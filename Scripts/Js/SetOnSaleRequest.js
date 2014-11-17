//设置渠道价格的实体（js前端）
function SetOnSaleRequestView() {
    this.entity = {
        MultiProductID:new Array(),
        ChannelPriceRates:new Array()
    }
}

function ChannelPriceRateView() {
    this.entity = {
        Code:"",
        MarketPriceRate:null,
        WholeSalePriceRate:null,
        DistributionPriceRate:null,
        SalePriceRate:null,
        EnableDiscount:false
    }
}