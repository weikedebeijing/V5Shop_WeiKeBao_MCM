<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Market.Model"%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <P>请选择支持<b>快速下架</b>的店铺</P>
      <%foreach (var item in ViewData["list"] as List<Opened>){%>
        <input type="checkbox" /><%=item.Title%>
        <% } %>
        <br />
         <b>当前仅支持立刻下架</b>
	  <div class="dialog-FormBtn01">
          <button class="submit01" type="button" onclick="javascript:window.location.href=''">下架</button><!--最后一步按钮为"快速发布"-->
	  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
