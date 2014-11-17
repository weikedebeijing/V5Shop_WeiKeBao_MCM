<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript">
        $(function () {
            var winParent = window.opener;
            
            if (winParent == null) { winParent = window.parent; }
            
            if (winParent != null) {
                winParent.location.reload();
            }

            if (document.all) {//IE
                window.open('', '_self');
                window.close();
            }
            else {//FireFox
                window.open('', '_parent', '');
                window.close();
            }
        });
    </script>
</asp:Content>
