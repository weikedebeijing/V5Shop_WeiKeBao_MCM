<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mod-tab t20 b10">
        <div class="con style0big">
            <ul>
                <li class="current"><a href="javascript:void(0)">全部（<span id="quanbu"></span>）</a></li>
            </ul>
        </div>
    </div>
    <div class="share-list-crumb" id="ul">
      </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条，总计<span id="sum"></span>条</div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <div class="mod-table" id="flexigridDiv">
        <%       
            Html.RenderAction("GetProductShare", new { CurrentPageIndex = 0, Where = "" });//首次加载，实际上不需要出现数据，数据有ajax请求呈现，这里将currentIndex置为0
        %>
    </div>
    <script type="text/javascript" language="javascript">
        $(function () {
            SelectByGroupClick(1);

        });
          
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
