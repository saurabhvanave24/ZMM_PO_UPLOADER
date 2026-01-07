"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_PURCHASEORDER_PROCESS_SRV</em>
CLASS zsc_po_uploader DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type PURCHASE_ORDER
        purchase_order          TYPE string,
        "! Used for primitive type PURCHASE_ORDER_TYPE
        purchase_order_type     TYPE c LENGTH 4,
        "! Used for primitive type PURCHASING_GROUP
        purchasing_group        TYPE c LENGTH 3,
        "! Used for primitive type PURCHASING_ORGANIZATION
        purchasing_organization TYPE c LENGTH 4,
        "! Used for primitive type SUPPLIER
        supplier                TYPE c LENGTH 10,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">DummyFunctionImportResult</p>
      BEGIN OF tys_dummy_function_import_resu,
        "! IsInvalid
        is_invalid TYPE abap_bool,
      END OF tys_dummy_function_import_resu,
      "! <p class="shorttext synchronized">List of DummyFunctionImportResult</p>
      tyt_dummy_function_import_resu TYPE STANDARD TABLE OF tys_dummy_function_import_resu WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">GetPDFResult</p>
      BEGIN OF tys_get_pdfresult,
        "! PurchaseOrderBinary
        purchase_order_binary TYPE string,
      END OF tys_get_pdfresult,
      "! <p class="shorttext synchronized">List of GetPDFResult</p>
      tyt_get_pdfresult TYPE STANDARD TABLE OF tys_get_pdfresult WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function GetOutputBinaryData</p>
      "! <em>with the internal name</em> GET_OUTPUT_BINARY_DATA
      BEGIN OF tys_parameters_1,
        "! PurchaseOrderType
        purchase_order_type     TYPE c LENGTH 4,
        "! PurchasingOrganization
        purchasing_organization TYPE c LENGTH 4,
        "! PurchasingGroup
        purchasing_group        TYPE c LENGTH 3,
        "! Supplier
        supplier                TYPE c LENGTH 10,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function GetPDF</p>
      "! <em>with the internal name</em> GET_PDF
      BEGIN OF tys_parameters_2,
        "! PurchaseOrder
        purchase_order TYPE string,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_POSubcontractingComponentType</p>
      BEGIN OF tys_a_posubcontracting_compo_2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order         TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item    TYPE c LENGTH 5,
        "! <em>Key property</em> ScheduleLine
        schedule_line          TYPE c LENGTH 4,
        "! <em>Key property</em> ReservationItem
        reservation_item       TYPE c LENGTH 4,
        "! <em>Key property</em> RecordType
        record_type            TYPE c LENGTH 1,
        "! Material
        material               TYPE c LENGTH 40,
        "! BOMItemDescription
        bomitem_description    TYPE c LENGTH 40,
        "! RequiredQuantity
        required_quantity      TYPE p LENGTH 7 DECIMALS 3,
        "! BaseUnit
        base_unit              TYPE c LENGTH 3,
        "! RequirementDate
        requirement_date       TYPE datn,
        "! QuantityInEntryUnit
        quantity_in_entry_unit TYPE p LENGTH 7 DECIMALS 3,
        "! EntryUnit
        entry_unit             TYPE c LENGTH 3,
        "! WithdrawnQuantity
        withdrawn_quantity     TYPE p LENGTH 7 DECIMALS 3,
        "! Plant
        plant                  TYPE c LENGTH 4,
        "! Batch
        batch                  TYPE c LENGTH 10,
      END OF tys_a_posubcontracting_compo_2,
      "! <p class="shorttext synchronized">List of A_POSubcontractingComponentType</p>
      tyt_a_posubcontracting_compo_2 TYPE STANDARD TABLE OF tys_a_posubcontracting_compo_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseOrderItemNoteType</p>
      BEGIN OF tys_a_purchase_order_item_no_2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order      TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item TYPE c LENGTH 5,
        "! <em>Key property</em> TextObjectType
        text_object_type    TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language            TYPE c LENGTH 2,
        "! PlainLongText
        plain_long_text     TYPE string,
      END OF tys_a_purchase_order_item_no_2,
      "! <p class="shorttext synchronized">List of A_PurchaseOrderItemNoteType</p>
      tyt_a_purchase_order_item_no_2 TYPE STANDARD TABLE OF tys_a_purchase_order_item_no_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseOrderItemType</p>
      BEGIN OF tys_a_purchase_order_item_type,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! PurchasingDocumentDeletionCode
        purchasing_document_deleti TYPE c LENGTH 1,
        "! PurchaseOrderItemText
        purchase_order_item_text   TYPE c LENGTH 40,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! StorageLocation
        storage_location           TYPE c LENGTH 4,
        "! MaterialGroup
        material_group             TYPE c LENGTH 9,
        "! PurchasingInfoRecord
        purchasing_info_record     TYPE c LENGTH 10,
        "! SupplierMaterialNumber
        supplier_material_number   TYPE c LENGTH 35,
        "! OrderQuantity
        order_quantity             TYPE p LENGTH 7 DECIMALS 3,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! OrderPriceUnit
        order_price_unit           TYPE c LENGTH 3,
        "! OrderPriceUnitToOrderUnitNmrtr
        order_price_unit_to_order  TYPE p LENGTH 3 DECIMALS 0,
        "! OrdPriceUnitToOrderUnitDnmntr
        ord_price_unit_to_order_un TYPE p LENGTH 3 DECIMALS 0,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! NetPriceAmount
        net_price_amount           TYPE p LENGTH 7 DECIMALS 3,
        "! NetPriceQuantity
        net_price_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! ShippingInstruction
        shipping_instruction       TYPE c LENGTH 2,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! PriceIsToBePrinted
        price_is_to_be_printed     TYPE abap_bool,
        "! OverdelivTolrtdLmtRatioInPct
        overdeliv_tolrtd_lmt_ratio TYPE p LENGTH 2 DECIMALS 1,
        "! UnlimitedOverdeliveryIsAllowed
        unlimited_overdelivery_is  TYPE abap_bool,
        "! UnderdelivTolrtdLmtRatioInPct
        underdeliv_tolrtd_lmt_rati TYPE p LENGTH 2 DECIMALS 1,
        "! ValuationType
        valuation_type             TYPE c LENGTH 10,
        "! IsCompletelyDelivered
        is_completely_delivered    TYPE abap_bool,
        "! IsFinallyInvoiced
        is_finally_invoiced        TYPE abap_bool,
        "! PurchaseOrderItemCategory
        purchase_order_item_catego TYPE c LENGTH 1,
        "! AccountAssignmentCategory
        account_assignment_categor TYPE c LENGTH 1,
        "! MultipleAcctAssgmtDistribution
        multiple_acct_assgmt_distr TYPE c LENGTH 1,
        "! PartialInvoiceDistribution
        partial_invoice_distributi TYPE c LENGTH 1,
        "! GoodsReceiptIsExpected
        goods_receipt_is_expected  TYPE abap_bool,
        "! GoodsReceiptIsNonValuated
        goods_receipt_is_non_valua TYPE abap_bool,
        "! InvoiceIsExpected
        invoice_is_expected        TYPE abap_bool,
        "! InvoiceIsGoodsReceiptBased
        invoice_is_goods_receipt_b TYPE abap_bool,
        "! PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! Subcontractor
        subcontractor              TYPE c LENGTH 10,
        "! SupplierIsSubcontractor
        supplier_is_subcontractor  TYPE abap_bool,
        "! ItemNetWeight
        item_net_weight            TYPE p LENGTH 7 DECIMALS 3,
        "! ItemWeightUnit
        item_weight_unit           TYPE c LENGTH 3,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! PricingDateControl
        pricing_date_control       TYPE c LENGTH 1,
        "! ItemVolume
        item_volume                TYPE p LENGTH 7 DECIMALS 3,
        "! ItemVolumeUnit
        item_volume_unit           TYPE c LENGTH 3,
        "! SupplierConfirmationControlKey
        supplier_confirmation_cont TYPE c LENGTH 4,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! EvaldRcptSettlmtIsAllowed
        evald_rcpt_settlmt_is_allo TYPE abap_bool,
        "! PurchaseRequisition
        purchase_requisition       TYPE c LENGTH 10,
        "! PurchaseRequisitionItem
        purchase_requisition_item  TYPE c LENGTH 5,
        "! IsReturnsItem
        is_returns_item            TYPE abap_bool,
        "! RequisitionerName
        requisitioner_name         TYPE c LENGTH 12,
        "! ServicePackage
        service_package            TYPE c LENGTH 10,
        "! EarmarkedFunds
        earmarked_funds            TYPE c LENGTH 10,
        "! EarmarkedFundsDocument
        earmarked_funds_document   TYPE c LENGTH 10,
        "! EarmarkedFundsItem
        earmarked_funds_item       TYPE c LENGTH 3,
        "! EarmarkedFundsDocumentItem
        earmarked_funds_document_i TYPE c LENGTH 3,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! Material
        material                   TYPE c LENGTH 40,
        "! InternationalArticleNumber
        international_article_numb TYPE c LENGTH 18,
        "! ManufacturerMaterial
        manufacturer_material      TYPE c LENGTH 40,
        "! ServicePerformer
        service_performer          TYPE c LENGTH 10,
        "! ProductType
        product_type               TYPE c LENGTH 2,
        "! ExpectedOverallLimitAmount
        expected_overall_limit_amo TYPE p LENGTH 8 DECIMALS 3,
        "! OverallLimitAmount
        overall_limit_amount       TYPE p LENGTH 8 DECIMALS 3,
        "! PurContractForOverallLimit
        pur_contract_for_overall_l TYPE c LENGTH 10,
        "! PurchasingParentItem
        purchasing_parent_item     TYPE c LENGTH 5,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! PurchasingItemIsFreeOfCharge
        purchasing_item_is_free_of TYPE abap_bool,
        "! ReferenceDeliveryAddressID
        reference_delivery_address TYPE c LENGTH 10,
        "! DeliveryAddressID
        delivery_address_id        TYPE c LENGTH 10,
        "! DeliveryAddressName
        delivery_address_name      TYPE c LENGTH 40,
        "! DeliveryAddressName2
        delivery_address_name_2    TYPE c LENGTH 40,
        "! DeliveryAddressFullName
        delivery_address_full_name TYPE c LENGTH 80,
        "! DeliveryAddressStreetName
        delivery_address_street_na TYPE c LENGTH 60,
        "! DeliveryAddressHouseNumber
        delivery_address_house_num TYPE c LENGTH 10,
        "! DeliveryAddressCityName
        delivery_address_city_name TYPE c LENGTH 40,
        "! DeliveryAddressPostalCode
        delivery_address_postal_co TYPE c LENGTH 10,
        "! DeliveryAddressRegion
        delivery_address_region    TYPE c LENGTH 3,
        "! DeliveryAddressCountry
        delivery_address_country   TYPE c LENGTH 3,
        "! DeliveryAddressDistrictName
        delivery_address_district  TYPE c LENGTH 40,
        "! DownPaymentType
        down_payment_type          TYPE c LENGTH 4,
        "! DownPaymentPercentageOfTotAmt
        down_payment_percentage_of TYPE p LENGTH 3 DECIMALS 2,
        "! DownPaymentAmount
        down_payment_amount        TYPE p LENGTH 7 DECIMALS 3,
        "! DownPaymentDueDate
        down_payment_due_date      TYPE datn,
        "! BR_MaterialUsage
        br_material_usage          TYPE c LENGTH 1,
        "! BR_MaterialOrigin
        br_material_origin         TYPE c LENGTH 1,
        "! BR_CFOPCategory
        br_cfopcategory            TYPE c LENGTH 2,
        "! BR_IsProducedInHouse
        br_is_produced_in_house    TYPE abap_bool,
        "! ConsumptionTaxCtrlCode
        consumption_tax_ctrl_code  TYPE c LENGTH 16,
        "! PurgProdCmplncSupplierStatus
        purg_prod_cmplnc_supplier  TYPE c LENGTH 1,
        "! PurgProductMarketabilityStatus
        purg_product_marketability TYPE c LENGTH 1,
        "! PurgSafetyDataSheetStatus
        purg_safety_data_sheet_sta TYPE c LENGTH 1,
        "! PurgProdCmplncDngrsGoodsStatus
        purg_prod_cmplnc_dngrs_goo TYPE c LENGTH 1,
      END OF tys_a_purchase_order_item_type,
      "! <p class="shorttext synchronized">List of A_PurchaseOrderItemType</p>
      tyt_a_purchase_order_item_type TYPE STANDARD TABLE OF tys_a_purchase_order_item_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseOrderNoteType</p>
      BEGIN OF tys_a_purchase_order_note_type,
        "! <em>Key property</em> PurchaseOrder
        purchase_order   TYPE c LENGTH 10,
        "! <em>Key property</em> TextObjectType
        text_object_type TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language         TYPE c LENGTH 2,
        "! PlainLongText
        plain_long_text  TYPE string,
      END OF tys_a_purchase_order_note_type,
      "! <p class="shorttext synchronized">List of A_PurchaseOrderNoteType</p>
      tyt_a_purchase_order_note_type TYPE STANDARD TABLE OF tys_a_purchase_order_note_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseOrderScheduleLineType</p>
      BEGIN OF tys_a_purchase_order_schedul_2,
        "! <em>Key property</em> PurchasingDocument
        purchasing_document        TYPE c LENGTH 10,
        "! <em>Key property</em> PurchasingDocumentItem
        purchasing_document_item   TYPE c LENGTH 5,
        "! <em>Key property</em> ScheduleLine
        schedule_line              TYPE c LENGTH 4,
        "! DelivDateCategory
        deliv_date_category        TYPE c LENGTH 1,
        "! ScheduleLineDeliveryDate
        schedule_line_delivery_dat TYPE datn,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! ScheduleLineOrderQuantity
        schedule_line_order_quanti TYPE p LENGTH 7 DECIMALS 3,
        "! ScheduleLineDeliveryTime
        schedule_line_delivery_tim TYPE timn,
        "! SchedLineStscDeliveryDate
        sched_line_stsc_delivery_d TYPE datn,
        "! PurchaseRequisition
        purchase_requisition       TYPE c LENGTH 10,
        "! PurchaseRequisitionItem
        purchase_requisition_item  TYPE c LENGTH 5,
        "! ScheduleLineCommittedQuantity
        schedule_line_committed_qu TYPE p LENGTH 7 DECIMALS 3,
        "! PerformancePeriodStartDate
        performance_period_start_d TYPE datn,
        "! PerformancePeriodEndDate
        performance_period_end_dat TYPE datn,
      END OF tys_a_purchase_order_schedul_2,
      "! <p class="shorttext synchronized">List of A_PurchaseOrderScheduleLineType</p>
      tyt_a_purchase_order_schedul_2 TYPE STANDARD TABLE OF tys_a_purchase_order_schedul_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseOrderType</p>
      BEGIN OF tys_a_purchase_order_type,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! PurchaseOrderType
        purchase_order_type        TYPE c LENGTH 4,
        "! PurchasingDocumentDeletionCode
        purchasing_document_deleti TYPE c LENGTH 1,
        "! PurchasingProcessingStatus
        purchasing_processing_stat TYPE c LENGTH 2,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestampl,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! PurchaseOrderSubtype
        purchase_order_subtype     TYPE c LENGTH 1,
        "! Language
        language                   TYPE c LENGTH 2,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CashDiscount1Days
        cash_discount_1_days       TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount2Days
        cash_discount_2_days       TYPE p LENGTH 2 DECIMALS 0,
        "! NetPaymentDays
        net_payment_days           TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount1Percent
        cash_discount_1_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount2Percent
        cash_discount_2_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PurchasingDocumentOrigin
        purchasing_document_origin TYPE c LENGTH 1,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! PurchaseOrderDate
        purchase_order_date        TYPE datn,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! ExchangeRate
        exchange_rate              TYPE c LENGTH 12,
        "! ExchangeRateIsFixed
        exchange_rate_is_fixed     TYPE abap_bool,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
        "! SupplierQuotationExternalID
        supplier_quotation_externa TYPE c LENGTH 10,
        "! PurchasingCollectiveNumber
        purchasing_collective_numb TYPE c LENGTH 10,
        "! SupplierRespSalesPersonName
        supplier_resp_sales_person TYPE c LENGTH 30,
        "! SupplierPhoneNumber
        supplier_phone_number      TYPE c LENGTH 16,
        "! SupplyingSupplier
        supplying_supplier         TYPE c LENGTH 10,
        "! SupplyingPlant
        supplying_plant            TYPE c LENGTH 4,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! CorrespncExternalReference
        correspnc_external_referen TYPE c LENGTH 12,
        "! CorrespncInternalReference
        correspnc_internal_referen TYPE c LENGTH 12,
        "! InvoicingParty
        invoicing_party            TYPE c LENGTH 10,
        "! ReleaseIsNotCompleted
        release_is_not_completed   TYPE abap_bool,
        "! PurchasingCompletenessStatus
        purchasing_completeness_st TYPE abap_bool,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! ManualSupplierAddressID
        manual_supplier_address_id TYPE c LENGTH 10,
        "! IsEndOfPurposeBlocked
        is_end_of_purpose_blocked  TYPE c LENGTH 1,
        "! AddressCityName
        address_city_name          TYPE c LENGTH 40,
        "! AddressFaxNumber
        address_fax_number         TYPE c LENGTH 30,
        "! AddressHouseNumber
        address_house_number       TYPE c LENGTH 10,
        "! AddressName
        address_name               TYPE c LENGTH 40,
        "! AddressPostalCode
        address_postal_code        TYPE c LENGTH 10,
        "! AddressStreetName
        address_street_name        TYPE c LENGTH 60,
        "! AddressPhoneNumber
        address_phone_number       TYPE c LENGTH 30,
        "! AddressRegion
        address_region             TYPE c LENGTH 3,
        "! AddressCountry
        address_country            TYPE c LENGTH 3,
        "! AddressCorrespondenceLanguage
        address_correspondence_lan TYPE c LENGTH 2,
        "! PurgAggrgdProdCmplncSuplrSts
        purg_aggrgd_prod_cmplnc_su TYPE c LENGTH 1,
        "! PurgAggrgdProdMarketabilitySts
        purg_aggrgd_prod_marketabi TYPE c LENGTH 1,
        "! PurgAggrgdSftyDataSheetStatus
        purg_aggrgd_sfty_data_shee TYPE c LENGTH 1,
        "! PurgProdCmplncTotDngrsGoodsSts
        purg_prod_cmplnc_tot_dngrs TYPE c LENGTH 1,
      END OF tys_a_purchase_order_type,
      "! <p class="shorttext synchronized">List of A_PurchaseOrderType</p>
      tyt_a_purchase_order_type TYPE STANDARD TABLE OF tys_a_purchase_order_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurOrdAccountAssignmentType</p>
      BEGIN OF tys_a_pur_ord_account_assign_2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> AccountAssignmentNumber
        account_assignment_number  TYPE c LENGTH 2,
        "! IsDeleted
        is_deleted                 TYPE abap_bool,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! MultipleAcctAssgmtDistrPercent
        multiple_acct_assgmt_distr TYPE p LENGTH 2 DECIMALS 1,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! PurgDocNetAmount
        purg_doc_net_amount        TYPE p LENGTH 8 DECIMALS 3,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! SalesOrderScheduleLine
        sales_order_schedule_line  TYPE c LENGTH 4,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! GoodsRecipientName
        goods_recipient_name       TYPE c LENGTH 12,
        "! UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! OrderID
        order_id                   TYPE c LENGTH 12,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! WBSElementInternalID
        wbselement_internal_id     TYPE c LENGTH 24,
        "! WBSElement
        wbselement                 TYPE c LENGTH 24,
        "! WBSElementExternalID
        wbselement_external_id     TYPE c LENGTH 24,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! NetworkActivity
        network_activity           TYPE c LENGTH 4,
        "! RealEstateObject
        real_estate_object         TYPE c LENGTH 40,
        "! PartnerAccountNumber
        partner_account_number     TYPE c LENGTH 10,
        "! CommitmentItem
        commitment_item            TYPE c LENGTH 24,
        "! JointVentureRecoveryCode
        joint_venture_recovery_cod TYPE c LENGTH 2,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! SettlementReferenceDate
        settlement_reference_date  TYPE datn,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! EarmarkedFundsDocument
        earmarked_funds_document   TYPE c LENGTH 10,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
      END OF tys_a_pur_ord_account_assign_2,
      "! <p class="shorttext synchronized">List of A_PurOrdAccountAssignmentType</p>
      tyt_a_pur_ord_account_assign_2 TYPE STANDARD TABLE OF tys_a_pur_ord_account_assign_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurOrdPricingElementType</p>
      BEGIN OF tys_a_pur_ord_pricing_elemen_2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> PricingDocument
        pricing_document           TYPE c LENGTH 10,
        "! <em>Key property</em> PricingDocumentItem
        pricing_document_item      TYPE c LENGTH 6,
        "! <em>Key property</em> PricingProcedureStep
        pricing_procedure_step     TYPE c LENGTH 3,
        "! <em>Key property</em> PricingProcedureCounter
        pricing_procedure_counter  TYPE c LENGTH 3,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! ConditionRateValue
        condition_rate_value       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 5,
        "! PriceDetnExchangeRate
        price_detn_exchange_rate   TYPE c LENGTH 12,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 5,
        "! ConditionAmount
        condition_amount           TYPE p LENGTH 9 DECIMALS 3,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionApplication
        condition_application      TYPE c LENGTH 2,
        "! PricingDateTime
        pricing_date_time          TYPE c LENGTH 14,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 3,
        "! ConditionBaseValue
        condition_base_value       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionToBaseQtyNmrtr
        condition_to_base_qty_nmrt TYPE p LENGTH 6 DECIMALS 0,
        "! ConditionToBaseQtyDnmntr
        condition_to_base_qty_dnmn TYPE p LENGTH 6 DECIMALS 0,
        "! ConditionCategory
        condition_category         TYPE c LENGTH 1,
        "! ConditionIsForStatistics
        condition_is_for_statistic TYPE abap_bool,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! IsRelevantForAccrual
        is_relevant_for_accrual    TYPE abap_bool,
        "! CndnIsRelevantForInvoiceList
        cndn_is_relevant_for_invoi TYPE c LENGTH 1,
        "! ConditionOrigin
        condition_origin           TYPE c LENGTH 1,
        "! IsGroupCondition
        is_group_condition         TYPE c LENGTH 1,
        "! CndnIsRelevantForLimitValue
        cndn_is_relevant_for_limit TYPE abap_bool,
        "! ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 3,
        "! ConditionControl
        condition_control          TYPE c LENGTH 1,
        "! ConditionInactiveReason
        condition_inactive_reason  TYPE c LENGTH 1,
        "! ConditionClass
        condition_class            TYPE c LENGTH 1,
        "! FactorForConditionBasisValue
        factor_for_condition_basis TYPE /iwbep/v4_float,
        "! PricingScaleBasis
        pricing_scale_basis        TYPE c LENGTH 3,
        "! ConditionScaleBasisValue
        condition_scale_basis_valu TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionScaleBasisCurrency
        condition_scale_basis_curr TYPE c LENGTH 5,
        "! ConditionScaleBasisUnit
        condition_scale_basis_unit TYPE c LENGTH 3,
        "! CndnIsRelevantForIntcoBilling
        cndn_is_relevant_for_intco TYPE abap_bool,
        "! ConditionIsForConfiguration
        condition_is_for_configura TYPE abap_bool,
        "! ConditionIsManuallyChanged
        condition_is_manually_chan TYPE abap_bool,
        "! ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! AccessNumberOfAccessSequence
        access_number_of_access_se TYPE c LENGTH 3,
      END OF tys_a_pur_ord_pricing_elemen_2,
      "! <p class="shorttext synchronized">List of A_PurOrdPricingElementType</p>
      tyt_a_pur_ord_pricing_elemen_2 TYPE STANDARD TABLE OF tys_a_pur_ord_pricing_elemen_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_POSubcontractingComponent
        "! <br/> Collection of type 'A_POSubcontractingComponentType'
        a_posubcontracting_compone TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_POSUBCONTRACTING_COMPONE',
        "! A_PurchaseOrder
        "! <br/> Collection of type 'A_PurchaseOrderType'
        a_purchase_order           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_ORDER',
        "! A_PurchaseOrderItem
        "! <br/> Collection of type 'A_PurchaseOrderItemType'
        a_purchase_order_item      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_ORDER_ITEM',
        "! A_PurchaseOrderItemNote
        "! <br/> Collection of type 'A_PurchaseOrderItemNoteType'
        a_purchase_order_item_note TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_ORDER_ITEM_NOTE',
        "! A_PurchaseOrderNote
        "! <br/> Collection of type 'A_PurchaseOrderNoteType'
        a_purchase_order_note      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_ORDER_NOTE',
        "! A_PurchaseOrderScheduleLine
        "! <br/> Collection of type 'A_PurchaseOrderScheduleLineType'
        a_purchase_order_schedule  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_ORDER_SCHEDULE',
        "! A_PurOrdAccountAssignment
        "! <br/> Collection of type 'A_PurOrdAccountAssignmentType'
        a_pur_ord_account_assignme TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_ORD_ACCOUNT_ASSIGNME',
        "! A_PurOrdPricingElement
        "! <br/> Collection of type 'A_PurOrdPricingElementType'
        a_pur_ord_pricing_element  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_ORD_PRICING_ELEMENT',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! GetOutputBinaryData
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        get_output_binary_data TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_OUTPUT_BINARY_DATA',
        "! GetPDF
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        get_pdf                TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_PDF',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for DummyFunctionImportResult</p>
        "! See also structure type {@link ..tys_dummy_function_import_resu}
        BEGIN OF dummy_function_import_resu,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF dummy_function_import_resu,
        "! <p class="shorttext synchronized">Internal names for GetPDFResult</p>
        "! See also structure type {@link ..tys_get_pdfresult}
        BEGIN OF get_pdfresult,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF get_pdfresult,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_POSubcontractingComponentType</p>
        "! See also structure type {@link ..tys_a_posubcontracting_compo_2}
        BEGIN OF a_posubcontracting_compo_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_posubcontracting_compo_2,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseOrderItemNoteType</p>
        "! See also structure type {@link ..tys_a_purchase_order_item_no_2}
        BEGIN OF a_purchase_order_item_no_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_purchase_order_item_no_2,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseOrderItemType</p>
        "! See also structure type {@link ..tys_a_purchase_order_item_type}
        BEGIN OF a_purchase_order_item_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_AccountAssignment
            to_account_assignment      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ACCOUNT_ASSIGNMENT',
            "! to_PurchaseOrder
            to_purchase_order          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_ORDER',
            "! to_PurchaseOrderItemNote
            to_purchase_order_item_not TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_ORDER_ITEM_NOT',
            "! to_PurchaseOrderPricingElement
            to_purchase_order_pricing  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_ORDER_PRICING',
            "! to_ScheduleLine
            to_schedule_line           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SCHEDULE_LINE',
          END OF navigation,
        END OF a_purchase_order_item_type,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseOrderNoteType</p>
        "! See also structure type {@link ..tys_a_purchase_order_note_type}
        BEGIN OF a_purchase_order_note_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_purchase_order_note_type,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseOrderScheduleLineType</p>
        "! See also structure type {@link ..tys_a_purchase_order_schedul_2}
        BEGIN OF a_purchase_order_schedul_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_SubcontractingComponent
            to_subcontracting_componen TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUBCONTRACTING_COMPONEN',
          END OF navigation,
        END OF a_purchase_order_schedul_2,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseOrderType</p>
        "! See also structure type {@link ..tys_a_purchase_order_type}
        BEGIN OF a_purchase_order_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseOrderItem
            to_purchase_order_item TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_ORDER_ITEM',
            "! to_PurchaseOrderNote
            to_purchase_order_note TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_ORDER_NOTE',
          END OF navigation,
        END OF a_purchase_order_type,
        "! <p class="shorttext synchronized">Internal names for A_PurOrdAccountAssignmentType</p>
        "! See also structure type {@link ..tys_a_pur_ord_account_assign_2}
        BEGIN OF a_pur_ord_account_assign_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_pur_ord_account_assign_2,
        "! <p class="shorttext synchronized">Internal names for A_PurOrdPricingElementType</p>
        "! See also structure type {@link ..tys_a_pur_ord_pricing_elemen_2}
        BEGIN OF a_pur_ord_pricing_elemen_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_pur_ord_pricing_elemen_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define DummyFunctionImportResult</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_dummy_function_import_resu RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetPDFResult</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_pdfresult RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_POSubcontractingComponentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_posubcontracting_compo_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseOrderItemNoteType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_order_item_no_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseOrderItemType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_order_item_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseOrderNoteType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_order_note_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseOrderScheduleLineType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_order_schedul_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseOrderType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_order_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurOrdAccountAssignmentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_ord_account_assign_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurOrdPricingElementType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_ord_pricing_elemen_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetOutputBinaryData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_output_binary_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetPDF</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_pdf RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSC_PO_UPLOADER IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_PURCHASEORDER_PROCESS_SRV' ) ##NO_TEXT.

    def_dummy_function_import_resu( ).
    def_get_pdfresult( ).
    def_a_posubcontracting_compo_2( ).
    def_a_purchase_order_item_no_2( ).
    def_a_purchase_order_item_type( ).
    def_a_purchase_order_note_type( ).
    def_a_purchase_order_schedul_2( ).
    def_a_purchase_order_type( ).
    def_a_pur_ord_account_assign_2( ).
    def_a_pur_ord_pricing_elemen_2( ).
    def_get_output_binary_data( ).
    def_get_pdf( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASE_ORDER'
                            iv_element             = VALUE tys_types_for_prim_types-purchase_order( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASE_ORDER_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-purchase_order_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASING_GROUP'
                            iv_element             = VALUE tys_types_for_prim_types-purchasing_group( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASING_ORGANIZATION'
                            iv_element             = VALUE tys_types_for_prim_types-purchasing_organization( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SUPPLIER'
                            iv_element             = VALUE tys_types_for_prim_types-supplier( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

  ENDMETHOD.


  METHOD def_a_posubcontracting_compo_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_POSUBCONTRACTING_COMPO_2'
                                    is_structure              = VALUE tys_a_posubcontracting_compo_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_POSubcontractingComponentType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_POSUBCONTRACTING_COMPONE' ).
    lo_entity_set->set_edm_name( 'A_POSubcontractingComponent' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESERVATION_ITEM' ).
    lo_primitive_property->set_edm_name( 'ReservationItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECORD_TYPE' ).
    lo_primitive_property->set_edm_name( 'RecordType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOMITEM_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'BOMItemDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIRED_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'RequiredQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UNIT' ).
    lo_primitive_property->set_edm_name( 'BaseUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIREMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'RequirementDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_IN_ENTRY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityInEntryUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_UNIT' ).
    lo_primitive_property->set_edm_name( 'EntryUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHDRAWN_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'WithdrawnQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_purchase_order_item_no_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_ORDER_ITEM_NO_2'
                                    is_structure              = VALUE tys_a_purchase_order_item_no_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseOrderItemNoteType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_ORDER_ITEM_NOTE' ).
    lo_entity_set->set_edm_name( 'A_PurchaseOrderItemNote' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAIN_LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'PlainLongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_purchase_order_item_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_ORDER_ITEM_TYPE'
                                    is_structure              = VALUE tys_a_purchase_order_item_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseOrderItemType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_ORDER_ITEM' ).
    lo_entity_set->set_edm_name( 'A_PurchaseOrderItem' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_DELETI' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'StorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_GROUP' ).
    lo_primitive_property->set_edm_name( 'MaterialGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_INFO_RECORD' ).
    lo_primitive_property->set_edm_name( 'PurchasingInfoRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_MATERIAL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierMaterialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'OrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT_TO_ORDER' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnitToOrderUnitNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORD_PRICE_UNIT_TO_ORDER_UN' ).
    lo_primitive_property->set_edm_name( 'OrdPriceUnitToOrderUnitDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetPriceAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'NetPriceQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_INSTRUCTION' ).
    lo_primitive_property->set_edm_name( 'ShippingInstruction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_IS_TO_BE_PRINTED' ).
    lo_primitive_property->set_edm_name( 'PriceIsToBePrinted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERDELIV_TOLRTD_LMT_RATIO' ).
    lo_primitive_property->set_edm_name( 'OverdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLIMITED_OVERDELIVERY_IS' ).
    lo_primitive_property->set_edm_name( 'UnlimitedOverdeliveryIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDERDELIV_TOLRTD_LMT_RATI' ).
    lo_primitive_property->set_edm_name( 'UnderdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValuationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_COMPLETELY_DELIVERED' ).
    lo_primitive_property->set_edm_name( 'IsCompletelyDelivered' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_FINALLY_INVOICED' ).
    lo_primitive_property->set_edm_name( 'IsFinallyInvoiced' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM_CATEGO' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_CATEGOR' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistribution' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTIAL_INVOICE_DISTRIBUTI' ).
    lo_primitive_property->set_edm_name( 'PartialInvoiceDistribution' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_NON_VALUA' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsNonValuated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_GOODS_RECEIPT_B' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsGoodsReceiptBased' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBCONTRACTOR' ).
    lo_primitive_property->set_edm_name( 'Subcontractor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_IS_SUBCONTRACTOR' ).
    lo_primitive_property->set_edm_name( 'SupplierIsSubcontractor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'ItemNetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_WEIGHT_UNIT' ).
    lo_primitive_property->set_edm_name( 'ItemWeightUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DATE_CONTROL' ).
    lo_primitive_property->set_edm_name( 'PricingDateControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME' ).
    lo_primitive_property->set_edm_name( 'ItemVolume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME_UNIT' ).
    lo_primitive_property->set_edm_name( 'ItemVolumeUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_CONFIRMATION_CONT' ).
    lo_primitive_property->set_edm_name( 'SupplierConfirmationControlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_TRANSFER_LOCATIO' ).
    lo_primitive_property->set_edm_name( 'IncotermsTransferLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVALD_RCPT_SETTLMT_IS_ALLO' ).
    lo_primitive_property->set_edm_name( 'EvaldRcptSettlmtIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisitionItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_RETURNS_ITEM' ).
    lo_primitive_property->set_edm_name( 'IsReturnsItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUISITIONER_NAME' ).
    lo_primitive_property->set_edm_name( 'RequisitionerName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_PACKAGE' ).
    lo_primitive_property->set_edm_name( 'ServicePackage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFunds' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_ITEM' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT_I' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_ARTICLE_NUMB' ).
    lo_primitive_property->set_edm_name( 'InternationalArticleNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUFACTURER_MATERIAL' ).
    lo_primitive_property->set_edm_name( 'ManufacturerMaterial' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_PERFORMER' ).
    lo_primitive_property->set_edm_name( 'ServicePerformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_TYPE' ).
    lo_primitive_property->set_edm_name( 'ProductType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPECTED_OVERALL_LIMIT_AMO' ).
    lo_primitive_property->set_edm_name( 'ExpectedOverallLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_LIMIT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'OverallLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTRACT_FOR_OVERALL_L' ).
    lo_primitive_property->set_edm_name( 'PurContractForOverallLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PARENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchasingParentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ITEM_IS_FREE_OF' ).
    lo_primitive_property->set_edm_name( 'PurchasingItemIsFreeOfCharge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DELIVERY_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'ReferenceDeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_NAME' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_NAME_2' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_STREET_NA' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressStreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_HOUSE_NUM' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressHouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressCityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_POSTAL_CO' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_REGION' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressRegion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_DISTRICT' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressDistrictName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_PERCENTAGE_OF' ).
    lo_primitive_property->set_edm_name( 'DownPaymentPercentageOfTotAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DownPaymentAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_MATERIAL_USAGE' ).
    lo_primitive_property->set_edm_name( 'BR_MaterialUsage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_MATERIAL_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'BR_MaterialOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_CFOPCATEGORY' ).
    lo_primitive_property->set_edm_name( 'BR_CFOPCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_IS_PRODUCED_IN_HOUSE' ).
    lo_primitive_property->set_edm_name( 'BR_IsProducedInHouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSUMPTION_TAX_CTRL_CODE' ).
    lo_primitive_property->set_edm_name( 'ConsumptionTaxCtrlCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncSupplierStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PRODUCT_MARKETABILITY' ).
    lo_primitive_property->set_edm_name( 'PurgProductMarketabilityStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_SAFETY_DATA_SHEET_STA' ).
    lo_primitive_property->set_edm_name( 'PurgSafetyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_DNGRS_GOO' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncDngrsGoodsStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_ACCOUNT_ASSIGNMENT' ).
    lo_navigation_property->set_edm_name( 'to_AccountAssignment' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_ORD_ACCOUNT_ASSIGN_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_ORDER' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_ORDER_ITEM_NOT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseOrderItemNote' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_ORDER_ITEM_NO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_ORDER_PRICING' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseOrderPricingElement' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_ORD_PRICING_ELEMEN_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SCHEDULE_LINE' ).
    lo_navigation_property->set_edm_name( 'to_ScheduleLine' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_ORDER_SCHEDUL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_purchase_order_note_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_ORDER_NOTE_TYPE'
                                    is_structure              = VALUE tys_a_purchase_order_note_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseOrderNoteType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_ORDER_NOTE' ).
    lo_entity_set->set_edm_name( 'A_PurchaseOrderNote' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAIN_LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'PlainLongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_purchase_order_schedul_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_ORDER_SCHEDUL_2'
                                    is_structure              = VALUE tys_a_purchase_order_schedul_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseOrderScheduleLineType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_ORDER_SCHEDULE' ).
    lo_entity_set->set_edm_name( 'A_PurchaseOrderScheduleLine' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_DATE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'DelivDateCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_DELIVERY_DAT' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_ORDER_QUANTI' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineOrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_DELIVERY_TIM' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineDeliveryTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHED_LINE_STSC_DELIVERY_D' ).
    lo_primitive_property->set_edm_name( 'SchedLineStscDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisitionItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_COMMITTED_QU' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineCommittedQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERFORMANCE_PERIOD_START_D' ).
    lo_primitive_property->set_edm_name( 'PerformancePeriodStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERFORMANCE_PERIOD_END_DAT' ).
    lo_primitive_property->set_edm_name( 'PerformancePeriodEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUBCONTRACTING_COMPONEN' ).
    lo_navigation_property->set_edm_name( 'to_SubcontractingComponent' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_POSUBCONTRACTING_COMPO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_purchase_order_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_ORDER_TYPE'
                                    is_structure              = VALUE tys_a_purchase_order_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseOrderType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_ORDER' ).
    lo_entity_set->set_edm_name( 'A_PurchaseOrder' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_TYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_DELETI' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PROCESSING_STAT' ).
    lo_primitive_property->set_edm_name( 'PurchasingProcessingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGE_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangeDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_SUBTYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderSubtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PAYMENT_DAYS' ).
    lo_primitive_property->set_edm_name( 'NetPaymentDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_GROUP' ).
    lo_primitive_property->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_DATE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE' ).
    lo_primitive_property->set_edm_name( 'ExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE_IS_FIXED' ).
    lo_primitive_property->set_edm_name( 'ExchangeRateIsFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_START_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_END_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_QUOTATION_EXTERNA' ).
    lo_primitive_property->set_edm_name( 'SupplierQuotationExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_COLLECTIVE_NUMB' ).
    lo_primitive_property->set_edm_name( 'PurchasingCollectiveNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_RESP_SALES_PERSON' ).
    lo_primitive_property->set_edm_name( 'SupplierRespSalesPersonName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'SupplyingSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_PLANT' ).
    lo_primitive_property->set_edm_name( 'SupplyingPlant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_INTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncInternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY' ).
    lo_primitive_property->set_edm_name( 'InvoicingParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELEASE_IS_NOT_COMPLETED' ).
    lo_primitive_property->set_edm_name( 'ReleaseIsNotCompleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_COMPLETENESS_ST' ).
    lo_primitive_property->set_edm_name( 'PurchasingCompletenessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_VERSION' ).
    lo_primitive_property->set_edm_name( 'IncotermsVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_SUPPLIER_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'ManualSupplierAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_END_OF_PURPOSE_BLOCKED' ).
    lo_primitive_property->set_edm_name( 'IsEndOfPurposeBlocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'AddressCityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AddressFaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AddressHouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_NAME' ).
    lo_primitive_property->set_edm_name( 'AddressName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'AddressPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'AddressStreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AddressPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_REGION' ).
    lo_primitive_property->set_edm_name( 'AddressRegion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'AddressCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_CORRESPONDENCE_LAN' ).
    lo_primitive_property->set_edm_name( 'AddressCorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_PROD_CMPLNC_SU' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdProdCmplncSuplrSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_PROD_MARKETABI' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdProdMarketabilitySts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_SFTY_DATA_SHEE' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdSftyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_TOT_DNGRS' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncTotDngrsGoodsSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_ORDER_ITEM' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_ORDER_NOTE' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseOrderNote' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_ORDER_NOTE_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_pur_ord_account_assign_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_ORD_ACCOUNT_ASSIGN_2'
                                    is_structure              = VALUE tys_a_pur_ord_account_assign_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurOrdAccountAssignmentType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_ORD_ACCOUNT_ASSIGNME' ).
    lo_entity_set->set_edm_name( 'A_PurOrdAccountAssignment' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'IsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistrPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'PurgDocNetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'CostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'SalesOrderScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MASTER_FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'MasterFixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'FixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECIPIENT_NAME' ).
    lo_primitive_property->set_edm_name( 'GoodsRecipientName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLOADING_POINT_NAME' ).
    lo_primitive_property->set_edm_name( 'UnloadingPointName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_OBJECT' ).
    lo_primitive_property->set_edm_name( 'CostObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ID' ).
    lo_primitive_property->set_edm_name( 'OrderID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_INTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT' ).
    lo_primitive_property->set_edm_name( 'WBSElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_EXTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK' ).
    lo_primitive_property->set_edm_name( 'ProjectNetwork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'NetworkActivity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REAL_ESTATE_OBJECT' ).
    lo_primitive_property->set_edm_name( 'RealEstateObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_ACCOUNT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PartnerAccountNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMITMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CommitmentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE_RECOVERY_COD' ).
    lo_primitive_property->set_edm_name( 'JointVentureRecoveryCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CENTER' ).
    lo_primitive_property->set_edm_name( 'FundsCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONAL_AREA' ).
    lo_primitive_property->set_edm_name( 'FunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETTLEMENT_REFERENCE_DATE' ).
    lo_primitive_property->set_edm_name( 'SettlementReferenceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CTR_ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'CostCtrActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PROCESS' ).
    lo_primitive_property->set_edm_name( 'BusinessProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_ID' ).
    lo_primitive_property->set_edm_name( 'GrantID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_pur_ord_pricing_elemen_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_ORD_PRICING_ELEMEN_2'
                                    is_structure              = VALUE tys_a_pur_ord_pricing_elemen_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurOrdPricingElementType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_ORD_PRICING_ELEMENT' ).
    lo_entity_set->set_edm_name( 'A_PurOrdPricingElement' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'PricingDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PricingDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_STEP' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureStep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_DETN_EXCHANGE_RATE' ).
    lo_primitive_property->set_edm_name( 'PriceDetnExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_APPLICATION' ).
    lo_primitive_property->set_edm_name( 'ConditionApplication' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'PricingDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_NMRT' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_DNMN' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'ConditionCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_STATISTIC' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForStatistics' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_RELEVANT_FOR_ACCRUAL' ).
    lo_primitive_property->set_edm_name( 'IsRelevantForAccrual' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_INVOI' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForInvoiceList' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'ConditionOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_GROUP_CONDITION' ).
    lo_primitive_property->set_edm_name( 'IsGroupCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForLimitValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CONTROL' ).
    lo_primitive_property->set_edm_name( 'ConditionControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_INACTIVE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionInactiveReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CLASS' ).
    lo_primitive_property->set_edm_name( 'ConditionClass' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FACTOR_FOR_CONDITION_BASIS' ).
    lo_primitive_property->set_edm_name( 'FactorForConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_BASIS' ).
    lo_primitive_property->set_edm_name( 'PricingScaleBasis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_VALU' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_CURR' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_INTCO' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForIntcoBilling' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_CONFIGURA' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForConfiguration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_MANUALLY_CHAN' ).
    lo_primitive_property->set_edm_name( 'ConditionIsManuallyChanged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCESS_NUMBER_OF_ACCESS_SE' ).
    lo_primitive_property->set_edm_name( 'AccessNumberOfAccessSequence' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_dummy_function_import_resu.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'DUMMY_FUNCTION_IMPORT_RESU'
                                    is_structure              = VALUE tys_dummy_function_import_resu( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'DummyFunctionImportResult' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'IS_INVALID' ).
    lo_primitive_property->set_edm_name( 'IsInvalid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_get_output_binary_data.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_OUTPUT_BINARY_DATA' ).
    lo_function->set_edm_name( 'GetOutputBinaryData' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_1( ) ).

    lo_function_import = lo_function->create_function_import( 'GET_OUTPUT_BINARY_DATA' ).
    lo_function_import->set_edm_name( 'GetOutputBinaryData' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_parameter = lo_function->create_parameter( 'PURCHASE_ORDER_TYPE' ).
    lo_parameter->set_edm_name( 'PurchaseOrderType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASE_ORDER_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'PURCHASING_ORGANIZATION' ).
    lo_parameter->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASING_ORGANIZATION' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'PURCHASING_GROUP' ).
    lo_parameter->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASING_GROUP' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SUPPLIER' ).
    lo_parameter->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SUPPLIER' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'GET_PDFRESULT' ).

  ENDMETHOD.


  METHOD def_get_pdf.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_PDF' ).
    lo_function->set_edm_name( 'GetPDF' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_2( ) ).

    lo_function_import = lo_function->create_function_import( 'GET_PDF' ).
    lo_function_import->set_edm_name( 'GetPDF' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_parameter = lo_function->create_parameter( 'PURCHASE_ORDER' ).
    lo_parameter->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASE_ORDER' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'GET_PDFRESULT' ).

  ENDMETHOD.


  METHOD def_get_pdfresult.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'GET_PDFRESULT'
                                    is_structure              = VALUE tys_get_pdfresult( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'GetPDFResult' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'PURCHASE_ORDER_BINARY' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderBinary' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

  ENDMETHOD.
ENDCLASS.
