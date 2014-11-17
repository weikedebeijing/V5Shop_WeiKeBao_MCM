<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
        <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = '';
        searchQuery.Query = '';
    </script>
    <!--tab begin-->
    <div class="mod-tab t20"  >
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a href="#" class="c16"><span>全部（<%:ViewData["totalCount"]%>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" name="" id="txtSearch" class="search-input" placeholder="请输入模版名称..." />
                </li>
                <li><a class="search-btn search" href="#" onclick="javascript:txtSearch();"></a>
                </li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li class="hidden"><a class="a-btn" href="javascript:void(0)" linkUrl="/Logistics/SetPrintTemplate"  onclick="GoToLinkUrl(event)"> 
                    添加</a> </li>
                <li class="hidden"><a class="a-btn" href="#" onclick="javascript:DeleteBatch(event);">
                    刪除</a> </li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->


    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul" id="dvPage">
                 
                </ul>
            </div>
            <div class="number">
                <div class="r10">
                    当前<span id="numberStart"></span>~<span id="numberEnd"></span>条，总计<span id="pageTotalCount"></span>条</div>
            </div>
        </div>
    </div>
    <%--Page End--%>
    <div class="clear h10">
    </div>
    <!--List Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <%Html.RenderAction("GetPrintTemplateView", new { CurrentPageIndex = 0 }); %>
            <%--局部试图 End--%>
        </div>
    </div>
    <!--List End-->
    <%--弹层 Start--%>
    <div id="printTemplatePopup" style="display: none;">
        <div class="content scroll" style="height: 400px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <!---name begin--->
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="templet" style="position: relative;">
                                <!--img begin-->
                                <div class="file01 w800">
                                    <img id="TemplatePic" src="" alt="请上传图片" />
                                </div>
                                <!--img end-->
                                <!--label01 begin-->
                                <div class="templet-label">
                                    <!--col01 begin-->
                                    <div class="col01">
                                        <!--01 begin-->
                                        <div class="field" id="tip1" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip2" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip3" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip4" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip5" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip6" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip7" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip8" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip9" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip10" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip11" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip12" style="position: absolute;">
                                        </div>
                                        <div class="field" id="tip13" style="position: absolute; top: 360px; left: 0px;">
                                        </div>
                                    </div>
                                </div>
                                <!--label01 End-->
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--弹层 End--%>
    <script type="text/javascript" language="javascript">
        $(function () {
            GetPrintTemplateView(1);

            // 注册文本框的事件
            txtTips();
        });

        // 查看详情弹层
        var printTemplateDetail = function (templateID) {

            $.getJSON("/Logistics/GetTemPalteElement", "templateID=" + templateID + "", function (returnData) {
                var ImageUrl = returnData.ImageUrl;
                var Length = returnData.Length;
                var Width = returnData.Width;
                // tips 坐标的集合
                var templateElements = returnData.templateElements;
                // 循环把每一个tip的坐标放上去
                var elementID = 0;
                for (var i = 0; i < templateElements.length; i++) {
                    // 取到 elementID
                    elementID = templateElements[i].ElementID;
                    // 取到tip
                    var tip = "#tip" + elementID;
                    $(tip).css('top', templateElements[i].OffSetY + "px");
                    $(tip).css('left', templateElements[i].OffSetX + "px");

                };

                // 存储tip Name的
                var elements = returnData.elements;
                for (var i = 0; i < elements.length; i++) {

                    var id = elements[i].ID;
                    var name = elements[i].ElementName;
                    var tip = "#tip" + id;
                    $(tip).text(name);
                }
                //alert(ImageUrl);
                // 把数据组装到页面上
                $("#TemplatePic").attr("src", ImageUrl);
                $("#TemplatePic").css("height", Width);
                $("#TemplatePic").css("width", Length);

                $("#content").css("height", Width + 2);
                $("#content").css("width", Length + 2);
            });
            popupOperate("printTemplatePopup", "查看", 'printTemplate');
        };

        // 输入文本框
        function txtTips() {
//            $("#txtSearch").focus(function () {
//                if ($(this).val() == "请输入模版名称...") {
//                    $(this).val('');
//                    $(this).val('').css("color", "#6b6969");
//                }
//            });
            $("#txtSearch").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            })
        };

        // enter 键模糊查询 bug 2013-11-16 14:10:06
        document.onkeypress = function () {
            var iKeyCode = -1;
            if (arguments[0]) {
                iKeyCode = arguments[0].which;
            }
            else {
                iKeyCode = event.keyCode;
            }

            if (iKeyCode == 13) {
                if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入模版名称..." || $("#txtSearch").val().trim() == '') {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入模版名称").change();
                    return false;
                }
                else {
                    searchQuery.Query = $("#txtSearch").val().trim();
                    GetPrintTemplateView(1);
                }
            }
        }

        // 查询
        function txtSearch() {
            if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入模版名称..." || $("#txtSearch").val().trim() == '') {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入模版名称").change();
                return false;
            }
            else {
                searchQuery.Query = $("#txtSearch").val().trim();
                GetPrintTemplateView(1);
            }
        };

        // 批量删除快递单模板
        function DeleteBatch(event) {

            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");

                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);

                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "/Logistics/DeletePrintTemplates",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                GetPrintTemplateView(1);
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();

                            } else if (succData == "del ok but have default sysTemplate") {
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功 但系统模版不能删除").change();
                                window.location.href = "/Logistics/PrintTemplateList?MenuCode=C415";
                            } else if (succData == "sysTemplate can not del") {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("系统模版不能删除").change();
                            } else {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("请选中要删除的项").change();
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除出现异常，联系管理员").change();
                        }
                    });
                } else {
                    return false;
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要删除的项").change();
                return false;
            }
        };

        // 删除快递单模板
        function DeletePrintTemplate(event, templateID) {
            if (confirmThis(event, '确定要删除？')) {
                $.post("/Logistics/DeletePrintTemplate", "id=" + templateID + "", function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功").change();
                        GetPrintTemplateView(1);
                    } else if (returnData == "can not delete sysTemplate") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("系统模板不能删除").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除失败，联系管理员").change();
                    }

                });
            }
        };

        // 点击全部的时候
        $("#type ul li").click(function () {
            searchQuery.Groups = 'A';
            searchQuery.Query = '';
            GetPrintTemplateView(1);
        });
    </script>
</asp:Content>
