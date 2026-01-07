@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Error Log PO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ERROR_LOG_PO as select from zerror_log_po
{
    key rownu as Rownu,
    sno as Sno,
    company_code as CompanyCode,
    purchasing_document_type as PurchasingDocumentType,
    po_number as PoNumber,
    po_date as PoDate,
    vendor_account_number as VendorAccountNumber,
    terms_of_payment_key as TermsOfPaymentKey,
    purchasing_organization as PurchasingOrganization,
    purchasing_group as PurchasingGroup,
    currency_key as CurrencyKey,
    validity_start_date as ValidityStartDate,
    validity_end_date as ValidityEndDate,
    incoterms as Incoterms,
    incoterms_location as IncotermsLocation,
    item_number as ItemNumber,
    material_number as MaterialNumber,
    short_text as ShortText,
    material_group as MaterialGroup,
    plant as Plant,
    storage_location as StorageLocation,
    po_quantity as PoQuantity,
    po_uom as PoUom,
    net_price as NetPrice,
    price_unit as PriceUnit,
    tax_code as TaxCode,
    acct_assignment_category as AcctAssignmentCategory,
    gl_account as GlAccount,
    cost_center as CostCenter,
    valuation_type as ValuationType,
    req_no as ReqNo,
    req_item as ReqItem,
    info_record as InfoRecord,
    filename as Filename,
    username as Username,
    message as Message
}
