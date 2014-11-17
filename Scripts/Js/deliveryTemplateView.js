//发布到淘宝的运费模板数据设置，用一个json传到后台，更新产品的相关字段，但是目前这种运费信息和产品绑定的设计只能支持一个平台，如淘宝，以后遇到其它平台还是需要修改

function DeliveryInfoForProduct() {
    this.entity = {
        FreightPayer: "seller", //"seller" : "buyer"
        FreightFeeType: "T",  //T:使用运费模板/F:使用固定运费
        DeliveryTemplateID: 0,
        EmsFee: 0,
        PostFee: 0,
        ExpressFee: 0
    }
}