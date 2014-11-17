function GetProductInCategoryInfo(channelCode) {
    $.ajax({
        url: "../../product/GetProductInCategoryInfo",
        type: "get",
        data: { "channelCode": channelCode },
        async: false,
        success: function (res) {
            $("#dvProductInCategoryContainer>ul").text(""); //清空
            var jsonRes = JSON.parse(res);
            for (var i = 0; i < jsonRes.length; i++) {
                if (jsonRes[i].ParentID == 0) {
                    var hasSub = false;
                    for (var j = 0; j < jsonRes.length; j++) {
                        if (jsonRes[j].ParentID == jsonRes[i].ID) {
                            hasSub = true;
                            break;
                        }
                    }
                    if (hasSub == true) {
                        var li = $("<li>&nbsp;<label>" + jsonRes[i].Name + "</label><ul id='shopCat" + jsonRes[i].ID + "'></ul></li>");
                        $("#dvProductInCategoryContainer>ul").append(li);
                    } else {
                        var li = $("<li>&nbsp;<input id='shopCat" + jsonRes[i].ID + "' type='checkbox'/>&nbsp;<label for='shopCat" + jsonRes[i].ID + "'>" + jsonRes[i].Name + "</label></li>");
                        $("#dvProductInCategoryContainer>ul").append(li);
                    }
                }
            }

            GetSubCat("dvProductInCategoryContainer>ul", res);
        },
        error: function () {
            $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
            $("#operateTip").html("获取店铺类目数据时出错").change();
        }
    })
}


function GetSubCat(con, res) {
    var jsonRes = JSON.parse(res);
    con = con + " li ul";
    $("#" + con + "").each(function () {
        var thisID = $(this).attr("id");
        if (thisID != undefined && thisID != "") {
            thisID = thisID.replace("shopCat", "");
            for (var j = 0; j < jsonRes.length; j++) {
                if (thisID == jsonRes[j].ParentID) {
                    var subli = $("<li>&nbsp;&nbsp;&nbsp;&nbsp;<input id='shopCat" + jsonRes[j].ID + "' type='checkbox'/>&nbsp;<label for='shopCat" + jsonRes[j].ID + "'>" + jsonRes[j].Name + "</label><ul id='shopCat" + jsonRes[j].ID + "'></ul></li>");
                    $(this).append(subli);
                }
            }
        }
    })

    //GetSubCat(con, res);
}


function GetShopCategoryForProduct(productID, channelCode) {
    $.ajax({
        url: "../../Product/GetProductInCategoryIDsByProductIDAndChannelCode",
        type: "get",
        data: { "productID": productID, "channelCode": channelCode },
        success: function (res) {

            var shopCategoryIDs = JSON.parse(res);
            for (var i = 0; i < shopCategoryIDs.length; i++) {
                $("#dvProductInCategoryContainer input[type=checkbox]").each(function () {
                    if ($(this).attr("id").replace("shopCat", "") == shopCategoryIDs[i]) {
                        $(this).attr("checked", "checked");
                    }
                })
            }
        },
        error: function () {
            $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
            $("#operateTip").html("获取商品的店铺类目时出错").change(); 
        }
    })
}