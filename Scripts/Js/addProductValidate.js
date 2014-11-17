

//商品添加页面基础数据添加和编辑的验证
function ValidateUserInput() {

    if (!IsEmpty("#txtProductCategory")) {
        $(".prompt", $("#txtProductCategory").parents("li")).text("请选择商品类目");
        return false;
    } else {
        $(".prompt", $("#txtProductCategory").parents("li")).text("");
    }
    if (!IsEmpty("#txtProductTitle")) {
        $(".prompt", $("#txtProductTitle").parents("li")).text("请输入商品标题");
        return false;
    } else {
        $(".prompt", $("#txtProductTitle").parents("li")).text("");
    }
    if ($("#spStereMes").text() === "*") {
        if (!IsNum("#txtStere")) {
            $(".prompt", $("#txtStere").parents("li")).text("您选择的运费模板是按体积计价，物流体积不能为空且需是数字");
            $(".prompt", $("#txtKilogram").parents("li")).text("");
            return false;
        } else {
            $(".prompt", $("#txtStere").parents("li")).text("");
        }
    } else {
        $(".prompt", $("#txtStere").parents("li")).text("");
    }
    if ($("#spKilogramMes").text() === "*") {
        if (!IsNum("#txtKilogram")) {
            $(".prompt", $("#txtKilogram").parents("li")).text("您选择的运费模板是按重量计价，物流重量不能为空且需是数字");
            $(".prompt", $("#txtStere").parents("li")).text("");
            return false;
        } else {
            $(".prompt", $("#txtKilogram").parents("li")).text("");
        }
    } else {
        $(".prompt", $("#txtKilogram").parents("li")).text("");
    }
    if (!IsNum("#txtProductPriceA")) {
        $(".prompt", $("#txtProductPriceA").parents("li")).text("商品零售价不能为空且需是数字");
        return false;
    } else {
        $(".prompt", $("#txtProductPriceA").parents("li")).text("");
    }
    if (!IsPositiveNum("#txtProductCount")) {
        $(".prompt", $("#txtProductCount").parents("li")).text("商品数量不能为空且需是正整数");
        return false;
    } else {
        $(".prompt", $("#txtProductCount").parents("li")).text("");
    }

    var mainImage = $("#file_upload_img_1").attr("src");
    if (mainImage == "../../Images/Default.png") {
        $(".prompt", $("#upImgDiv").parents("li")).text("请上传一张商品主图（第一个选择区）");
        $("#file_upload_1").focus();
        return false;
    } else {
        $(".prompt", $("#upImgDiv").parents("li")).text("");
    }

    var description = editor.html();

    description = description.replace(/(\n)/g, "");
    description = description.replace(/(\t)/g, "");
    description = description.replace(/(\r)/g, "");
    //    description = description.replace(/<\/?[^>]*>/g, "");
    description = description.replace(/\s*/g, "");
    if (description == "") {
        $(".prompt", $("#tareaProductDiscrip").parents("li")).text("商品描述不能为空");
        $("#txtroductDestribution").focus();
        return false;
    } else if (description.length < 5 || description.length > 25000) {
        $(".prompt", $("#tareaProductDiscrip").parents("li")).text("商品描述字符数应在5～25000之间");
        $("#txtroductDestribution").focus();
        return false;
    } else {
        $(".prompt", $("#tareaProductDiscrip").parents("li")).text("");
    }
    var productCity = $("#slCity").val();
    if (productCity == "default" || productCity == "-请选择-") {
        $(".prompt", $("#slCity").parents("li")).text("商品所在地需要选择");
        return false;
    } else {
        $(".prompt", $("#slCity").parents("li")).text("");
    }

    //验证必填的属性属否都填写完整了
    var trueFalseFlag = true;
    $("#propertyContainer>li").each(function () {
        if ($(".star", $(this)).text() == "*") {
            if ($("input", $(this)).val() != undefined) {
                if ($("input", $(this)).val() == "" || $("input", $(this)).val()=="可直接输入或选择") {
                    var propertyName = $("label", $(this)).text();
                    $(".prompt", $(this)).text("" + propertyName + "不能为空");
                    trueFalseFlag = false;
                    $("input", $(this)).focus();
                    return false;
                } else {
                    $(".prompt", $(this)).text("");
                }
            }
            if ($("select", $(this)).val() != undefined) {
                if ($("select", $(this)).val() == "") {
                    var propertyName = $("label", $(this)).text();
                    $(".prompt", $(this)).text("" + propertyName + "不能为空");
                    trueFalseFlag = false;
                    $("select", $(this)).focus();
                    return false;
                } else {
                    $(".prompt", $(this)).text("");
                }
            }
        }
        //        if ($("span[class=spMessage]", $(this)).val() != undefined) {
        //            $("span[class=spMessage]", $(this)).remove();
        //        }

        //        var reg = /\*/g;
        //        if (reg.test($(this).text())) {
        //            if ($("input", $(this)).val() != undefined) {
        //                if ($("input", $(this)).val() == "") {
        //                    var propertyName = $("div:first", $(this)).text().replace(/\*/g, "");
        //                    var spMessage = $("<span class='spMessage'>" + propertyName + "不能为空</span>")
        //                    $(this).append(spMessage);
        //                    trueFalseFlag = false;
        //                    $("input", $(this)).focus();
        //                    return false;
        //                } else {
        //                    if ($("span[class=spMessage]", $(this)).val() != undefined) {
        //                        $("span[class=spMessage]", $(this)).remove();
        //                    }
        //                }
        //            }
        //            if ($("select", $(this)).val() != undefined) {
        //                if ($("select", $(this)).val() == "") {
        //                    var propertyName = $("div:first", $(this)).text().replace(/\*/g, "");
        //                    var spMessage = $("<span class='spMessage'>" + propertyName + "不能为空</span>")
        //                    $(this).append(spMessage);
        //                    trueFalseFlag = false;
        //                    $("select", $(this)).focus();
        //                    $(this).focus();
        //                    return false;
        //                } else {
        //                    if ($("span[class=spMessage]", $(this)).val() != undefined) {
        //                        $("span[class=spMessage]", $(this)).remove();
        //                    }
        //                }
        //            }
        //        }
    })

    var validateSpecMusted = ValidateSpecMusted("specContainer");
    if (validateSpecMusted == false) {
        return false;
    }

    var validateSpecIsAllSelected = ValidateSpecIsAllSelected("specContainer");
    if (validateSpecIsAllSelected == false) {
        return false;
    }


    //验证规格组合表格里的价格，数量是否填写正确
    //var currentSpecCombineTable = $(".specContainer .specCombineTable");
    if ($(".specContainer .specCombineTable").css("display") != "none") {
        //$(".specContainer .specCombineTable").siblings("span").remove();
        $(".prompt:last", $(".specContainer")).text("");

        $(".specContainer .specCombineTable tr:not(:first)").each(function () {

            var price = $("#txtPrice", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var count = $("#txtCount", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var reg = /^\d+(\.\d+|\d*)$/g;

            if (reg.test(price) == false) {
                //  var spMessage = $("<span class='prompt' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //   $(".specContainer .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainer")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtPrice", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
            reg.lastIndex = 0;
            if (reg.test(count) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //$(".specContainer .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainer")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtCount", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
        })
    }

    if ($("#deliverySelect").val() == "请选择..." || $("#deliverySelect").val() == "") {
        $("#deliverySelect").next().text("请选择运费模板");
        //$(".prompt", $("#deliverySelect")).next().text("请选择运费模板");
        $("#deliverySelect").focus();
        return false;
    } else {
        $("#deliverySelect").next().text("");
    }

    //整个验证方法返回值（受trueFalseFlag影响，即商品必填属性是否填写完整,规格组合表里的数据是否符合规范）
    if (trueFalseFlag == true) {
        return true;
    } else {
        return false;
    }
}


//商品添加页,发布到分销页签页验证
function ValidateDestributionUserInput() {
    var trueFalseFlag = true;
    if ($("#slProductLine").val() == "default") {
        $(".prompt", $("#slProductLine").parents("li")).text("请选择产品线");
        $("#slProductLine").focus();
        return false;
    } else {
        $(".prompt", $("#slProductLine").parents("li")).text("");
    }

    var validateSpecMusted = ValidateSpecMusted("specContainerForDestribution");
    if (validateSpecMusted == false) {
        return false;
    }

    var validateSpecIsAllSelected = ValidateSpecIsAllSelected("specContainerForDestribution");
    if (validateSpecIsAllSelected == false) {
        return false;
    }


    if ($(".specContainerForDestribution .specCombineTable").css("display") == "none") {//没有SKU的商品需要填写这部分价格

        //$(".specContainerForDestribution span[class=spMessage]").remove();
        $(".prompt:last", $(".specContainerForDestribution")).text("");

        if (!IsNum("#txtJingxiaoA")) {
            $(".prompt", $("#txtJingxiaoA").parent().parent()).text("经销商采购价不能为空且需是数字");
            return false;
        } else {
            $(".prompt", $("#txtJingxiaoA").parent().parent()).text("");
        }
        if (!IsNum("#txtDaixiaoA")) {
            $(".prompt", $("#txtDaixiaoA").parent().parent()).text("代销商采购价不能为空且需是数字");
            return false;
        } else {
            $(".prompt", $("#txtDaixiaoA").parent().parent()).text("");
        }
        //        if (!IsNum("#txtLingshouA")) {
        //            $("#txtLingshouA").next().text("建议零售价不能为空且需是数字");
        //            return false;
        //        } else {
        //            $("#txtLingshouA").next().text("");
        //        }
    } else {//有SKU的商品不验证上面的三个价格
        $(".prompt", $("#txtJingxiaoA").parent().parent()).text("");
        $(".prompt", $("#txtDaixiaoA").parent().parent()).text("");
        //$("#txtLingshouA").next().text("");


        //验证分销的规格组合表格里的数据（价格、数量等是否填写完整）

        $(".specContainerForDestribution .specCombineTable tr:not(:first)").each(function () {
            var daixiaoPrice = $("#txtDaixiaoPrice", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var jingxiaoPrice = $("#txtJingxiaoPrice", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var lingshouPrice = $("#txtLingshouPrice", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var count = $("#txtCount", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var reg = /^\d+(\.\d+|\d*)$/g;

            if (reg.test(daixiaoPrice) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //$(".specContainerForDestribution .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainerForDestribution")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtDaixiaoPrice", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
            reg.lastIndex = 0;
            if (reg.test(jingxiaoPrice) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //$(".specContainerForDestribution .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainerForDestribution")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtJingxiaoPrice", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
            //            reg.lastIndex = 0;
            //            if (reg.test(lingshouPrice) == false) {
            //                var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
            //                $(".specContainerForDestribution .specCombineTable").before(spMessage);
            //                $("#txtLingshouPrice", $(this)).focus();
            //                trueFalseFlag = false;
            //                return false;
            //            }
            reg.lastIndex = 0;
            if (reg.test(count) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                // $(".specContainerForDestribution .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainerForDestribution")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtCount", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
        })
    }
    if (!IsNum("#txtJingxiaoMinCount")) {
        $(".prompt", $("#txtJingxiaoMinCount").parent().parent()).text("享受经销价最小购买数不能为空且需是数字");
        return false;
    } else {
        $(".prompt", $("#txtJingxiaoMinCount").parent().parent()).text("");
    }

    //整个验证方法返回值（受trueFalseFlag影响，即商品分销规格组合表里的数据是否符合规范）
    if (trueFalseFlag == true) {
        return true;
    } else {
        return false;
    }
}

//验证商品添加页发送到淘宝页签页的脚本
function ValidateTaobaoUserInput() {
    var trueFalseFlag = true;

    var validateSpecMusted = ValidateSpecMusted("specContainerForTaobao");
    if (validateSpecMusted == false) {
        return false;
    }

    var validateSpecIsAllSelected = ValidateSpecIsAllSelected("specContainerForTaobao");
    if (validateSpecIsAllSelected == false) {
        return false;
    }

    //$(".specContainerForTaobao span[class=spMessage]").remove();
    $(".prompt:last", $(".specContainerForTaobao")).text("");

    if ($(".specContainerForTaobao .specCombineTable").css("display") != "none") {
        $(".specContainerForTaobao .specCombineTable tr:not(:first)").each(function () {

            var price = $("#txtPrice", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var count = $("#txtCount", $(this)).val().replace(/(^\s*)|(\s*$)/g, "");
            var reg = /^\d+(\.\d+|\d*)$/g;

            if (reg.test(price) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //$(".specContainerForTaobao .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainerForTaobao")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtPrice", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
            reg.lastIndex = 0;
            if (reg.test(count) == false) {
                //var spMessage = $("<span class='spMessage' style='clear:both;'>规格组合表里的价格和数量需要填写完整并且是数字</span>");
                //$(".specContainerForTaobao .specCombineTable").before(spMessage);
                $(".prompt:last", $(".specContainerForTaobao")).text("规格组合表里的价格和数量需要填写完整并且是数字");
                $("#txtCount", $(this)).focus();
                trueFalseFlag = false;
                return false;
            }
        })
    }
    //整个验证方法返回值（受trueFalseFlag影响，即商品某渠道（现为淘宝）规格组合表里的数据是否符合规范）
    if (trueFalseFlag == true) {
        return true;
    } else {
        return false;
    }
}

//验证必须选择的规格是否选择了
function ValidateSpecMusted(containerID) {
    var trueFalseFlag = true;
    $("#" + containerID + " span[class=star]").each(function () {
        if ($(this).text() == "*") {//该规格是必选的
            var specName = $(this).siblings("label").text();
            var flag = 0;
            $("input[type=checkbox]", $(this).parents("li")).each(function () {
                if ($(this).attr("checked") == "checked") {
                    flag++;
                }
            })
            if (flag == 0) {
                $(".prompt", $(this).parents("li")).text("" + specName + "不能为空");
                $("#" + containerID + " input[type=checkbox]:first").focus();
                trueFalseFlag = false;
                return false;
            } else {
                $(".prompt", $(this).parents("li")).text("");
            }
        }
    })
    if (trueFalseFlag == true) {
        return true;
    } else {
        return false;
    }
    //    $("#" + containerID + " li>div:not(:first)").each(function () {
    //        var $currentDiv = $(this);

    //        if ($("span[class=spMessage]", $currentDiv).val() != undefined) {
    //            $("span[class=spMessage]", $currentDiv).remove();
    //        }

    //        var reg = /\*/g;
    //        var specName = $("div:first", $(this)).text();
    //        if (reg.test(specName)) {
    //            var flag = 0;
    //            $("input[type=checkbox]", $(this)).each(function () {
    //                if ($(this).attr("checked") == "checked") {
    //                    flag++;
    //                }
    //            })
    //            if (flag == 0) {
    //                var spMessage = $("<span class='spMessage' style='display:block;clear:both;'>" + specName.replace(/\*/g, '') + "不能为空</span>");
    //                $currentDiv.append(spMessage);
    //                $("#" + containerID + " input[type=checkbox]:first").focus();
    //                trueFalseFlag = false;
    //                return false;
    //            } else {
    //                if ($("span[class=spMessage]", $currentDiv).val() != undefined) {
    //                    $("span[class=spMessage]", $currentDiv).remove();
    //                }
    //            }
    //        }
    //    })
    //整个验证方法返回值（受trueFalseFlag影响，即商品规格必填的是否都填上了）
    //    if (trueFalseFlag == true) {
    //        return true;
    //    } else {
    //        return false;
    //    }
}

//验证规格是否选择完整
function ValidateSpecIsAllSelected(containerID) {
    var checkedFlag = false;
    $("#" + containerID + " input[type=checkbox]").each(function () {
        if ($(this).attr("checked") == "checked") {
            checkedFlag = true;
            return;
        }
    })
    if (checkedFlag == true) {
        if ($("." + containerID + " .specCombineTable").css("display") == "none") {
            $(".prompt:first", $("#" + containerID + "")).text("规格要么不选，要么必须选完整");
            $("#" + containerID + " input[type=checkbox]:first").focus();
            return false;
        } else {
            return true;
        }
    }
    //    var checkedFlag = false;
    //    $("#" + containerID + " input[type=checkbox]").each(function () {
    //        if ($(this).attr("checked") == "checked") {
    //            checkedFlag = true;
    //            return;
    //        }
    //    })
    //    if (checkedFlag == true) {
    //        if ($("." + containerID + ">span").val() != undefined) {
    //            $("." + containerID + ">span").remove();
    //        }

    //        if ($("." + containerID + " .specCombineTable").css("display") == "none") {
    //            var spMessage = $("<span class='spMessage' style='display:block;clear:both;'>规格要么不选，要么必须选完整</span>");
    //            $("." + containerID + "").append(spMessage);
    //            $("#" + containerID + " input[type=checkbox]:first").focus();
    //            return false;
    //        } else {
    //            return true;
    //        }
    //    } else {
    //        if ($("." + containerID + ">span").val() != undefined) {
    //            $("." + containerID + ">span").remove();
    //        }
    //        return true;
    //    }
}