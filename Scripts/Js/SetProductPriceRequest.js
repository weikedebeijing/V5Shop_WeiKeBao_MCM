function ProductPriceRequest(){
    this.entity = {
        ProductID:0,
        WholeSalePrice:0,
        DistributionPrice:0,
        MarketPrice: 0,
        EnableDiscount:false,
        ChannelPrices: new Array(),
        ChannelCode : new Array()
    }
}


function ChannelPricesList() {
    this.entity = {
        ChannelPrices: {
            ID: 0,
            ProductID: 0,
            ChannelCode: "",
            SalePrice: 0,
            EnableChannelDiscount: true,
            CreatedBy: "",
            DateCreated: new Date(),
            ModifiedBy: "",
            DateModified: new Date()
        }
    }
}
