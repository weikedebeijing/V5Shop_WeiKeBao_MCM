
//往渠道上发商品的实体
function ChannelItemViewObj() {
    this.entity = {
        ChannelItem: {
            ID: 0,
            ChannelCode: "",
            ProductID: 0,
            ProductNo: "",
            OuterNo: "",
            CreatedBy: "",
            DateCreated: new Date(),
            ModifiedBy: "",
            DateModified: new Date(),
            SalesPrice: 0,
            CostPrice: 0,
            EnableDiscount: false,
            Stock: 0,
            IsDel:false
        },
        ChannelProducts: new Array(),
        ChannelImages: new Array()
    }
}

function ProductInChannel() {
    this.entity = {
        ID: 0,
        ChannelCode: "",
        GoodsNo: "",
        State: 0,
        NoticePath: "",
        OuterNo: "",
        ProductID: 0,
        ProductNo: "",
        ProductDetailID: 0,
        SalesPrice: 0,
        CostPrice: 0,
        CreatedBy: "",
        DateCreated: new Date(),
        ModifiedBy: "",
        DateModified: new Date(),
        Stock: 0,
        IsDel: false
    }
}

function DestributionPrice() {
    this.entity = {
        GoodsNo: "",
        JingxiaoPrice: 0,
        DaixiaoPrice: 0,
        LingshouPrice: 0,
        MinWholeSaleQty: 1, //享受经销价的最小购买数量
        ProductLineID:0,
        DestributionPriceList: new Array()
    }
}

function DestributionPriceList() {
    this.entity = {
        GoodsNo: "",
        JingxiaoPrice: 0,
        DaixiaoPrice: 0,
        LingshouPrice: 0
    }
}