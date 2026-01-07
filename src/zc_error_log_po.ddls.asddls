@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO ERROR LOG'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_ERROR_LOG_PO as projection on ZI_ERROR_LOG_PO
{
    key Rownu,
    Sno,
    CompanyCode,
    PurchasingDocumentType,
    PoNumber,
    PoDate,
    VendorAccountNumber,
    TermsOfPaymentKey,
    PurchasingOrganization,
    PurchasingGroup,
    CurrencyKey,
    ValidityStartDate,
    ValidityEndDate,
    Incoterms,
    IncotermsLocation,
    ItemNumber,
    MaterialNumber,
    ShortText,
    MaterialGroup,
    Plant,
    StorageLocation,
    PoQuantity,
    PoUom,
    NetPrice,
    PriceUnit,
    TaxCode,
    AcctAssignmentCategory,
    GlAccount,
    CostCenter,
    ValuationType,
    ReqNo,
    ReqItem,
    InfoRecord,
    Filename,
    Username,
    Message
}
