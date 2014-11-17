<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftMvcAjax.debug.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .l150
        {
            margin: 149px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mod-title">
        <div class="con style03">
            <a href="../../WeiXinManage/PictureClassify" title="返回">
                <button type="button" class="returnBtn">
                    返回</button>
            </a><span class="spanTitle">添加单图文</span>
        </div>
    </div>
    <div>
        <div class="Loading" style="display: none;">
            <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <div class="">
        <div class="mod-form">
            <%using (Ajax.BeginForm("AddOddImage", "WeiXinManage", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
              { 
          
            %>
            <div class="con style01">
               <span style="display:none" id="HidUpdateTargetId"></span>
                <input type="hidden" id="HidImg" name="HidImg" />
                <input type="hidden" id="HidDescribe" name="HidDescribe" />
                <dl>
                    <dt>标题：<span style="color: Red;">*</span></dt>
                    <dd class="l150" style="padding-left: 20px">
                        <input type="text" name="txtName" id="txtName" class="v5-input w150" />
                        <span class="spMessage"></span>
                    </dd>
                    <dt>网址链接地址：<span style="color: Red;">*</span></dt>
                    <dd class="l150" style="padding-left: 20px">
                        <input class="v5-input w150" type="text" name="txtChainedUrl" id="txtChainedUrl"
                            style="width: 500px">
                        <span class="spMessage"></span>
                    </dd>
                    <dt>描述：<span style="color: Red;">*</span></dt>
                    <dd class="l150" style="padding-left: 20px">
                        <textarea name="txtDescribe" id="txtDescribe" style="width: 500px; height: 200px;"></textarea>
                        <span class="spMessage"></span>
                    </dd>
                    <dt></dt>
                    <dt>图片上传：<span style="color: Red;">*</span></dt>
                    <dd class="l150" style="padding-left: 20px">
                        <div id="uploadImgUpload">
                            <div class="uploadImgItem">
                                <div class="uploadImgItemPreview">
                                    <div class="previewContainer">
                                        <img id="file_upload_img" src="../../Images/Default.png" alt="图片" onload="DrawImage(this,90,90)"
                                            style="display: block; margin: 0 auto" width="90" height="90">
                                    </div>
                                    <div style="display: none;" class="operateImg">
                                        <div sort="delete">
                                            ×</div>
                                    </div>
                                </div>
                                <div class="uploadImgBtn">
                                    <button class="uploadButton">
                                        选择</button><span class="spMessage"></span>
                                    <input id="file_upload" name="file_upload" value=" " onchange="FileUpload()" class="uploadInputFile"
                                        style="width: 60px;" type="file">
                                </div>
                            </div>
                        </div>
                    </dd>
                    <dd class="l150" style="margin-ll130150px">
                        <button type="button" onclick="javascript:btnSub();" class="saveBtn t10">
                            保存</button>
                        <button type="submit" id="realSub" style="display: none;">
                            保存</button>
                        <button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel();">
                            取消</button>
                    </dd>
                </dl>
                <%--         <dt class="w130">
                        <button type="button" class="submit01">
                            取消</button>
                    </dt>--%>
            </div>
            <% } %>
        </div>
    </div>
    <script type="text/javascript">


        $(function () {

            //页面全局变量,编辑页面赋值，单独发送到某个渠道用到（现在只有淘宝） channelCode
            var channelCode = "";

            //在页面load完成富文本编辑器KindEditor load完成后继续下面的代码，
            KindEditor.ready(function (K) {//富文本编辑器的生成代码
                editor = K.create('#txtDescribe', {
                    resizeType: 1,
                    allowPreviewEmoticons: false,
                    allowImageUpload: true,
                    items: [
				'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']

                })
            })
        })


        function afterOnSuccess() {
            if ($("#HidUpdateTargetId").html() == "ok") {
                $(".spMessage").text("");
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");

                $("#operateTip").html("添加成功！").change();
                btnCancel();
                $("input").val('')

            }
        }
        function afterOnFailure() {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
            $("#operateTip").html("添加失败！").change();

        };
        // 点击取消的时候
        function btnCancel() {
            window.location.href = "../../WeiXinManage/PictureClassify";
        };

        function AjaxForm() {




        }
        function FileUpload() {

            //图片上传
            $.ajaxFileUpload({
                url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: "file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        $("#file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res);
                        //var dd = $(eventSrc).parent().parent().attr("class")
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function ()//服务器响应失败处理函数
                {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })

        }


        function btnSub() {


            var strRegex = /(https?):\/\/([^\.\/]+)([\.]?)([^\.\/]+)([\.]?)([^\.\/]+)(\/[\w-\.\/\?\%\&\=]*)?/i;


            var re = new RegExp(strRegex);

            if ($("#txtName").val() == "") {
                $("#txtName").focus();
                $(".spMessage").text("");
                $("#txtName").siblings(".spMessage").text("请输入标题");
                return false;
            }



            else if (!re.test($("#txtChainedUrl").val())) {

                $("#txtChainedUrl").focus();
                $(".spMessage").text("");
                $("#txtChainedUrl").siblings(".spMessage").text("请输入正确的地址");
                return false;
            }
            else if ($("#txtChainedUrl").val() == "") {
                $("#txtChainedUrl").focus();
                $(".spMessage").text("");
                $("#txtChainedUrl").siblings(".spMessage").text("请输入网址链接");
                return false;
            }



            //            else if ($("#txtDescribe").val() == "") {
            //                $("#txtDescribe").focus();
            //                $(".spMessage").text("");
            //                $("#txtDescribe").siblings(".spMessage").text("请输入描述");
            //                return false;
            //            }

            else if ($("#uploadImgUpload img").attr("src") == "../../Images/Default.png") {

                $("#uploadImgUpload img").focus();
                $(".spMessage").text("");
                $(".uploadButton").siblings(".spMessage").text("请上传图片");
                return false;

            }

            $("#HidImg").val($("#uploadImgUpload img").attr("src").replace("../../", ""));

            $("#HidDescribe").val(editor.html());

           // alert($("#HidImg").val());
            $("#realSub").submit();





        }
    </script>
</asp:Content>
