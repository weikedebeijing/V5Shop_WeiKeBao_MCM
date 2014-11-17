<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var article = (V5.MetaData.DRP.Model.Article)ViewData["article"];
    %>
    <!--title begin-->
    <div class="mod-title t20">
        <div class="con style0h1-02">
            <a href="/HelpCenter/HelpCenterList?MenuCode=C555" title="返回" class="a-btn float-l">
                <i class="icon-back"></i></a>
            <h1 class="spanTitle">
                店铺内容编辑</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>文章标题</label></div>
                    <div class="float-l">
                        <input id="txtTitle" type="text" name="txtTitle" class="w230" value="<%:article.Title %>" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            排序</label></div>
                    <div class="float-l">
                        <input id="txtSortOrder" type="text" name="txtSortOrder" class="w230" value="<%:ViewData["sortOrder"] %>" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            文章内容</label></div>
                    <div class="float-l">
                        <textarea id="helperCenter" name="helperCenter" style="width: 750px; height: 560px;"><%:article.Content%></textarea>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <div class="l130 t20 b20">
                <button class="submit01 r10" onclick="javascript:btnSave();">
                    保存</button>
                <button onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
            </div>
        </div>
    </div>
    <input type="hidden" value="<%:article.ID %>" id="articleID" />
    <!--form End-->
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var editor = "";
        $(function () {
            // KindEditor初始化
            kindEditorInit();
        });

        // 提交前 js验证
        function validateBeforeSave() {
            $(".prompt").text('');

            if ($("#txtTitle").val() == "") {
                $("#txtTitle").focus();
                validataPrompt($("#txtTitle"), "文章标题不能为空");
                return false;
            }

            if (editor.html().length <= 0) {
                validataPrompt($("#helperCenter"), "文章内容不能为空");
                editor.focus();
                return false;
            }

            return true;
        };

        // 保存
        function btnSave() {
            $(".spMessage").text("");
            if (!validateBeforeSave()) {
                return false;
            }
            var articleID = $("#articleID").val();

            var content = editor.html(); // editor是KindEditor返回的一个对象
            content = content.replace(/'/g, "&apos;"); //对描述中的单引号进行编码处理，否则json数据转换时候出问题

            var title = $("#txtTitle").val();
            var sortOrder = $("#txtSortOrder").val();
            var sysGroupID = $("#sysGroupID").val();

            $.ajax({
                url: "/HelpCenter/EditHelpCenter",
                data: { "title": title, "sortOrder": sortOrder, "content": content, "articleID": articleID },
                type: "post",
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("修改成功!").change();
                        setTimeout(function () {
                            window.location.href = "/HelpCenter/HelpCenterList?MenuCode=C555";
                        }, 600);
                    } else {
                        errorTip("出现异常");
                    }
                }
            });
        };

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        // 取消
        function btnCancel() {
            if (editor.html().length > 0) {
                if (confirm("确定离开本页？")) {
                    window.location.href = "/HelpCenter/HelpCenterList?MenuCode=C555";
                } else {
                    return false;
                }
            } else {
                window.location.href = "/HelpCenter/HelpCenterList?MenuCode=C555";
            }
        };

        // KindEditor初始化
        function kindEditorInit() {
            // KindEditor 的初始化
            KindEditor.ready(function (K) {
                editor = K.create('#helperCenter', {
                    resizeType: 1,
                    allowPreviewEmoticons: false,
                    allowImageUpload: true,
                    items: [
				'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']

                })

            })
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
