<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <% V5.MetaData.Market.Model.Opened drpShop = (V5.MetaData.Market.Model.Opened)ViewData["DrpShop"];%>
        <div class="MCM-C-M ">
            <div class="mod-title">
                <div class="con style0h1-02">
                    <h1 class="spanTitle">店铺基本信息</h1>
                </div>
            </div>
            <div class="mod-box">
                <div class="con style0bg">
                    <div class="website-view">
                        <div class="codebar">
                            <img alt="codebar" src="../../DimensionCode/GetDimensionCodesByUrl">
                        </div>
                        <div class="text">
                            <span>手机上的二维码扫描软件拍摄左侧二维码，可直接访问微商城。</span><a class="btn-gradient-blue" target="_blank"
                                href="<%=drpShop.Path %>">预 览</a>
                        </div>
                    </div>
                </div>
            </div>
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("EditShop", "DrpSetting", null, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
              { %>
            <div class="mod-form">
                <div class="con style0page">
                    <input type="hidden" id="appCode" name="appCode" value="<%=ViewData["appCode"] %>" />
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>微店名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="ShopName" name="ShopName" class="w230" value="<%=drpShop.Title %>" />
                                <span
                                    class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>微店标题</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="SiteTitle" name="SiteTitle" class="w230" value="<%=drpShop.SiteTitle %>" /><span
                                    class="prompt"></span>
                                <input type="text" id="SiteUrl" name="SiteUrl" class="w230" value="<%=drpShop.Path %>" style="display: none" /><span class="spMessage"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>微店图标</label>
                            </div>
                            <div class="float-l">
                                <div class="file01 w230">
                                    <span class="pic-place wb100 h150" style="line-height: 180px;">
                                        <img style="background: #333;" id="file_upload_img" src="../../Images/Drp/<%=drpShop.Icon %>"
                                            name="file_upload_img" alt="" />
                                        <p id="OneImage_none" style="display: none" class="nopic">
                                            暂无图片
                                        </p>
                                    </span>
                                    <div class="btn">
                                        <input type="hidden" value="<%=drpShop.Icon %>" id="LogoUrl" name="LogoUrl" />
                                        <input type="button" value="上传图片" class="btn-pic" />
                                        <input type="file" id="file_upload" name="file_upload" class="inputfile" onchange="UploadImage()" />
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="l130 t20 b20">
                        <button class="submit01 t10" type="submit">
                            保存</button>
                    </div>
                </div>
            </div>
            <span id="UpdateTargetHiddenID" style="display: none"></span>
            <%} %>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">


        function UploadImage() {
            $.ajaxFileUpload({
                url: '../../DrpSetting/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: 'file_upload', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res) //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        $("#file_upload_img").attr("src", "../../Images/DRP/" + res);
                        $("#LogoUrl").val(res);
                        //var dd = $(eventSrc).parent().parent().attr("class")
                    } else {
                        //                        alert(res);
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function () //服务器响应失败处理函数
                {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                    //                    alert("提交过程中出现未知错误");
                }
            });
        }

        // ajax.BeginForm 的提交前验证
        function AjaxFormValidata() {
            $(".prompt").text("");
            if ($("#ShopName").val() == "") {
                $("#ShopName").focus();
                $(".spMessage").text("");
                $("#ShopName").siblings(".prompt").text("店铺名称不能为空");
                return false;
            }
            //if (!IsWebUrl($("#SiteUrl"))) {
            //    $("#SiteUrl").siblings(".prompt").text("域名格式不正确(http://www.v5shop.com/)");
            //    return false;
            //}
            if ($("#SiteTitle").val() == "") {
                $("#SiteTitle").focus();
                $(".spMessage").text("");
                $("#SiteTitle").siblings(".prompt").text("站点标题不能为空");
                return false;
            }

            return true;
        };


        function afterOnSuccess() {
            if ($("#UpdateTargetHiddenID").html() == "ok") {
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("店铺设置成功").change();
            }
        };
        // 添加会员等级失败
        function afterOnFailure() {
            // 把添加失败放到<span>中
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("店铺设置失败").change();
            //              $("#ResultTip").css("display", "block").text("分销店铺设置失败");
        };
    </script>
</asp:Content>
