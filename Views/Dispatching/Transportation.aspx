<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var TransportationQuery = new Object();

        TransportationQuery.Groups = new Array(1);
        TransportationQuery.Groups[0] = 'q1';
    </script>
    
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
                <input type="text" id="txtName" placeholder="请输入模板名称..." class="search-input" name="">
              </li>
              <li><a id="btnSelect" class="search-btn" href="#"></a></li>
            </ul>
          </div>
        </div>
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li class="hidden"><a href="javascript:void(0)" linkUrl="AddTransportation" class="a-btn" onclick="GoToLinkUrl(event)" >添加</a></li>
                <li class="hidden"><a href="javascript:void(0)" class="a-btn" onclick="AllDeleteTransportation(event)" id="AllDeleteTransportation">删除</a></li>
            </ul>
        </div>
    </div>
    
     <!--Page Start-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                   <%-- <li class="next"></li>--%>
                    <%-- <li class="prev"></li>--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>
    <!--Page End-->

    <div class="clear h10"></div>
    <div class="mod-table">
        <%Html.RenderAction("TransportationList", new { TransportationPageIndex = 0 }); %>
    </div>
    <script type="text/javascript">

        $(function () {

            Transportation(1);
        });
    </script>
    <script type="text/javascript">



        function Delect(ID, event) {
            if (confirmThis(event, "您确定要删除？")) {
                $.ajax({
                    type: "post",
                    url: "../../Dispatching/DeleteDispatching",
                    data: { id: ID },
                    success: function (data) {
                        if (data == 1) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功！").change();
                            Transportation(1);
                        }

                    }
                });
            }
        }
        $(function () {

            //查询
            $("#btnSelect").click(function () {
                TransportationQuery.Query = $("#txtName").val();

                Transportation(1);

            });

            $("#txtName").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            })

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


            $("#type ul li").click(function () {
                TransportationQuery.Query = "";
                $("#types ul li").removeClass("current");
                TransportationQuery.Groups[0] = "q1";
                Transportation(1);
            });
        });

        //删除全部
        function AllDeleteTransportation(event) {

            var TransportationID = new Array();
            $("input[name='sub']:checked").each(function () {
                TransportationID.push($(this).val());
            });

            if (TransportationID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
                return;

            }
            if (confirmThis(event, "您确定要删除？")) {

                $.ajax({
                    type: "post",
                    url: "../../Dispatching/AllDeleteTransportation",
                    data: { "srt": JSON.stringify(TransportationID) },
                    dataType: "json",
                    success: function (jsonRes) {

                        if (jsonRes == 1) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html(" 删除成功！").change();
                            Transportation(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                            $("#operateTip").html(JSON.stringify(jsonRes)).change();

                        }
                    }

                });

            }
        };        
    </script>
</asp:Content>
