<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%var customerCardTypes = (List<V5.MetaData.WeiXin.Model.CustomerCardType>)ViewData["customerCardTypes"]; %>
    <!--tab begin-->
    <div class="mod-tab t20">
        <div class="con style0big">
            <ul>
                <li class="current"><a href="javascript:void(0);" class="c16"><span>全部（<span id="customerCardTypesCount"><%:customerCardTypes.Count %></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--operate begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li id="addCustomerLi"><a href="javascript:void(0);" onclick="javascript:addCustomerCard();"
                    class="a-btn">添加</a></li>
            </ul>
        </div>
    </div>
    <!--operate end-->
    <div class="clear h10">
    </div>
    <!--table begin-->
    <div class="mod-table">
        <div class="mod-table-head">
            <div class="con style0list">
                <table>
                    <colgroup>
                        <col style="width: 5%;">
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
                                    <input type="checkbox" onclick="CheckAll(event)" id="ckall" name="" value=""></label>
                            </th>
                            <th>
                                会员卡
                            </th>
                            <th>
                                起始编号
                            </th>
                            <th>
                                生成数量
                            </th>
                            <th>
                                申领数量
                            </th>
                            <th>
                                创建时间
                            </th>
                            <th>
                                操作
                            </th>
                            <th>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div class="con style0line">
                <table>
                    <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody id="content">
                        <%foreach (var item in customerCardTypes)
                          {%>
                        <tr>
                            <td>
                                <div class="cell">
                                    <label>
                                        <input type="checkbox" onclick="CheckThis()" name="sub" value="" />
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%:item.CardName%>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%:item.CardFrontNumer %>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%:item.CreateNum %></div>
                            </td>
                            <td>
                                <div>
                                    <%:item.HandOutNum %>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%:item.CreateDate %></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <a class="r15 c07" href="#" onclick="javascript:customerCardTypeEdit();">编辑</a>
                                    <a class="r15 c07" href="#" onclick="javascript:customerCardTypeDel(event);">删除</a>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--table end-->
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //-------------初始化--------------
        $(function () {

        });

        // 添加会员卡
        var addCustomerCard = function () {
            // 验证是否能够添加

            var checks = $("#content input[type=checkbox]");
            if (checks.length <= 0) {
                window.location.href = "/WeiXinCustomerCardType/AddCustomerCardType?MenuCode=C365";
            } else {
                warningTip("请先删除会员卡信息");
                return false;
            }


        };

        // 删除
        var customerCardTypeDel = function (event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            $.ajax({
                url: "/WeiXinCustomerCardType/CheckCanDel",
                data: {},
                type: "post",
                async: false,
                success: function (data) {
                    if (data == "ok") {
                        isCanDel = true;
                    } else if (data == "no") {
                        warningTip("已经发放的会员卡不能删除");
                        isCanDel = false;
                    } else {
                        errorTip("服务器异常");
                    }
                }
            });

            if (isCanDel) {// 可以删除
                if (confirmThis(event, "确定要删除，删除后此会员卡将无法发放")) {
                    $.ajax({
                        url: "/WeiXinCustomerCardType/CustomerCardTypeDel",
                        data: {},
                        type: "post",
                        async: false,
                        success: function (data) {
                            if (data == "ok") {
                                successTip("删除成功");
                                $(eventSrc).parents("tr").remove();
                                $("#addCustomerLi").css("display", "block");
                            } else if (data == "error") {
                                errorTip("服务器异常");
                            }
                        }
                    });
                }
            };
        };

        // 编辑
        var customerCardTypeEdit = function () {
            $.ajax({
                url: "/WeiXinCustomerCardType/CheckCanEdit",
                data: {},
                type: "post",
                success: function (data) {
                    if (data == "ok") {
                        window.location.href = "/WeiXinCustomerCardType/CustomerCardTypeEdit?MenuCode=C365";
                    } else if (data == "no") {
                        warningTip("已经发放的会员卡不能编辑");
                    } else {
                        errorTip("服务器异常");
                    }
                }
            });
        };

        //------------------通用 Start----------------
        // 去除前后空格
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

        //------------------通用 End------------------

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
