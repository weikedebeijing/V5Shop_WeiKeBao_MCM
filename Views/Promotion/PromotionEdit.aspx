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
<%@ Import Namespace="V5.MetaData.Util" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        // 定义一个全局变量 检测用户有没有按查询按钮 一旦按了查询按钮 就按照 addpromotion的方式添加
        var flagForQuery = new Object();
        flagForQuery.flag = "NoQuery";
    </script>
    <%
        var promotion = (V5.MetaData.Customer.Model.Promotion)ViewData["promotion"];

        var opened = (V5.MetaData.Market.Model.Opened)ViewData["opened"];

        var grade = (V5.MetaData.Customer.Model.Grade)ViewData["grade"];

        var PromotionItemReports = (List<V5.MetaData.Customer.Model.PromotionItemReport>)ViewData["promotionItemReports"];

        var messageContent = string.Empty;
        if (ViewData["message"] != null)
        {
            var message = (V5.MetaData.Customer.Model.Message)ViewData["message"];
            messageContent = message.Content;
        }
    %>
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">



            <a href="javascript:void(0)" onclick="GoToLinkUrl(event)"
                title="返回" class="a-btn float-l"><i class="icon-back" linkurl="../../Promotion/PromotionList?type=<%=ViewData["type"]%>"></i></a>
            <h1 class="spanTitle">编辑会员营销</h1>
        </div>
    </div>
    <!--title end-->
    <div class="mod-form t20">
        <div class="con style0page">
            <input type="hidden" id="pType_forShowTable" value="<%:promotion.Type %>" />
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("PromotionEdit", "Promotion", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            活动对象</label>
                    </div>
                    <div class="float-l">
                        <select name="shopType" id="shopTypeChangeID" disabled="disabled">
                           <%-- <option>所有</option>--%>
                            <% if (promotion.SaleType == (int)AppEnum.ChannelType.All)
                               {%>
                            <option value="0" selected="selected">所有</option>

                            <%}
                               else if (promotion.SaleType == (int)AppEnum.ChannelType.DRP_Platform)
                               {%>
                            <option value="1">零售</option>

                            <%}
                               else
                               {%>
                            <option value="1">零售</option>

                            <%} %>
                        </select>
                        <select name="shopTypeCode" id="typeCodeChange" disabled="disabled">
                            <option id="changeTypeCode" >全网店铺</option>
                            <% if (opened != null)
                               { %>
                            <option selected="selected" value="<%:opened.Code %>">
                                <%:opened.Title %></option>
                            <%} %>
                        </select>
                        <select name="gradeTypeID" id="gradeTypeID" selectedValue="<%=grade==null?"":grade.ID.ToString() %>">
                            <option id="changeGradeID">所有会员等级</option>
                            <% if (grade != null)
                               {%>
                          <%--  <option selected="selected" value="<%:grade.ID %>">
                                <%:grade.Name %></option>--%>
                            <%} %>
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
                        <input type="text" class="w230" name="PromotionName" id="PromotionName" value="<%:promotion.Name %>" />
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
                        <input type="text" class="w230 Wdate" name="DateStart" id="DateStart" value="<%:promotion.DateStart %>"
                            onfocus="var DateEnd=$dp.$('DateEnd');WdatePicker({onpicked:function(){DateEnd.focus();},dateFmt:'yyyy-MM-dd 00:00:00',minDate:'%y-%M-#{%d+1}'})" />
                        <input type="text" class="w230 Wdate" name="DateEnd" id="DateEnd" value="<%:promotion.DateEnd%>"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',minDate:'#F{$dp.$D(\'DateStart\')}'})" />
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
                    <div class="float-l" id="DiscountOrRedutionMain">
                        <% if (promotion.Type == "C")
                           {%>
                        <input type="radio" id="all-p1" name="cuxiaoCheck" value="Discount" checked="checked" />
                        <%}
                           else
                           {%>
                        <input type="radio" id="all-p1" name="cuxiaoCheck" value="Discount" />
                        <%} %>
                        <label for="all-p1">
                            打折</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <% if (promotion.Type == "D")
                           { %>
                        <input type="radio" id="part-p1" name="cuxiaoCheck" value="Reduction" checked="checked" />
                        <%}
                           else
                           {%>
                        <input type="radio" id="part-p1" name="cuxiaoCheck" value="Reduction" />
                        <%} %>
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
                    <div class="float-l" id="AllOrPartMain">
                        <% if (promotion.ItemScope == "A")
                           {%>
                        <input type="radio" id="all-p" name="ProductCheckMian" value="AllProduct" checked="checked" />
                        <label for="all-p">
                            所有商品</label>&nbsp;&nbsp;
                        <input type="radio" id="part-p" name="ProductCheckMian" value="BatchProduct" />
                        <label for="part-p">
                            部分商品</label>
                        <%}
                           else
                           {%>
                        <input type="radio" id="all-p" name="ProductCheckMian" value="AllProduct" />
                        <label for="all-p">
                            所有商品</label>
                        <input type="radio" id="part-p" name="ProductCheckMian" value="BatchProduct" checked="checked" />
                        <label for="part-p">
                            部分商品</label>
                        <%} %>
                        <br />
                        <span>所有商品或部分商品为活动对象所在店铺商品</span>
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
                        <% if (promotion.Discount > 0)
                           {%>
                        <%var promotionDiscount = promotion.Discount.ToString().Substring(0, promotion.Discount.ToString().Length - 3); %>
                        <input type="text" name="Discount" id="txtDiscountNum" onkeyup="value=value.replace(/[^\d]/g,'')"
                            class="v5-input w100" value="<%:promotionDiscount %>" />折（0~100）%
                        <%}
                           else
                           { %>
                        <input type="text" name="Discount" id="txtDiscountNum" onkeyup="value=value.replace(/[^\d]/g,'')"
                            class="v5-input w100" />折（0~100）%
                        <%} %>
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
                        <% if (promotion.Reduction > 0)
                           {%>
                        <%
                               var promotionReduction = promotion.Reduction.ToString().Substring(0, promotion.Reduction.ToString().Length - 3);
                        %>
                        <input type="text" id="txtReductionNum" onkeyup="value=value.replace(/[^\d]/g,'')"
                            name="Reduction" class="v5-input w100" value="<%:promotionReduction %>" />
                        <%}
                           else
                           {%>
                        <input type="text" id="txtReductionNum" onkeyup="value=value.replace(/[^\d]/g,'')"
                            name="Reduction" class="v5-input w100" />
                        <%} %>元
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
                            <button type="button" class="searchContent" onclick="btnSearch();">
                                查询</button>
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
                        <button type="button" onclick="javascript:batchDel();" class="a-btn">
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
                        <table id="DiscountContentMain">
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
                            <% if (promotion.ItemScope == "P" && promotion.Type == "C")
                               {%>
                            <% foreach (var PromotionItemReport in PromotionItemReports)
                               {%>
                            <tr class="tr-Current">
                                <td>
                                    <div class="cell">
                                        <label>
                                            <input type="checkbox" id="checkbox_<%:PromotionItemReport.ProductID %>" value=""
                                                name="sub" />
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.Name%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell" name="SalesPrice">
                                        <%:PromotionItemReport.OriginalPrice%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <input name="DiscountNumberMain" class="w50 h20" onkeyup="value=value.replace(/[^\d]/g,'')"
                                            value="<%:PromotionItemReport.Discount %>" />
                                    </div>
                                </td>
                                <td>
                                    <div class="cell" name="CurrentPrice">
                                        <% if (PromotionItemReport.OriginalPrice > 0 && PromotionItemReport.Discount > 0)
                                           {%>
                                        <%:PromotionItemReport.OriginalPrice * (PromotionItemReport.Discount/100)%>
                                        <%} %>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.OuterCode%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.Stock%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a> </span>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <%} %>
                            <%} %>
                        </table>
                        <input type="hidden" id="sendDiscountDatasMain" name="sendDiscountDatasMain" />
                        <input type="hidden" id="isDiscountValidateMain" name="isDiscountValidateMain" />
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
                                    <th class="x-tab">减现金
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
                        <table id="ReductionContentMain">
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
                            <% if (promotion.ItemScope == "P" && promotion.Type == "D")
                               {%>
                            <% foreach (var PromotionItemReport in PromotionItemReports)
                               {%>
                            <tr class="tr-Current" id="str_<%:PromotionItemReport.ProductID %>">
                                <td>
                                    <div class="cell">
                                        <label>
                                            <input type="checkbox" id="checkbox_<%:PromotionItemReport.ProductID %>" name="sub" />
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.Name%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell" name="SalesPrice">
                                        <%:PromotionItemReport.OriginalPrice%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <input name="ReductionNumber" class="w50 h20" value="<%:PromotionItemReport.Reduction %>" />
                                    </div>
                                </td>
                                <td>
                                    <div class="cell" name="CurrentPrice">
                                        <%if (PromotionItemReport.OriginalPrice > 0 && PromotionItemReport.Reduction > 0)
                                          { %>
                                        <%:PromotionItemReport.OriginalPrice-PromotionItemReport.Reduction%>
                                        <%} %>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.OuterCode%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%:PromotionItemReport.Stock%>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a> </span>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <%} %>
                            <%} %>
                        </table>
                        <input type="hidden" id="sendReductDatasMain" name="sendReductDatasMain" />
                        <input type="hidden" id="isReductionValidateMain" name="isReductionValidateMain" />
                    </div>
                </div>
            </div>
            <%--02-减现金列表End---------------------%>
            <!--table end-->
            <!---column end--->
            <div class="l130 t30 b20">
                <button type="submit" class="submit01 r10" onclick="javascript:saveAllUpdate();">
                    保存</button>
                <button type="button" onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
                <span id="UpdateTargetHiddenID" style="display: none"></span>
                <input type="hidden" id="flagForQuery" name="flagForQuery" value="" />
                <input type="hidden" name="promotionID" value='<%:ViewData["promotionID"] %>' />
            </div>
            <%} %>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 初始化
        $(function () {
            // 默认 用户没有点击查询
            $("#flagForQuery").val('NoQuery');

            // 注册文本框点击事件
            txtTips();

            // 初始化
            initDefalult();

            // 注册输入"打折"离开的事件
            txtDiscountLeaveMain();

            // 注册输入“折扣”离开的事件
            DiscountPriceLeaveMain();

            // 注册输入"减价"离开的事件
            txtReductionLeaveMain();

            // 注册输入“减现金”离开的事件
            ReductionPriceLeaveMain();

            // 打折全选
            checkAllDisCount();

            // 减现金全选
            checkAllReduction();

            // 默认让所有的checkBox 全选中
            defaultCheckAll();
            $("#typeCodeChange").change();
        });

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

        // 初始化
        var initDefalult = function () {
            var promotionType = $("#pType_forShowTable").val();
            if (promotionType == "C") {
                $("#DiscountList").css("display", "block");
                $("#ReductionList").css("display", "none");
            } else if (promotionType == "D") {
                $("#DiscountList").css("display", "none");
                $("#ReductionList").css("display", "block");
            }

            // 这个要动态的判断了~~~
            var checkAll = $("#all-p").attr("checked");
            var checkPart = $("#part-p").attr("checked");

            var checkDiscount = $("#all-p1").attr("checked");
            var checkReduction = $("#part-p1").attr("checked");

            if (checkPart == "Checked") {

                if (checkDiscount == "checked") { // 部分商品+打折
                    // 显示打折列表 并且把信息填充上去
                    $("#DiscountList").css("display", "block"); // 打折列表
                }

                if (checkReduction == "checked") {
                    // 显示减现金列表 并且把信息填充上去
                    $("#ReductionList").css("display", "block"); // 减价列表
                }
            }

            if (checkAll == "checked") {
                $("#dd_Search").css("display", "none");  // 查询条件
                $("#DiscountList").css("display", "none"); // 打折列表
                $("#ReductionList").css("display", "none");  // 减价列表
            }

            if (checkDiscount == "checked") { // 把 减现金文本框隐藏
                $("#txtReduction").css("display", "none");
            };

            if (checkReduction == "checked") { // 把 打折文本框隐藏
                $("#txtDiscount").css("display", "none");
            }

            $("#batchDelBtn").css("display", "none"); // 批量删除按钮

        };

        // 批量删除
        var batchDel = function () {
            if ($("#part-p1").attr("checked") == "checked") {  // 如果选中的是减现金
                var checks = $("#ReductionContentMain input[type=checkbox]");
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    if (check == "checked") {
                        $(checks[i]).parents("tr").remove();
                    }
                }
            } else if ($("#all-p1").attr("checked") == "checked") { // 选中的是 打折
                var checks = $("#DiscountContentMain input[type=checkbox]"); //DiscountContentMain
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");
                    if (check == "checked") {
                        $(checks[i]).parents("tr").remove();
                    }
                }
            }
            successTip('删除成功');
        };

        // 往后台提交前检查 前台 js (只要遇到 returne false 就不会往后台提交)
        function AjaxFormValidata() {
            $(".prompt").text('');

            // 验证文本框输入是否合法
            if ($("#PromotionName").val() == "请输入活动名称") {
                $("#PromotionName").focus();
                validataPrompt($("#PromotionName"), '活动名称不能为空');
                return false;
            }

            if ($("#DateStart").val() == "活动开始时间") {
                validataPrompt($("#DateStart"), '活动开始时间不能为空');
                return false;
            }

            if ($("#DateEnd").val() == "活动结束时间") {
                validataPrompt($("#DateEnd"), '活动结束时间不能为空');
                return false;
            }

            // 输入折扣不合法
            if ($("#all-p1").attr("checked") == "checked") {
                if ($("#txtDiscountNum").val() != "" && (!IsNum("#txtDiscountNum") || $("#txtDiscountNum").val() <= 0) || $("#txtDiscountNum").val() > 100) {
                    $("#txtDiscountNum").focus();
                    validataPrompt($("#txtDiscountNum"), '输入的折扣不合法');
                    return false;
                }
            }

            // 减现金不合法
            if ($("#part-p1").attr("checked") == "checked") {
                if ($("#txtReductionNum").val() != "" && (!IsNum("#txtReductionNum") || $("#txtReductionNum").val() <= 0)) {
                    $("#txtReductionNum").focus();
                    validataPrompt($("#txtReductionNum"), '输入的减现金不合法');
                    return false;
                }
            }


            var flag = flagForQuery.flag; // 检测用户有没有按下查询框

            // ===========如果选择的是部分商品 进行验证
            if ($("#AllOrPartMain #part-p").attr("checked") == "checked") {

                //if (flag == "hasQuery") {
                // 打折
                if ($("#DiscountOrRedutionMain #all-p1").attr("checked") == "checked") {
                    var hasCheckedDiscountProduct = false;
                    var checks = $("#DiscountContentMain input[type=checkbox]");
                    for (var i = 0; i < checks.length; i++) {
                        var check = $(checks[i]).attr("checked");
                        if (check == "checked") {
                            var discountPriceElement = $("input[name=DiscountNumberMain]", $(checks[i]).parents("tr"));
                            var discountPrice = $("input[name=DiscountNumberMain]", $(checks[i]).parents("tr")).val().trim();
                            if (discountPrice.length <= 0) {
                                warningTip("请给勾选的商品打折赋值！");
                                $("#isDiscountValidateMain").val("false");
                                // 清空要传递给后台的数据
                                $("#sendReductDatasMain").val("");
                                $(discountPriceElement).focus();
                                return false;
                            }
                            hasCheckedDiscountProduct = true;
                        };
                    };
                    if (!hasCheckedDiscountProduct) { // 没有选中的
                        warningTip("请选择要打折的商品！");
                        return false;
                    }
                };

                // 减现金
                if ($("#DiscountOrRedutionMain #part-p1").attr("checked") == "checked") {
                    var checks = $("#ReductionContentMain input[type=checkbox]");
                    var hasCheckedReductionProduct = false;
                    var checks = $("#ReductionContentMain input[type=checkbox]");
                    for (var i = 0; i < checks.length; i++) {
                        var check = $(checks[i]).attr("checked");
                        if (check == "checked") { // 如果checkbox被选中
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
                            hasCheckedReductionProduct = true;
                        };
                    };
                    if (!hasCheckedReductionProduct) { // 没有选中的
                        warningTip("请选择要减现金的商品！");
                        return false;
                    }
                };

            } else { //===========如果选择的是全部商品 进行
                // 打折
                if ($("#DiscountOrRedutionMain #all-p1").attr("checked") == "checked") {
                    if (!IsNum("#txtDiscountNum")) {
                        warningTip("请输入要打折的金额！");
                        return false;
                    }
                }

                // 减现金
                if ($("#DiscountOrRedutionMain #part-p1").attr("checked") == "checked") {
                    if (!IsNum("#txtReductionNum")) {
                        warningTip("请输入要减现金的金额！");
                        return false;
                    }
                }
            };

            // 都通过了就清除 错误提示
            $(".spMessage").text("");

        }

        // 保存修改
        function saveAllUpdate() {
            var flag = flagForQuery.flag; // 检测用户有没有按下查询框
            // 如果选择的是部分商品 // 需要把用户修改的list信息提交到后台
            if ($("#AllOrPartMain #part-p").attr("checked") == "checked") {

                if (flag == "NoQuery") {  // 全部商品不需要考虑 会自动提交到后台  →部分商品+未查询
                    if ($("#DiscountOrRedutionMain #all-p1").attr("checked") == "checked") {// →部分商品+未查询+打折
                        // 要获取到所有用户修改的list信息
                        // 获取所有选中的checkBox的ID和减的现金
                        // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                        // 存储的形如 3_4,4_6，8_9 的数据
                        var sendDiscountDatasMain = "";
                        var checks = $("#DiscountContentMain input[type=checkbox]");

                        for (var i = 0; i < checks.length; i++) {
                            var check = $(checks[i]).attr("checked");

                            if (check == "checked") { // 如果checkbox被选中

                                // 取出 id  形如checkbox_7
                                var checkID = $(checks[i]).attr("id");
                                // 当前行的“打折”
                                var discountPrice = $("input[name=DiscountNumberMain]", $(checks[i]).parents("tr")).val();
                                if (discountPrice.length == 0) { // 如果选中了checkBox却没有给"打折"赋值 就默认的赋值为10
                                    discountPrice = 100;
                                }
                                // 这点处理的不好
                                var strID = checkID.substring(9, checkID.length);

                                strID = strID + "_" + discountPrice + ",";
                                sendDiscountDatasMain += strID

                                // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "打折"
                            }
                        }

                        // 如果存储id的数组不为空
                        if (sendDiscountDatasMain.length <= 0) {
                            // 给验证码置为 false
                            $("#isDiscountValidateMain").val("false");
                            // 清空要传递给后台的数据
                            $("#sendReductDatasMain").val("");
                            return false;
                        }

                        // 将要传递到后台的数据放到隐藏域中
                        sendDiscountDatasMain = sendDiscountDatasMain.substring(0, sendDiscountDatasMain.length - 1); // 去除最后一个","

                        $("#sendDiscountDatasMain").val(sendDiscountDatasMain);
                        $("#isDiscountValidateMain").val("true");

                    }

                    // 如果是减现金
                    if ($("#DiscountOrRedutionMain #part-p1").attr("checked") == "checked") {// →部分商品+未查询+减现金
                        // 获取所有选中的checkBox的ID和减的现金
                        // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                        //var sendReductDatasMain = new Array();        // 存储的形如 3_4,4_6，8_9 的数据
                        var sendReductDatasMain = "";
                        var checks = $("#ReductionContentMain input[type=checkbox]");
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
                                sendReductDatasMain += strID

                                // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "减现金"
                                //sendReductDatasMain.push(strID);
                            }
                        }

                        // 如果存储id的数组不为空
                        if (sendReductDatasMain.length <= 0) {
                            // 给验证码置为 false
                            $("#isReductionValidateMain").val("false");
                            // 清空要传递给后台的数据
                            $("#sendReductDatasMain").val("");
                            return false;
                        }

                        // 使用贱招 将要传递到后台的数据放到隐藏域中

                        sendReductDatasMain = sendReductDatasMain.substring(0, sendReductDatasMain.length - 1); // 去除最后一个","
                        //sendReductDatasMain += "|";
                        $("#sendReductDatasMain").val(sendReductDatasMain);
                        $("#isReductionValidateMain").val("true");
                    }

                } else if (flag == "hasQuery") { // 就按照addPromotion的方式做  →部分商品+查询
                    // 选择了 打折
                    if ($("#all-p1").attr("checked") == "checked") { // 部分商品+打折
                        btnDiscountConfirm();
                    } else if ($("#part-p1").attr("checked") == "checked") {
                        btnReductConfirm();
                    }
                }
            }
        };

        // 减现金
        function btnReductConfirm() {
            // 如果选中的是部分商品 并且选中了减现金 才会向后台提交
            if ($("#part-p").attr("checked") == "checked" && $("#part-p1").attr("checked") == "checked") {
                // 获取所有选中的checkBox的ID和减的现金
                // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                //var sendReductDatas = new Array();        // 存储的形如 3_4,4_6，8_9 的数据
                var sendReductDatas = "";
                var checks = $("#ReductionContentMain input[type=checkbox]");
                //alert(checks.length-1);
                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");

                    if (check == "checked") { // 如果checkbox被选中

                        // 取出 id  形如checkbox_7
                        var checkID = $(checks[i]).attr("id");

                        // 当前行的减的现金
                        var reductPrice = $("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                        if (reductPrice.length == 0) { // 如果选中了checkBox却没有赋值
                            reductPrice = 0;
                        }
                        // 这点处理的不好
                        var strID = checkID.substring(9, checkID.length);

                        strID = strID + "_" + reductPrice + ",";
                        sendReductDatas += strID

                        // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "减现金"
                        //sendReductDatas.push(strID);
                    }
                }

                // 如果存储id的数组不为空
                if (sendReductDatas.length <= 0) {
                    // 给验证码置为 false
                    $("#isReductionValidateMain").val("false");
                    // 清空要传递给后台的数据
                    $("#sendReductDatasMain").val("");
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请选择要减现金的商品").change();
                    return false;
                }

                // 使用贱招 将要传递到后台的数据放到隐藏域中

                sendReductDatas = sendReductDatas.substring(0, sendReductDatas.length - 1); // 去除最后一个","
                //sendReductDatas += "|";
                $("#sendReductDatasMain").val(sendReductDatas);
                $("#isReductionValidateMain").val("true");
            }
        }

        // 打折
        function btnDiscountConfirm() {

            // 如果选中的是部分商品 并且选中了打折 才会向后台提交
            if ($("#part-p").attr("checked") == "checked" && $("#all-p1").attr("checked") == "checked") {
                // 获取所有选中的checkBox的ID和减的现金
                // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
                // 存储的形如 3_4,4_6，8_9 的数据
                var sendDiscountDatas = "";
                var checks = $("#DiscountContentMain input[type=checkbox]");

                for (var i = 0; i < checks.length; i++) {
                    var check = $(checks[i]).attr("checked");

                    if (check == "checked") { // 如果checkbox被选中

                        // 取出 id  形如checkbox_7
                        var checkID = $(checks[i]).attr("id");
                        // 当前行的“打折”
                        var discountPrice = $("input[name=DiscountNumber]", $(checks[i]).parents("tr")).val();

                        if (discountPrice.length == 0) { // 如果选中了checkBox却没有给"打折"赋值 就默认的赋值为10  
                            discountPrice = 10;
                        }
                        // 这点处理的不好
                        var strID = checkID.substring(9, checkID.length);

                        strID = strID + "_" + discountPrice + ",";
                        sendDiscountDatas += strID

                        // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "打折"
                    }
                }

                // 如果存储id的数组不为空
                if (sendDiscountDatas.length <= 0) {
                    // 给验证码置为 false
                    $("#isDiscountValidateMain").val("false");
                    // 清空要传递给后台的数据
                    $("#sendReductDatasMain").val("");
                    warningTip("请选择要打折的商品");
                    return false;
                }

                // 使用贱招 将要传递到后台的数据放到隐藏域中

                sendDiscountDatas = sendDiscountDatas.substring(0, sendDiscountDatas.length - 1); // 去除最后一个","

                $("#sendDiscountDatasMain").val(sendDiscountDatas);
                $("#isDiscountValidateMain").val("true");
            }
        };


        // 打折全选
        function checkAllDisCount() {
            $("#discountAll_Check").click(function () {
                var checkAllState = $("#discountAll_Check").attr("Checked");
                if (checkAllState == "checked") {
                    $("#DiscountContentMain input[type=checkbox]").attr("checked", "checked");
                } else {
                    $("#DiscountContentMain input[type=checkbox]").attr("checked", false);
                };
            });
        };

        // 减现金全选
        function checkAllReduction() {
            $("#ckallChecked").click(function () {
                var checkAllState = $("#ckallChecked").attr("Checked");
                if (checkAllState == "checked") {
                    $("#ReductionContentMain input[type=checkbox]").attr("checked", "checked");
                } else {
                    $("#ReductionContentMain input[type=checkbox]").attr("checked", false);
                };
            });
        };

        // 输入"打折"离开的事件
        function txtDiscountLeaveMain() {

            // #txtDiscountNum：是 addRomotion.aspx中的
            $("#txtDiscountNum").blur(function () {
                // 要限制是在选中的部分商品时
                if ($("#part-p").attr("checked") != "checked") {
                    return false;
                }
                if ($(this).val() != "") {
                    if ($(this).val() <= 0 || $(this).val() >= 100) {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("请输入 0~100 之间的数").change();
                        return false;
                    }

                    // 把所有的"打折"文本框都赋值此值
                    $(".tr-Current input[name=DiscountNumberMain]").val($(this).val());

                    // 要循环赋值 这样可以把优惠价也赋值上去
                    var strs = $(".tr-Current input[name=DiscountNumberMain]");
                    for (var i = 0; i < strs.length; i++) { //$("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                        // 获取每一当前行减的现金 优惠价=原价x打折
                        var discountPrice = $("input[name=DiscountNumberMain]", $(strs[i]).parents("tr")).val();

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
        function DiscountPriceLeaveMain() {
            // 要循环遍历 "折扣"文本框 触发文本框改变的事件
            var discounts = $("#DiscountContentMain input[name=DiscountNumberMain]");

            $(discounts).change(function () {
                // 当前操作的对象
                // "打折"
                var disCount = $(this).val();
                disCount = parseFloat(disCount);
                if (disCount <= 0 || disCount > 100) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入 0~100 之间的数").change();
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

        function txtReductionLeaveMain() {
            // #txtReductionNum：是 addRomotion.aspx中的
            $("#txtReductionNum").blur(function () {
                // 要限制是在选中的部分商品时
                if ($("#part-p").attr("checked") != "checked") {
                    return false;
                }
                if ($(this).val() <= 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入正数").change();
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


        // 当用户输入"减现金" 并且离开的时候自动填充到"优惠价"一栏
        function ReductionPriceLeaveMain() {
            // 要循环遍历 "减现金"文本框 触发文本框改变的事件
            var discounts = $("#ReductionContentMain input[name=ReductionNumber]");
            $(discounts).change(function () {
                var reduction = $(this).val();

                reduction = parseFloat(reduction);


                if (reduction <= 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入正数").change();
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

        // 点击查询时触发
        function btnSearch() {  // flagForQuery.flag = "NoQuery";
            // 如果文本框中没有输入信息 就按照"商品分类"查询 ；如果商品分类也没有勾选就查询所有的

            // 获取当前搜索文本中的值
            var txtSearch = $("#txtSearch").val();
            if (txtSearch == "请输入商品名称或商家编码" || txtSearch.trim() == "") { // 不返回任何结果
                return;
            }

            // 只要点击查询 就按照 addPromotion的方式
            flagForQuery.flag = "hasQuery";

            $("#flagForQuery").val('hasQuery');

            // 渠道
            var channelCode = $("#shopTypeChangeID").val();

            // 店铺
            var shop = $("#typeCodeChange").val();

            // 当前选中的是"打折"
            if ($("#all-p1").attr("checked") == "checked") {
                discountOrReduction = "discount";
                // 列表中已有商品不能重复添加
                var checkRepeatProductIDs = "";

                var checks = $("#DiscountContentMain input[type=checkbox]");
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
                    url: "/Promotion/GetTableList",
                    data: { "txtSearch": txtSearch, "channelCode": channelCode, "shop": shop, "discountOrReduction": discountOrReduction, "checkRepeatProductIDs": checkRepeatProductIDs },
                    dataType: "html",
                    type: "post",
                    success: function (returnData) {
                        if (returnData == "no data") {
                            warningTip("没有要查询的数据,请核实");
                        } else if (returnData == "product repeat") {
                            warningTip("添加的商品已在列表中,不能重复添加");
                        } else if (returnData != null) {
                            $("#batchDelBtn").css("display", "block");
                            $("#DiscountList").css("display", "block"); // 打折列表
                            $("#DiscountContentMain").append(returnData);
                        }

                    }
                });
            };

            // 当前选中的是"减现金"
            if ($("#part-p1").attr("checked") == "checked") {
                discountOrReduction = "reduction";
                // 列表中已有商品不能重复添加
                var checkRepeatProductIDs = "";

                var checks = $("#ReductionContentMain input[type=checkbox]");
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
                    url: "/Promotion/GetTableList",
                    data: { "txtSearch": txtSearch, "channelCode": channelCode, "shop": shop, "discountOrReduction": discountOrReduction, "checkRepeatProductIDs": checkRepeatProductIDs },
                    dataType: "html",
                    type: "post",
                    success: function (returnData) {
                        if (returnData == "no data") {
                            warningTip("没有要查询的数据,请核实");
                        } else if (returnData == "product repeat") {
                            warningTip("添加的商品已在列表中,不能重复添加");
                        } else if (returnData != null) {
                            $("#ReductionContentMain").append(returnData);

                            //ReductionPriceLeaveMain();
                            $("#batchDelBtn").css("display", "block");
                            $("#ReductionList").css("display", "block"); // 减现列表

                        }
                    }
                });
            };


        };

        // 逻辑删除当前要删除的行的数据
        function DeleteRow(event) {
            // 移除当前行
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            $(eventSrc).parents("tr").remove();
        };
        // -------------------6.0 辅助功能 Start----------------------------------->
        /*
        6.1 填写"活动名称"离开时触发的事件
        */
        $("#PromotionName").change(function () {
            var promotionName = $(this).val();
            $.post("../../Promotion/checkPromotionNameRepeat", "promotionName=" + promotionName + "", function (succData) {
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
        //-------------------辅助功能 End------------------------------------->
        //-------------------1.0 下拉框改变时触发的事件 Start----------------------------------->
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
                //$("#RoleTypeID").css("display", "none");
                $("#gradeTypeID").css("display", "none");
                return;
            }

            $.ajax({
                url: "../../Promotion/TypeCodeChangeing",
                data: "typeCode=" + typeCode + "",
                type: "post",
                success: function (returnData) {
                    if (returnData != null && returnData.length > 0) { // 如果返回的数据长度为零就不显示
                        // 将返回的结果绑定上去
                        $("#changeGradeID").after(returnData);
                        $("#gradeTypeID").css("display", "inline");
                        $("#gradeTypeID option").each(function () {
                            if ($(this).val() == $("#gradeTypeID").attr("selectedValue")) {
                                $(this).attr("selected", "selected");
                            }
                        });
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
                $("#batchDelBtn").css("display", "block");

                if ($("#all-p1").attr("checked") == "checked") { // 如果是打折
                    var checks = $("#DiscountContentMain input[type=checkbox]");
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
                    var checks = $("#ReductionContentMain input[type=checkbox]");
                    if (checks.length > 0) {
                        $("#ReductionList").css("display", "block");  // 减价列表
                        $("#batchDelBtn").css("display", "block");
                    } else {
                        $("#ReductionList").css("display", "none");
                        $("#batchDelBtn").css("display", "none");
                    }

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
                var checks = $("#DiscountContentMain input[type=checkbox]");
                if (checks.length > 0) {
                    $("#DiscountList").css("display", "block"); // 打折列表
                    $("#batchDelBtn").css("display", "block");
                } else {
                    $("#DiscountList").css("display", "none");
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
                var checks = $("#ReductionContentMain input[type=checkbox]");
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
                    $(this).val("活动开始时间");
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
                    $(this).val("活动结束时间");
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
            var data = $("#UpdateTargetHiddenID").html();
            if (data == "ok") {
                //$("#ResultTip").css("display", "block").text("添加活动成功");
                // 清空表单信息
                successTip("修改活动成功");
                window.location.href = "../../Promotion/PromotionList?MenuCode=C310";
            } else if (data == "ReductionPrice over SalePrice") {
                warningTip("某些商品原价不能小于减现金");
            } else if (data == "product Repeat") {
                warningTip("请核实同一件商品在一段时间内只能有一种营销活动");
            } else if (data == "product Repeat") {
                warningTip("请核实同一件商品在一段时间内只能有一种营销活动");
            } else if (data == "开始时间不能大于结束时间") {
                warningTip("开始时间不能大于结束时间");
                $("#DateStart").val('');
            } else if (data == "开始时间不能小于当前时间") {
                warningTip("开始时间不能小于当前时间");
                $("#DateStart").val('');
            } else {
                errorTip("未知异常，联系管理员");
            }
        };

        var defaultCheckAll = function () {
            $("input[type=checkbox]").attr("checked", "checked");
        };

        // 添加营销活动失败
        function afterOnFailure() {
            errorTip("保存失败");
        };


        // 点击取消的时候
        function btnCancel() {
            GoToLinkUrl("", "../../Promotion/PromotionList?type=<%=ViewData["type"]%>")


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
</asp:Content>
