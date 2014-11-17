<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
    <style type="text/css">
        .inputTip
        {
            color: #666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="javascript:void(0)" onclick="GoToLinkUrl(event)" title="返回" class="a-btn float-l">
                <i class="icon-back" linkurl="../../Promotion/PromotionList?type=<%=ViewData["type"] %>">
                </i></a>
            <h1 class="spanTitle">创建会员营销</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form">
        <div class="con style0page">
            <!---name begin--->
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("addPromotion", "Promotion", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>
            <input type="hidden" id="sendDiscountDatas" name="sendDiscountDatas" />
            <input type="hidden" id="isDiscountValidate" name="isDiscountValidate" />
            <input type="hidden" id="sendReductDatas" name="sendReductDatas" />
            <input type="hidden" id="isReductionValidate" name="isReductionValidate" />
            <span id="UpdateTargetHiddenID" style="display: none"></span>
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            活动对象</label>
                    </div>
                    <div class="float-l">
                        <select name="shopType" id="shopTypeChangeID">
                            <option>所有</option>
                            <option value="1">零售</option>
                            <%--     <option value="B">分销</option>--%>
                        </select>
                        <select name="shopTypeCode" id="typeCodeChange">
                            <option id="changeTypeCode">全网店铺</option>
                        </select>
                        <select name="gradeTypeID" id="gradeTypeID">
                            <option id="changeGradeID" tip="要动态组装的数据">所有会员等级</option>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            活动名称
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="text" class="w230" name="PromotionName" onchange="javascript:onchangeForValidata(event);"
                            id="PromotionName" value="请输入活动名称" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            活动时间
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="text" class="w230 Wdate" name="DateStart" onchange="javascript:onchangeForValidata(event);"
                            id="DateStart" value="活动开始时间" onfocus="var DateEnd=$dp.$('DateEnd');WdatePicker({onpicked:function(){DateEnd.focus();},dateFmt:'yyyy-MM-dd 00:00:00',minDate:'%y-%M-#{%d+1}'})" />
                        <input type="text" class="w230 Wdate" name="DateEnd" onchange="javascript:onchangeForValidata(event);"
                            id="DateEnd" value="活动结束时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',minDate:'#F{$dp.$D(\'DateStart\')}'})" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            促销方式
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="radio" id="all-p1" name="cuxiaoCheck" value="Discount" checked="checked" />
                        <label for="all-p1">
                            打折</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="part-p1" name="cuxiaoCheck" value="Reduction" />
                        <label for="part-p1">
                            减现金</label>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            活动商品
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="radio" id="all-p" value="AllProduct" name="ProductCheck" checked="checked" />
                        <label for="all-p">
                            所有商品</label>
                        &nbsp;&nbsp;
                        <input type="radio" id="part-p" name="ProductCheck" value="BatchProduct" />
                        <label for="part-p">
                            部分商品</label>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="txtReduction">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            每件商品减
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="text" id="txtReductionNum" name="Reduction" onkeyup="value=value.replace(/[^\d]/g,'')"
                            class="v5-input w100" />
                        元
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="txtDiscount">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            单件商品
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="text" name="Discount" id="txtDiscountNum" onkeyup="value=value.replace(/[^\d]/g,'')"
                            class="v5-input w100" />折（0~100）%
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                        </label>
                    </div>
                    <div class="float-l">
                        <div id="dd_Search">
                            <input type="text" class="w230" id="txtSearch" placeholder="请输入商品名称或商家编码" />
                            <button type="button" class="btn-gradient-blue" onclick="btnSearch();">
                                商品查询</button>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="batchDelBtn">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                        </label>
                    </div>
                    <div class="float-l">
                        <button type="button" onclick="javascript:batchDel();" class="btn-gradient-blue">
                            批量删除</button>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <br />
            <!---name end--->
            <!--table begin-->
            <%--01-打折列表Start-------------------%>
            <div class="mod-table l130" id="DiscountList">
                <div class="mod-table-head">
                    <div class="con style0list-bg">
                        <table>
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" onclick="CheckAll(event)" value="" name="" id="discountAll_Check" />
                                        </label>
                                    </th>
                                    <th class="x-tab">商品名称
                                    </th>
                                    <th class="x-tab">原价
                                    </th>
                                    <th class="x-tab">折扣(0~100)
                                    </th>
                                    <th class="x-tab">优惠价
                                    </th>
                                    <th class="x-tab">商家编码
                                    </th>
                                    <th class="x-tab">库存
                                    </th>
                                    <th class="x-tab">操作
                                    </th>
                                    <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0dotted">
                        <table id="DiscountContent">
                            <colgroup id="DiscountContentRemove">
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                        </table>
                    </div>
                </div>
            </div>
            <%--01-打折列表End---------------------%>
            <%--02-减现金列表Start-------------------%>
            <div class="mod-table l130" id="ReductionList">
                <div class="mod-table-head">
                    <div class="con style0list-bg">
                        <table>
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" onclick="CheckAll(event)" value="" name="" id="ckallChecked" />
                                        </label>
                                    </th>
                                    <th class="x-tab">商品名称
                                    </th>
                                    <th class="x-tab">原价
                                    </th>
                                    <th class="x-tab">减现金（元）
                                    </th>
                                    <th class="x-tab">优惠价
                                    </th>
                                    <th class="x-tab">商家编码
                                    </th>
                                    <th class="x-tab">库存
                                    </th>
                                    <th class="x-tab">操作
                                    </th>
                                    <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0dotted">
                        <table id="ReductionContent">
                            <colgroup id="ReductionContentRemove">
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                        </table>
                    </div>
                </div>
            </div>
            <%--02-减现金列表End---------------------%>
            <!--table end-->
            <!---column end--->
            <div class="l130 t30 b20">
                <button class="submit01 r10" onclick="javascript:saveAll();">
                    保存</button>
                <button type="button" onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
            </div>
            <%} %>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // 注册文本框点击事件
            txtTips();

            // 初始化操作
            initDefalult();

            //隐藏分销
            $("#shopTypeChangeID").val('1');
            $("#shopTypeChangeID").change();
            $("#shopTypeChangeID").attr("disabled", true)
            $("#typeCodeChange").val('C001');
            $("#typeCodeChange").change();
            $("#typeCodeChange").attr("disabled", true)
            var type = '<%=ViewData["type"] %>';
            if (type == "D") {
                $("#part-p1").attr("checked", "checked")
                $("#txtReduction").show();
                $("#txtDiscount").hide();
            }
        });

        /*
        ajax.BeginForm 的提交前验证 (会保证 所有AjaxFormValidata中的验证全部通过才提交)
        */
        function AjaxFormValidata() {
            $(".prompt").text('');
            var promotionName = $("#PromotionName").val().trim();
            var dateStart = $("#DateStart").val().trim();
            var dateEnd = $("#DateEnd").val().trim();
            var txtDiscountNum = $("#txtDiscountNum").val().trim();
            var txtReductionNum = $("#txtReductionNum").val().trim();

            if (promotionName.length <= 0 || promotionName == "请输入活动名称") {
                $("#PromotionName").focus();
                validataPrompt($("#PromotionName"), '活动名称不能为空');
                return false;
            }

            if (dateStart.length <= 0 || dateStart == "活动开始时间") {
                validataPrompt($("#DateStart"), '活动开始时间不能为空');
                return false;
            }

            if (dateEnd.length <= 0 || dateEnd == "活动结束时间") {
                validataPrompt($("#DateEnd"), '活动结束时间不能为空');
                return false;
            }


            // 输入折扣不合法
            if ($("#all-p1").attr("checked") == "checked") {
                if (txtDiscountNum != "" && (!IsNum("#txtDiscountNum") || txtDiscountNum > 100 || txtDiscountNum <= 0)) { // 只能是(正)数字或者是'.' 并且要小于10
                    $("#txtDiscountNum").focus();
                    validataPrompt($("#txtDiscountNum"), '输入的折扣不合法');
                    return false;
                }
            }

            // 如果选中了减现金
            if ($("#part-p1").attr("checked") == "checked") {
                if (txtReductionNum != "" && (!IsNum("#txtReductionNum") || txtReductionNum <= 0)) {
                    $("#txtReductionNum").focus();
                    validataPrompt($("#txtReductionNum"), '输入的减现金不合法');
                    return false;
                }

            }

            // 如果全部通过才向后台提交
            var result = checkBeforeSaveAll();
            if (!result) {
                return false;
            } else {
            }
            successTip("努力提交中......");
        };

        // 验证 保存所有是否都合法
        function checkBeforeSaveAll() {
            // 选择了部分商品才会执行 下面的JS
            if ($("#part-p").attr("checked") == "checked") {
                // 执行打折
                if ($("#all-p1").attr("checked") == "checked") { // 部分商品+打折
                    // 获取所有选中的checkBox的ID和减的现金
                    // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                    // 存储的形如 3_4,4_6，8_9 的数据
                    var hasSetValue = false;
                    var checks = $("#DiscountContent input[type=checkbox]");

                    if (checks.length <= 0) { // 没有商品时
                        $("#txtSearch").focus();
                        $(".prompt", $("#txtSearch").parent().parent().next()).text("请输入商品名称或商家编码");
                        return false;
                    }

                    var hasChecked = false; // 是否有选中的项

                    for (var i = 0; i < checks.length; i++) {
                        var check = $(checks[i]).attr("checked");
                        if (check == "checked") { // 如果checkbox被选中
                            var discountPriceElement = $("input[name=DiscountNumber]", $(checks[i]).parents("tr"));
                            var discountPrice = $("input[name=DiscountNumber]", $(checks[i]).parents("tr")).val().trim();
                            if (discountPrice.length <= 0) { //  bug 2014-01-03 15:07:51 如果没赋值提示用户
                                warningTip("请给勾选的商品打折赋值！");
                                $("#isDiscountValidate").val("false");
                                // 清空要传递给后台的数据
                                $("#sendReductDatas").val("");
                                $(discountPriceElement).focus();
                                return false;
                            }
                            hasChecked = true;
                        }
                    }

                    if (!hasChecked) {
                        warningTip("请勾选要'打折'的商品");
                        return false;
                    }
                };

                // 验证减现金
                if ($("#part-p1").attr("checked") == "checked") {

                    if ($("#txtSearch").val() == "请输入商品名称或商家编码" || $("#txtSearch").val().trim() == "") { // 不返回任何结果
                        $("#txtSearch").focus();
                        $(".prompt", $("#txtSearch").parent().parent().next()).text("请输入商品名称或商家编码");

                        return false;
                    }

                    var hasChecked = false;
                    var checks = $("#ReductionContent input[type=checkbox]");
                    for (var i = 0; i < checks.length; i++) {
                        var check = $(checks[i]).attr("checked");
                        if (check == "checked") { // 如果checkbox被选中
                            // 当前行的减的现金
                            var reductPriceElement = $("input[name=ReductionNumber]", $(checks[i]).parents("tr"));
                            var reductPrice = $("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val().trim();
                            if (reductPrice.length <= 0) { // 如果选中了checkBox却没有给"减现金"赋值 就默认的赋值为0
                                warningTip("请给勾选的商品'减现'赋值！");
                                $("#isReductionValidate").val("false");
                                // 清空要传递给后台的数据
                                $("#sendReductDatas").val("");
                                $(reductPriceElement).focus();
                                return false;
                            }
                            hasChecked = true;
                        }
                    }
                    // 如果存储id的数组不为空
                    if (!hasChecked) {
                        // 给验证码置为 false
                        $("#isReductionValidate").val("false");
                        // 清空要传递给后台的数据
                        $("#sendReductDatas").val("");
                        warningTip("请勾选要'减现金'的商品");
                        return false;
                    }
                }

                return true;
            } else { // 全部商品 没有列表数据需要验证
                return true;
            }
        }

        // 保存全部
        function saveAll() {

            // 清除所有的 错误提示
            $(".spMessage").text("");
            // 选择了部分商品才会执行 下面的JS
            if ($("#part-p").attr("checked") == "checked") {
                // 执行打折
                if ($("#all-p1").attr("checked") == "checked") { // 部分商品+打折
                    btnDiscountConfirm();
                };
                if ($("#part-p1").attr("checked") == "checked") {
                    btnReductConfirm();
                };
            }

        };

        // 点击查询时触发
        function btnSearch() {
            // 如果文本框中没有输入信息 就按照"商品分类"查询 ；如果商品分类也没有勾选就查询所有的);

            // 获取当前搜索文本中的值
            var txtSearch = $("#txtSearch").val();

            // 渠道
            var channelCode = $("#shopTypeChangeID").val();

            // 店铺
            var shop = $("#typeCodeChange").val();

            if (txtSearch == "请输入商品名称或商家编码" || txtSearch.trim() == "") { // 不返回任何结果
                $("#txtSearch").focus();
                $(".prompt", $("#txtSearch").parent().parent().next()).text("请输入商品名称或商家编码");

                return false;
            }

            var discountOrReduction = "";
            // 当前选中的是"打折"
            if ($("#all-p1").attr("checked") == "checked") {
                discountOrReduction = "discount";
                // 列表中已有商品不能重复添加
                var checkRepeatProductIDs = "";

                var checks = $("#DiscountContent input[type=checkbox]");
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");
                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);
                    strID = strID + ",";
                    checkRepeatProductIDs += strID;
                }

                checkRepeatProductIDs = checkRepeatProductIDs.substring(0, checkRepeatProductIDs.length - 1); // 去除最后一个","

                $.ajax({
                    url: "/Promotion/GetTableList", //ProductType=" + ProductType + "&txtSearch=" + txtSearch + "
                    data: { "txtSearch": txtSearch, "channelCode": channelCode, "shop": shop, "discountOrReduction": discountOrReduction, "checkRepeatProductIDs": checkRepeatProductIDs },
                    type: "post",
                    async: false,
                    dataType: "html",
                    success: function (returnData) {
                        if (returnData == "no data") {
                            warningTip("商品不在活动对象中，或者不存在该商品");
                        } else if (returnData == "product repeat") {
                            warningTip("添加的商品已在列表中,不能重复添加");
                        } else if (returnData != null) {
                            $("#DiscountContent").append(returnData);
                            $("#batchDelBtn").css("display", "block");
                            $("#DiscountList").css("display", "block"); // 打折列表
                            // 注册输入“折扣”离开的事件 【必须放到查询后面去注册 因为初始化是没有name=DiscountNumber】
                            DiscountPriceLeave();
                        }
                    }
                });
            };

            // 当前选中的是"减现金"
            if ($("#part-p1").attr("checked") == "checked") {
                discountOrReduction = "reduction";
                // 列表中已有商品不能重复添加
                var checkRepeatProductIDs = "";

                var checks = $("#ReductionContent input[type=checkbox]");
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");
                    var strID = checkID.substring(9, checkID.length);
                    strID = strID + ",";
                    checkRepeatProductIDs += strID;
                }
                checkRepeatProductIDs = checkRepeatProductIDs.substring(0, checkRepeatProductIDs.length - 1); // 去除最后一个","

                $.ajax({
                    url: "/Promotion/GetTableList",
                    data: { "txtSearch": txtSearch, "channelCode": channelCode, "shop": shop, "discountOrReduction": discountOrReduction, "checkRepeatProductIDs": checkRepeatProductIDs },
                    dataType: "html",
                    success: function (returnData) {
                        if (returnData == "no data") {
                            warningTip("商品不在活动对象中，或者不存在该商品");
                        } else if (returnData == "product repeat") {
                            warningTip("添加的商品已在列表中,不能重复添加");
                        } else if (returnData != null) {
                            $("#ReductionContent").append(returnData);
                            $("#batchDelBtn").css("display", "block");
                            $("#ReductionList").css("display", "block"); // 减现列表
                            // 注册输入“减现金”离开的事件
                            ReductionPriceLeave();
                        }
                    }
                });
            };


        };

        // 初始化操作
        var initDefalult = function () {
            // 默认进来 店铺、渠道、会员等级是隐藏的
            $("#typeCodeChange").css("display", "none");
            $("#gradeTypeID").css("display", "none");

            // 默认进来就隐藏
            $("#dd_Search").css("display", "none");  // 查询条件
            $("#DiscountList").css("display", "none"); // 打折列表
            $("#ReductionList").css("display", "none");  // 减价列表

            $("#txtReduction").css("display", "none");  // 减价文本框

            $("#batchDelBtn").css("display", "none"); // 批量删除按钮
        };

        // 批量删除
        var batchDel = function () {
            if ($("#part-p1").attr("checked") == "checked") {  // 如果选中的是减现金
                var checks = $("#ReductionContent input[type=checkbox]");
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    if (check == "checked") {
                        $(checks[i]).parents("tr").remove();
                    }
                }
            } else if ($("#all-p1").attr("checked") == "checked") { // 选中的是 打折
                var checks = $("#DiscountContent input[type=checkbox]");
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    if (check == "checked") {
                        $(checks[i]).parents("tr").remove();
                    }
                }
            }
            successTip('删除成功');
        };


        //6.0 -------------------辅助功能 Start----------------------------------->
        /*
        6.1 填写"活动名称"离开时触发的事件
        */
        $("#PromotionName").change(function () {
            var promotionName = $(this).val();
            $.post("/Promotion/checkPromotionNameRepeat", "promotionName=" + promotionName + "", function (succData) {
                if (succData != null) {
                    if (succData == "repeat") {
                        validataPrompt($("#PromotionName"), '活动名称重复');
                        $("#PromotionName").val('');
                        $("#PromotionName").focus();
                    }
                }
            });
        });

        /*
        6.2 减现金时 （金钱的文本自动填上.00）
        */
        $("#txtReductionNum").change(function () {
            // 先要判断是否含有'.'
            var value = $(this).val();
            if (value.indexOf('.') > 0) {
                return;
            }
            var money = parseInt($(this).val());
            if (money > 0) {
                $(this).val(money + '.00');
            }
        });

        /*
        6.3 当输入内容时 取消提示字
        */
        function onchangeForValidata(event) {
            $(".prompt").text('');
        };
        //-------------------辅助功能 End------------------------------------->
        //-------------------1.1 下拉框改变时触发的事件 Start----------------------------------->
        /*
        1.1 "直销或者分销"改变时触发的事件 (从后台获取数据 动态的拼接到前台)
        */
        $("#shopTypeChangeID").change(function () {
            // 要移除用户查询添加上去的数据 (打折、和减现)
            $("#DiscountContentRemove").siblings().remove();
            $("#ReductionContentRemove").siblings().remove();

            // 首先要移除“店铺”下的元素
            $("#changeTypeCode").siblings().remove();

            $("#gradeTypeID").css("display", "none");

            // 获取到当前选中的值
            var shopType = $(this).attr("Value");
            // 如果点击的是"会员类型"
            if (shopType == "所有") { // 即点击全部时 应该返回所有
                // 隐藏后面的下拉框
                $("#typeCodeChange").css("display", "none");
                $("#gradeTypeID").css("display", "none");
                return;
            }

            $.ajax({
                url: "../../Promotion/ShopTypeChangeing",
                data: "shopType=" + shopType + "",
                async: false,
                success: function (returnData) {
                    if (returnData != null && returnData.length > 0) {
                        // 将返回的结果绑定上去
                        $("#changeTypeCode").after(returnData);
                        $("#typeCodeChange").css("display", "inline");
                    }
                },
                error: function (error) {
                    errorTip("服务器端错误，联系管理员");
                }
            });
        });

        /*
        1.2 店铺类型改变的时候触发的事件 (从后台获取数据 动态的拼接到前台)
        */
        $("#typeCodeChange").change(function () {
            // 要移除用户查询添加上去的数据 (打折、和减现)
            $("#DiscountContentRemove").siblings().remove();
            $("#ReductionContentRemove").siblings().remove();

            // 首先要移除“会员类型”下的元素
            $("#changeGradeID").siblings().remove();

            // 获取到当前选中的值
            var typeCode = $(this).attr("value"); // 取到渠道编号code值
            if (typeCode == "全网店铺") {
                $("#gradeTypeID").css("display", "none");
                return;
            }

            $.ajax({
                url: "../../Promotion/TypeCodeChangeing",
                data: "typeCode=" + typeCode + "",
                type: "post",
                async: false,
                success: function (returnData) {
                    if (returnData != null && returnData.length > 0) { // 如果返回的数据长度为零就不显示
                        // 将返回的结果绑定上去
                        $("#changeGradeID").after(returnData);
                        $("#gradeTypeID").css("display", "inline");
                    }
                },
                error: function (error) {
                    errorTip("服务器端错误，联系管理员");
                }
            });
        });

        //-------------------下拉框改变时触发的事件 End------------------------------------->

        //-------------------2.0 勾选复选框触发的事件 Start------------------------------------->
        /*
        2.1 勾选 "全部商品" 触发的事件
        */
        $("#all-p").change(function () {
            // 当选中的是全部商品 隐藏部分内容
            if ($("#all-p").attr("checked") == "checked") {
                // 清空文本框中的值
                $("#txtReductionNum").val("");
                $("#txtDiscountNum").val("");

                $("#dd_Search").css("display", "none");
                $("#DiscountList").css("display", "none"); // 打折列表
                $("#ReductionList").css("display", "none");  // 减价列表

                $("#batchDelBtn").css("display", "none");
                if ($("#all-p1").attr("checked") == "checked") { // 如果是打折
                    $("#txtReduction").css("display", "none");  // 减价文本框
                    $("#txtDiscount").css("display", "block");  // 打折文本框
                } else { // 减现金
                    $("#txtReduction").css("display", "block");  // 减价文本框
                    $("#txtDiscount").css("display", "none");  // 打折文本框
                }
            }
        });

        /*
        2.2 勾选 "部分商品" 触发的事件
        */
        $("#part-p").change(function () {
            // 当选中的是部分商品 
            if ($("#part-p").attr("checked") == "checked") {
                // 清空文本框中的值
                $("#txtReductionNum").val("");
                $("#txtDiscountNum").val("");

                $("#dd_Search").css("display", "block");  // 查询条件


                if ($("#all-p1").attr("checked") == "checked") { // 如果是打折
                    var checks = $("#DiscountContent input[type=checkbox]");
                    if (checks.length > 0) {
                        $("#DiscountList").css("display", "block"); // 打折列表
                        $("#batchDelBtn").css("display", "block");
                    } else {
                        $("#batchDelBtn").css("display", "none");
                    }
                    $("#ReductionList").css("display", "none");  // 减价列表

                    $("#txtReduction").css("display", "none");  // 减价文本框
                    $("#txtDiscount").css("display", "block");  // 打折文本框
                } else { // 减现金
                    var checks = $("#ReductionContent input[type=checkbox]");
                    if (checks.length > 0) {
                        $("#ReductionList").css("display", "block");  // 减价列表
                        $("#batchDelBtn").css("display", "block");
                    } else {
                        $("#ReductionList").css("display", "none");
                        $("#batchDelBtn").css("display", "none");
                    }

                    $("#DiscountList").css("display", "none"); // 打折列表
                    $("#txtReduction").css("display", "block");  // 减价文本框
                    $("#txtDiscount").css("display", "none");  // 打折文本框
                }

            }
        });

        /*
        2.3 点击了 "打折" 触发的事件
        */
        $("#all-p1").change(function () {
            // 清空文本框中的值
            $("#txtReductionNum").val("");
            $("#txtDiscountNum").val("");

            $("#txtDiscount").css("display", "block");  // 打折文本框
            $("#txtReduction").css("display", "none");  // 减价文本框
            // 如果选择的是部分商品
            if ($("#part-p").attr("checked") == "checked") {
                // 判断 打折列表 中有没有数据 有就显示
                var checks = $("#DiscountContent input[type=checkbox]");
                if (checks.length > 0) {
                    $("#DiscountList").css("display", "block"); // 打折列表
                    $("#batchDelBtn").css("display", "block");
                } else {
                    $("#batchDelBtn").css("display", "none");
                }
                $("#ReductionList").css("display", "none");  // 减价列表

            }
        });

        /*
        2.4 点击了 "减现金" 触发的事件
        */
        $("#part-p1").change(function () {
            // 清空文本框中的值
            $("#txtReductionNum").val("");
            $("#txtDiscountNum").val("");

            $("#txtDiscount").css("display", "none");  // 打折文本框
            $("#txtReduction").css("display", "block");  // 减价文本框
            // 如果选择的是部分商品
            if ($("#part-p").attr("checked") == "checked") {
                // 判断 减现金列表 中有没有数据 有就显示
                var checks = $("#ReductionContent input[type=checkbox]");
                if (checks.length > 0) {
                    $("#ReductionList").css("display", "block");  // 减价列表
                    $("#batchDelBtn").css("display", "block");
                } else {
                    $("#ReductionList").css("display", "none");
                    $("#batchDelBtn").css("display", "none");
                }

                $("#DiscountList").css("display", "none"); // 打折列表
            }
        });
        //-------------------勾选复选框触发的事件 End--------------------------------------->


        // 输入文本框
        function txtTips() {
            $("#PromotionName").focus(function () {
                if ($(this).val() == "请输入活动名称") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#PromotionName").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入活动名称");
                }
            });

            $("#DateStart").focus(function () {
                if ($(this).val() == "活动开始时间") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#DateStart").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("");
                }
            });

            $("#DateEnd").focus(function () {
                if ($(this).val() == "活动结束时间") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#DateEnd").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("");
                }
            });

            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入商品名称或商家编码") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#txtSearch").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入商品名称或商家编码");
                }
            });
        };

        // 添加营销活动之后
        function afterOnSuccess() {
            var data = $("#UpdateTargetHiddenID").html()
            if (data == "ok") {
                //$("#ResultTip").css("display", "block").text("添加活动成功");
                // 清空表单信息
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("创建活动成功").change();
                GoToLinkUrl("", "../../Promotion/PromotionList?type=<%=ViewData["type"]%>");

            } else if (data == "ReductionPrice over SalePrice") {
                warningTip("某些商品原价不能小于减现金");
            } else if (data == "product Repeat") {
                warningTip("请核实同一件商品在一段时间内只能有一种营销活动");
            } else if (data == "开始时间不能大于结束时间") {
                warningTip("开始时间不能大于结束时间");
            } else if (data == "开始时间不能小于当前时间") {
                warningTip("开始时间不能小于当前时间");
            } else {
                errorTip("未知异常，联系管理员");
            }
        };

        // 添加营销活动失败
        function afterOnFailure() {
            errorTip("添加失败");
        };

        // 点击取消的时候
        function btnCancel() {
            GoToLinkUrl("", "../../Promotion/PromotionList?type=<%=ViewData["type"]%>")
        };

    </script>
    <%--------------------减现金开始(由局部试图 改为同一个页面 2013-10-16 21:27:09)--%>
    <script type="text/javascript">
        $(function () {
            // 注册全选
            reductionCheckAll();

            // 注册输入"减价"离开的事件
            txtReductionLeave();
        });

        // "确定" 这个方法是最后提交整个页面的时候执行的(AddPromotion.aspx页面调用的)
        function btnReductConfirm() {
            // 如果选中的是部分商品 并且选中了减现金 才会向后台提交
            debugger;
            if ($("#part-p").attr("checked") == "checked" && $("#part-p1").attr("checked") == "checked") {
                // 获取所有选中的checkBox的ID和减的现金
                // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                //var sendReductDatas = new Array();        // 存储的形如 3_4,4_6，8_9 的数据
                var sendReductDatas = "";
                var checks = $("#ReductionContent input[type=checkbox]");
                //alert(checks.length-1);
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");

                    if (check == "checked") { // 如果checkbox被选中

                        // 取出 id  形如checkbox_7
                        var checkID = $(checks[i]).attr("id");
                        // 当前行的减的现金
                        var reductPrice = $("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                        if (reductPrice.length == 0) { // 如果选中了checkBox却没有给"减现金"赋值 就默认的赋值为0
                            reductPrice = "0";
                        }
                        // 这点处理的不好
                        var strID = checkID.substring(9, checkID.length);

                        strID = strID + "_" + reductPrice + ",";
                        sendReductDatas += strID

                        // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "减现金"
                        //sendReductDatas.push(strID);
                    }
                }

                // 将要传递到后台的数据放到隐藏域中
                sendReductDatas = sendReductDatas.substring(0, sendReductDatas.length - 1); // 去除最后一个","
                //sendReductDatas += "|";
                $("#sendReductDatas").val(sendReductDatas);
                $("#isReductionValidate").val("true");
            }
        }

        // 当用户输入"减现金" 并且离开的时候自动填充到"优惠价"一栏
        function ReductionPriceLeave() {
            // 要循环遍历 "减现金"文本框 触发文本框改变的事件
            var reductions = $("#ReductionContent input[name=ReductionNumber]");
            $(reductions).change(function () {
                var reduction = $(this).val();

                reduction = parseFloat(reduction);

                if (reduction <= 0) {
                    //alert('请输入正数');
                    $(this).val("");
                    return false;
                }

                // 金钱的文本自动填上.00
                // 先要判断是否含有'.'
                var value = $(this).val();
                if (value.indexOf('.') <= 0) {
                    $(this).val(reduction + '.00');
                }

                // 对应的原价
                var salePrice = $("div[name=SalesPrice]", $(this).parents("tr")).text();
                salePrice = parseFloat(salePrice);
                // 优惠价 = 原价-减现金
                var currentprice1 = salePrice - reduction;
                if (currentprice1 < 0) {
                    warningTip("减现金不能小于原价");
                    // 用户输入的价格清空
                    $(this).val('');
                    return false;
                }
                if (value.indexOf('.') <= 0) {
                    var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1 + '.00');
                } else {
                    var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1);
                }

            });
        };

        // 逻辑删除当前要删除的行的数据 把当前行移除
        function DeleteRow(event) {
            // 移除当前行
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            $(eventSrc).parents("tr").remove();
        };

        // 输入"减价"离开的事件
        function txtReductionLeave() {

            // #txtReductionNum：是 addRomotion.aspx中的
            $("#txtReductionNum").blur(function () {
                // 要限制是在选中的部分商品时
                if ($("#part-p").attr("checked") != "checked") {
                    return false;
                }
                if ($(this).val() <= 0) {
                    //                alert('请输入正数');
                    return false;
                }
                var isOverSalePrice = false;
                if ($(this).val() != "") {
                    // 把所有的"减现金"文本框都赋值此值
                    $(".tr-Current input[name=ReductionNumber]").val($(this).val());

                    // 要循环赋值 这样可以把优惠价也赋值上去
                    var strs = $(".tr-Current input[name=ReductionNumber]");
                    for (var i = 0; i < strs.length; i++) { //$("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                        // 获取每一当前行减的现金 优惠价=原价-现金
                        var reductPrice = $("input[name=ReductionNumber]", $(strs[i]).parents("tr")).val();

                        // 获取对应行的原价
                        var salePrice = $("div[name=SalesPrice]", $(strs[i]).parents("tr")).text();

                        // 获取"优惠价"的列 并赋值
                        var currentPrice1 = parseFloat(salePrice) - parseFloat(reductPrice);
                        if (currentPrice1 <= 0) {
                            isOverSalePrice = true;
                        }
                        var currentPrice = $("div[name=CurrentPrice]", $(strs[i]).parents("tr")).text(currentPrice1 + '.00');
                    }

                    if (isOverSalePrice == true) { // 如果原价小于减现金
                        $("#txtReductionNum").val("");
                        $(".tr-Current input[name=ReductionNumber]").val(""); // 减现金
                        $(".tr-Current div[name=CurrentPrice]").text(""); // 优惠价
                        warningTip("请检查有的商品价钱小于减的现金");
                    }

                }

            });
        };

        // 全选
        function reductionCheckAll() {
            $("#ckallChecked").click(function () {
                var checkAllState = $("#ckallChecked").attr("Checked");
                if (checkAllState == "checked") {
                    $("#ReductionContent input[type=checkbox]").attr("checked", "checked");
                } else {
                    $("#ReductionContent input[type=checkbox]").attr("checked", false);
                };
            });
        };

        //-----------通用方法 Start----------------------->
        // 去空格
        if (!String.prototype.trim) {
            String.prototype.trim = function () {
                var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
                while (ws.test(this.charAt(end))) {
                    end--;
                }
                return this.slice(0, end + 1);
            }
        }

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        var successTip = function (msg) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(msg).change();
        };

        var warningTip = function (msg) {
            $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
            $("#operateTip").html(msg).change();
        };

        var errorTip = function (msg) {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html(msg).change();
        };
        //-----------通用方法 End----------------------->
    </script>
    <%--------------------减现金结束(由局部试图 改为同一个页面 2013-10-16 21:27:09)--%>
    <%--------------------打折开始(由局部试图 改为同一个页面 2013-10-16 21:27:09)--%>
    <script type="text/javascript">
        $(function () {
            // 注册全选
            checkAll();

            // 注册输入"打折"离开的事件
            txtDiscountLeave();
        });

        // "确定" 这个方法是最后提交整个页面的时候执行的(AddPromotion.aspx页面调用的)
        function btnDiscountConfirm() {
            // 如果选中的是部分商品 并且选中了打折 才会向后台提交
            if ($("#part-p").attr("checked") == "checked" && $("#all-p1").attr("checked") == "checked") {
                // 获取所有选中的checkBox的ID和减的现金
                // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                // 存储的形如 3_4,4_6，8_9 的数据
                var sendDiscountDatas = "";
                var checks = $("#DiscountContent input[type=checkbox]");

                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");

                    if (check == "checked") { // 如果checkbox被选中

                        // 取出 id  形如checkbox_7
                        var checkID = $(checks[i]).attr("id");
                        // 当前行的“打折”
                        var discountPrice = $("input[name=DiscountNumber]", $(checks[i]).parents("tr")).val();
                        if (discountPrice.length == 0) { // 如果选中了checkBox却没有给"打折"赋值 就默认的赋值为100 bug 2014-01-03 15:07:51 提示用户
                            warningTip("请给选择的商品打折赋值");
                            discountPrice = 100;
                        }
                        // 这点处理的不好
                        var strID = checkID.substring(9, checkID.length);

                        strID = strID + "_" + discountPrice + ",";
                        sendDiscountDatas += strID

                        // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "打折"
                    }
                }

                sendDiscountDatas = sendDiscountDatas.substring(0, sendDiscountDatas.length - 1); // 去除最后一个","
                //sendDiscountDatas += "|";
                $("#sendDiscountDatas").val(sendDiscountDatas);
                $("#isDiscountValidate").val("true");
            }
        };


        // 输入"打折"离开的事件
        function txtDiscountLeave() {
            // #txtDiscountNum：是 addRomotion.aspx中的
            $("#txtDiscountNum").blur(function () {
                // 要限制是在选中的部分商品时
                if ($("#part-p").attr("checked") != "checked") {
                    return false;
                }
                if ($(this).val() != "") {
                    if ($(this).val() <= 0 || $(this).val() >= 100) {
                        //alert('请输入 0~10 之间的数');
                        return false;
                    }

                    // 把所有的"打折"文本框都赋值此值
                    $(".tr-Current input[name=DiscountNumber]").val($(this).val());

                    // 要循环赋值 这样可以把优惠价也赋值上去
                    var strs = $(".tr-Current input[name=DiscountNumber]");
                    for (var i = 0; i < strs.length; i++) { //$("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                        // 获取每一当前行减的现金 优惠价=原价x打折
                        var discountPrice = $("input[name=DiscountNumber]", $(strs[i]).parents("tr")).val();

                        // 获取对应行的原价
                        var salePrice = $("div[name=SalesPrice]", $(strs[i]).parents("tr")).text();

                        // 获取"优惠价"的列 并赋值
                        var currentPrice1 = parseInt(salePrice) * (parseFloat(discountPrice) / 100);
                        var currentPrice = $("div[name=CurrentPrice]", $(strs[i]).parents("tr")).text(currentPrice1 + '.00');
                    }

                }
            });
        };

        // 当用户输入"折扣" 并且离开的时候自动填充到"优惠价"一栏
        function DiscountPriceLeave() {
            // 要循环遍历 "折扣"文本框 触发文本框改变的事件
            var discounts = $("#DiscountContent input[name=DiscountNumber]");

            $(discounts).change(function () {
                // 当前操作的对象
                // "打折"
                var disCount = $(this).val();
                disCount = parseFloat(disCount);
                if (disCount <= 0 || disCount >= 100) {
                    warningTip("折扣只能在 0 ~ 100 范围内！");
                    $(this).val("");
                    return false;
                }
                // 对应的原价
                var salePrice = $("div[name=SalesPrice]", $(this).parents("tr")).text();
                salePrice = parseFloat(salePrice);
                // 优惠价 = 原价x折扣
                var currentprice1 = salePrice * (disCount / 100);
                var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1);
            });
        };

        // 全选
        function checkAll() {
            $("#discountAll_Check").click(function () {
                var checkAllState = $("#discountAll_Check").attr("Checked");
                if (checkAllState == "checked") {
                    $("#DiscountContent input[type=checkbox]").attr("checked", "checked");
                } else {
                    $("#DiscountContent input[type=checkbox]").attr("checked", false);
                };
            });
        };

        // 逻辑删除当前要删除的行的数据 把当前行移除
        function DeleteRow(event) {
            // 移除当前行
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            $(eventSrc).parents("tr").remove();
        };

    </script>
    <%--------------------打折结束(由局部试图 改为同一个页面 2013-10-16 21:27:09)--%>
</asp:Content>
