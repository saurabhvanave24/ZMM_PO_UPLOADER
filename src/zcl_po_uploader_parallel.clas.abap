CLASS zcl_po_uploader_parallel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

* DATA: mapped_early TYPE RESPONSE FOR MAPPED LATE
*                   I_PURCHASEORDERTP_2.

* STRUCTURE FOR INTERNAL TABLE *

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
             info_record              TYPE c LENGTH 10,                              " Info Record (10 char)
             power                    type c length 5,
             model                    type c length 40,
             AccountAssignmentNumber  type c length 2,
             filename                 type string,
             username                 type string,
           END OF ty_po_excel.



    TYPES tt_po_excel TYPE STANDARD TABLE OF ty_po_excel WITH DEFAULT KEY.
    DATA: it_po_final TYPE  tt_po_excel .


    TYPES: BEGIN OF gty_log_table,
             sno                      TYPE c LENGTH 5,                         " Serial No
             company_code             TYPE bukrs,                              " Company Code (4 char)
             purchasing_document_type TYPE c LENGTH 10,                        " PO Type (4 char)
             po_number                TYPE ebeln,                              " PO Number (10 char)
             date                     TYPE d,                                  " Date
             vendor_account_number    TYPE lifnr,                              " Vendor (10 char, char key)
             terms_of_payment_key     TYPE c LENGTH 50,                        " Payment Terms (4 char)
             purchasing_organization  TYPE ekorg,                              " Purchasing Org (4 char)
             purchasing_group         TYPE ekgrp,                              " Purchasing Group (3 char)
             currency_key             TYPE waers,                              " Currency (3 char)
             validity_start_date      TYPE d,                                  " Validity Start Date
             validity_end_date        TYPE d,                                  " Validity End Date
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
             price_unit               TYPE c LENGTH 20,                              " Price Unit
             tax_code                 TYPE mwskz,                              " Tax Code (2 char)
             acct_assignment_category TYPE knttp,                              " Account Assignment Cat (1 char)
             gl_account               TYPE saknr,                              " G/L Account (10 char)
             cost_center              TYPE kostl,                              " Cost Center (10 char)
             valuation_type           TYPE c LENGTH 50,                        " Valuation Type (10 char)
             req_no                   TYPE banfn,                              " Requisition No (10 char)
             req_item                 TYPE bnfpo,                              " Requisition Item (5 char NUMC)
             info_record              TYPE infnr,                              " Info Record (10 char)
             status                   TYPE c LENGTH 30,                        " Status
             message                  TYPE c LENGTH 255,                       " Message
             ponumber                 TYPE ebeln,                              " Po Number

           END OF gty_log_table.


      TYPES: BEGIN OF ty_error,
         sno     TYPE c LENGTH 5, " replace with correct type
         message TYPE string,
         ponumber type I_PurchaseOrderTP_2-PurchaseOrder,

       END OF ty_error.

DATA: lt_ponerror_log TYPE STANDARD TABLE OF zerror_log_po.

DATA: lt_error TYPE STANDARD TABLE OF ty_error,
      ls_error TYPE ty_error.
data : lv_pp1 type string.

      TYPES: BEGIN OF ty_keys1,

   sno                        TYPE c LENGTH 5,

   END OF  ty_keys1.

   DATA: lt_ser TYPE STANDARD TABLE OF ty_keys1,
      ls_ser  TYPE ty_keys1.

    DATA lt_pohdr   TYPE TABLE FOR CREATE I_PURCHASEORDERTP_2.
    Data : ls_pohdr LIKE LINE OF lt_pohdr.

    Data : lt_poitem  TYPE TABLE FOR CREATE I_PURCHASEORDERTP_2\_PurchaseOrderItem.
    Data : ls_poitem LIKE LINE OF lt_poitem  .

    DATA lt_poitemAssignment   TYPE TABLE FOR CREATE  I_PURCHASEORDERITEMTP_2\_PurOrdAccountAssignment.
    Data : ls_poitemAssignment LIKE LINE OF lt_poitemAssignment .

    TYPES tt_log_table TYPE STANDARD TABLE OF gty_log_table WITH DEFAULT KEY.
    DATA: gt_mailformat TYPE  tt_log_table .


    DATA: gv_total_records   TYPE c LENGTH 5,
          gv_success_records TYPE c LENGTH 5,
          gv_fail_records    TYPE c LENGTH 5.


    TYPES: BEGIN OF ty_create_purchaseorder,
             purchaseorderheader TYPE zsc_po_uploader=>tys_a_purchase_order_type,
             purchaseorderitems  TYPE STANDARD TABLE OF zsc_po_uploader=>tys_a_purchase_order_item_type WITH DEFAULT KEY,
           END OF ty_create_purchaseorder.


    DATA:
      ls_po_header    TYPE zsc_po_uploader=>tys_a_purchase_order_type,  " header structure
      ls_item         TYPE zsc_po_uploader=>tys_a_purchase_order_item_type,    " item structure
      lt_items        TYPE STANDARD TABLE OF zsc_po_uploader=>tys_a_purchase_order_item_type,
      ls_create       TYPE ty_create_purchaseorder ,         " API input
      ls_result       TYPE zsc_po_uploader=>tys_a_purchase_order_type,         " API output
      lo_http_client  TYPE REF TO if_web_http_client,
      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request      TYPE REF TO /iwbep/if_cp_request_create,
      lo_response     TYPE REF TO /iwbep/if_cp_response_create.

    DATA:lv_json TYPE string.
    DATA:http_client  TYPE REF TO if_web_http_client,
         lo_response1 TYPE REF TO if_web_http_response.



*-----Constructor & Methods

    METHODS constructor
      IMPORTING
        lt_po_details TYPE tt_po_excel.


*    METHODS sendmail.

    INTERFACES if_serializable_object .
    INTERFACES if_abap_parallel .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PO_UPLOADER_PARALLEL IMPLEMENTATION.


  METHOD constructor.

    it_po_final = lt_po_details .

  ENDMETHOD.


  METHOD if_abap_parallel~do.

 Data :         lv_cidheader TYPE abp_behv_cid,
                 lv_ciditem TYPE abp_behv_cid.

 DATA: lt_serial TYPE STANDARD TABLE OF ty_keys1,
      ls_serial  TYPE ty_keys1.

 Data : lv_sno type c length 5.

 DELETE it_po_final INDEX 1.

 loop at it_po_final into data(ls_po_final).

      IF ls_po_final-sno EQ lv_sno.
        CONTINUE .
      ENDIF.

      lv_sno =  ls_po_final-sno.


if ls_po_final-req_no is INITIAL.

 clear ls_pohdr.

       ls_pohdr = VALUE #(
                           %cid                  = |CID_HEADER_{ ls_po_final-sno }|
                           PurchaseOrderType     = ls_po_final-purchasing_document_type
                          CompanyCode            = ls_po_final-company_code
                          PurchasingOrganization = ls_po_final-purchasing_organization
                          PurchasingGroup        = ls_po_final-purchasing_group
                          Supplier               = ls_po_final-vendor_account_number
                          ValidityStartDate      = ls_po_final-validity_start_date
                          ValidityEndDate        = ls_po_final-validity_end_date
                          IncotermsClassification = ls_po_final-incoterms
                          IncotermsLocation1     = ls_po_final-incoterms_location
                          PaymentTerms           = ls_po_final-terms_of_payment_key
                          PurchaseOrderDate      = ls_po_final-date


                              %control-PurchaseOrderType      = cl_abap_behv=>flag_changed
                              %control-CompanyCode            = cl_abap_behv=>flag_changed
                              %control-PurchasingOrganization = cl_abap_behv=>flag_changed
                              %control-PurchasingGroup        = cl_abap_behv=>flag_changed
                              %control-Supplier               = cl_abap_behv=>flag_changed
                              %control-ValidityStartDate      = cl_abap_behv=>flag_changed
                              %control-ValidityEndDate        = cl_abap_behv=>flag_changed
                              %control-IncotermsClassification = cl_abap_behv=>flag_changed
                              %control-IncotermsLocation1     = cl_abap_behv=>flag_changed
                              %control-PaymentTerms           = cl_abap_behv=>flag_changed
                              %control-PurchaseOrderDate      = cl_abap_behv=>flag_changed
     ).

  if ls_pohdr is not INITIAL.
  APPEND ls_pohdr to lt_pohdr.
  clear ls_pohdr.
  endif.

clear ls_poitem.
clear lt_poitem.

lt_poitem = VALUE #(
  FOR ls_poitem IN it_po_final INDEX INTO lv_ind
  WHERE ( sno = ls_po_final-sno )
  (
    %cid_ref = |CID_HEADER_{ ls_poitem-sno }|
    %target  = VALUE #(
      (
        %cid                        = lv_ind
        PurchaseRequisition         = ls_poitem-req_no
        PurchaseRequisitionItem     = ls_poitem-req_item
        Material                    = ls_poitem-material_number
        Plant                       = ls_poitem-plant
        OrderQuantity               = ls_poitem-po_quantity
        NetPriceAmount              = ls_poitem-net_price
        TaxCode                     = ls_poitem-tax_code
        PurchaseOrderQuantityUnit   = ls_poitem-po_uom
        StorageLocation             = ls_poitem-storage_location
        AccountAssignmentCategory   = ls_poitem-acct_assignment_category
        ValuationType               = ls_poitem-valuation_type
        PurchasingInfoRecord        = ls_poitem-info_record
        DocumentCurrency            = ls_poitem-currency_key
        PurchaseOrderItemCategory   = ls_poitem-item_category
        NetPriceQuantity            = ls_poitem-price_unit


        %control-Material                  = cl_abap_behv=>flag_changed
        %control-Plant                     = cl_abap_behv=>flag_changed
        %control-OrderQuantity             = cl_abap_behv=>flag_changed
        %control-PurchaseOrderItem         = cl_abap_behv=>flag_changed
        %control-NetPriceAmount            = cl_abap_behv=>flag_changed
        %control-PurchaseRequisition       = cl_abap_behv=>flag_changed
        %control-PurchaseRequisitionItem   = cl_abap_behv=>flag_changed
        %control-DocumentCurrency          = cl_abap_behv=>flag_changed
        %control-TaxCode                   = cl_abap_behv=>flag_changed
        %control-PurchaseOrderQuantityUnit = cl_abap_behv=>flag_changed
        %control-StorageLocation           = cl_abap_behv=>flag_changed
        %control-AccountAssignmentCategory = cl_abap_behv=>flag_changed
        %control-ValuationType             = cl_abap_behv=>flag_changed
        %control-PurchasingInfoRecord      = cl_abap_behv=>flag_changed
        %control-PurchaseOrderItemCategory = cl_abap_behv=>flag_changed
        %control-NetPriceQuantity          = cl_abap_behv=>flag_changed
      )
    )
  )
).

clear ls_poitemAssignment.
clear lt_poitemAssignment.

 lt_poitemAssignment = VALUE #(
  FOR ls_poitemAssignment IN it_po_final index into lv_ind1
  WHERE ( sno = ls_po_final-sno )
  (
    %cid_ref = lv_ind1
    %target  = VALUE #(
      (
                                %cid                        = |CID_SERIAL_{ lv_ind1 }|
                               GLAccount     = ls_poitemAssignment-gl_account
                               CostCenter    = ls_poitemAssignment-cost_center
*                               ControllingArea = 'A000'
*                               FunctionalArea  = 'YB40'
*                               CompanyCode     = '2000'
                               AccountAssignmentNumber = ls_poitemAssignment-accountassignmentnumber



        " --- %control flags ---
                               %control-GLAccount                    = cl_abap_behv=>flag_changed
                               %control-CostCenter                   = cl_abap_behv=>flag_changed
*                               %control-ControllingArea              = cl_abap_behv=>flag_changed
*                               %control-FunctionalArea               = cl_abap_behv=>flag_changed
*                               %control-CompanyCode               = cl_abap_behv=>flag_changed
                               %control-AccountAssignmentNumber               = cl_abap_behv=>flag_changed
      )
    )
  )
).


* lt_poitem = VALUE #(
*  FOR ls_poitem IN it_po_final index into lv_ind
*  WHERE ( sno = ls_po_final-sno )
*  (
*    %cid_ref = |CID_HEADER_{ ls_po_final-sno }|
*    %target  = VALUE #(
*      (
*        %cid                        = lv_ind
*        PurchaseRequisition     = ls_po_final-req_no
*                               PurchaseRequisitionItem = ls_po_final-req_item
*                               Material                = ls_po_final-material_number
*                               Plant                   = ls_po_final-plant
*                               OrderQuantity           = ls_po_final-po_quantity
*                               NetPriceAmount          = ls_po_final-net_price
*                               TaxCode                 = ls_po_final-tax_code
*                               PurchaseOrderQuantityUnit = ls_po_final-po_uom
*                               StorageLocation         = ls_po_final-storage_location
*                               AccountAssignmentCategory = ls_po_final-acct_assignment_category
*                               ValuationType           = ls_po_final-valuation_type
*                               PurchasingInfoRecord    = ls_po_final-info_record
*                               DocumentCurrency        = ls_po_final-currency_key
*
*        " --- %control flags ---
*                                   %control-Material                = cl_abap_behv=>flag_changed
*                                   %control-Plant                   = cl_abap_behv=>flag_changed
*                                   %control-OrderQuantity           = cl_abap_behv=>flag_changed
*                                   %control-PurchaseOrderItem       = cl_abap_behv=>flag_changed
*                                   %control-NetPriceAmount          = cl_abap_behv=>flag_changed
*                                   %control-PurchaseRequisition     = cl_abap_behv=>flag_changed
*                                   %control-PurchaseRequisitionItem = cl_abap_behv=>flag_changed
*                                   %control-DocumentCurrency        = cl_abap_behv=>flag_changed
*                                   %control-TaxCode                 = cl_abap_behv=>flag_changed
*                                   %control-PurchaseOrderQuantityUnit = cl_abap_behv=>flag_changed
*                                   %control-StorageLocation         = cl_abap_behv=>flag_changed
*                                   %control-AccountAssignmentCategory = cl_abap_behv=>flag_changed
*                                   %control-ValuationType           = cl_abap_behv=>flag_changed
*                                   %control-PurchasingInfoRecord    = cl_abap_behv=>flag_changed
*      )
*    )
*  )
*).

endif.


if ls_po_final-req_no is not INITIAL.

 clear ls_pohdr.

       ls_pohdr = VALUE #(
                           %cid                  = |CID_HEADER_{ ls_po_final-sno }|
                           PurchaseOrderType     = ls_po_final-purchasing_document_type
                          CompanyCode            = ls_po_final-company_code
                          PurchasingOrganization = ls_po_final-purchasing_organization
                          PurchasingGroup        = ls_po_final-purchasing_group
                          Supplier               = ls_po_final-vendor_account_number
                          ValidityStartDate      = ls_po_final-validity_start_date
                          ValidityEndDate        = ls_po_final-validity_end_date
                          IncotermsClassification = ls_po_final-incoterms
                          IncotermsLocation1     = ls_po_final-incoterms_location
                          PaymentTerms           = ls_po_final-terms_of_payment_key
                          PurchaseOrderDate      = ls_po_final-date

                              %control-PurchaseOrderType      = cl_abap_behv=>flag_changed
                              %control-CompanyCode            = cl_abap_behv=>flag_changed
                              %control-PurchasingOrganization = cl_abap_behv=>flag_changed
                              %control-PurchasingGroup        = cl_abap_behv=>flag_changed
                              %control-Supplier               = cl_abap_behv=>flag_changed
                              %control-ValidityStartDate      = cl_abap_behv=>flag_changed
                              %control-ValidityEndDate        = cl_abap_behv=>flag_changed
                              %control-IncotermsClassification = cl_abap_behv=>flag_changed
                              %control-IncotermsLocation1     = cl_abap_behv=>flag_changed
                              %control-PaymentTerms           = cl_abap_behv=>flag_changed
                              %control-PurchaseOrderDate      = cl_abap_behv=>flag_changed

     ).

  if ls_pohdr is not INITIAL.
  APPEND ls_pohdr to lt_pohdr.
  clear ls_pohdr.
  endif.

clear ls_poitem.
clear lt_poitem.


 lt_poitem = VALUE #(
  FOR ls_poitem IN it_po_final index into lv_ind
  WHERE ( sno = ls_po_final-sno )
  (
    %cid_ref = |CID_HEADER_{ ls_po_final-sno }|
    %target  = VALUE #(
      (
        %cid                        = lv_ind
                               PurchaseRequisition     = ls_poitem-req_no
                               PurchaseRequisitionItem = ls_poitem-req_item
                               "Material                = ls_po_final-material_number
                               Plant                   = ls_poitem-plant
                               OrderQuantity           = ls_poitem-po_quantity
                               NetPriceAmount          = ls_poitem-net_price
                               TaxCode                 = ls_poitem-tax_code
                               PurchaseOrderQuantityUnit = ls_poitem-po_uom
                               StorageLocation         = ls_poitem-storage_location
                               AccountAssignmentCategory = ls_poitem-acct_assignment_category
                               ValuationType           = ls_poitem-valuation_type
                               PurchasingInfoRecord    = ls_poitem-info_record
                               DocumentCurrency        = ls_poitem-currency_key
                               PurchaseOrderItemCategory   = ls_poitem-item_category
                               NetPriceQuantity            = ls_poitem-price_unit


        " --- %control flags ---
                                   "%control-Material                = cl_abap_behv=>flag_changed
                                   %control-Plant                   = cl_abap_behv=>flag_changed
                                   %control-OrderQuantity           = cl_abap_behv=>flag_changed
                                   %control-PurchaseOrderItem       = cl_abap_behv=>flag_changed
                                   %control-NetPriceAmount          = cl_abap_behv=>flag_changed
                                   %control-PurchaseRequisition     = cl_abap_behv=>flag_changed
                                   %control-PurchaseRequisitionItem = cl_abap_behv=>flag_changed
                                   %control-DocumentCurrency        = cl_abap_behv=>flag_changed
                                   %control-TaxCode                 = cl_abap_behv=>flag_changed
                                   %control-PurchaseOrderQuantityUnit = cl_abap_behv=>flag_changed
                                   %control-StorageLocation         = cl_abap_behv=>flag_changed
                                   %control-AccountAssignmentCategory = cl_abap_behv=>flag_changed
                                   %control-ValuationType           = cl_abap_behv=>flag_changed
                                   %control-PurchasingInfoRecord    = cl_abap_behv=>flag_changed
                                   %control-PurchaseOrderItemCategory = cl_abap_behv=>flag_changed
                                   %control-NetPriceQuantity          = cl_abap_behv=>flag_changed
      )
    )
  )
).

clear ls_poitemAssignment.
clear lt_poitemAssignment.

 lt_poitemAssignment = VALUE #(
  FOR ls_poitemAssignment IN it_po_final index into lv_ind1
  WHERE ( sno = ls_po_final-sno )
  (
    %cid_ref = lv_ind1
    %target  = VALUE #(
      (
                                %cid                        = |CID_SERIAL_{ lv_ind1 }|
                               GLAccount     = ls_poitemAssignment-gl_account
                               CostCenter    = ls_poitemAssignment-cost_center
*                               ControllingArea = 'A000'
*                               FunctionalArea  = 'YB40'
*                               CompanyCode     = '2000'
                               AccountAssignmentNumber = ls_poitemAssignment-accountassignmentnumber


        " --- %control flags ---
                               %control-GLAccount                    = cl_abap_behv=>flag_changed
                               %control-CostCenter                   = cl_abap_behv=>flag_changed
*                               %control-ControllingArea              = cl_abap_behv=>flag_changed
*                               %control-FunctionalArea               = cl_abap_behv=>flag_changed
*                               %control-CompanyCode               = cl_abap_behv=>flag_changed
                               %control-AccountAssignmentNumber               = cl_abap_behv=>flag_changed
      )
    )
  )
).

endif.


*if ls_po_final-purchasing_document_type = 'ZSER'.
*
* clear ls_pohdr.
*
*       ls_pohdr = VALUE #(
*                           %cid                  = |CID_HEADER_{ ls_po_final-sno }|
*                           PurchaseOrderType     = ls_po_final-purchasing_document_type
*                          CompanyCode            = ls_po_final-company_code
*                          PurchasingOrganization = ls_po_final-purchasing_organization
*                          PurchasingGroup        = ls_po_final-purchasing_group
*                          Supplier               = ls_po_final-vendor_account_number
*                          ValidityStartDate      = ls_po_final-validity_start_date
*                          ValidityEndDate        = ls_po_final-validity_end_date
*                          IncotermsClassification = ls_po_final-incoterms
*                          IncotermsLocation1     = ls_po_final-incoterms_location
*                          PaymentTerms           = ls_po_final-terms_of_payment_key
*                          PurchaseOrderDate      = ls_po_final-date
*
*                              %control-PurchaseOrderType      = cl_abap_behv=>flag_changed
*                              %control-CompanyCode            = cl_abap_behv=>flag_changed
*                              %control-PurchasingOrganization = cl_abap_behv=>flag_changed
*                              %control-PurchasingGroup        = cl_abap_behv=>flag_changed
*                              %control-Supplier               = cl_abap_behv=>flag_changed
*                              %control-ValidityStartDate      = cl_abap_behv=>flag_changed
*                              %control-ValidityEndDate        = cl_abap_behv=>flag_changed
*                              %control-IncotermsClassification = cl_abap_behv=>flag_changed
*                              %control-IncotermsLocation1     = cl_abap_behv=>flag_changed
*                              %control-PaymentTerms           = cl_abap_behv=>flag_changed
*                              %control-PurchaseOrderDate      = cl_abap_behv=>flag_changed
*     ).
*
*  if ls_pohdr is not INITIAL.
*  APPEND ls_pohdr to lt_pohdr.
*  clear ls_pohdr.
*  endif.
*
*clear ls_poitem.
*clear lt_poitem.
*
*
* lt_poitem = VALUE #(
*  FOR ls_poitem IN it_po_final index into lv_ind
*  WHERE ( sno = ls_po_final-sno )
*  (
*    %cid_ref = |CID_HEADER_{ ls_po_final-sno }|
*    %target  = VALUE #(
*      (
*        %cid                        = lv_ind
*                               PurchaseRequisition     = ls_po_final-req_no
*                               PurchaseRequisitionItem = ls_po_final-req_item
*                               "Material                = ls_po_final-material_number
*                               Plant                   = ls_po_final-plant
*                               OrderQuantity           = ls_po_final-po_quantity
*                               NetPriceAmount          = ls_po_final-net_price
*                               TaxCode                 = ls_po_final-tax_code
*                               PurchaseOrderQuantityUnit = ls_po_final-po_uom
*                               StorageLocation         = ls_po_final-storage_location
*                               AccountAssignmentCategory = ls_po_final-acct_assignment_category
*                               ValuationType           = ls_po_final-valuation_type
*                               PurchasingInfoRecord    = ls_po_final-info_record
*                               DocumentCurrency        = ls_po_final-currency_key
*
*        " --- %control flags ---
*                                   "%control-Material                = cl_abap_behv=>flag_changed
*                                   %control-Plant                   = cl_abap_behv=>flag_changed
*                                   %control-OrderQuantity           = cl_abap_behv=>flag_changed
*                                   %control-PurchaseOrderItem       = cl_abap_behv=>flag_changed
*                                   %control-NetPriceAmount          = cl_abap_behv=>flag_changed
*                                   %control-PurchaseRequisition     = cl_abap_behv=>flag_changed
*                                   %control-PurchaseRequisitionItem = cl_abap_behv=>flag_changed
*                                   %control-DocumentCurrency        = cl_abap_behv=>flag_changed
*                                   %control-TaxCode                 = cl_abap_behv=>flag_changed
*                                   %control-PurchaseOrderQuantityUnit = cl_abap_behv=>flag_changed
*                                   %control-StorageLocation         = cl_abap_behv=>flag_changed
*                                   %control-AccountAssignmentCategory = cl_abap_behv=>flag_changed
*                                   %control-ValuationType           = cl_abap_behv=>flag_changed
*                                   %control-PurchasingInfoRecord    = cl_abap_behv=>flag_changed
*      )
*    )
*  )
*).
*
* lt_poitemAssignment = VALUE #(
*  FOR ls_poitem IN it_po_final index into lv_ind1
*  WHERE ( sno = ls_po_final-sno )
*  (
*    %cid_ref = |CID_HEADER_{ ls_po_final-sno }|
*    %target  = VALUE #(
*      (
*                                %cid                        = lv_ind1
*                               GLAccount     = ls_po_final-gl_account
*
*        " --- %control flags ---
*                               %control-GLAccount                   = cl_abap_behv=>flag_changed
*
*      )
*    )
*  )
*).
*
*endif.



READ TABLE lt_pohdr INDEX 1 INTO data(wa_hdr).


 IF wa_hdr-PurchaseOrderType <> 'ZSER'.

 MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
  ENTITY PurchaseOrder
    CREATE FROM lt_pohdr
  ENTITY PurchaseOrder
    CREATE BY \_PurchaseOrderItem
      FROM lt_poitem
*  ENTITY PurchaseOrderItem
*    CREATE BY \_PurOrdAccountAssignment
*      FROM lt_poitemAssignment
  REPORTED DATA(ls_reported)
  FAILED   DATA(ls_failed)
  MAPPED   DATA(ls_mapped).
*      MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
*        ENTITY purchaseorder CREATE FROM lt_pohdr
*        ENTITY purchaseorder CREATE BY \_PurchaseOrderItem FROM lt_poitem
*        REPORTED DATA(ls_reported)
*        FAILED   DATA(ls_failed)
*        MAPPED   DATA(ls_mapped).

*clear ls_mapped.
*clear ls_failed.
*clear ls_reported.
*clear lt_pohdr.
*clear lt_poitem.
*clear lt_poitemAssignment.

      COMMIT ENTITIES BEGIN
        RESPONSE OF i_purchaseordertp_2
        FAILED DATA(commit_failed)
        REPORTED DATA(commit_reported).

      cl_aunit_assert=>assert_subrc(
      exp = 0
      act = sy-subrc ).

"Data : lv_final_key type I_PURCHASEORDERTP_2-PurchaseOrder.
     LOOP AT ls_mapped-purchaseorder
      ASSIGNING FIELD-SYMBOL(<ls_mapped>).

      CONVERT KEY OF I_PURCHASEORDERTP_2
        FROM TEMPORARY VALUE #( %pid = <ls_mapped>-%pid
                                %tmp = <ls_mapped>-%key )
        TO data(lv_final_key).
    ENDLOOP.



    COMMIT ENTITIES END.

clear ls_mapped.
clear ls_failed.
clear ls_reported.
clear lt_pohdr.
clear lt_poitem.
clear lt_poitemAssignment.
*        DATA(lv_po) = ''.

*LOOP AT commit_reported-PurchaseOrder INTO DATA(ls_po_report).
*  lv_po = ls_po_report-PurchaseOrder. " THIS IS THE NEW PO NUMBER
*ENDLOOP.

 LOOP AT commit_reported-purchaseorder INTO data(ls_report).
  DATA(lv_result) = ls_report-%msg->if_message~get_text( ).
  "gv_success = ls_report-%msg->severity.
  CLEAR ls_error.
  ls_error-sno     = ls_po_final-sno.  " <-- current serial number
  ls_error-message = lv_result .
  ls_error-ponumber = lv_final_key.


                      TRY.
                      lv_pp1 = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
                    CATCH cx_uuid_error.
                      ASSERT 1 = 0.
                  ENDTRY.

  APPEND ls_error TO lt_error.

  clear lv_final_key.

 endloop.
    ENDIF.

   IF wa_hdr-PurchaseOrderType = 'ZSER'.

 MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
  ENTITY PurchaseOrder
    CREATE FROM lt_pohdr
  ENTITY PurchaseOrder
    CREATE BY \_PurchaseOrderItem
      FROM lt_poitem
  ENTITY PurchaseOrderItem
    CREATE BY \_PurOrdAccountAssignment
      FROM lt_poitemAssignment
  REPORTED DATA(ls_reported1)
  FAILED   DATA(ls_failed1)
  MAPPED   DATA(ls_mapped1).
*      MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
*        ENTITY purchaseorder CREATE FROM lt_pohdr
*        ENTITY purchaseorder CREATE BY \_PurchaseOrderItem FROM lt_poitem
*        REPORTED DATA(ls_reported)
*        FAILED   DATA(ls_failed)
*        MAPPED   DATA(ls_mapped).

clear ls_mapped1.
clear ls_failed1.
clear ls_reported1.
clear lt_pohdr.
clear lt_poitem.
clear lt_poitemAssignment.

      COMMIT ENTITIES
        RESPONSE OF i_purchaseordertp_2
        FAILED DATA(commit_failed1)
        REPORTED DATA(commit_reported1).

  LOOP AT commit_reported1-purchaseorder INTO data(ls_report1).
  DATA(lv_result1) = ls_report-%msg->if_message~get_text( ).
  "gv_success = ls_report-%msg->severity.
  CLEAR ls_error.
  ls_error-sno     = ls_po_final-sno.  " <-- current serial number
  ls_error-message = lv_result1.

                      TRY.
                      lv_pp1 = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
                    CATCH cx_uuid_error.
                      ASSERT 1 = 0.
                  ENDTRY.

  APPEND ls_error TO lt_error.

 endloop.
    ENDIF.


*LOOP AT commit_reported-purchaseorder INTO data(ls_report).
*  DATA(lv_result) = ls_report-%msg->if_message~get_text( ).
*  "gv_success = ls_report-%msg->severity.
*  CLEAR ls_error.
*  ls_error-sno     = ls_po_final-sno.  " <-- current serial number
*  ls_error-message = lv_result.
*
*                      TRY.
*                      data(lv_pp1) = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
*                    CATCH cx_uuid_error.
*                      ASSERT 1 = 0.
*                  ENDTRY.
*
*  APPEND ls_error TO lt_error.
*
* endloop.

         lt_ponerror_log = VALUE #( BASE lt_ponerror_log
                                 FOR gs_po_final IN it_po_final index into lv_inc
                                 WHERE ( sno = ls_po_final-sno )
                                       (

  rownu                  =   |{ lv_inc }{ lv_pp1 }|
  sno                    =   gs_po_final-sno
  company_code           = gs_po_final-company_code
  purchasing_document_type = gs_po_final-purchasing_document_type
  po_number                = gs_po_final-po_number
  po_date                  = gs_po_final-date
  vendor_account_number    = gs_po_final-vendor_account_number
  terms_of_payment_key     = gs_po_final-terms_of_payment_key
  purchasing_organization  = gs_po_final-purchasing_organization
  purchasing_group         = gs_po_final-purchasing_group
  currency_key             = gs_po_final-currency_key
  validity_start_date      = gs_po_final-validity_start_date
  validity_end_date        = gs_po_final-validity_end_date
  incoterms                = gs_po_final-incoterms
  incoterms_location       = gs_po_final-incoterms_location
  item_number              = gs_po_final-item_number
  material_number          = gs_po_final-material_number
  short_text               = gs_po_final-short_text
  material_group           = gs_po_final-material_group
  plant                    = gs_po_final-plant
  storage_location         = gs_po_final-storage_location
  po_quantity              = gs_po_final-po_quantity
  po_uom                   = gs_po_final-po_uom
  net_price                = gs_po_final-net_price
  price_unit               = gs_po_final-price_unit
  tax_code                 = gs_po_final-tax_code
  acct_assignment_category = gs_po_final-acct_assignment_category
  gl_account               = gs_po_final-gl_account
  cost_center              = gs_po_final-cost_center
  valuation_type           = gs_po_final-valuation_type
  req_no                   = gs_po_final-req_no
  req_item                 = gs_po_final-req_item
  info_record              = gs_po_final-info_record
  filename                 = gs_po_final-filename
  username                 = gs_po_final-username
  message                  = lv_result
                                           ) ).


 endloop.

MODIFY zerror_log_po FROM table @lt_ponerror_log.











































******************************************************Not Required but still keeping**********************************
* LOOP AT it_po_final ASSIGNING FIELD-SYMBOL(<fs_key>).
*  CLEAR ls_serial.
*  ls_serial-sno = <fs_key>-sno.
*  APPEND ls_serial TO lt_serial.
*ENDLOOP.
*
*SORT lt_serial BY sno.
*DELETE ADJACENT DUPLICATES FROM lt_serial COMPARING sno.
*
*LOOP AT lt_serial ASSIGNING FIELD-SYMBOL(<fs_serial>).
*
*  "--- Step 1: Clear the tables for the new Purchase Order
*  CLEAR: lt_pohdr, lt_poitem.
*
*  "--- Step 2: Read the FIRST line for the current serial number to get header data
*  READ TABLE it_po_final INTO DATA(ls_po_header_data)
*    WITH KEY sno = <fs_serial>-sno.
*
*  "Check if a line was found (it always should be based on lt_serial)
*  IF sy-subrc = 0.
*
*    lv_cidheader = <fs_serial>-sno.
*
*    "--- Step 3: Create the PO Header structure ONLY ONCE
*    lt_pohdr = VALUE #( ( %cid                   = |CID_HEADER_{ lv_cidheader }|
*                          PurchaseOrderType      = ls_po_header_data-purchasing_document_type
*                          CompanyCode            = ls_po_header_data-company_code
*                          PurchasingOrganization = ls_po_header_data-purchasing_organization
*                          PurchasingGroup        = ls_po_header_data-purchasing_group
*                          Supplier               = ls_po_header_data-vendor_account_number
*                          ValidityStartDate      = ls_po_header_data-validity_start_date
*                          ValidityEndDate        = ls_po_header_data-validity_end_date
*                          IncotermsClassification = ls_po_header_data-incoterms
*                          IncotermsLocation1     = ls_po_header_data-incoterms_location
*                          PaymentTerms           = ls_po_header_data-terms_of_payment_key
*                          PurchaseOrderDate      = ls_po_header_data-date
*                          %control               = VALUE #(
*                              PurchaseOrderType      = cl_abap_behv=>flag_changed
*                              CompanyCode            = cl_abap_behv=>flag_changed
*                              PurchasingOrganization = cl_abap_behv=>flag_changed
*                              PurchasingGroup        = cl_abap_behv=>flag_changed
*                              Supplier               = cl_abap_behv=>flag_changed
*                              ValidityStartDate      = cl_abap_behv=>flag_changed
*                              ValidityEndDate        = cl_abap_behv=>flag_changed
*                              IncotermsClassification = cl_abap_behv=>flag_changed
*                              IncotermsLocation1     = cl_abap_behv=>flag_changed
*                              PaymentTerms           = cl_abap_behv=>flag_changed
*                              PurchaseOrderDate      = cl_abap_behv=>flag_changed ) ) ).
*
*
*    "--- Step 4: Loop for ALL items with the same serial number to create the item data
*    DATA lv_pos_numbering TYPE i_purchaseorderitemtp_2-purchaseorderitem.
*    lv_pos_numbering = 10.
*
*    "** THIS IS THE KEY CORRECTION **
*    LOOP AT it_po_final ASSIGNING FIELD-SYMBOL(<ls_item_data>) WHERE sno = <fs_serial>-sno.
*
*      DATA(lv_ciditem1) = |CID_ITEM_{ lv_cidheader }_{ sy-tabix }|. "Use sy-tabix for a unique item CID
*
*      APPEND VALUE #(
*        %cid_ref = |CID_HEADER_{ lv_cidheader }|
*        %target  = VALUE #( ( %cid                    = lv_ciditem1
*                               PurchaseRequisition     = <ls_item_data>-req_no
*                               PurchaseRequisitionItem = <ls_item_data>-req_item
*                               Material                = <ls_item_data>-material_number
*                               Plant                   = <ls_item_data>-plant
*                               OrderQuantity           = <ls_item_data>-po_quantity
*                               PurchaseOrderItem       = lv_pos_numbering
*                               NetPriceAmount          = <ls_item_data>-net_price
*                               TaxCode                 = <ls_item_data>-tax_code
*                               PurchaseOrderQuantityUnit = <ls_item_data>-po_uom
*                               StorageLocation         = <ls_item_data>-storage_location
*                               AccountAssignmentCategory = <ls_item_data>-acct_assignment_category
*                               ValuationType           = <ls_item_data>-valuation_type
*                               PurchasingInfoRecord    = <ls_item_data>-info_record
*                               DocumentCurrency        = <ls_item_data>-currency_key
*                               %control                = VALUE #(
*                                   Material                = cl_abap_behv=>flag_changed
*                                   Plant                   = cl_abap_behv=>flag_changed
*                                   OrderQuantity           = cl_abap_behv=>flag_changed
*                                   PurchaseOrderItem       = cl_abap_behv=>flag_changed
*                                   NetPriceAmount          = cl_abap_behv=>flag_changed
*                                   PurchaseRequisition     = cl_abap_behv=>flag_changed
*                                   PurchaseRequisitionItem = cl_abap_behv=>flag_changed
*                                   DocumentCurrency        = cl_abap_behv=>flag_changed
*                                   TaxCode                 = cl_abap_behv=>flag_changed
*                                   PurchaseOrderQuantityUnit = cl_abap_behv=>flag_changed
*                                   StorageLocation         = cl_abap_behv=>flag_changed
*                                   AccountAssignmentCategory = cl_abap_behv=>flag_changed
*                                   ValuationType           = cl_abap_behv=>flag_changed
*                                   PurchasingInfoRecord    = cl_abap_behv=>flag_changed  ) ) ) ) TO lt_poitem.
*
*      lv_pos_numbering += 10.
*    ENDLOOP.
*
*
*    "--- Step 5: Modify entities (only if there are items to create)
*    IF lt_poitem IS NOT INITIAL.
*      MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
*        ENTITY purchaseorder CREATE FROM lt_pohdr
*        ENTITY purchaseorder CREATE BY \_PurchaseOrderItem FROM lt_poitem
*        REPORTED DATA(ls_reported)
*        FAILED   DATA(ls_failed)
*        MAPPED   DATA(ls_mapped).
*
*      COMMIT ENTITIES
*        RESPONSE OF i_purchaseordertp_2
*        FAILED DATA(commit_failed)
*        REPORTED DATA(commit_reported).
*    ENDIF.
*
*  ENDIF. "sy-subrc check
*ENDLOOP.

******************************************************Not Required but still keeping**********************************
*DATA: lv_sno TYPE c LENGTH 5.

*---Loop On internal table lt_po_excel and Create PO   .

*    LOOP AT it_po_final INTO DATA(ls_po_excel).
*
**---Fill PO Header
*
*      IF ls_po_excel-sno EQ lv_sno.
*        CONTINUE .
*      ENDIF.
*
*      lv_sno =  ls_po_excel-sno.
*
*      CLEAR ls_po_header.
*      ls_po_header = VALUE #(
*       company_code              = ls_po_excel-company_code
*       purchase_order_type       = ls_po_excel-purchasing_document_type
*       supplier                  = ls_po_excel-vendor_account_number
*       purchasing_organization   = ls_po_excel-purchasing_organization
*       purchasing_group          = ls_po_excel-purchasing_group
*       creation_date             = ls_po_excel-date
*       validity_start_date       = ls_po_excel-validity_start_date
*       validity_end_date         = ls_po_excel-validity_end_date
*     ).
*
**---Fill PO Items
*      CLEAR lt_items.
*      CLEAR ls_item.
*
*      lt_items = VALUE #(
*        FOR ls_po_item IN it_po_final
*        WHERE ( sno = ls_po_excel-sno )
*        (
*          purchase_order_item  = ls_po_item-item_number
*          material             = ls_po_item-material_number
*          plant                = ls_po_item-plant
*          order_quantity       = ls_po_item-po_quantity
*          order_price_unit     = ls_po_item-price_unit
*          net_price_amount     = ls_po_item-net_price
**         currency             = ls_po_item-currency_key
*          tax_code             = ls_po_item-tax_code
*        )
*      ).




      " At end of group → Create PO
      "IF ls_po_excel-sno NE lv_sno and lt_items is NOT INITIAL.

*      TRY.


*--create http destination by url API endpoint for API sandbox

*          DATA(lo_http_destination) =
*               cl_http_destination_provider=>create_by_url( 'https://my426754.s4hana.cloud.sap:443/sap/opu/odata4/sap/api_purchaseorder_2/srvd_a2x/sap/purchaseorder/0001/' ).
*          DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
*
**---Adding headers
*          DATA(lo_web_http_request) = lo_web_http_client->get_http_request( ).
*
*          lo_web_http_request->set_header_fields( VALUE #(
*          (  name = 'config_authType' value = 'Basic' )
*          (  name = 'Authorization' value = 'Basic RU5WX0lOVF9EOndmWXppRkF6V0ZiWUNsTWZnQUA4TllTdk5CUFZQY1JlaGZFcUpjR0E=' )
*          (  name = 'config_packageName' value = 'SAPS4HANACloud' )
*          (  name = 'config_actualUrl' value = 'https://my426754.s4hana.cloud.sap:443/sap/opu/odata4/sap/api_purchaseorder_2/srvd_a2x/sap/purchaseorder/0001/' )
*          (  name = 'config_apiName' value = 'api_purchaseorder_2' )
*          (  name = 'DataServiceVersion' value = '2.0' )
*          (  name = 'Accept' value = 'application/json' )
*          (  name = 'x-csrf-token' value = 'fetch' )
*           ) ).
*
**---set request method and execute request
*          DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
*
*
*          DATA(lv_response) = lo_web_http_response->get_text( ).
*          DATA(lv_header) = lo_web_http_response->get_header_field( i_name = 'x-csrf-token' ).
*
*
*
*          lo_web_http_request->set_header_fields( VALUE #(
*                                                (  name = 'config_authType' value = 'Basic' )
*                                                (  name = 'Authorization' value = 'Basic RU5WX0lOVF9EOndmWXppRkF6V0ZiWUNsTWZnQUA4TllTdk5CUFZQY1JlaGZFcUpjR0E=' )
*          (  name = 'Accept' value = '*/*' )
*          (  name = 'Content-Type' value = 'application/json' )
*          (  name = 'x-csrf-token' value = lv_header )
*          (  name = '~request_method' value = 'POST' )
*           ) ).
*
*          DATA(lv_header_fields) = lo_web_http_request->get_header_fields(  ).

***********

*
*          lo_web_http_request->set_text(
*            EXPORTING
*              i_text   =  lv_json
*            RECEIVING
*             r_value  = DATA(lv_ret_val)  ).
*
*          lo_response1 = lo_web_http_client->execute( if_web_http_client=>post ).
*
*          DATA(status) = lo_response1->get_status( ).
*          IF status-code NE 200.
*            "Error handling here
*          ENDIF.
*
*          lo_response1 = lo_web_http_client->execute( if_web_http_client=>post ).
*          DATA(lv_xml_results) = lo_response1->get_text( ).

          "

*          TYPES: BEGIN OF ty_po_response,
*                   PurchaseOrder TYPE string,
*                 END OF ty_po_response.
*
*          TYPES: BEGIN OF ty_response_wrapper,
*                   d TYPE ty_po_response,
*                 END OF ty_response_wrapper.
*
*          DATA: ls_response TYPE ty_response_wrapper.
*
*          TRY.
*              /ui2/cl_json=>deserialize(
*                EXPORTING
*                  json = lv_xml_results
*                CHANGING
*                  data = ls_response
*              ).
*            CATCH cx_root INTO DATA(lx_json_error).
*              " Handle error
*          ENDTRY.
*          ls_result-purchase_order = ls_response-d-PurchaseOrder.
*
*
*        CATCH cx_http_dest_provider_error cx_web_http_client_error cx_web_message_error.
*          "error handling
*      ENDTRY.
*
*      gv_total_records = gv_total_records + 1 . " Total Number of Records
*
*
**----PO Creation was successful, commit and log success
*
*      IF ls_result-purchase_order IS NOT INITIAL.
*
*        gt_mailformat = VALUE #(
*          BASE gt_mailformat
*          FOR ls_po_data IN it_po_final
*          WHERE ( sno = ls_po_excel-sno )
*          (
*            sno                       = ls_po_data-sno
*            company_code              = ls_po_data-company_code
*            purchasing_document_type  = ls_po_data-purchasing_document_type
*            date                      = ls_po_data-date
*            vendor_account_number     = ls_po_data-vendor_account_number
*            terms_of_payment_key      = ls_po_data-terms_of_payment_key
*            purchasing_organization   = ls_po_data-purchasing_organization
*            purchasing_group          = ls_po_data-purchasing_group
**             currency                  = ls_po_data-currency_key
*            validity_start_date       = ls_po_data-validity_start_date
*            validity_end_date         = ls_po_data-validity_end_date
*            incoterms                 = ls_po_data-incoterms
*            incoterms_location        = ls_po_data-incoterms_location
*            item_number               = ls_po_data-item_number
*            material_number           = ls_po_data-material_number
*            short_text                = ls_po_data-short_text
*            material_group            = ls_po_data-material_group
*            plant                     = ls_po_data-plant
*            storage_location          = ls_po_data-storage_location
*            po_quantity               = ls_po_data-po_quantity
*            po_uom                    = ls_po_data-po_uom
*            net_price                 = ls_po_data-net_price
*            price_unit                = ls_po_data-price_unit
*            tax_code                  = ls_po_data-tax_code
*            acct_assignment_category  = ls_po_data-acct_assignment_category
*            gl_account                = ls_po_data-gl_account
*            cost_center               = ls_po_data-cost_center
*            valuation_type            = ls_po_data-valuation_type
*            req_no                    = ls_po_data-req_no
*            req_item                  = ls_po_data-req_item
*            info_record               = ls_po_data-info_record
*            status                    = 'SUCCESS'
*            ponumber                  = ls_result-purchase_order
*            message                   = 'PO CREATION SUCCESSFUL' )
*            ).
*
*
*        gv_success_records = gv_success_records + 1 ." Success Records
*
**----PO creation failed rollback and log failure
*
*      ELSE.
*
*        gt_mailformat = VALUE #( BASE gt_mailformat
*                                 FOR ls_po_data_error IN it_po_final
*                                 WHERE ( sno = ls_po_excel-sno )
*                                       (
*            sno                       = ls_po_data_error-sno
*            company_code              = ls_po_data_error-company_code
*            purchasing_document_type  = ls_po_data_error-purchasing_document_type
*            date                      = ls_po_data_error-date
*            vendor_account_number     = ls_po_data_error-vendor_account_number
*            terms_of_payment_key      = ls_po_data_error-terms_of_payment_key
*            purchasing_organization   = ls_po_data_error-purchasing_organization
*            purchasing_group          = ls_po_data_error-purchasing_group
**             currency                  = ls_po_data_error-currency_key
*            validity_start_date       = ls_po_data_error-validity_start_date
*            validity_end_date         = ls_po_data_error-validity_end_date
*            incoterms                 = ls_po_data_error-incoterms
*            incoterms_location        = ls_po_data_error-incoterms_location
*            item_number               = ls_po_data_error-item_number
*            material_number           = ls_po_data_error-material_number
*            short_text                = ls_po_data_error-short_text
*            material_group            = ls_po_data_error-material_group
*            plant                     = ls_po_data_error-plant
*            storage_location          = ls_po_data_error-storage_location
*            po_quantity               = ls_po_data_error-po_quantity
*            po_uom                    = ls_po_data_error-po_uom
*            net_price                 = ls_po_data_error-net_price
*            price_unit                = ls_po_data_error-price_unit
*            tax_code                  = ls_po_data_error-tax_code
*            acct_assignment_category  = ls_po_data_error-acct_assignment_category
*            gl_account                = ls_po_data_error-gl_account
*            cost_center               = ls_po_data_error-cost_center
*            valuation_type            = ls_po_data_error-valuation_type
*            req_no                    = ls_po_data_error-req_no
*            req_item                  = ls_po_data_error-req_item
*            info_record               = ls_po_data_error-info_record
*            status                    = 'FAILED'
*            ponumber                  = ''
*            message                   = 'PO CREATION FAILED'
*                                           ) ).
*
*        gv_fail_records = gv_fail_records + 1 ." Error Records
*
*      ENDIF.
*
*
*
*
*    ENDLOOP.
*
*
*
*  ENDMETHOD.
*
*  METHOD sendmail.
*
*
*
**---Populate Data into Excel file along with status message and send mail to login user .
*
*    DATA: lv_sender_email   TYPE c LENGTH 512,
*          lv_string_content TYPE string,
*          lv_string         TYPE string,
*          lv_content        TYPE string,
*          lv_timestamp      TYPE timestamp,
*          ls_recipient      TYPE cl_bcs_mail_message=>ty_address,
*          lv_filename       TYPE string,
*          lv_stamp          TYPE string,
*          lv_datestring     TYPE string,
*          lv_finalstamp     TYPE string,
*          lv_timestring     TYPE string.
*
*    CONSTANTS: lc_tab TYPE c VALUE cl_abap_char_utilities=>horizontal_tab.
*
*    CONSTANTS:
*      lc_to_creator          TYPE c LENGTH 132 VALUE 'To Creator,',
*      lc_mass_upload_success TYPE c LENGTH 132 VALUE 'The PTA mass upload process you initiated has been successfully executed ...',
*      lc_find_record_results TYPE c LENGTH 132 VALUE 'Please find the full record and results of the upload per attachments for reference.',
*      lc_summary             TYPE c LENGTH 56  VALUE '<br><br><u>Summary:</u><br>',
*      lc_total_records       TYPE c LENGTH 68  VALUE '<li>Total Records Processed: </li>',
*      lc_successful_records  TYPE c LENGTH 60  VALUE '<li>Successful Records: </li>',
*      lc_failed_records      TYPE c LENGTH 52  VALUE '<li>Failed Records: </li>',
*      lc_upload_detail       TYPE c LENGTH 68  VALUE '<br><br><u>Upload Detail:</u><br>',
*      lc_file_name           TYPE c LENGTH 40  VALUE '<li>File Name: </li>',
*      lc_system_id           TYPE c LENGTH 40  VALUE '<li>System ID: </li>',
*      lc_application_name    TYPE c LENGTH 112 VALUE '<li>Application Name: Mass Asset Master Maintenance </li>',
*      lc_scenario_type       TYPE c LENGTH 48  VALUE '<li>Scenario Type: </li>',
*      lc_process_mode        TYPE c LENGTH 46  VALUE '<li>Process mode: </li>',
*      lc_created_by          TYPE c LENGTH 42  VALUE '<li>Created by: </li>',
*      lc_submission_datetime TYPE c LENGTH 66  VALUE '<li>Submission Date & Time: </li>',
*      lc_text_html           TYPE c LENGTH 128  VALUE 'text/html',
*      lc_mass_processing_ok  TYPE c LENGTH 1024 VALUE 'PTA mass processing has been successfully executed',
*      lc_uploaded_log        TYPE c LENGTH 23  VALUE 'Uploaded Log.xls',
*      lc_xlsx                TYPE c LENGTH 128  VALUE 'XLSX'.
*
*
*
*
**---------------------------------------------------------------------*
** Get Sender Email
**---------------------------------------------------------------------*
*    SELECT addr~emailaddress
*      FROM i_user
*      WITH PRIVILEGED ACCESS AS user
*      LEFT OUTER JOIN i_addressemailaddress_2
*      WITH PRIVILEGED ACCESS
*      AS addr ON  addr~addressid     = user~addressid
*              AND addr~addresspersonid = user~addresspersonid
*      WHERE user~userid = @sy-uname
*      INTO @lv_sender_email
*      UP TO 1 ROWS.
*    ENDSELECT.
*
**---------------------------------------------------------------------*
** Populate Header data in Excel file (PO Fields)
**---------------------------------------------------------------------*
*    IF sy-subrc EQ 0 AND lv_sender_email IS NOT INITIAL.
*
*      CONCATENATE
*        ' Serial No'
*        ' Company Code'
*        ' PO Type'
*        ' PO Number'
*        ' PO Date'
*        ' Vendor'
*        ' Terms of Payment'
*        ' Purchasing Org'
*        ' Purchasing Group'
*        ' Currency'
*        ' Validity Start'
*        ' Validity End'
*        ' Incoterms'
*        ' Incoterms Location'
*        ' Item Number'
*        ' Material'
*        ' Short Text'
*        ' Material Group'
*        ' Plant'
*        ' Storage Location'
*        ' Quantity'
*        ' UoM'
*        ' Net Price'
*        ' Price Unit'
*        ' Tax Code'
*        ' Account Assignment Cat.'
*        ' G/L Account'
*        ' Cost Center'
*        ' Valuation Type'
*        ' Requisition No'
*        ' Requisition Item'
*        ' Info Record'
*        ' Status'
*        ' PO Created'
*        ' Message'
*        INTO lv_string SEPARATED BY lc_tab.
*
*      lv_string_content = |{ lv_string_content }{ cl_abap_char_utilities=>newline }{ lv_string }|.
*      CLEAR lv_string.
*
**---------------------------------------------------------------------*
** Populate Line Data from gt_mailformat
**---------------------------------------------------------------------*
*      LOOP AT gt_mailformat ASSIGNING FIELD-SYMBOL(<fs_mailformat>).
*
*        CONCATENATE
*          <fs_mailformat>-sno                                  " Serial No
*          <fs_mailformat>-company_code                         " Company Code
*          <fs_mailformat>-purchasing_document_type             " PO Type
*          <fs_mailformat>-ponumber                             " PO Number
*          <fs_mailformat>-date                                 " PO Date
*          <fs_mailformat>-vendor_account_number                " Vendor
*          <fs_mailformat>-terms_of_payment_key                 " Terms of Payment
*          <fs_mailformat>-purchasing_organization              " Purchasing Org
*          <fs_mailformat>-purchasing_group                     " Purchasing Group
*          <fs_mailformat>-currency_key                         " Currency
*          <fs_mailformat>-validity_start_date                  " Validity Start
*          <fs_mailformat>-validity_end_date                    " Validity End
*          <fs_mailformat>-incoterms                            " Incoterms
*          <fs_mailformat>-incoterms_location                   " Incoterms Location
*          <fs_mailformat>-item_number                          " Item Number
*          <fs_mailformat>-material_number                      " Material
*          <fs_mailformat>-short_text                           " Short Text
*          <fs_mailformat>-material_group                       " Material Group
*          <fs_mailformat>-plant                                " Plant
*          <fs_mailformat>-storage_location                     " Storage Location
*          <fs_mailformat>-po_quantity                          " Quantity
*          <fs_mailformat>-po_uom                               " UoM
*          <fs_mailformat>-net_price                            " Net Price
*          <fs_mailformat>-price_unit                           " Price Unit
*          <fs_mailformat>-tax_code                             " Tax Code
*          <fs_mailformat>-acct_assignment_category             " Account Assignment Cat.
*          <fs_mailformat>-gl_account                           " G/L Account
*          <fs_mailformat>-cost_center                          " Cost Center
*          <fs_mailformat>-valuation_type                       " Valuation Type
*          <fs_mailformat>-req_no                               " Requisition No
*          <fs_mailformat>-req_item                             " Requisition Item
*          <fs_mailformat>-info_record                          " Info Record
*          <fs_mailformat>-status                               " Status
*          <fs_mailformat>-message                              " Message
*
*          INTO lv_string SEPARATED BY lc_tab.
*
*        lv_string_content = |{ lv_string_content }{ cl_abap_char_utilities=>newline }{ lv_string }|.
*        CLEAR lv_string.
*
*      ENDLOOP.
*
**---------------------------------------------------------------------*
** Timestamp for log
**---------------------------------------------------------------------*
*      GET TIME STAMP FIELD lv_timestamp.
*      IF lv_timestamp IS NOT INITIAL.
*        lv_stamp = lv_timestamp.
*        DATA(lv_date) = lv_stamp+0(8).
*        DATA(lv_time) = lv_stamp+8(6).
*
*        lv_datestring = |{ lv_date+4(2) }/{ lv_date+6(2) }/{ lv_date+0(4) }|.
*        lv_timestring = |{ lv_time+0(2) }:{ lv_time+2(2) }:{ lv_time+4(2) }|.
*        lv_finalstamp = |{ lv_datestring } { lv_timestring }|.
*      ENDIF.
*
**---------------------------------------------------------------------*
** Send Mail
**---------------------------------------------------------------------*
*
*      TRY.
*          DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).
*
*          lv_content = |{ lc_to_creator }{ lc_mass_upload_success }{ lc_find_record_results }
*{ lc_summary }{ lc_total_records }{ gv_total_records }{ lc_successful_records }{ gv_success_records }{ lc_failed_records }{ gv_fail_records }
*{ lc_upload_detail }{lc_system_id }{ sy-sysid }{
*                        lc_application_name }{ lc_created_by }{ sy-uname }{ lc_submission_datetime }{ lv_finalstamp }|.
*
*          lo_mail->set_main(
*            cl_bcs_mail_textpart=>create_instance(
*              iv_content      = lv_content
*              iv_content_type = lc_text_html ) ).
*
*          lo_mail->set_sender( lv_sender_email ).
*
*          ls_recipient = lv_sender_email.
*          lo_mail->add_recipient( ls_recipient ).
*
*          lo_mail->set_subject( lc_mass_processing_ok ).
*          lv_filename = lc_uploaded_log.
*
*          lo_mail->add_attachment(
*            cl_bcs_mail_textpart=>create_instance(
*              iv_content      = lv_string_content
*              iv_content_type = lc_xlsx
*              iv_filename     = lv_filename ) ).
*
*          lo_mail->send( ).
*        CATCH cx_bcs_mail INTO DATA(lo_bcs_mail).
*          " Handle exception
*      ENDTRY.
*
*
*
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
