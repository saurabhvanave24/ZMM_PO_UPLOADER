CLASS lhc_zi_mass_po_upload DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_mass_po_upload RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_mass_po_upload RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zi_mass_po_upload.

    METHODS pouploader FOR MODIFY
      IMPORTING keys FOR ACTION zi_mass_po_upload~pouploader RESULT result.

ENDCLASS.

CLASS lhc_zi_mass_po_upload IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entities>).
      APPEND CORRESPONDING #( <fs_entities> ) TO mapped-zi_mass_po_upload
      ASSIGNING FIELD-SYMBOL(<fs_poupload>).
      <fs_poupload>-enduser = cl_abap_context_info=>get_user_technical_name( ).
      IF <fs_poupload>-fileid IS INITIAL.
        TRY.
            <fs_poupload>-fileid = cl_system_uuid=>create_uuid_x16_static(  ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD pouploader.

    TYPES: BEGIN OF ty_po_excel,
             sno                      TYPE c LENGTH 10,                                  " Serial No
             company_code             TYPE bukrs,                              " Company Code (4 char)
             purchasing_document_type TYPE c LENGTH 10,                        " PO Type (4 char)
             po_number                TYPE ebeln,                              " PO Number (10 char)
             date                     TYPE string,                             " Date
             vendor_account_number    TYPE lifnr,                              " Vendor (10 char, char key)
             terms_of_payment_key     TYPE c LENGTH 50,                        " Payment Terms (4 char)
             purchasing_organization  TYPE ekorg,                              " Purchasing Org (4 char)
             purchasing_group         TYPE ekgrp,                              " Purchasing Group (3 char)
             currency_key             TYPE waers,                              " Currency (3 char)
             validity_start_date      TYPE sy-datum,                             " Validity Start Date
             validity_end_date        TYPE sy-datum,                             " Validity End Date
             incoterms                TYPE c LENGTH 50,                        " Incoterms (3 char)
             incoterms_location       TYPE c LENGTH 50,                        " Incoterms Location (28 char)
             item_number              TYPE ebelp,                              " Item Number (5 char NUMC)
             material_number          TYPE matnr,                              " Material (18 char)
             short_text               TYPE maktx,                              " Short Text (40 char)
             material_group           TYPE matkl,                              " Material Group (9 char)
             plant                    TYPE werks_d,                            " Plant (4 char)
             storage_location         TYPE lgort_d,                            " Storage Location (4 char)
             po_quantity              TYPE c LENGTH 20,                            " PO Quantity
             po_uom                   TYPE meins,                              " UoM (3 char)
             net_price                TYPE c LENGTH 20,                        " Net Price
             price_unit               TYPE c LENGTH 5,                        " Price Unit
             tax_code                 TYPE c LENGTH 2,                              " Tax Code (2 char)
             acct_assignment_category TYPE c LENGTH 2,                              " Account Assignment Cat (1 char)
             item_category            Type c length 2,
             gl_account               TYPE c LENGTH 10,                              " G/L Account (10 char)
             cost_center              TYPE c LENGTH 10,                              " Cost Center (10 char)
             valuation_type           TYPE c LENGTH 10,                        " Valuation Type (10 char)
             req_no                   TYPE c LENGTH 10,                              " Requisition No (10 char)
             req_item                 TYPE c LENGTH 10,                              " Requisition Item (5 char NUMC)
             info_record              TYPE c LENGTH 10,
             power                    type c length 5,
             model                    type c length 40,                            " Info Record (10 char)
             AccountAssignmentNumber  type c length 2,
             filename                 type string,
             username                 type string,
           END OF ty_po_excel.

    TYPES tt_po_excel TYPE STANDARD TABLE OF ty_po_excel WITH DEFAULT KEY.
    DATA: lt_po_excel TYPE  tt_po_excel .

    DATA: lt_poparallel TYPE cl_abap_parallel=>t_in_inst_tab .

    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    READ ENTITIES OF zi_mass_po_upload IN LOCAL MODE
           ENTITY zi_mass_po_upload
           ALL FIELDS WITH CORRESPONDING #( keys )
           RESULT DATA(lt_file_po_uploader).

    " Get attachment value from the instance
    DATA(lv_attachment) = lt_file_po_uploader[ 1 ]-attachment.
    DATA(lv_file) = lt_file_po_uploader[ 1 ]-Filename.
    IF lv_attachment IS INITIAL.
      RETURN.
    ENDIF.

    DATA(lo_xlsx) = xco_cp_xlsx=>document->for_file_content( iv_file_content = lv_attachment )->read_access( ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).
    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).
    DATA(lo_execute) = lo_worksheet->select( lo_selection_pattern
      )->row_stream(
      )->operation->write_to( REF #( lt_po_excel ) ).
    lo_execute->set_value_transformation( xco_cp_xlsx_read_access=>value_transformation->string_value
               )->if_xco_xlsx_ra_operation~execute( ).

SELECT single from zerror_log_po
fields filename
where filename = @lv_file
into @data(lv_file_name).

if sy-subrc <> 0.



LOOP AT lt_po_excel ASSIGNING FIELD-SYMBOL(<fs_key>).
  <fs_key>-username = lv_user.
  <fs_key>-filename = lv_file.
ENDLOOP.
    "DELETE lt_po_excel INDEX 1.  " removes the header row

    DATA lt_pohdr   TYPE TABLE FOR CREATE I_PURCHASEORDERTP_2.
    Data : ls_pohdr LIKE LINE OF lt_pohdr.

    Data : lt_poitem  TYPE TABLE FOR CREATE I_PURCHASEORDERTP_2\_PurchaseOrderItem.
    Data : ls_poitem LIKE LINE OF lt_poitem  .

    DATA lt_poitemAssignment   TYPE TABLE FOR CREATE  I_PURCHASEORDERITEMTP_2\_PurOrdAccountAssignment.
    Data : ls_poitemAssignment LIKE LINE OF lt_poitemAssignment .



    DATA: lt_po  TYPE TABLE FOR CREATE I_PURCHASEORDERTP_2,
    lv_cidheader TYPE abp_behv_cid,
    lv_ciditem TYPE abp_behv_cid.


                  TRY.
                      lv_cidheader = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
                    CATCH cx_uuid_error.
                      ASSERT 1 = 0.
                  ENDTRY.

                  TRY.
                      lv_ciditem = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
                    CATCH cx_uuid_error.
                      ASSERT 1 = 0.
                  ENDTRY.

  APPEND INITIAL LINE TO lt_pohdr ASSIGNING FIELD-SYMBOL(<pohead>).
  APPEND INITIAL LINE TO lt_poitem ASSIGNING FIELD-SYMBOL(<poitem>).
  APPEND INITIAL LINE TO lt_poitemAssignment  ASSIGNING FIELD-SYMBOL(<poassignment>).



*---- Call PARALLEL Class to Pass data and call RAP BO for GRN Posting

    DATA(lo_proc) = NEW cl_abap_parallel( p_percentage = 30 )  .

    IF lt_po_excel IS NOT INITIAL .

      INSERT NEW zcl_po_uploader_parallel(  lt_po_details = CORRESPONDING #( lt_po_excel )  )
      INTO TABLE lt_poparallel.

      IF lt_poparallel IS NOT INITIAL .

        lo_proc->run_inst(  EXPORTING p_in_tab = lt_poparallel
                                     p_debug = abap_false
                            IMPORTING p_out_tab = DATA(lt_finished)  ).
      ENDIF.
    ENDIF.


MODIFY ENTITIES OF ZI_MASS_PO_UPLOAD IN LOCAL MODE
ENTITY ZI_MASS_PO_UPLOAD
UPDATE FIELDS ( FileStatus ) WITH VALUE #( FOR key IN keys ( %tky = key-%tky FileStatus = 'S' ) ).
result = VALUE #( FOR key IN keys ( %tky = key-%tky
%param = CORRESPONDING #( key ) ) ) .

APPEND VALUE #( %msg = new_message_with_text(
severity = if_abap_behv_message=>severity-success
text = 'File Uploaded Successfully' ) )
TO reported-ZI_MASS_PO_UPLOAD.
else.
MODIFY ENTITIES OF ZI_MASS_PO_UPLOAD IN LOCAL MODE
ENTITY ZI_MASS_PO_UPLOAD
UPDATE FIELDS ( FileStatus ) WITH VALUE #( FOR key IN keys ( %tky = key-%tky FileStatus = 'F' ) ).
result = VALUE #( FOR key IN keys ( %tky = key-%tky
%param = CORRESPONDING #( key ) ) ) .

APPEND VALUE #( %msg = new_message_with_text(
severity = if_abap_behv_message=>severity-success
text = 'File is already uploaded , upload different file' ) )
TO reported-ZI_MASS_PO_UPLOAD.
endif.


  ENDMETHOD.


ENDCLASS.
