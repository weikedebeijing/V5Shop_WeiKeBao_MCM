<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function query() {
            $.ajax({
                url: "../../ImportGoods/StartExecuteImport",
                dataType: 'json',
                cache: false,
                success: function (result) {
                    if (result.IsRuning != true) {
                        if (result.FailCount > 0) {
                            window.location.href = '/ImportGoods/ImportFail?appCode=PLATFORM&MenuCode=C110';
                        } else {
                            window.location.href = '/ImportGoods/ImportSucceed?appCode=PLATFORM&MenuCode=C110';
                        }
                    } else {
                        if (result.SuccessCount > 0) {
                            $("#spImportedCount").text(result.SuccessCount);
                            $("#spTotalCount").text(result.TotalCount);
                        }
                        if (result.FailCount > 0) {
                            $("#progressBar").parent().parent().removeClass("style0green").addClass("style0red");
                        }

                        $("#progressBar").css("width", (result.SuccessCount / result.TotalCount) * 100 + "%");
                    }
                }
            });
        }

        $(function () {
            query();
        });

        setInterval("query()", 500);

    </script>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                一键导入商品</h1>
        </div>
    </div>
    <div class="inport">
        <div class="step02">
        </div>
        <div class="mod-stripe t30 w530">
            <div class="con style0green">
                <div class="outdiv">
                    <div id="progressBar" class="indiv" style="width: 0%;">
                    </div>
                </div>
                <div class="number">
                    <span id="spImportedCount" class="c06">0</span> /<span id="spTotalCount">0</span>条
                </div>
                <div class="clear">
                </div>
                <div class="status">
                    正在导入请稍候...</div>
            </div>
        </div>
    </div>
</asp:Content>
