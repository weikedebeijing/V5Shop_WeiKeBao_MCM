<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="/ShopDecorate/ShopDecorateList?MenuCode=C545" title="返回" class="a-btn float-l">
                <i class="icon-back"></i></a>
            <h1 class="spanTitle">
                添加分销模板</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            模板包
                        </label>
                    </div>
                    <div class="float-l">
                        <input name="ZipUrl" id="ZipUrl" type="text" class="w230" value="" readonly="readonly"></input>
                        <input type="file" id="file_upload" name="file_upload" style="display: none" onchange="UploadZip()" />
                    </div>
                    <div class="float-l">
                        <a class="a-btn" id="spEdit" style="cursor: pointer;" onclick="file_upload.click()">
                            预览</a>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            安装并立即启用
                        </label>
                    </div>
                    <div class="float-l">
                        <input id="IsAct" type="checkbox" name="IsAct" />
                        <label for="IsAct">
                            是</label>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <div class="l130 t30 b20">
                <button type="button" onclick="javascript:ChickButton()" class="submit01 r10">
                    保存</button>
                <button type="button" onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
            </div>
        </div>
    </div>
    <script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script type="text/javascript">


        var arr;
        function UploadZip() {
            $("#BtnOk").removeClass("disabled").addClass("submit01").attr("disabled", "disabled");
            $.ajaxFileUpload({
                url: '../../DrpSetting/UploadZip', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: 'file_upload', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    arr = res.split('|');
                    if (arr[0] == "true") {
                        $("#ZipUrl").val(arr[1]);
                    } else {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html(arr[1]).change();
                    }
                },
                error: function ()//服务器响应失败处理函数
                {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })
        }
        function posttrue(status) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(status).change();

        }
        function ChickButton() {
            $("#BtnOk").removeClass("submit01").addClass("disabled").attr("disabled", "disabled");
            if ($("#ZipUrl").val() != "") {
                var isAct = $("#IsAct").attr("checked") == "checked";
                if (arr.length == 4) {
                    $.getScript(arr[2] + "?action=addTemplate&BmcTpUrl=" + arr[1] + "&isAct=" + isAct + "&truepath=" + arr[3], function (data) {

                    });

                } else {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("no").change();
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先选择文件").change();
            }
        }

        var btnCancel = function () {
            window.location.href = "/ShopDecorate/ShopDecorateList?MenuCode=C545";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
