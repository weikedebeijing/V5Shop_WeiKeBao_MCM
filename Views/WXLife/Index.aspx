<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% List<V5.App.BMC.UI.ViewModels.WeiXin.WXLifeModel> list = ViewData["wxLifePropList"] as List<V5.App.BMC.UI.ViewModels.WeiXin.WXLifeModel>;
    %>
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <%foreach (var item in list)
                  {%>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">
                            <%=item.IsMust==true?"*":"" %></span><label><%=item.Name%></label></div>
                    <div class="float-l">
                        <%if (item.IsInput)
                          {%>
                        <input id="txtProp<%=item.ID %>" type="text" class="w230" name="name" value="">
                        <%}
                          else
                          {%>
                        <select id="slProp<%=item.ID %>" class="w230">
                            <option value="value">text</option>
                        </select>
                        <% } %>
                        <span class="unit">
                            <%=item.Unit %></span>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</asp:Content>
