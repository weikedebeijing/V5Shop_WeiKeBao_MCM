<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script type="text/javascript">
        var WithdrawalQuery = new Object();
        WithdrawalQuery.Groups = new Array(1);
        WithdrawalQuery.Groups[0] = "q1";

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a class="c16" href="javascript:void(0)"><span>全部（<span id="all"></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>


    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" id="Name" placeholder="请输入联系人名称..." class="search-input"
                        name="">
                </li>
                <li><a class="search-btn" id="btnSelect" href="javascript:void(0)"></a></li>
            </ul>
        </div>
    </div>


    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" id="AllUpdate" onclick="Update(event,'more')" href="javascript:void(0)">批量转账</a></li>
            </ul>
        </div>
    </div>



    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%-- <li class="next"></li>--%>
                    <%-- <li class="prev"></li>--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>

    <div class="clear h10"></div>

    <div class="mod-table">


        <% 
            Html.RenderAction("GetWithdrawalList", new { CurrentPageIndex = 0, PageSize = 15, searchName="" });
   
                 
        %>
    </div>






    <script type="text/javascript">

        $(function () {

            GetWithdrawalList(1);
            $("#btnSelect").click(function () {
                WithdrawalQuery.Query = $("#Name").val();
                GetWithdrawalList(1);
            });

            $("#type ul li").click(function () {
                WithdrawalQuery.Query = "";
                $("#types ul li").removeClass("current");
                WithdrawalQuery.Groups[0] = "q1";
                GetWithdrawalList(1);
            });

            // enter 键搜索
            document.onkeypress = function () {

                var iKeyCode = -1;
                if (arguments[0]) {
                    iKeyCode = arguments[0].which;
                }
                else {
                    iKeyCode = event.keyCode;
                }
                if (iKeyCode == 13) {
                    // 搜索
                    $("#btnSelect").click();

                }
            }

        });

        var WithdrawalList = new Array();

        function Update(event, singleOrMore) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            // 获取选中的数据
            if (singleOrMore === "single") {
                var id = $(eventSrc).attr("dir");
                WithdrawalList.push(id);
            }
            else if (singleOrMore === "more") {
                $("input[name='sub']:checked").each(function () {
                    WithdrawalList.push($(this).val());
                });
                if (WithdrawalList.length == 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                    $("#operateTip").html("请先勾选再进行批量操作！").change();
                    return;
                };
            }


            $.ajax({
                type: "post",
                url: "../../CustomerManage/CreateCashFlows",
                data: { "Srt": JSON.stringify(WithdrawalList) },
                success: function (jsonRes) {
                    if (jsonRes == "OK") {
                        $("#DivUpdatalogistics").hide();
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("操作成功！").change();
                        popupClose('gray-add-prize');
                        GetCommissionRatoView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                        $("#operateTip").html(JSON.stringify(jsonRes)).change();
                        popupClose('gray-add-prize');
                        GetCommissionRatoView(1);


                    }
                }
            });


            // popupOperate("gray-add-prize", "修改佣金比率", "gray-add-prize");

        }
    </script>


</asp:Content>


