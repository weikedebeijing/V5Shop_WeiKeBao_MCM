<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/publicDialog/materialManagedialogJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var materialQuery = new Object();
        materialQuery.Groups = new Array(3);
        materialQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        materialQuery.Groups[1] = 'q1';
        materialQuery.Groups[2] = 'd0';
    </script>
    <div id="gray-views"  style="display: none">
        <div class="content scroll">
            <div >
                <!--more text begin-->
                <div class="moretext">
                    <div class="moretext-area mauto">
                        <div class="moretext-emulation" id="emulation">
                            <!--emulation01 begin-->
                            <div class="moretext-emulation01 r25">
                                <div class="moretext-emulation01-img">
                                    <img src="../../content/css/css4.0/images/test/active-cover.png">
                                    <span style="none" class="moretext-emulation01-img-text">封面图片</span> <span class="moretext-emulation01-title-text">
                                    </span><a class="moretext-emulation01-title-a" href=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--more text end-->
    </div>
    <div id="single_gray-views"  style="display: none">
        <div class="content scroll">
            <div style="width: 330px; height: 250px;">
                <!--content begin-->
                <!--simple text begin-->
                <div style="display: ;" class="simpletext">
                    <div class="simpletext-area mauto">
                        <div class="simpletext-emulation">
                            <div class="simpletext-emulation-title">
                                <a class="simpletext-emulation-title-a" href=""></a>
                            </div>
                            <div class="simpletext-emulation-img">
                                <img width="326" height="172" src="../../content/css/css4.0/images/test/active-cover.png"><span
                                    style="display: none;" class="simpletext-emulation-img-text">封面图片</span></div>
                        </div>
                    </div>
                </div>
                <!--simple text end-->
            </div>
        </div>
    </div>
    <div class="mod-tab t20">
        <div class="con style0big" id="types">
            <ul>
                <li dir="d0" class="current"><a href="javascript:void(0)">全部（<span id="all"></span>）</a></li>
                <li dir="d1"><a href="javascript:void(0)">文本（<span id="text"></span>）</a></li>
                <li dir="d2"><a href="javascript:void(0)">单图文（<span id="OneImageText"></span>）</a></li>
                <li dir="d3"><a href="javascript:void(0)">多图文（<span id="MoreImageText"></span>）</a></li>
                <input type="hidden" id="Hidden1" />
            </ul>
        </div>
    </div>
   <%-- <div class="mod-condition t20">
        <div class="con style0list" id="types">
            <ul>
                <li dir="d1"><a href="javascript:void(0)">文本（<span id="text"></span>）</a></li>
                <li dir="d2"><a href="javascript:void(0)">单图文（<span id="OneImageText"></span>）</a></li>
                <li dir="d3"><a href="javascript:void(0)">多图文（<span id="MoreImageText"></span>）</a></li>
     
            </ul>
        </div>
    </div>--%>
               <input type="hidden" id="hidTagId" />
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0)" id="AddMaterial" class="a-btn">添加</a></li>
                <li><a href="javascript:void(0)" id="DelectMaterial" onclick="AllDelectMaterial(event)"
                    class="a-btn">删除</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%--  <li class="next"></li>
                <li class="prev"></li>--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <div class="mod-table">
        <% 
            Html.RenderAction("GetMaterialManage", new { materialManageIndex = 0 });
        %>
    </div>
    <script type="text/javascript">

        var materialManageModel = '<%= ViewData["materialManage"] %>';
        //        $("#DelectMaterial").click(function () {
        //            dialog("Add");
        //        });


        $("#AddMaterial").click(function () {
            dialog("Add", "0", "refresh");
        });

        function Opan(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var id = $(eventSrc).attr("dir");
            dialog("Update", id, "refresh");
        }


        $(function () {
            GetmaterialManage(1);

            $("#type ul li").click(function () {
                $("#types ul li").removeClass("current");
                materialQuery.Groups[1] = "q1";
                materialQuery.Groups[2] = "";
                GetmaterialManage(1);
            });

            $("#types ul li").click(function () {

                $("#types ul li").removeClass("current");
                $(this).addClass("current");
                materialQuery.Groups[1] = "q1";
                materialQuery.Groups[2] = $(this).attr("dir");
                GetmaterialManage(1);
            });


        });
        function GetSuperset(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var id = $(eventSrc).attr("dir");

            if ($(eventSrc).attr("class") == "icon-hide t5 l10") {
                $(eventSrc).attr("class", "icon-show t5 l10");
                $("[name = 'trPart" + id + "']").show();



            }
            else {
                $(eventSrc).attr("class", "icon-hide t5 l10");
                $("[name = 'trPart" + id + "']").hide();
            }

            //alert($(eventSrc).parent().attr("href"));
        }


        function AllDelectMaterial(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var materialID = new Array();
            $("input[name='sub']:checked").each(function () {
                materialID.push($(this).val());
            });

            if (materialID.length == 0) {
                $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            if (confirmThis(event, "您确认删除这条数据?")) {
                $.ajax({
                    type: "post",
                    url: "../../WeiXinManage/AllDelectMaterial",
                    data: { "srt": JSON.stringify(materialID) },

                    success: function (jsonRes) {

                        if (jsonRes == "OK") {

                            GetmaterialManage(1);

                            $(".Loading").removeClass("style03 style02").addClass("style01");
                            $("#operateTip").html("删除成功！").change();

                        } else if (jsonRes == "ON") {
                            $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
                            $("#operateTip").html("删除失败！").change();
                        } else if (jsonRes == "contains") {
                            $(".Loading").removeClass("style01 style03").addClass("style02"); //黄色
                            $("#operateTip").html("其它地方在使用不能删除该信息！").change();

                        } else {
                            $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
                            $("#operateTip").html(JSON.stringify(jsonRes)).change();


                        }
                    }

                });
            }

           


        }

        function Delete(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var id = $(eventSrc).attr("dir");

            if (confirmThis(event, "您确认删除这条数据?")) {
                //你将要执行的代码

                $.ajax({
                    url: "/WeiXinManage/DelectMaterial",
                    data: { "id": id }, // 会自动转换成 字符串数组
                    type: "post",
                    success: function (succData) {
                        if (succData == "OK") {

                            $(".Loading").removeClass("style03 style02").addClass("style01");
                            $("#operateTip").html("删除成功").change();
                            GetmaterialManage(1);
                        }
                        else if (succData == "ON") {
                            $(".Loading").removeClass("style01 style02").addClass("style03");
                            $("#operateTip").html("删除失败").change();

                        }
                        else if (succData == "contains") {
                            $(".Loading").removeClass("style01 style03").addClass("style02");
                            $("#operateTip").html("其它地方在使用不能删除该信息！").change();
                        }
                    },
                    error: function (errData) {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                });


            };
        }







        //          function views() {
        //                $("#moreViews").css("display", "block");
        //                $("#simpletext").css("display", "none");
        //                //simpletext
        //            });


        function views(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var id = $(eventSrc).attr("dir");
            ViewAjax(id);


            //            $("#moreViews").css("display", "block");
            //            $("#simpletext").css("display", "none");


        };





        function ViewAjax(id) {

            $.ajax({
                type: "post",
                url: "../../WeiXinManage/GetViews",
                data: { "id": id },
                dataType: "json",
                success: function (data) {

                    $("#emulation>div:not(:eq(0))").remove();

                    if (data != null && data.length > 0) {
                      
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].MessageType == 3) {
                             
                                popupOperate("gray-views", "查看素材", "gray-views");
                                if (data[i].SonId == 0) {
                                 
                                    $(".moretext-emulation01-img .moretext-emulation01-title-text").text(data[i].Title);
                                    $(".moretext-emulation01-img img").attr("src", "../../" + data[i].CoverUrl);
                                }
                                else {
                                    var str = "";
                                  
                                    str = '<div class="moretext-emulation02">';
                                    str += '<div class="moretext-emulation02-box">';
                                    str += '<div class="moretext-emulation02-img">';
                                    str += '<img width="78" height="78" src="../../' + data[i].CoverUrl + '"></div>';
                                    str += '<div class="moretext-emulation02-text">' + data[i].Title + '</div></div> </div>';
                                    $("#emulation").append(str);

                                }

                            }
                            else if (data[i].MessageType == 2) {
                                popupOperate("single_gray-views", "查看素材", "single_gray-views");
                                $(".simpletext-emulation-title-a").text(data[i].Title);
                                $(".simpletext-emulation-img img").attr("src", "../../" + data[i].CoverUrl);
                            }
                            else if (data[i].MessageType == 1) {



                            }

                        }


                    }

                }
            });

        }


    </script>
</asp:Content>
