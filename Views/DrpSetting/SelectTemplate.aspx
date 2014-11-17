<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <% List<V5.MetaData.DRP.Model.DrpTemplate> list = (List<V5.MetaData.DRP.Model.DrpTemplate>)ViewData["TemplatList"];%>
    <% string ajaxUrl = ViewData["ajaxUrl"].ToString();%>
    <div class="mod-title">
        <div class="con style0h1">
            <h1 class="spanTitle">
                模板管理</h1>
        </div>
    </div>
    <!--title end-->
    <!--tab begin-->
    <div class="mod-tab">
        <div class="con style0big">
            <!--“分销商城”、“淘宝一店”不可用时加 class="unable"-->
            <ul>
                <li class="current"><a class="c16" href="#">1. 栏目首页模板风格</a> </li>
                <li class="unable" style="display: none"><a href="#">2.图文列表模板风格</a> </li>
                <li class="liZhiyingData" style="display: none"><a href="#">3.图文详细页模板风格</a> </li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--content begin-->
    <div class="mod-templet">
        <div class="con style0img">
            <ul class="list-ul" id="template-ul">
                <% foreach (var template in list)
                   { %>
                <%if (template.IsAct == 1)
                  { %>
                <li class="list-li current">
                    <div class="img">
                        <img width="170" height="353" alt="template" src="<%=ajaxUrl %>/Template/<%=template.Src %>"></div>
                    <div class="name">
                        <input type="radio" id="<%=template.ID%>" checked="checked" name="template"><label
                            for="01"><%=template.Name%></label></div>
                </li>
                <%}
                  else
                  {%>
                <li class="list-li">
                    <div class="img">
                        <img width="170" height="353" alt="template" src="<%=ajaxUrl %>/Template/<%=template.Src %>"/></div>
        <div class="name">
            <input type="radio" id="<%=template.ID%>" name="template"><label for="01"><%=template.Name%></label></div>
        </li>
        <%} %>
        <%} %>
        </ul>
    </div>
    </div>
    <div class="h30">
    </div>
    <input type="hidden" id="ajaxUrl" value="<%=ajaxUrl %>" />
    <script src="../../Scripts/SelectTemplate.js" type="text/javascript"></script>
    <!--content end-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
