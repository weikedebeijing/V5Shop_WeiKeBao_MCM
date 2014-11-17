$(document).ready(function () {
    $(".mod-tab li").click(function () {
        if ($(this).index() == 0) {
            window.location = " ../../Commodity/CommodityConvention";
        } else if ($(this).index() == 1) {
            window.location = "../../Commodity/CommodityClassify";
        } 
//        else if ($(this).index() == 2) {
//            window.location = "../../Commodity/CommodityLabel";
//        } 
        else if ($(this).index() == 2) {
            window.location = "../../Commodity/CommodityProduction";
        }
    });
});

