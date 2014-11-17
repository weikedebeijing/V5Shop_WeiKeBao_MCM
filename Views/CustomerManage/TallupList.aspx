<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script src="../../Scripts/bootstrap/BootstrapAllselect.js"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">
        var TallupListQuery = new Object();
        TallupListQuery.Groups = new Array(1);
        TallupListQuery.Groups[0] = "q1";

        var btnPageSize = 15;

    </script>
    <div class="row funbar">
        <div class="span6 funbar-l"></div>
        <div class="span3 funbar-r">
            <form class="form-search">
                <div class="bs-docs-example">
                    <input type="text" id="Name" data-provide="typeahead" placeholder="请输入订单号/收益人帐号" class="input-large search-query" />
                    <input type="text" style="display:none" />
                    <button class="btn-search" id="btnSelect" type="button"></button>
                </div>
            </form>
        </div>
    </div>




    <div class="main">
        <!--table begin-->
        <div id="Table">


            <% 
                Html.RenderAction("GetTallupList", new { CurrentPageIndex = 1, PageSize = 15, searchName = "" });
   
                 
            %>
        </div>
        <!--table end-->
        <!--page begin-->
        <div class="page">
            <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
            <div class="page-select">
                每页显示
       
                <div class="btn-group dropup">
                    <button class="btn" id="btnPageSize">15</button>
                    <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                    <ul class="dropdown-menu selectpage" id="numbers">
                        <li><a href="javascript:void(0)">15</a></li>
                        <li><a href="javascript:void(0)">20</a></li>
                        <li><a href="javascript:void(0)">30</a></li>
                        <li><a href="javascript:void(0)">40</a></li>
                        <li><a href="javascript:void(0)">50</a></li>
                    </ul>
                </div>
                条
     
            </div>
            <div class="pagination pagination-right" id="turn-ul">
                <%--            <ul>
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
        <!--page end-->
    </div>

    <script type="text/javascript">

        function FillName() {
            $.ajax({
                type: "post",
                url: "../../CustomerManage/GetOrderNumberAndCustomerAccount",
                success: function (jsonRes) {
                    $("#Name").attr("data-source", jsonRes);
                }
            })
        }

        $(function () {

            GetTallupList(1);

            FillName();

            $("#btnSelect").click(function () {
                TallupListQuery.Query = $("#Name").val();
                GetTallupList(1, btnPageSize);
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


            $("#numbers li").click(function () {
                $("#btnPageSize").text($(this).text());

                btnPageSize = parseInt($("#btnPageSize").text());
             
                GetTallupList(1, btnPageSize);
            });


        });


        //获取tr行
        function SelectedEvents(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;


            if ($(eventSrc).parent().parent().parent("tr").attr("class") == undefined || $(eventSrc).parent().parent().parent("tr").attr("class") == "") {

                $(eventSrc).parent().parent().parent("tr").attr("class", "tr-show");
                if ($(eventSrc).parent().parent().parent("tr").attr("dir") == $(eventSrc).parent().parent().parent("tr").next("tr").attr("dir")) {
                    $(eventSrc).parent().parent().parent("tr").next("tr").show();

                }
                else { $(eventSrc).parent().parent().parent("tr").next("tr").hide(); }
            }
            else {
                $(eventSrc).parent().parent().parent("tr").removeClass("tr-show");
                if ($(eventSrc).parent().parent().parent("tr").attr("dir") == $(eventSrc).parent().parent().parent("tr").next("tr").attr("dir")) {
                    $(eventSrc).parent().parent().parent("tr").next("tr").hide();

                }
            }
        }

        function GetMouseover(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var src = $(eventSrc).attr("src");
            var tooltip = "<div id='tooltip'><img src='" + src + "' alt='产品预览图'/> </div>"; //创建 div 元素
            $(".pic50").append(tooltip);
        }

    </script>






    <%--</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul>
                <li><a href="img/QQ截图20140304131329.png" title="HTML教材" class="tooltip">
                    <img alt="图片" width="100" height="75" src="img/QQ截图20140304131329.png" /></a></li>

            </ul>
        </div>
    </form>
</body>
</html>--%>
</asp:Content>


