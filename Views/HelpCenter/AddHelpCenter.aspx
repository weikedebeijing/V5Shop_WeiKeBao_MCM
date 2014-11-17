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
    <div class="mod-title t20">
        <div class="con style0h1-02">
            <a href="/HelpCenter/HelpCenterList?MenuCode=C555" title="返回" class="a-btn float-l">
                <i class="icon-back"></i></a>
            <h1 class="spanTitle">
                创建店铺内容</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>所属分组</label></div>
                    <div class="float-l">
                        <%
                            var sysGroups = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["sysGroups"];     
                        %>
                        <select id="helperCenter_sysGroupID" name="helperCenter_sysGroupID" class="w242">
                            <%foreach (var sysGroup in sysGroups)
                              { %>
                            <option value="<%:sysGroup.ID %>">
                                <%:sysGroup.Name%></option>
                            <%} %>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>文章标题</label></div>
                    <div class="float-l">
                        <input id="txtTitle" class="w230" type="text" name="txtTitle" />
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
                        <input id="txtSortOrder" class="w230" onkeyup="value=value.replace(/[^\d]/g,'') "
                            type="text" name="txtSortOrder" /></div>
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
                        <textarea id="helperCenter" name="helperCenter" style="width: 750px; height: 560px;"></textarea>
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

            if ($("#txtTitle").val().length > 18) {
                $("#txtTitle").focus();
                validataPrompt($("#txtTitle"), "文章标题长度不能大于18");
                return false;
            }

            if ($("#txtSortOrder").val() > 1000000) {
                $("#txtSortOrder").focus();
                validataPrompt($("#txtSortOrder"), "序号不能大于1000000");
                return false;
            }

            if (editor.html().length <= 0) {
                validataPrompt($("#helperCenter"), "文章内容不能为空");
                editor.focus();
                return false;
            }
            return true;
        };

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        // 保存
        function btnSave() {
            $(".spMessage").text("");
            if (!validateBeforeSave()) {
                return false;
            }

            var content = editor.html(); // editor是KindEditor返回的一个对象
            content = content.replace(/'/g, "&apos;"); //对描述中的单引号进行编码处理，否则json数据转换时候出问题

            var title = $("#txtTitle").val();
            var sortOrder = $("#txtSortOrder").val();
            var sysGroupID = $("#helperCenter_sysGroupID").val();

            $.ajax({
                url: "/HelpCenter/AddHelpCenter",
                data: { "title": title, "sortOrder": sortOrder, "content": content, "sysGroupID": sysGroupID },
                type: "post",
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加成功!").change();
                        setTimeout(function () {
                            window.location.href = "/HelpCenter/HelpCenterList?MenuCode=C555";
                        }, 600);
                    }
                }
            });
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

    
    </script>
</asp:Content>
