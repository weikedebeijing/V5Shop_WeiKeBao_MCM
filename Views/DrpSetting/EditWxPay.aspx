<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="payset">
        <!--big title begin-->
        <div class="bigTitle">
            <div class="bigTitle-name"><span class="text">微信支付设置</span></div>
        </div>
        <!--big title end-->
        <div class="main">
            <% Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("EditWxPay", "DrpSetting", null, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
              { %>

            <div class="form-horizontal">
                <!--small title-->
                <div class="smallTitle">
                    <i class="icon-pen-green"></i><span class="text">填写微信支付信息</span><a class="ahelp" href="WxPayhelp"><i class="icon-help-blue"></i>如何申请微信支付</a>
                </div>
                <!--small title-->
                <ul class="applyStep">
                    <li>
                        <div class="content">
                            <p class="explanation05">
                                请将微信团队邮件中的支付专用签名串复制并粘贴在输入框内：           
                            </p>

                            <div class="control-group">
                                <label class="control-label input-label" for="paySignKey">支付专用签名串[paySignKey]</label>
                                <div class="controls">
                                    <input type="text" id="paySignKey" name="paySignKey" placeholder="" value="<%=ViewData["paySignKey"] %>"><span class="help-inline"></span>
                                </div>
                            </div>
                            <p class="explanation05-2">请将财付通邮件中的商户号及初始密钥复制并粘贴在输入框内：</p>
                            <div class="control-group">
                                <label class="control-label input-label" for="PartnerID">商户号[PartnerID]</label>
                                <div class="controls">
                                    <input type="text" id="PartnerID" name="PartnerID" placeholder="" value="<%=ViewData["PartnerID"] %>"><span class="help-inline"></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label input-label" for="PartnerKey">初始密钥[PartnerKey]</label>
                                <div class="controls">
                                    <input type="text" id="PartnerKey" name="PartnerKey" placeholder="" value="<%=ViewData["PartnerKey"] %>"><span class="help-inline"></span>
                                </div>
                            </div>

                        </div>
                    </li>
                </ul>
                <%--                <!--small title-->
                <div class="smallTitle mt20">
                    <i class="icon-car-green"></i><span class="text">运费设置</span>
                </div>
                <!--small title-->
                <ul class="applyStep">
                    <li>
                        <div class="control-group fare">
                            <label class="control-label input-fare" for="WxFreight">微信全场运费（元）</label>
                            <div class="controls">
                                <input type="text" id="WxFreight" name="WxFreight" placeholder="" value="<%=ViewData["WxFreight"] %>"><span class="help-inline"></span>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--small title-->--%>
                <div class="smallTitle mt20">
                    <i class="icon-eject-green"></i><span class="text">发布微信支付</span><a class="ahelp" href="WxPayIssue"><i class="icon-help-blue"></i>如何发布</a>
                </div>
                <!--small title-->
                <ul class="applyStep">
                    <li>
                        <label class="checkbox">
                            <%if (ViewData["isact"] == "false")
                              { %>
                            <input type="checkbox" id="isact" onclick="IsAct()" name="isact">
                            <%}
                              else
                              { %>
                            <input type="checkbox" id="isact" onclick="IsAct()" name="isact" checked="checked">
                            <%} %>
                            已经发布微信支付功能
                        </label>
                    </li>
                </ul>

                <p class="button ml25 mt60">
                    <button class="btn btn-large btn-primary" type="submit">确定</button>
                </p>
            </div>
            <span id="UpdateTargetHiddenID" style="display: none"></span>
            <%} %>
        </div>
        <div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="myModal" style="display: none;">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" onclick="clearbtn()" type="button">×</button>
                <h3 id="myModalLabel">提示</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <!--02 begin-->
                    <div class="control-group">
                        <!--error-->
                        <p>请确实您已发布微信支付,如为发布可能会导致用户前端购买失败!</p>
                    </div>
                    <!--02 end-->
                </form>
            </div>
            <div class="modal-footer">
                <button aria-hidden="true" data-dismiss="modal" onclick="clearbtn()" class="btn">关闭</button>
                <button aria-hidden="true" data-dismiss="modal" class="btn btn-info">我已发布</button>
            </div>
        </div>

        <script type="text/javascript">
            function clearbtn() {
                $("#isact").attr("checked", false);
            }
            function IsAct() {
                if ($("#isact").attr("checked") == "checked") {
                    //alert("2");
                    $("#myModal").modal("show");
                }
            }

            // ajax.BeginForm 的提交前验证
            function AjaxFormValidata() {
                $(".help-inline").text("");
                $(".error").removeClass("error");
                if ($("#paySignKey").val() == "") {
                    $("#paySignKey").focus();
                    $("#paySignKey").parent().parent().addClass("error");
                    $("#paySignKey").next().text("支付专用签名串不可为空").show();
                    return false;
                }
                if ($("#PartnerID").val() == "") {
                    $("#PartnerID").focus();
                    $("#PartnerID").parent().parent().addClass("error");
                    $("#PartnerID").next().text("商户号不可为空").show();
                    return false;
                }
                if ($("#PartnerKey").val() == "") {
                    $("#PartnerKey").focus();
                    $("#PartnerKey").parent().parent().addClass("error");
                    $("#PartnerKey").next().text("初始密钥不可为空").show();
                    return false;
                }
                //if ($("#WxFreight").val() == "") {
                //    $("#WxFreight").focus();
                //    $("#WxFreight").parent().parent().addClass("error");
                //    $("#WxFreight").next().text("微信全场运费不可为空").show();
                //    return false;
                //}
                //if (isNaN($("#WxFreight").val())) {
                //    $("#WxFreight").focus();
                //    $("#WxFreight").parent().parent().addClass("error");
                //    $("#WxFreight").next().text("微信全场运费格式不正确").show();
                //    return false;
                //}
                // alert("1");
                return true;
            };

            function afterOnSuccess() {
                if ($("#UpdateTargetHiddenID").html() == "ok") {
                    Show("保存成功", "success");
                } else {
                    Show("保存失败", "error");
                }
            };
            // 保存失败
            function afterOnFailure() {
                Show("保存失败", "error");

            };
        </script>
    </div>
</asp:Content>
