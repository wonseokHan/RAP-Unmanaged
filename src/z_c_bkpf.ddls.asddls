@EndUserText.label: 'Projection Header View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_BKPF provider contract transactional_query as projection on Z_I_BKPF
{
    @EndUserText.label: '전표번호'
    key Belnr as Belnr,
    
    @EndUserText.label: '회계연도'
    key Gjahr as Gjahr,
    
    @EndUserText.label: '회사코드'
    key Bukrs as Bukrs,
    
    @EndUserText.label: '증빙일'
    @Consumption.filter.selectionType: #INTERVAL
    Bldat as Bldat,
    
    @EndUserText.label: '전기일'
    @Consumption.filter.selectionType: #INTERVAL
    Budat as Budat,
    
    @EndUserText.label: '원화'
    @Semantics.amount.currencyCode: 'waers'
    Dmbtr as Dmbtr,
    
    @EndUserText.label: '통화'
    Waers as Waers,
    
    @EndUserText.label: '적요'
    Sgtxt as Sgtxt,
    
    @Semantics.user.createdBy: true
    CreatedBy            as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    CreatedAt            as CreatedAt,
    
    @Semantics.user.lastChangedBy: true
    LastChangedBy       as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt       as LastChangedAt,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt as LocalLastChangedAt
}
