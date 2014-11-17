<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                系统授权店铺</h1>
        </div>
    </div>
    <div class="mod-form b20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w200">
                        <label>
                            请选择授权店铺类型：</label>
                    </div>
                    <div class="float-l">
                        <select class="w130" id="v5-select">
                            <option value="2">
                                淘宝集市店</option>
                        </select>
                    </div>
                    <div class="float-l">
                        <a id="linkAuthorize" class="btn-gradient-blue l10" href="javascript:void(0);">前往授权</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!--标题 begin-->
    <div class="mod-title">
        <div class="con style02">
            <h2>
                已授权店铺列表
            </h2>
        </div>
    </div>
    <!--标题 end-->
    <div class="mod-table">
        <div class="mod-table-head">
            <div class="con style0list-bg">
                <table>
                    <colgroup>
                        <col style="width: 33%">
                        <col style="width: 33%">
                        <col style="width: 33%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                店铺名称
                            </th>
                            <th>
                                授权情况
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
            <div class="con style0dotted">
                <table>
                    <colgroup>
                        <col style="width: 33%">
                        <col style="width: 33%">
                        <col style="width: 33%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <%  var list = ViewData["list"] as List<Shop>;
                            foreach (var item in list)
                            {
                        %>
                        <tr class="tr-Current">
                            <td>
                                <% if (item.ChannelCode == "C002")
                                   { %>
                                <span class="icon-fenxiao"></span>
                                <% }
                                   else if (item.ChannelCode == "C001")
                                   { %>
                                <span class="icon-wechat"></span>
                                <% }
                                   else
                                   { %>
                                <span class="icon-taobao"></span>
                                <% } %>
                                <%= item.Title %>
                            </td>
                            <td>
                                <%if (item.ChannelCode != "C002" && item.ChannelCode != "C001")
                                  {
                                      Dictionary<string, string> dic = ViewData["outOfDate"] as Dictionary<string, string>;
                                      foreach (var itemOutOfDate in dic)
                                      {
                                          if (itemOutOfDate.Key == item.ChannelCode)
                                          {
                                              Regex reg = new Regex("1");
                                              if (reg.IsMatch(itemOutOfDate.Value))
                                              {%>
                                                <span class="c03">授权过期</span>
                                            <% }
                                               else
                                               {%>
                                                <span class="c01-4">已授权</span>
                                                <%
                                              }
                                   
                                          }
                                      }
                                  }%>
                            </td>
                            <td>
                                <div class="cell">
                                    <div class="mod-operate">
                                        <div class="con style0editdel">
                                            <% if (item.ChannelCode != "C002" && item.ChannelCode != "C001")
                                               { %>
                                            <a class="del" name="del" data_id="<%= item.ID %>" href="javascript:void(0);" onclick="delThisShop(event)">
                                                删除</a> <a class="edit" href="http://oauth.v5shop.com/authorize.aspx?state=http://<%=ViewData["host"]%>/Shop/Attestation?code=<%=item.ChannelCode %>"
                                                    target="_blank">重新授权</a>
                                            <% } %>
                                        </div>
                                    </div>
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
    <!--List Start-->
    <!--List End-->
    <script type="text/javascript">

        $(function () {
            var clickFlag = 0;
            // 前往授权(切换渠道是获取授权链接Url)
            $("#v5-select").change(function () {
                //清空原有的Url
                $("#linkAuthorize").attr("href", "javascript:void(0)");

                var type = $(this).val();

                if (type == 0) {
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请选择授权店铺类型").change();
                    return false;
                }

                $.ajax({
                    url: "../../Shop/GenerateChannelCode",
                    type: "get",
                    async: false,
                    success: function (channelCode) {
                        $("#linkAuthorize").attr("href", "http://oauth.v5shop.com/authorize.aspx?state=http://" + '<%=ViewData["host"]%>' + "/Shop/ShopAuthorize?code=" + channelCode + "&type=" + type);
                        $("#linkAuthorize").attr("target", "_blank");
                    }
                });
            })
        });

        // 删除
        function delThisShop(event) {
            if (!confirmThis(event, "删除店铺授权后，平台上该店铺的所有商品将删除，您确认删除?")) {
                return;
            }
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var shopID = $(eventSrc).attr("data_id");
            $.ajax({
                url: "/Shop/DeleteShop",
                type: "post",
                dataType: 'json',
                data: { "shopID": shopID },
                success: function (result) {
                    if (result.Code == null && result.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功").change();
                        window.location.reload();
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除失败").change();
                    }
                }
            });
        }


        $(function () {
            //触发一下获取前往授权(切换渠道是获取授权链接Url)的事件
            $("#v5-select").change();
        })
    </script>
</asp:Content>
