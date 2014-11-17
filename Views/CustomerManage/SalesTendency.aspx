<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=dashboard"></script>
     <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="RIGHT salesSummary">
        <!--big title begin-->
        <div class="bigTitle">
            <div class="bigTitle-name"><i class="icon-dashboard"></i><span class="text">分销商销售排行</span></div>
            <!--form begin-->
            <div class="bar-search">
                <script>
                </script>
                <div class="form-inline">
                    <select class="input-small" id="selectmd">
                        <option value="按月份">按月份</option>
                        <option value="按日期">按日期</option>
                    </select>
                    <!--select month begin-->
                    <input type="month" class="input-medium" id="selectmonth" />
                    <!--select month end-->
                    <!--select date-->
                    <span id="selectday" style="display: none">
                        <input type="date" id="selectday1" class="input-medium" />
                        ~
                        <input id="selectday2" type="date" class="input-medium" /></span>
                    <!--select date-->
                    <button id="btnOk" onclick="btnOk();" type="button" class="btn">确定</button>
                </div>
            </div>
            <!--form end-->
        </div>
        <!--big title end-->
        <div class="main">

            <!--small title-->
            <div class="smallTitle row" style="display: none;">
                <div class="fl"><i class="icon-box"></i><span class="text">分销商销售指标</span></div>
                <div class="fr pagination pagination-right" style="display: none;">
                    <ul>
                        <li class="disabled"><a href="#">上一页</a></li>
                        <li><a href="#">下一页</a></li>
                    </ul>
                </div>
            </div>
            <!--small title-->
            <div class="salesRanktable">
                <% Html.RenderAction("ShowDistriSaleList", new { PageIndex = 1, PageCount = 15, Search = "", SortName = "销量", Direction = "Desc" }); %>
            </div>
            <!--page begin-->
            <div class="page">

                <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
                <div class="page-select">
                    每页显示
        <div class="btn-group dropup" id="selectPageSize">
            <button class="btn" id="ddlPageCount">15</button>
            <button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
            <ul class="dropdown-menu selectpage">
                <li><a href="javascript:void(0);" >15</a></li>
                <li><a href="javascript:void(0);" >20</a></li>
                <li><a href="javascript:void(0);" >30</a></li>
                <li><a href="javascript:void(0);" >40</a></li>
                <li><a href="javascript:void(0);" >50</a></li>
            </ul>
        </div>
                    条
                </div>

                <div class="pagination pagination-right" id="turn-ul">
                    <%--  <ul>
            <li class="disabled"><a href="javascript:void(0);" onclick="JumpNewPage('','Home');">|&lt;</a></li>
            <li class="disabled"><a href="javascript:void(0);" onclick="JumpNewPage(i,'Last');">&lt;</a></li>
           
            <li class="active"><a href="javascript:void(0);" onclick="JumpNewPage(i,'');"><%=i %></a></li>
            <li><a href="javascript:void(0);" onclick="JumpNewPage('','Next');">&gt;</a></li>
            <li><a href="javascript:void(0);" onclick="JumpNewPage('','End');">&gt;|</a></li>
        </ul>--%>
                </div>
            </div>
            <!--page end-->
        </div>
        <div class="mt30"></div>
    </div>
    <!--right end-->
    <script>
        var query = new Object();
        query.Where = "";
        query.SortColumn = "销量";
        query.Direction = "Desc";
       
        //document.onkeydown = function () {
        //    if (event.keyCode == 13) {
        //        $("#btnOk").click();
        //    }
        //};

        $(function () {
            $("#selectmd").change(function () {
                if ($("#selectmd").val() == "按月份") {
                    $("#selectmonth").show();
                    $("#selectday").hide();
                } else {
                    $("#selectmonth").hide();
                    $("#selectday").show();
                }
            });
            GetSalesTendencyView(1, $("#ddlPageCount").text());
            $("#selectPageSize li").click(function () {
                $("#ddlPageCount").text($(this).text());
                GetSalesTendencyView(1, $("#ddlPageCount").text());
            });

            $("#tableDistrbution tr th a").live("click", function () {
                var Direction = $(this).find("i").attr("class") == "icon-arrowUp-back" ? "Asc" : "Desc";
                SortOpera($(this).text(), Direction);
                GetSalesTendencyView(1, $("#ddlPageCount").text());
            });
        });

        function btnOk() {
            var selectmd = $("#selectmd").val();
            if (selectmd == "按月份") {
                query.Where = $("#selectmonth").val();
            }
            else {
                query.Where = $("#selectday1").val() + "$" + $("#selectday2").val();
            }
            GetSalesTendencyView(1, $("#ddlPageCount").text());
        }

        //根据点击的列名进行排序
        //key = S, 销售额排序，key = N, 销量排序，key = O, 订单数排序，key = P, 客单价排序，key = U, 成交用户数排序
        function SortOpera(ColumnName, Direction) {
            var SortDirection;
            //如果排序的列名和当前排序的列名一致，则判断排序方向
            if (query.SortColumn == ColumnName) {
                SortDirection = Direction == undefined || Direction == "Asc" ? "Desc" : "Asc";
            }
            else {
                SortDirection = "Desc";
            }

            query.SortColumn = ColumnName;
            query.Direction = SortDirection;
           
        }
        function ChangeSeqenceClass(SortName, SortDirection) {
            $(".sequence").each(function () {
                //还原原有样式
                $(this).find("a").find("i").removeClass("icon-arrowDown-back");
                $(this).find("a").find("i").addClass("icon-arrowUp-back");
                if (SortName == "" && SortDirection == "") {
                    SortName = "销量";
                    SortDirection = "Desc";
                }
                if ($(this).text() == SortName) {
                    if (SortDirection == "Desc") {
                        $(this).find("i").removeClass("icon-arrowUp-back");
                        $(this).find("i").addClass("icon-arrowDown-back");
                    }
                }
            });
        }


    </script>
</asp:Content>
