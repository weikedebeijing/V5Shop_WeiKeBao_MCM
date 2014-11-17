<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Function/weiXinFunctionListJs.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 查询条件 begin -->
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var functionQuery = new Object();
        functionQuery.Groups = new Array(1);
        //activityQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        functionQuery.Groups[0] = 'q1';




    </script>
    <%--<div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current" dir="q1"><a href="#"><span>全部（<span id="all"></span>）</span> </a></li>
            </ul>
        </div>
    </div>--%>
    <%--<div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input id="txtName" type="text" placeholder="请输入功能名称..." class="search-input">
                </li>
                <li><a class="search-btn" id="selectID" href="#"></a></li>
            </ul>
        </div>
    </div>
    <!--operate begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0);" class="a-btn" id="btnEnabled">启用</a></li>
                <li><a href="javascript:void(0);" class="a-btn" id="btnDisabled">禁用</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>--%>
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" id="btnEnabled" class="btn btn-small fun-a"><i class="icon-open-gray"></i>启用</a>
            <a href="javascript:void(0)" id="btnDisabled" class="btn btn-small fun-a"><i class="icon-close-gray"></i>禁用</a>
        </div>
        <div class="span3 funbar-r">
            <div class="form-search">
                <div class="bs-docs-example">
                    <input type="text" data-provide="typeahead" id="txtName" placeholder="请输入功能名称..." class="input-large search-query">
                    <button class="btn-search" id="selectID" type="submit"></button>
                </div>
            </div>
        </div>
    </div>
    <!--operate end-->
    <!--table begin-->
    <div class="main">
        <div class="mod-table" id="sourceList">
            <% Html.RenderAction("WeiXinFunctionTable", new { functionIdex = 1 }); %>
        </div>
        <div class="page">
            <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
            <div class="page-select">
                每页显示
       
                    <div class="btn-group dropup">
                        <button class="btn" id="ddlPageSize">15</button>
                        <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                        <ul class="dropdown-menu selectpage" id="numbers">
                            <li><a href="#">20</a></li>
                            <li><a href="#">30</a></li>
                            <li><a href="#">40</a></li>
                            <li><a href="#">50</a></li>
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
    <!--table end-->
    <script type="text/jscript">

        $(function () {
            GetFunction(1, $("#ddlPageSize").text());

            $("#type ul li").click(function () {
                functionQuery.Query = "";
                functionQuery.Groups[0] = "q1";
                GetFunction(1, $("#ddlPageSize").text());
            });

            $("#selectID").click(function () {


                functionQuery.Query = $("#txtName").val();

                GetFunction(1, $("#ddlPageSize").text());
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
                    $("#selectID").click();

                }
            }

            $("#numbers li").click(function () {
                $("#ddlPageSize").text($(this).text());
                var pageSize = $("#ddlPageSize").text();
                GetUserView(1, pageSize);
            });

        });




    </script>
</asp:Content>
