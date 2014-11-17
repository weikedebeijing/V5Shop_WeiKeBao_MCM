<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current" dir="All"><a href="#">全部（<%:ViewData["GradeCount"]%>）</a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--操作栏 begin-->
    
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0);" class="a-btn" onclick="javascript:addUserPopup();">
                    添加</a></li>
                <li><a href="#" id="DeleteBatch" onclick="javascript:DeleteBatch(event);" class="a-btn">
                    删除</a></li>
            </ul>
        </div>
    </div>

    <!--操作栏 end-->
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div class="mod-table">
        <div class="mod-table-head">
            <div class="con style0list">
                <table>
                    <colgroup>
                     
                        <col style="width: 5%;">
                    
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 15%;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            
                            <th>
                                <label>
                                    <input type="checkbox" id="ckall" name="" value="" onclick="CheckAll(event)" /></label>
                            </th>
                    
                            <th "x-tab">
                                会员等级
                            </th>
                            <th "x-tab">
                                会员类型
                            </th>
                            <th "x-tab">
                                满足条件
                            </th>
                            <th "x-tab">
                                <div class="iconbg-arrow up">
                                    会员优惠</div>
                            </th>
                            <th "x-tab">
                              
                                <%--<i class="icon-resize"></i>--%>操作
                            
                            </th>
                            <th>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div class="con style0line" id="GetGradeViewFlag">
                <%--局部试图--%>
            </div>
        </div>
    </div>

    <!--列表 End-->
    <%--弹层 Start--%>
    <%--添加会员等级 Start--%>
    <div id="addGradePopup" style="display: none;">
        <div class="content" style="width: 600px;">
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("addGrade", "customer", new { }, new AjaxOptions()
                  {
                      HttpMethod = "post",
                      OnBegin = "ajaxFormAddGradeValidata",
                      OnSuccess = "afterAddOnSuccess",
                      OnFailure = "afterAddOnFailure",
                      UpdateTargetId = "UpdateTargetHiddenID"
                  }))
              { %>
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    店铺客户</label></div>
                            <div class="float-l">
                                <select name="shopType" id="shopTypeAddChangeID">
                                    <option value="1">零售</option>
                                 <%--   <option value="B">分销</option>--%>
                                </select>
                                <select name="shopTypeCode" id="openedAdd">
                                </select>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" <li class="list-li" style="display:none">>
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    会员等级</label></div>
                            <div class="float-l">
                                <input type="radio" id="normalCustomerAdd" value="1" name="customerGrade" />
                                <label for="normalCustomerAdd">
                                    普通会员</label>&nbsp;&nbsp;
                                <input type="radio" id="selfCustomerAdd" value="0" name="customerGrade" checked="checked" />
                                <label for="selfCustomerAdd">
                                    自定义</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" id="GradeNameAddLi">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    等级名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="GradeNameAdd" name="GradeName" onchange="javascript:onchangeForValidata(event);"
                                    class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" id="meetConditionAddLi">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    需满足条件</label>
                            </div>
                            <div class="float-l">
                                <label class="w60 float-l r10">
                                    消费金额</label><label class="float-l r10">&gt;</label>
                                <input name="ConsumeAmount" id="ConsumeAmountAdd" type="text" onkeyup="value=value.replace(/[^\d]/g,'')"
                                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                    class="v5-input in100" />&nbsp; 元
                                <br />
                                <label class="w60 float-l r10">
                                    或消费次数</label><label class="float-l r10">&gt;</label><input name="ConsumeTimes" onkeyup="value=value.replace(/[^\d]/g,'')"
                                        onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                        id="ConsumeTimesAdd" type="text" class="v5-input in100" />&nbsp; 次
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    可享受折扣</label>
                            </div>
                            <div class="float-l">
                                <input name="DiscountRate" id="DiscountRateAdd" type="text" class="w230" onkeyup="value=value.replace(/[^\d]/g,'')"
                                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                    onchange="javascript:onchangeForValidata(event);" />
                                （0~100）%
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <button style="display: none;" id="addSubmit" type="submit">
                保存</button>
            <!--operate end-->
            <%} %>
        </div>
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="javascript:addGrade();" class="submit01-alert r10">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('addGrade')" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--添加会员等级 End----%>
    <%--编辑会员等级 Start----%>
    <div id="editGradePopup" style="display: none;">
        <div class="content" style="width: 600px;">
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("EditGrade", "customer", new { }, new AjaxOptions()
                  {
                      HttpMethod = "post",
                      UpdateTargetId = "UpdateTargetHiddenID",
                      OnBegin = "ajaxFormEditGradeValidata",
                      OnSuccess = "afterEditOnSuccess",
                      OnFailure = "afterEditOnFailure"
                  }))
              { %>
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    店铺客户</label></div>
                            <div class="float-l">
                                <select name="shopType" id="shopTypeEditChangeID">
                                    <option value="1">零售</option>
                              <%--    //  <option value="B">分销</option>--%>
                                </select>
                                <select name="shopTypeCode" id="openedEdit">
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
                                    会员等级</label></div>
                            <div class="float-l">
                                <div id="normalCustomerDiv">
                                    <input type="radio" id="normalCustomerEdit" value="1" name="customerGrade" />
                                    <label for="normalCustomer">
                                        普通会员</label>
                                </div>
                                <div id="selfCustomerDiv">
                                    <input type="radio" id="selfCustomerEdit" value="0" name="customerGrade" />
                                    <label for="selfCustomer">
                                        自定义</label></div>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" id="GradeNameEditLi">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    等级名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="GradeNameEdit" name="GradeName" onchange="javascript:onchangeForValidata(event);"
                                    class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" id="meetConditionEditLi">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    需满足条件</label>
                            </div>
                            <div class="float-l">
                                <label class="w60 float-l r10">
                                    消费金额</label><label class="float-l r10">&gt;</label>
                                <input name="ConsumeAmount" id="ConsumeAmountEdit" type="text" onkeyup="value=value.replace(/[^\d]/g,'')"
                                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                    class="v5-input in100" />&nbsp; 元
                                <br />
                                <label class="w60 float-l r10">
                                    或消费次数</label><label class="float-l r10">&gt;</label><input name="ConsumeTimes" onkeyup="value=value.replace(/[^\d]/g,'')"
                                        onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                        id="ConsumeTimesEdit" type="text" class="v5-input in100" />&nbsp; 次
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    可享受折扣</label>
                            </div>
                            <div class="float-l">
                                <input name="DiscountRate" id="DiscountRateEdit" type="text" class="w230" onkeyup="value=value.replace(/[^\d]/g,'')"
                                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                    onchange="javascript:onchangeForValidata(event);" />
                                （0~100）%
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <input type="hidden" name="GradeID" id="GradeID" />
            <button style="display: none;" id="editSubmit" type="submit">
                保存</button>
            <!--operate end-->
            <%} %>
        </div>
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="javascript:editGrade();" class="submit01-alert r10">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('editGrade')" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--编辑会员等级 End----%>
    <%--弹层 End----%>
   <span id="UpdateTargetHiddenID" style="display: none"></span>
    <%--   </div>--%>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
      
 

        $(function () {

            // 加载部分视图
            GetGradeView();

            // 注册 全部、直销、分销
            SelectGroup();

        });

        /*
        02- 编辑会员等级
        */
        // 编辑会员等级弹层
        var editUserPopup = function (gradeID) {
            $("#GradeID").val(gradeID);
            var gradeData;

            $.ajax({
                url: "/Customer/GetGradeInfo",
                data: { "gradeID": gradeID },
                dataType: "json",
                type: "post",
                async: false,
                success: function (jsonData) {
                    gradeData = jsonData;
                    $("select[id=shopTypeEditChangeID]").find('option').each(function () { // 让零售或者分销选中
                        var currentValue = $(this).val().trim();
                        if (currentValue == jsonData.SaleType) {
                            $(this).attr("selected", "selected");
                        }
                    });
                }
            });

            var ChannelCode = gradeData.ChannelCode;
            var saleType = gradeData.SaleType
            var IsDefault = gradeData.IsDefault;
            if (IsDefault) { // 默认等级
                $("#meetConditionEditLi").css("display", "none");
                $("#GradeNameEditLi").css("display", "none");

                $("#normalCustomerDiv").css("display", "block");
                $("#selfCustomerDiv").css("display", "none");

                $("#normalCustomerEdit").attr("checked", "checked");
                $("#selfCustomerEdit").attr("checked", false);
            } else {
                $("#meetConditionEditLi").css("display", "block");
                $("#GradeNameEditLi").css("display", "block");

                $("#normalCustomerDiv").css("display", "none");
                $("#selfCustomerDiv").css("display", "block");

                $("#normalCustomerEdit").attr("checked", false);
                $("#selfCustomerEdit").attr("checked", "checked");
            }

            $.ajax({
                url: "/Customer/GetShopTypeCode",
                data: { "ChannelCode": ChannelCode, "saleType": saleType },
                async: false,
                success: function (returnData) {
                    if (returnData != null && returnData.length > 0) {
                        $("#openedEdit").children().remove();
                        $("#openedEdit").css("display", "inline");
                        $("#openedEdit").append(returnData);
                    } else {
                        $("#openedEdit").css("display", "none");
                    }
                }
            });



            popupOperate("editGradePopup", "编辑会员等级", 'editGrade');
            helperForMoneyEditTxt(); // 金钱自动加 .00
            shopTypeEditChange(); // 店铺类型改变时
            defaultDealCustomerGrade(); // 根据会员类型不同 处理dom 元素的显隐性
            // 绑定数据
            $("#GradeNameEdit").val(gradeData.Name);
            $("#ConsumeAmountEdit").val(gradeData.ConsumeAmount);
            $("#ConsumeTimesEdit").val(gradeData.ConsumeTimes);
            $("#DiscountRateEdit").val(gradeData.DiscountRate); //DiscountRateEdit
        };

        // 2.1 编辑会员等级
        function editGrade() {
            $("#editSubmit").submit(); // 提交
        };

        // 2.2 编辑提交时的表单验证
        var ajaxFormEditGradeValidata = function () {
            $(".prompt").text('');

            var IsSelf = $("#selfCustomerEdit").attr("checked") == "checked" ? "0" : "1"; // "0" 是 自定义会员

            if ($("#GradeNameEdit").val() == "" && IsSelf == "0") {
                $("#GradeNameEdit").focus();
                validataPrompt($("#GradeNameEdit"), '等级名称不能为空');
                return false;
            }

            if ($("#ConsumeAmountEdit").val() == "" && $("#ConsumeTimesEdit").val() == "" && IsSelf == "0") {
                $("#ConsumeAmountEdit").focus();
                validataPrompt($("#ConsumeTimesEdit"), '消费金额或消费次数最少填写一个');
                return false;
            }

            if ($("#DiscountRateEdit").val() == "") {
                $("#DiscountRateEdit").focus();
                validataPrompt($("#DiscountRateEdit"), '折扣不能为空');
                return false;
            }

            if ($("#DiscountRateEdit").val() <= 0 || $("#DiscountRateEdit").val() > 100) {
                $("#DiscountRateEdit").focus();
                validataPrompt($("#DiscountRateEdit"), '折扣要在0~100之间');
                return false;
            }
        };

        // 2.3 根据会员类型不同 处理dom 元素的显隐性
        var defaultDealCustomerGrade = function () {
            var normalCustomerCheck = $("#normalCustomerEdit").attr("checked");
            if (normalCustomerCheck == "checked") {// 普通会员（默认等级）
                $("#GradeNameLi").css("display", "none");
                $("#meetConditionLi").css("display", "none");
            }
        };

        // 2.4 编辑会员等级失败
        function afterEditOnFailure() {
            errorTip("编辑失败");
        };

        // 2.5 修改会员等级之后
        function afterEditOnSuccess() {
            var data = $("#UpdateTargetHiddenID").html();
            if (data == "ok") {
                successTip("修改会员等级成功");
                GoToLinkUrl("", "/Customer/GradeList");
            } else if (data == "edit repeat") {
                warningTip("已经存在相同的会员等级和会员名称");
            } else if (data == "no meet") {
                warningTip("有店铺才能添加会员等级,请联系有关人员");
            }
            else {
                errorTip("未知异常,联系管理员");
            }
        };

        // 2.6 "直销或者分销"改变时触发的事件
        var shopTypeEditChange = function () {
            // 从后台获取数据 动态的拼接到前台
            $("#shopTypeEditChangeID").change(function () {
                // 首先要移除“店铺”下的元素
                $("#openedEdit").children().remove();

                // 获取到当前选中的值
                var saleType = $(this).attr("value");

                $.ajax({
                    url: "/Customer/ShopTypeChangeing",
                    data: "saleType=" + saleType + "",
                    success: function (returnData) {
                        if (returnData != null && returnData.length > 0) {
                            $("#openedEdit").css("display", "inline");
                            // 将返回的结果绑定上去
                            $("#openedEdit").append(returnData);
                        } else {
                            $("#openedEdit").css("display", "none");
                        }

                    },
                    error: function (error) {
                        errorTip("服务器端错误，联系管理员");
                    }
                });
            });
        };

        // 2.7 填完"消费金额"自动填上.00
        var helperForMoneyEditTxt = function () {
            $("#ConsumeAmountEdit").change(function () {
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
        };

        /*
        01-添加会员等级-------------------------------
        */
        // 1.0.0 添加会员等级弹层
        var addUserPopup = function () {
            popupOperate("addGradePopup", "添加会员等级", 'addGrade');
            helperForMoneyAddTxt();
            shopTypeAddChange();
            shopTypeAdd();
            normalCustomerAddChange();
            selfCustomerAddClick();
        };

        // 1.0 添加会员等级
        function addGrade() {
            $("#addSubmit").submit(); // 提交
        };

        // 1.1 添加用户 表单验证
        var ajaxFormAddGradeValidata = function () {
            $(".prompt").text(''); // 清空所有的提示

            // 普通会员选中就不需要验证满足条件
            var normalCustomerAddState = $("#normalCustomerAdd").attr("checked");

            if ($("#GradeNameAdd").val() == "" && normalCustomerAddState != "checked") {
                $("#GradeNameAdd").focus();
                validataPrompt($("#GradeNameAdd"), '等级名称不能为空');
                return false;
            }

            var consumeTimesAdd = $("#ConsumeTimesAdd").val(); // 消费次数

            if ($("#ConsumeAmountAdd").val() == "" && consumeTimesAdd == "" && normalCustomerAddState != "checked") {
                $("#ConsumeAmountAdd").focus();
                validataPrompt($("#ConsumeTimesAdd"), "消费金额或消费次数最少填写一个");
                return false;
            }

            // 判断消费次数是否大于 4294967296
            if (consumeTimesAdd >= 4294967296 && normalCustomerAddState != "checked") {
                validataPrompt($("#ConsumeTimesAdd"), "消费次数不能大于 4294967296");
                return false;
            }

            if ($("#DiscountRateAdd").val() == "") {
                $("#DiscountRateAdd").focus();
                validataPrompt($("#DiscountRateAdd"), '折扣不能为空');
                return false;
            }

            if ($("#DiscountRateAdd").val() <= 0 || $("#DiscountRateAdd").val() > 100) {
                $("#DiscountRateAdd").focus();
                validataPrompt($("#DiscountRateAdd"), "折扣要在0~100之间");
                return false;
            }
        };

        // 1.2 添加会员等级失败
        function afterAddOnFailure() {
            errorTip("添加失败");
        };

        // 1.3 添加会员等级之后
        function afterAddOnSuccess() {
            var data = $("#UpdateTargetHiddenID").html();
            if (data == "ok") {
                successTip("添加成功!");
                setTimeout(function () {
                    //window.location.href = "/Customer/GradeList?MenuCode=C325";
                    GoToLinkUrl("", "/Customer/GradeList");

                }, 600);
            } else if (data == "repeat") {
                warningTip("同一店铺下 已经存在相同的会员名称");
            } else if (data == "no meet") {
                warningTip("有店铺才能添加会员等级,请联系管理员");
            }
            else {
                errorTip("未知异常");
            }
        };

        // 1.4 "直销或者分销"改变时触发的事件

        var shopTypeAddChange = function () {

            $("#shopTypeAddChangeID").change(function () {

                // 首先要移除“店铺”下的元素
                $("#openedAdd").children().remove();

                // 获取到当前选中的值
                var saleType = $(this).attr("value");

                $.ajax({
                    url: "/Customer/ShopTypeChangeing",
                    data: "saleType=" + saleType + "",
                    success: function (returnData) {
                        if (returnData != null && returnData.length > 0) {


                            $("#openedAdd").append(returnData);
                            $("#openedAdd").css("display", "inline");
                        } else {
                            $("#openedAdd").css("display", "none");
                        }
                    },
                    error: function (error) {
                        errorTip("服务器端错误，联系管理员");
                    }
                });
            });
        };

        // 1.5 填完"消费金额"自动填上.00
        var helperForMoneyAddTxt = function () {
            $("#ConsumeAmountAdd").change(function () {
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
        };

        // 1.6 默认进来时的店铺类型
        function shopTypeAdd() {
            var saleType = $("#shopTypeAddChangeID").val();
            $("#openedAdd").html("");
            $.ajax({
                url: "/Customer/GetShopType",
                data: "saleType=" + saleType + "",
                success: function (returnData) {
                    if (returnData != null && returnData.length > 0) {
                        // 将返回的结果绑定上去
                        $("#openedAdd").find("option").remove();
                        $("#openedAdd").append(returnData);
                        $("#openedAdd").css("display", "inline");
                    }
                },
                error: function (error) {
                    errorTip("服务器端错误，联系管理员");
                }
            });
        };

        // 1.7 普通会员 的点击事件
        var normalCustomerAddChange = function () {
            $("#normalCustomerAdd").change(function () {
                var checkState = $(this).attr("checked");
                if (checkState == "checked") {
                    $("#GradeNameAddLi").css("display", "none");
                    $("#meetConditionAddLi").css("display", "none");
                }
            });
        };

        // 1.8 自定义会员 的点击事件
        var selfCustomerAddClick = function () {
            $("#selfCustomerAdd").change(function () {
                var checkState = $(this).attr("checked");
                if (checkState == "checked") {
                    $("#GradeNameAddLi").css("display", "block");
                    $("#meetConditionAddLi").css("display", "block");
                }
            });
        };

        /*
        3.0 添加和编辑通用功能
        */
        // 当输入内容时 取消提示字
        function onchangeForValidata(event) {
            $(".prompt").text('');
        };


        /*
        4.0 列表功能 -----------------------------
        */
        //直销
        function SelectGroup() {
            $(".mod-tab #type ul li").click(function () {
                $(".mod-tab #type ul li").removeClass("current c16");
                $(this).addClass("current c16");
             
                $.ajax({
                    url: "/Customer/GetGradeView",
                    type: "post",
                 
                    dataType: "html",
                    success: function (succData) {
                        if (succData != null) {
                            $("#GetGradeViewFlag").html(succData);
                        }
                    }
                });
            });
        };

        // 加载部分视图
        function GetGradeView() {
            $.ajax({
                url: "/Customer/GetGradeView",
             
                type: "post",
                dataType: "html",
                success: function (succData) {
                    if (succData != null) {
                        $("#GetGradeViewFlag").html(succData);
                    }
                }
            });
        };

        // 批量删除 listTotalCount列表中数据的条数
        function DeleteBatch(event) {
            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");

                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);

                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "../../customer/DeleteGrades",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                GoToLinkUrl("", "/Customer/GradeList");
                                successTip("删除成功");
                            } else if (succData == "del ok but have default garde") {
                                GoToLinkUrl("", "/Customer/GradeList");

                                warningTip("删除会员等级成功,默认等级不能删除");
                            } else if ("default garde can not del") {
                                warningTip("默认等级不能删除");
                            } else {
                                warningTip("请选中要删除的项");
                            }
                        },
                        error: function (errData) {
                            errorTip("删除出现异常，联系管理员");
                        }
                    });
                } else {
                    return false;
                }
            } else {
                warningTip("请勾选要删除的会员等级");
                return false;
            }


        };

        // 单个删除
        function DeleteSingle(event, ID) {
            if (confirmThis(event, "确定要删除此条数据？")) {
                $.post("/Customer/DeleteSingle", "GradeID=" + ID + "", function (returnData) {
                    if (returnData == "ok") {
                        successTip("删除会员等级成功");
                        GoToLinkUrl("", "/Customer/GradeList");
                    } else if (returnData == "is default") {
                        warningTip("默认等级不能删除，可以修改");
                    } else {
                        errorTip("删除会员等级失败");
                    }
                });
            }
        };

        //-------------通用------
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
    </script>
</asp:Content>
