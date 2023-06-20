@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Interface View'
define root view entity Z_I_BKPF as select from zapt0002
//composition of target_data_source_name as _association_name
{
    @EndUserText.label: '전표번호'
    key belnr as Belnr,
    
    @EndUserText.label: '회계연도'
    key gjahr as Gjahr,
    
    @EndUserText.label: '회사코드'
    key bukrs as Bukrs,
    
    @EndUserText.label: '증빙일'
    @Consumption.filter.selectionType: #INTERVAL
    bldat as Bldat,
    
    @EndUserText.label: '전기일'
    @Consumption.filter.selectionType: #INTERVAL
    budat as Budat,
    
    @EndUserText.label: '원화'
    @Semantics.amount.currencyCode: 'waers'
    dmbtr as Dmbtr,
    
    @EndUserText.label: '통화'
    waers as Waers,
    
    @EndUserText.label: '적요'
    sgtxt as Sgtxt,
    
    @Semantics.user.createdBy: true
    createdby            as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    createdat            as CreatedAt,
    
    @Semantics.user.lastChangedBy: true
    lastchangedby       as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat       as LastChangedAt,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchangedat as LocalLastChangedAt
}
