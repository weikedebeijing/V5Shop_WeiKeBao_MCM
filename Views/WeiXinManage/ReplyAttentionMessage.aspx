<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <style type="text/css">
        #tab
        {
            margin-top: 15px;
        }
        
        #tab_header ul
        {
            height: 27px;
            width: 170px;
        }
        
        #tab_header ul li
        {
            height: 25px;
            width: 50px;
            float: left;
            line-height: 25px;
            text-align: center;
            font-size: 14px;
            border: 1px solid #0096ff;
        }
        
        #tab_header ul li:hover
        {
            cursor: pointer;
            background: #0096ff;
            color: White;
        }
        
        .tabHeaderSelected
        {
            background: #0096ff;
            color: White;
        }
        
        .tabHeaderNormal
        {
            background: #eee;
        }
        
        #tab_content{width:710px;height:460px;}
        
        .tabContent
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M">
            <%--添加成功后把结果放到<span>标签中--%>
            <div>
                <div class="Loading" style="display: none;">
                    <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                </div>
            </div>
            <div>
                <div id="tab">
                    <div id="tab_header">
                        <ul>
                            <li dir="Text" class="tabHeaderNormal">文本</li>
                            <li dir="Image" class="tabHeaderNormal">图片</li>
                            <li dir="Voice" class="tabHeaderSelected">语音</li>
                        </ul>
                    </div>
                    <div class="separationLine">
                    </div>
                    <div id="tab_content">
                        <%--文本信息开始-----------------------------------%>
                        <div class="tabContent" id="content_Text">
                            <textarea style="width:700px;height:450px;" id="ReplyText" cols="20" rows="2"><%:ViewData["ReplyText"] %></textarea>
                        </div>
                        <%--文本信息结束-----------------------------------%>
                        <%--图片信息开始-----------------------------------%>
                        <div class="tabContent" id="content_Image">
                            图片
                        </div>
                        <%--图片信息结束-----------------------------------%>
                        <%--声音信息开始-----------------------------------%>
                        <div class="tabContent" id="content_Voice">
                            声音
                        </div>
                        <%--声音信息结束-----------------------------------%>
                    </div>
                </div>
                <div>
                    <input type="button" value="确定" class="saveBtn t10" onclick="javascript:btnSave();" />
                    <input type="button" value="取消" class="cancelBtn l10 t10" />
                </div>
                <div>
                    <input type="hidden" id="returnReplyContentType" value="<%:ViewData["ReplyContentType"] %>" />
                    <input type="hidden" id="returnReplyText" value="<%:ViewData["ReplyText"] %>" />  
                </div>
            </div>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 全局变量
        var selectedTab = ""; // tab的选中状态


        // 初始化
        $(function () {
            // 获取选中的信息
            selectedTab = $("#returnReplyContentType").val();

            // 默认把回复的类型tab选中
            tabSelected(selectedTab);
        });


        // 保存
        function btnSave() {
            // 只要保存当前选中的项及内容即可
            switch (selectedTab)
            {
                case "Text":
                    {
                        var replyText = $("#ReplyText").val();
                        $.ajax({
                            url: "/WeiXinManage/ReplyAttentionMessage",
                            data: { "flag": "Text", "replyText": replyText },
                            type: "post",
                            success: function (returnData) {
                                if ("ok" == returnData) {
                                    $(".Loading").removeClass("style03 style02").addClass("style01");
                                    $("#operateTip").html("保存成功").change();
                                };
                            },
                            
                        });
                    } break;
                case "Image":
                    {
                    } break;
                case "Voice":
                    {
                    } break;
            }
        };


        // 点击 tab 时
        $("#tab ul li").click(function () {
//            event = event ? event : window.event;
//            var eventSrc = event.srcElement ? event.srcElement : event.target;

//            $("#tab ul li").removeClass("tabHeaderSelected");
//            $("#tab ul li").addClass("tabHeaderNormal");

//            $(eventSrc).removeClass("tabHeaderNormal");
//            $(eventSrc).addClass("tabHeaderSelected");

//            var selected = $(eventSrc).attr("dir");

            $("#tab ul li").removeClass("tabHeaderSelected");
            $("#tab ul li").addClass("tabHeaderNormal");

            $(this).removeClass("tabHeaderNormal");
            $(this).addClass("tabHeaderSelected");

            var selected = $(this).attr("dir");

            // 选中状态赋值
            selectedTab = selected;

            // 切换内容选中
            $("#tab_content [class=tabContent]").css("display", "none"); // 先所有的隐藏

            $("#tab_content #content_" + selected).css("display", "block"); // 把对应tab的content选中
        });

        // 默认把回复的类型tab选中 并把对应的切换内容选中
        function tabSelected(selectedTab) {
            var liDir = "";
            var tabLi = $("#tab ul li").each(function () {
                liDir = $(this).attr("dir");
                if (liDir == selectedTab) {
                    $("#tab ul li").removeClass("tabHeaderSelected");
                    $("#tab ul li").addClass("tabHeaderNormal");

                    $(this).removeClass("tabHeaderNormal");
                    $(this).addClass("tabHeaderSelected");

                    // 切换内容选中
                    $("#content_" + liDir).css("display", "block");
                };
            });
        };
    </script>
</asp:Content>
