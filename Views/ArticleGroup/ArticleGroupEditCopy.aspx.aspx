<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <style type="text/css">
        .validateMessage
        {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M">
            <div class="mod-title" style="margin-bottom: 0px; margin-top: 18px;">

            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div id="baseInfoContainer" style="margin-top: 10px;">
                        <div style="width: 400px; height: 30px; line-height: 30px; float: left;">
                            <div style="width: 130px; float: left; text-align: left;">
                                招募书标题<span style="color: Red;">*</span>
                            </div>
                            <input id="txtTitle" class="w230" type="text" name="txtTitle" value="<%:ViewData["title"] %>" />
                            &nbsp;&nbsp;<span class="validateMessage" id="txtTitleMessage">招募书标题不能为空</span>
                        </div>
                    </div>
                </div>
                <div id="extendInfoContainer" style="margin-top: 10px; margin-bottom: 10px; clear: both;
                    height: auto;">
                    <div style="clear: both;">
                        <span class="spMessage"></span>
                    </div>
                    <div id="dvProductDestribution" style="clear: both;">
                        <div style="clear: both; width: auto; float: left; margin-top: 10px;">
                            <div style="width: 130px; float: left; text-align: left;">
                                招募书内容<span style="color: Red;">*</span></div>
                            <div style="float: left;">
                                <textarea id="ArticleContent" name="ArticleContent" style="width: 750px; height: 560px;"><%:ViewData["content"]%></textarea><span
                                    class="spMessage"></span></div>
                        </div>
                    </div>
                </div>
                <!--6 start-->
                <div style="clear: both; width: 1000px; height: 20px;">
                </div>
                <div id="dvButtonContainer" style="margin-top: 20px;">
                    <div id="dvButtonBase">
                        <dl>
                            <dt class=""></dt>
                            <dd class="l105">
                                <button class="submit01 t10 l25" onclick="javascript:btnSave()" id="btnSave">
                                    保存</button>
                            </dd>
                        </dl>
                    </div>
                </div>
                <input type="hidden" value="<%:ViewData["articleID"] %>" id="articleID" />
                <!--button end-->
            </div>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var editor = "";
        $(function () {
            // 初始化
            innitEvent();

            // KindEditor 的初始化
            KindEditor.ready(function (K) {

                editor = K.create('#ArticleContent', {
                    resizeType: 1,
                    allowPreviewEmoticons: false,
                    allowImageUpload: true,
                    items: [
				'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']

                })

            })
        });

        // 初始化
        function innitEvent() {
            $("#txtTitleMessage").css("display", "none");
        }

        // 表单验证
        function validate() {
            var passValidate = true;
            var txtTitle = $("#txtTitle").val();

            if (txtTitle.length <= 0) {
                $("#txtTitleMessage").css("display", "inline");
                passValidate = false;
            } else {
                $("#txtTitleMessage").css("display", "none");
            }

            if (editor.html().length <= 0) {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                $("#operateTip").html("招募书内容不能为空！").change();
                passValidate = false;
            }
            return passValidate;
        };

        // 保存
        function btnSave() {
            // 在提交前 验证表单内容

            var isPassValidate = validate();
            if (!isPassValidate) {
                return false;
            }

            var content = editor.html(); // editor是KindEditor返回的一个对象
            content = content.replace(/'/g, "&apos;"); //对描述中的单引号进行编码处理，否则json数据转换时候出问题

            var title = $("#txtTitle").val();
            var articleID = $("#articleID").val();
            $.ajax({
                url: "/ArticleGroup/ArticleGroupEdit",
                data: { "title": title, "content": content, "articleID": articleID },
                //data:"datas="+datas+"",
                type: "post",
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("招募书修改成功").change();
                    }
                }
            });
        };

        
    </script>
</asp:Content>
