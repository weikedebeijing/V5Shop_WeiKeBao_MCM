<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        var appCode = $("#channel-current a").attr("appCode");
        function OpenImport() {
            window.location.href = "/ImportGoods/Index";
        }
        function OpenGrounding() {
            window.location.href = "/ImportGoods/Grounding";
        }

        function OpenProduct() {
            window.location.href = "/Product/index?appCode=PLATFORM&MenuCode=C125";
        }
    </script>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                一键导入商品</h1>
        </div>
    </div>
    <div class="inport">
        <div class="step03">
        </div>
        <div class="inport-sucess">
            <i class="icon-sucess"></i><span class="text">导入成功<%=Session["SucceedCount"] %>条！</span>
        </div>
        <div class="operate-btn">
            <a class="goon" href="javascript:void(0);" onclick="javascript:OpenImport()">继续导入</a>
            <a class="view" href="javascript:void(0);" onclick="javascript:OpenProduct()">查看导入商品</a>
        </div>
    </div>
</asp:Content>
