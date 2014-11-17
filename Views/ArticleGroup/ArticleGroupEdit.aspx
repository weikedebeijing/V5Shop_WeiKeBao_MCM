<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                发布招募书</h1>
        </div>
    </div>
    <!--title end-->
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>招募书标题</label></div>
                    <div class="float-l">
                        <input id="txtTitle" class="w230" type="text" name="txtTitle" value="<%:ViewData["title"] %>" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>招募书内容</label></div>
                    <div class="float-l">
                        <textarea class="w780 h560" id="ArticleContent" name="ArticleContent"><%:ViewData["content"]%></textarea>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <div class="l130 t30 b20">
                <button type="button" onclick="javascript:btnSave()" class="submit01 r10">
                    保存</button>
                <input type="hidden" value="<%:ViewData["articleID"] %>" id="articleID" />
            </div>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var editor = "";
        $(function () {
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

        // 表单验证
        function validate() {
            $(".prompt").text('');
            var passValidate = true;
            var txtTitle = $("#txtTitle").val();

            if (txtTitle.length <= 0) {
                validataPrompt($("#txtTitle"), "标题不能为空");
                passValidate = false;
            }

            if (editor.html().length <= 0) {
                validataPrompt($("#ArticleContent"), "内容不能为空");
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

        //-------------通用------
        // 去空格
        if (!String.prototype.trim) {
            String.prototype.trim = function () {
                var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
                while (ws.test(this.charAt(end))) {
                    end--;
                }
                return this.slice(0, end + 1);
            }
        }

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        var successTip = function (msg) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(msg).change();
        };

        var warningTip = function (msg) {
            $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
            $("#operateTip").html(msg).change();
        };

        var errorTip = function (msg) {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html(msg).change();
        };
    </script>
</asp:Content>
