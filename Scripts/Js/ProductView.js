function productView() {
    this.entity = {
        Product: {
            BrandID: 0,
            BrandName: "",
            CategoryName: "",
            DefaultImageData: "",
            DetailMemo: "",
            ID: 0,
            IsCarriageNowEnabled: true,
            //IsDel: false,
            Status: 1, //1：立刻上架/0：放入仓库
            IsSaleNoStockEnabled: true,
            IsSpecificationEnabled: false,
            Keyword: "",
            LocalView: 0,
            Memo: "",
            Name: "0",
            PPView: 0,
            ProductCategoryID: 0,
            ProductNo: "0",
            ProductTypeID: 0,
            SEODescription: "",
            SEOKeyword: "",
            SEOTitle: "",
            ServiceMemo: "",
            Stock: 0,
            TBCID: 0,
            TBNO: "0",
            TBPID: 0,
            TBView: 0,
            TypeName: "",
            UnitName: "",
            DeliveryTemplateID: 0,
            DeliveryStere: 0,
            DeliveryKilogram: 0,
            LocationState: "", //所在省份（保存中文）
            LocationCity: "", //所在城市(保存中文）
            FreightPayer: "", //运费承担人--seller(卖家承担)/buyer(买家承担)
            FreightFeeType: "", //配送计费方式--T:使用运费模板/F:使用固定运费
            EmsFee: 0, // EMS运费
            PostFee: 0, //平邮运费
            ExpressFee: 0, //快递费用
            HasInvoice: false, //是否有发票
            HasWarranty: false, //是否有保修
            SellPromise: false, //退换货承诺
            HasShowcase: false, //是否橱窗显示
            HasDiscount: false, //是否有折扣
            ValidThru: 7, //有效期(淘宝默认7天)
            ListTime: new Date(), //上架时间
            ApproveStatus: "", //上架状态 --onsale(出售中)/instock(仓库中) 
            SalesPrice: 0, //不放在商品详情中的一口价（与SKU的个性化价格无关）
            OuterCode: "", //不放在规格中的商家编码（与SKU的小编码无关）
            IsDel: false, //是否删除
            MinWholeSaleQty: 1, //享受经销价的最小购买数量
            ProductLineID: 1//默认产品线 ID为1
        },
        PropertyList: new Array(),
        DetailList: new Array(),
        RelatedProductList: new Array(),
        ReleatedProductTypeExtendList: new Array(),
        ImageList: new Array(),
        ChannelPrices: new Array(),
        ChannelItems: new Array(),
        ChannelProducts: new Array(),
        ChannelImages: new Array()
    };
};
function productDetailList() {
    this.entity = {
        ProductDetail:
            { AddDate: new Date(),
                CostPrice: 0,
                DistributionPrice: 0,
                GoodsAllocation: "",
                GoodsNo: "",
                ID: 0,  //明细ID
                IsCarriageNowEnabledExt: true,
                MarketPrice: 0,
                ProductID: 0,
                SalesPrice: 0,
                Stock: 0,
                StockAlm: 0,
                UpdateDate: new Date(),
                Weight: 0,
                WholeSalePrice: 0,
                OuterCode: "",
                IsDel: false
            },
        Prices: [],
        SpecificationList: new Array()

    };
};

function SpecificationList() {
    this.entity = {
        ProductSpecification:
                    { Alias: "",
                        ID: 0,  //规格ID
                        Name: "",
                        ProductDetailID: 0,
                        SpecID: 0,
                        SpecImageUrl: "",
                        SpecValID: 0,
                        ThumbImageUrl: "",
                        IsDel: false
                    },
        ImageList: new Array(),
        Spec: {
            Alias: "",
            DisplayType: "",
            ID: 0,
            Img: "",
            Memo: "",
            Name: "",
            TBCID: 0,
            Type: ""
        },
        SpecValue: {
            Alias: "",
            ID: 0,
            ImgData: "",
            Name: "",
            SpecificationID: 0,
            TBCID: 0
        }
    };
};

function ProductProperty() {
    this.entity = {
        ID: 0,
        ProductDetailID: 0,
        PropertyID: 0,
        PropertyValueID: 0,
        PropertyValue: "",
        IsDel: false
    }
}

function ProductImage() {
    this.entity = {
        BigImageData: "",
        FromType: "",
        ID: 0,
        MidImageData: "",
        ProductID: 0,
        SmallImageData: "",
        SourceImageData: "",
        Tags: "",
        IsDel: false
    }
}

function ProductChannel() {
    this.entity = {
        ChannelCode: "",
        GoodsNo: "",
        ID: 0,
        NoticePath: "",
        State: 0,
        UpdateDate: new Date()
    }
}

function ChannelPrice() {
    this.entity = {
        ID: 0,
        ProductID: 0,
        ChannelCode: "",
        SalePrice: 0,
        EnableChannelDiscount: false,
        CreatedBy: "",
        DateCreated: new Date(),
        ModifiedBy: "",
        DateModified: new Date()
    }
}

function ItemInChannel() {
    this.entity = {
        ID: 0,
        ChannelCode: "",
        ProductID: 0,
        ProductNo: "",
        OuterNo: "",
        CreatedBy: "",
        DateCreated: new Date(),
        ModifiedBy: "",
        DateModified: new Date()
    }
}

function ProductInChannel() {
    this.entity = {
        ID: 0,
        ChannelCode: "",
        GoodsNo: "",
        UpdateDate: new Date(),
        State: 0,
        NoticePath: "",
        OuterNo: "",
        ProductID: 0,
        ProductNo: ""
    }
}

function ImageInChannel() {
    this.entity = {
        ID: 0,
        ChannelCode: "",
        ProductID: 0,
        ProductNo: "",
        ProductImageID: 0,
        OuterNo: "",
        CreatedBy: "",
        DateCreated: new Date(),
        ModifiedBy: "",
        DateModified: new Date()
    }
}

function SkuCodeList() {
    this.entity = {
        code: new Array()
    }
}

function ProductFoodSecurityInfo() {
    this.entity = {
        ID: 0,
        ProductID: 0,
        ProductionLicenseNo: "",
        ProductionNo: "",
        FactoryName: "",
        FactoryAddress: "",
        FactoryTel: "",
        BurdenSheet: "",
        StorageMethod: "",
        GuaranteePeriod: "",
        FoodAdditives: "",
        Supplier: "",
        ProduceDateStart: "",
        ProduceDateEnd: "",
        PurchaseDateStart: "",
        PurchaseDateEnd: ""
    }
}

//var productView = {
//    entity: {
//        Product: {
//            BrandID: 0,
//            BrandName: "",
//            CategoryName: "",
//            DefaultImageData: "",
//            DetailMemo: "",
//            ID: 0,
//            IsCarriageNowEnabled: true,
//            IsDel: false,
//            IsEnabled: true,
//            IsSaleNoStockEnabled: true,
//            IsSpecificationEnabled: false,
//            Keyword: "",
//            LocalView: 0,
//            Memo: "",
//            Name: "0",
//            PPView: 0,
//            ProductCategoryID: 0,
//            ProductNo: "0",
//            ProductTypeID: 0,
//            SEODescription: "",
//            SEOKeyword: "",
//            SEOTitle: "",
//            ServiceMemo: "",
//            Stock: 0,
//            TBCID: 0,
//            TBNO: "0",
//            TBPID: 0,
//            TBView: 0,
//            TypeName: "",
//            UnitName: "",
//            Test: null
//        },
//        DetailList: new Array(),
//        RelatedProductList: new Array(),
//        ReleatedProductTypeExtendList: new Array(),
//        ImageList: new Array(),
//        Channels: new Array()
//    },

//    init: function () {
//        this.entity.Product.BrandID = 0;
//        this.entity.Product.BrandName = "",
//        this.entity.Product.CategoryName = "",
//        this.entity.Product.DefaultImageData = "",
//        this.entity.Product.DetailMemo = "",
//        this.entity.Product.ID = 0,
//        this.entity.Product.IsCarriageNowEnabled = true,
//        this.entity.Product.IsDel = false,
//        this.entity.Product.IsEnabled = true,
//        this.entity.Product.IsSaleNoStockEnabled = true,
//        this.entity.Product.IsSpecificationEnabled = false,
//        this.entity.Product.Keyword = "",
//        this.entity.Product.LocalView = 0,
//        this.entity.Product.Memo = "",
//        this.entity.Product.Name = "0",
//        this.entity.Product.PPView = 0,
//        this.entity.Product.ProductCategoryID = 0,
//        this.entity.Product.ProductNo = "0",
//        this.entity.Product.ProductTypeID = 0,
//        this.entity.Product.SEODescription = "",
//        this.entity.Product.SEOKeyword = "",
//        this.entity.Product.SEOTitle = "",
//        this.entity.Product.ServiceMemo = "",
//        this.entity.Product.Stock = 0,
//        this.entity.Product.TBCID = 0,
//        this.entity.Product.TBNO = "0",
//        this.entity.Product.TBPID = 0,
//        this.entity.Product.TBView = 0,
//        this.entity.Product.TypeName = "",
//        this.entity.Product.UnitName = "",
//        this.entity.Product.Test = null,
//        this.entity.DetailList = new Array(),
//        this.entity.RelatedProductList = new Array(),
//        this.entity.ReleatedProductTypeExtendList = new Array(),
//        this.entity.ImageList = new Array(),
//        this.entity.Channels = new Array()
//    }
//};


//var productDetailList = {
//    entity: {
//        ProductDetail:
//            { AddDate: new Date(),
//                CostPrice: 0,
//                DistributionPrice: 0,
//                GoodsAllocation: "",
//                GoodsNo: "",
//                ID: 0,  //明细ID
//                IsCarriageNowEnabledExt: true,
//                MarketPrice: 0,
//                ProductID: 0,
//                SalesPrice: 0,
//                Stock: 0,
//                StockAlm: 0,
//                UpdateDate: new Date(),
//                Weight: 0,
//                WholeSalePrice: 0
//            },
//        Prices: [],
//        SpecificationList: new Array()
//    },

//    init: function () {
//        this.entity.ProductDetail.AddDate = new Date(),
//        this.entity.ProductDetail.CostPrice = 0,
//        this.entity.ProductDetail.DistributionPrice = 0,
//        this.entity.ProductDetail.GoodsAllocation = "",
//        this.entity.ProductDetail.GoodsNo = "",
//        this.entity.ProductDetail.ID = 0,
//        this.entity.ProductDetail.IsCarriageNowEnabledExt = true,
//        this.entity.ProductDetail.MarketPrice = 0,
//        this.entity.ProductDetail.ProductID = 0,
//        this.entity.ProductDetail.SalesPrice = 0,
//        this.entity.ProductDetail.Stock = 0,
//        this.entity.ProductDetail.StockAlm = 0,
//        this.entity.ProductDetail.UpdateDate = new Date(),
//        this.entity.ProductDetail.Weight = 0,
//        this.entity.ProductDetail.WholeSalePrice = 0,
//        this.entity.Prices = new Array(),
//        this.entity.SpecificationList = new Array()
//    }
//};

//var SpecificationList = {
//    entity: {
//        ProductSpecification:
//                    { Alias: "",
//                        ID: 0,  //规格ID
//                        Name: "",
//                        ProductDetailID: 0,
//                        SpecID: 0,
//                        SpecImageUrl: "",
//                        SpecValID: 0,
//                        ThumbImageUrl: ""
//                    },
//        ImageList: null
//    },
//    init: function () {
//        this.entity.ProductSpecification.Alias = "",
//        this.entity.ProductSpecification.ID = 0,
//        this.entity.ProductSpecification.Name = "",
//        this.entity.ProductSpecification.ProductDetailID = 0,
//        this.entity.ProductSpecification.SpecID = 0,
//        this.entity.ProductSpecification.SpecImageUrl = "",
//        this.entity.ProductSpecification.SpecValID = 0,
//        this.entity.ProductSpecification.ThumbImageUrl = "",
//        this.entity.ImageList = null
//    }
//};



//function DefineProductView() {

//}

//DefineProductView.prototype.initProductView = function () {
//    var productView = {
//        Product: {
//            BrandID: 0,
//            BrandName: "",
//            CategoryName: "",
//            DefaultImageData: "",
//            DetailMemo: "",
//            ID: 0,
//            IsCarriageNowEnabled: true,
//            IsDel: false,
//            IsEnabled: true,
//            IsSaleNoStockEnabled: true,
//            IsSpecificationEnabled: false,
//            Keyword: "",
//            LocalView: 0,
//            Memo: "",
//            Name: "0",
//            PPView: 0,
//            ProductCategoryID: 0,
//            ProductNo: "0",
//            ProductTypeID: 0,
//            SEODescription: "",
//            SEOKeyword: "",
//            SEOTitle: "",
//            ServiceMemo: "",
//            Stock: 0,
//            TBCID: 0,
//            TBNO: "0",
//            TBPID: 0,
//            TBView: 0,
//            TypeName: "",
//            UnitName: "",
//            Test: null
//        },
//        DetailList: new Array(),
//        RelatedProductList: new Array(),
//        ReleatedProductTypeExtendList: new Array(),
//        ImageList: new Array(),
//        Channels: new Array()
//    };
//}



// DetailList: [{
//        ProductDetail:
//    						{ AddDate: "",
//    						    CostPrice: 0,
//    						    DistributionPrice: 0,
//    						    GoodsAllocation: "",
//    						    GoodsNo: "",
//    						    ID: 0,
//    						    IsCarriageNowEnabledExt: false,
//    						    MarketPrice: 0,
//    						    ProductID: 0,
//    						    SalesPrice: 0,
//    						    Stock: 0,
//    						    StockAlm: 0,
//    						    UpdateDate: "",
//    						    Weight: 0,
//    						    WholeSalePrice: 0
//    						},
//        Prices: new Array(),
//        SpecificationList: [{
//            ProductSpecification: {
//                Alias: "",
//                ID: 0, Name: "",
//                ProductDetailID: 0,
//                SpecID: 0,
//                SpecImageUrl: "",
//                SpecValID: 0,
//                ThumbImageUrl: ""
//            },
//            ImageList: null
//        }]
//    }],


