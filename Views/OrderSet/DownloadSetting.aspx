<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/orderset.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
        <div class="MCM-C-M">
            <!--标题 begin-->
            <div class="mod-title">
                <div class="con style01">
                    <h1>
                        订单设置</h1>
                </div>
            </div>
            <!--标题 end-->
            <div class="mod-tab">
                <div class="con style01">
                    <ul>
                        <li class="current"><a class="c16">常规</a></li>
                        <%--<li><a>标签</a></li>--%>
                       <%-- <li><a>分组</a></li>--%>
                        <li><a>问题订单</a></li>
                    </ul>
                </div>
            </div>
            <div class="mod-title">
                <div class="con style01">
                    <div class="h10">
                    </div>
                    <h1>
                        下载范围</h1>
                </div>
            </div>
            <% List<Opened> list = ViewData["list"] as List<Opened>;
               foreach (var item in list)
               { %>
            <div class="mod-form" name="panel">
                <div class="con style01">
                    <div style="border-bottom: 0;" class="title bg02">
                        <h3 class="fb">
                            <input type="checkbox" id="cg-tb1" name="shop" code="<%=item.Code %>">
                            <label for="cg-tb1">
                                <%=item.Title%></label>
                        </h3>
                    </div>
                    <dl>
                        <dd class="0">
                            <input type="checkbox" id="cg-tb1-01" code="<%=item.Code %>" name="import" state="1">
                            <label for="cg-tb1-01" class="r30">
                                未付款订单</label>
                            <input type="checkbox" id="cg-tb1-02" code="<%=item.Code %>" name="import" state="2">
                            <label for="cg-tb1-02" class="r30">
                                待发货订单</label>
                            <input type="checkbox" id="cg-tb1-03" code="<%=item.Code %>" name="import" state="3">
                            <label for="cg-tb1-03" class="r30">
                                已发货订单</label>
                            <input type="checkbox" id="cg-tb1-04" code="<%=item.Code %>" name="import" state="4">
                            <label for="cg-tb1-04" class="r30">
                                交易完成订单</label>
                        </dd>
                    </dl>
                </div>
            </div>
            <%} %>
            <!--下载  开始-->
            <div class="mod-title">
                <div class="con style01">
                    <h1>
                        下载频率</h1>
                </div>
            </div>
            <!--下载  结束-->
            <div class="mod-form">
                <div class="con">
                    <table>
                        <colgroup>
                            <col style="width: auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <select class="v5-select w150">
                                        <option value="1">手动更新</option>
                                        <%--<option value="2">每30分钟一次</option>--%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="submit01 t10" name="save">
                                        &nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--订单常规设置脚本-->
    <script type="text/javascript" language="javascript">

        $(function () {
            // 加载全选或者反选事件
            $("input[name='shop']").click(function () {
                var current = $(this).attr("code");
                if (this.checked) {
                    $("input[name='import']").each(function () {
                        if ($(this).attr("code") == current) {
                            $(this).attr("checked", true);
                        }
                    })
                } else {
                    $("input[name='import']").each(function () {
                        if ($(this).attr("code") == current) {
                            $(this).attr("checked", false);
                        }
                    })
                }
            });

            //克隆实体类
            function clone(myObj) {
                if (typeof (myObj) != 'object') return myObj;
                if (myObj == null) return myObj;
                var myNewObj = new Object();
                for (var i in myObj) myNewObj[i] = clone(myObj[i]);
                return myNewObj;
            }

            // 设置保存
            $("button[name='save']").click(function () {
                var objlist = new Array();
                var entity = $.parseJSON('<%=ViewData["json"] %>');

                $("div[name='panel']").each(function () {
                    var shopCode = $('input[name="shop"]:checked', $(this)).attr("code");
                    $("input[name='import']:checked", $(this)).each(function () {
                        if ($(this).attr("code") == shopCode) {
                            var newobj = clone(entity);
                            newobj.ChannelCode = shopCode;
                            newobj.OrderStatus = $(this).attr("state");
                            objlist.push(newobj);
                        }
                    })
                });

                $.ajax({
                    url: "/OrderSet/SaveDownloadSetting",
                    type: "post",
                    dataType: 'json',
                    data: { "objList": JSON.stringify(objlist) },
                    success: function (result) {
                        if (result.Code == null && result.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("保存成功").change();
                        }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("保存失败").change();
                        }
                    }
                });
            });
        });

        $(document).ready(function () {

            // 绑定现有的下载配置
            var currentSetting = $.parseJSON('<%=ViewData["currentSetting"] %>');

            for (var i = 0; i < currentSetting.length; i++) {
                // 下载配置
                var code = currentSetting[i].ChannelCode;
                $('input[name="shop"][code=' + code + ']').attr("checked", true);

                // 订单状态
                var status = currentSetting[i].OrderStatus;
                $('input[name="import"][code="' + code + '"][state="' + status + '"]').attr("checked", true);
            }
        });

    </script>
    <!--订单常规设置 end-->
</asp:Content>
