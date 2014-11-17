<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=dashboard"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="RIGHT">
        <!--big title begin-->

        <div class="bigTitle">
            <div class="bigTitle-name"><i class="icon-dashboard"></i><span class="text">分销商品销售排行</span></div>
            <div class="bigTitle-search">
                <div class="form-search">
                    <div class="bs-docs-example">
                        <input type="text" id="txtQueryVal" class="input-large search-query" placeholder="输入商品名称/商家编码" data-provide="typeahead" data-source="[&quot;AlabamaAlabamaAlab&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]">
                        <button onclick="BtnSearch();" id="btnSearch" class="btn-search"></button>
                    </div>
                </div>
            </div>

        </div>
        <!--big title end-->
        <div class="main">
            <div class="salesRanktable">
            <% Html.RenderAction("GetOrderReportList", new { PageIndex = 1, PageCount = 15, query = "", SortColumn = "销量", Diretion = "Desc" }); %>
                </div>
            <div class="page">
      <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
      <div class="page-select">
        每页显示
        <div class="btn-group dropup" id="pageSizes">
          <button class="btn" id="btnpageSize">15</button>
          <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
          <ul class="dropdown-menu selectpage" >
              <li><a href="javascript:void(0);">15</a></li>
            <li><a href="javascript:void(0);">20</a></li>
            <li><a href="javascript:void(0);">30</a></li>
            <li><a href="javascript:void(0);">40</a></li>
            <li><a href="javascript:void(0);">50</a></li>
          </ul>
        </div>
        条
      </div>
      <div class="pagination pagination-right" id="turn-ul">
              <%--<ul>
                <li class="disabled"><a href="#">|&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">12</a></li>
                <li><a href="#">&gt;</a></li>
                <li><a href="#">&gt;|</a></li>
             </ul>--%>
            </div>
    </div>
        </div>
    </div>
    <script>
        var query = new Object();
        query.Where = "";
        query.SortColumn = "销量";
        query.Direction = "Desc";
        $(function () {
            GetSalesRankView(1, $("#btnpageSize").text());
            $("#pageSizes li").click(function () {
                $("#btnpageSize").text($(this).text());
                GetSalesRankView(1, $("#btnpageSize").text());
            });
            $("#tableSalesRank tr th").live("click",function () {
                var Direction = $(this).find("i").attr("class") == "icon-arrowUp-back" ? "Asc" : "Desc";
                if (Direction != undefined && Direction != "") {
                    SortOpera($(this).text(), Direction);
                    GetSalesRankView(1, $("#btnpageSize").text());
                }
            });
        });

        function BtnSearch() {
            query.Where = $("#txtQueryVal").val();
            GetSalesRankView(1, $("#btnpageSize").text());
            
        }

        //排序，SortName：当前排序列名
        function SortOpera(SortName,Direction)
        {
            var NewSortColumn;
            var NewDirection;
            //判断当前排序名和之前排序名
            //如果当前排序名和之前排序名相同，排序方向与之前的方向相反
            SortName=SortName==""?"销量":SortName;
            if (SortName == query.SortColumn) {
                if (Direction == undefined || Direction == "Asc") {
                    NewDirection = "Desc";
                }
                else {
                    NewDirection = "Asc";
                }
            }
            else {
                NewDirection="Desc"
            }
            NewSortColumn = SortName;
            query.SortColumn = SortName;
            query.Direction = NewDirection;
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

