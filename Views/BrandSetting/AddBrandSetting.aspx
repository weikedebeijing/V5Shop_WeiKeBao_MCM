<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
    <style type="text/css">
        #topTitle
        {
            font-size: 20px;
        }
        .validateMessage
        {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M">
            <div class="mod-title">
                <div>
                    <div class="Loading" style="display: none;">
                        <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                    </div>
                </div>
            </div>
            <div class="tab-content">
                <div class="mod-title" style="margin-top: 15px;">
                    <a title="返回" href="/BrandSetting/BrandSettingList">
                        <button type="button" class="returnBtn">
                            返回</button></a><span class="spanTitle">品牌添加</span>
                </div>
                <div class="tab-pane active">
                    <div id="baseInfoContainer">
                        <div style="width: auto; height: 30px; line-height: 30px; float: left; clear: both;
                            margin: 20px 0 0 0;">
                            <div style="width: 130px; float: left; text-align: left;">
                                <span style="color: Red;">&nbsp;&nbsp;</span><span class="c01-1 l5">品牌名称</span></div>
                            <div class="float-l">
                                <input id="txtBrand" type="text" class="w230" name="txtBrand" value="" />
                            &nbsp;&nbsp;<span class="validateMessage" id="txtBrandMessage">品牌名称不能为空</span></div>
                            <div class="float-l l10">
                                </div>
                        </div>
                        <%--<div style="width: 400px; height: 30px; line-height: 30px; float: left;">
                            <div style="width: 130px; float: left; text-align: left;">
                                品牌名称<span style="color: Red;">*</span>
                            </div>
                            <input id="txtBrand" type="text" class="w230" name="txtBrand" value="" />
                            &nbsp;&nbsp;<span class="validateMessage" id="txtBrandMessage">品牌名称不能为空</span>
                        </div>--%>
                        <div style="width: auto; height: 30px; line-height: 30px; float: left; clear: both;
                            margin: 20px 0 0 0;">
                            <div style="width: 130px; float: left; text-align: left;">
                                <span style="color: Red;">&nbsp;&nbsp;</span><span class="c01-1 l5">LOGO</span></div>
                            <div class="float-l">
                                <img id="DefalutPic" onload="DrawImage(this,90,90)" src="../../Images/Default.png" alt="商品图片" style="border: 1px solid black;" />
                                &nbsp;&nbsp;<input id="fileUploadImg" type="file" name="Img" onchange="javascript:btnUpload();"
                                    style="width: 65px;" />
                                &nbsp;&nbsp;<span class="validateMessage" id="txtPicMessage">请上传图片</span>
                            </div>
                            <div class="float-l l10">
                            </div>
                        </div>
                        <%--<div style="clear: both; padding-top: 15px;">
                            <img id="DefalutPic" onload="DrawImage(this,90,90)" src="../../Images/Default.png"
                                alt="商品图片" style="border: 1px solid black;" />
                            <div style="width: 130px; float: left; text-align: left;">
                                LOGO<span style="color: Red;">*</span></div>
                            <input id="fileUploadImg" type="file" name="Img" onchange="javascript:btnUpload();"
                                style="width: 65px;" />
                            &nbsp;&nbsp;<span class="validateMessage" id="txtPicMessage">请上传图片</span>
                        </div>--%>
                    </div>
                </div>
                <div style="padding-top: 100px; margin-bottom: 10px; clear: both; height: auto;">
                    <div style="clear: both;">
                        <span class="spMessage"></span>
                    </div>
                    <div id="dvProductDestribution" style="clear: both;margin-left:5px;">
                        <div style="clear: both; width: auto; float: left; margin-top: 10px;">
                            <div style="width: 130px; float: left; text-align: left;">
                                <span style="color: Red;">*</span>品牌介绍</div>
                            <div style="float: left;">
                                <textarea id="BrandContent" name="BrandContent" style="width: 750px; height: 560px;"></textarea><span
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
                            <dt class="w100"></dt>
                            <dd class="l105">
                                <button class="submit01 l25 b20 t10" onclick="javascript:btnSave()" id="btnSave">
                                    保存</button>
                                <%--<button class="cancelBtn l10 b20 t10" type="button" onclick="javascript:btnCancel();">
                                    取消</button>--%>
                            </dd>
                        </dl>
                    </div>
                </div>
                <!--button end-->
            </div>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script type="text/javascript">

        var editor = "";
        $(function () {
            // 初始化
            innitEvent();

            // KindEditor 的初始化
            KindEditor.ready(function (K) {

                editor = K.create('#BrandContent', {
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

        // 上传图片
        function btnUpload() {
            $.ajaxFileUpload({
                url: '/BrandSetting/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: "fileUploadImg", //文件上传空间的id属性 
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        // 把图片替换默认图片
                        $("#DefalutPic").attr("src", "../../UploadFile/BandSetting/" + res);

                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function () {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })
        }

        // 初始化
        function innitEvent() {
            $("#txtBrandMessage").css("display", "none");
            $("#txtPicMessage").css("display", "none");
            $("#txtSummaryMessage").css("display", "none");
        }

        // 表单验证
        function validate() {
            var passValidate = true;
            var txtBrand = $("#txtBrand").val();
            var DefalutPic = $("#DefalutPic").attr("src");

            if (txtBrand.length <= 0) {
                $("#txtBrandMessage").css("display", "inline");
                passValidate = false;
            } else {
                $("#txtBrandMessage").css("display", "none");
            }
            if (DefalutPic == "../../Images/Default.png") {
                passValidate = false;
                $("#txtPicMessage").css("display", "inline");
            } else {
                $("#txtPicMessage").css("display", "none");
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
            
            if (editor.html().length <= 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("品牌介绍不能为空！").change();
                return false;
            }

            var content = editor.html(); //商品描述 editor是KindEditor返回的一个对象
            content = content.replace(/'/g, "&apos;"); //对描述中的单引号进行编码处理，否则json数据转换时候出问题

            var brandName = $("#txtBrand").val();
            var imgUrl = $("#DefalutPic").attr("src");

            //            // 检验品牌名是否重复
            //            $.ajax({
            //                url: "/BrandSetting/CheckBrandNameRepeat",
            //                data: { "brandName": brandName },
            //                type: "post",
            //                async: false, // 同步执行 检查是否重复后再往下执行
            //                success: function (returnData) {
            //                    if (returnData == "repeat") {
            //                        $(".Loading").removeClass("style01 style03").addClass("style02");
            //                        $("#operateTip").html("品牌名称重复").change();
            //                        //                        $("#txtBrand").focusin();
            //                        isRepeat = true;
            //                    }
            //                }
            //            });

            // 添加
            $.ajax({
                url: "/BrandSetting/AddBrandSetting",
                data: { "brandName": brandName, "imgUrl": imgUrl, "content": content },
                type: "post",
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加品牌成功! 点击跳转到<a href='/BrandSetting/BrandSettingList'> 品牌列表</a> ").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("添加品牌失败").change();
                    }
                }
            });
        }



        // 取消
        function btnCancel() {
            window.location.href = "/BrandSetting/BrandSettingList";
        };
        
    </script>
</asp:Content>
