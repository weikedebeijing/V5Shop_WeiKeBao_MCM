<%@ Import Namespace="V5.MetaData.Category.Model" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IList<Category>>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <li>类目编号----类目名称</li>
        <% foreach(var category in Model) { %>
        <li><%= category.ID %>----<%= category.Name %>  </li>
        <% } %>
    </ul>
</asp:Content>
