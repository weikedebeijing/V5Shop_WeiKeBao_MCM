<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/DrpSetting/paymentJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("AddPayment", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
        <span style="display: none" id="UpdateTargetHiddenID"></span>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">支付方式设置</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">

                <div class="control-group" id="AlipayTypeError">
                    <label class="control-label" for="inputError">支付平台</label>
                    <div class="controls">
                        <select name="AlipayType" id="AlipayType" class="w230">
                            <option value="Alipay_Wap">支付宝(手机端)</option>
                        </select>
                        <span class="help-inline" id="AliPayTypePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="AccountError">
                    <label class="control-label" for="inputError">支付账户</label>
                    <div class="controls">
                        <input id="Account" name="Account" type="text">
                        <span class="help-inline" id="AccountPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="PIDError">
                    <label class="control-label" for="inputError">合作者身份(PID)</label>
                    <div class="controls">
                        <input id="PID" name="PID" type="text">
                        <span class="help-inline" id="PIDPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="KeyError">
                    <label class="control-label" for="inputError">安全校验码(Key)</label>
                    <div class="controls">
                        <input id="Key" name="Key" type="text">
                        <span class="help-inline" id="KeyPrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="addBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button type="submit" style="display: none" id="submit" class="submit01-alert r10">
                保存</button>
        </div>
        <%} %>
    </div>

    <div style="display: none;" id="editModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditPayment", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "EditAjaxFormValidata", OnSuccess = "EditafterOnSuccess", OnFailure = "EditafterOnFailure", UpdateTargetId = "EditUpdateTargetHiddenID" }))
          { %>
        <span style="display: none" id="EditUpdateTargetHiddenID"></span>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">支付方式设置</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">

                <div class="control-group" id="EditAlipayTypeError">
                    <label class="control-label" for="inputError">支付平台</label>
                    <div class="controls">
                        <select name="EditAlipayType" id="EditAlipayType" class="w230">
                            <option value="Alipay_Wap">支付宝(手机端)</option>
                        </select>
                        <span class="help-inline" id="EditAlipayTypePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditAccountError">
                    <label class="control-label" for="inputError">支付账户</label>
                    <div class="controls">
                        <input id="EditAccount" name="Account" type="text">
                        <span class="help-inline" id="EditAccountPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditPIDError">
                    <label class="control-label" for="inputError">合作者身份(PID)</label>
                    <div class="controls">
                        <input id="EditPID" name="PID" type="text">
                        <span class="help-inline" id="EditPIDPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditKeyError">
                    <label class="control-label" for="inputError">安全校验码(Key)</label>
                    <div class="controls">
                        <input id="EditKey" name="Key" type="text">
                        <span class="help-inline" id="EditKeyPrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="editBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <input type="hidden" id="id" name="id" />
            <input type="hidden" id="DllName" name="DllName" />
            <button class="submit01-alert r10" style="display: none" type="submit" id="Editsubmit">
            保存</button>
        </div>
        <%} %>
    </div>
    <%--<div id="gray-edit-prize" style="display: none">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditPayment", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "EditAjaxFormValidata", OnSuccess = "EditafterOnSuccess", OnFailure = "EditafterOnFailure", UpdateTargetId = "EditUpdateTargetHiddenID" }))
          { %>
        <span style="display: none" id="EditUpdateTargetHiddenID"></span>
        <input type="hidden" id="id" name="id" />
        <input type="hidden" id="DllName" name="DllName" />
        <div style="width: 520px; height: 160px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>支付平台</label>
                                </div>
                                <div class="float-l">
                                    <select name="EditAlipayType" id="EditAlipayType" class="w230">
                                        <option value="Alipay_Wap">支付宝(手机端)</option>
                                    </select>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>支付账户</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditAccount" name="Account" class="w230" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>合作者身份(PID)</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditPID" name="PID" class="w230" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>安全校验码(Key)</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditKey" name="Key" class="w230" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--content end-->
            </div>
        </div>
        <button class="submit01-alert r10" style="display: none" type="submit" id="Editsubmit">
            保存</button>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="btn()" type="button" id="btn">
                    保存</button>
                <button class="reset01-alert" onclick="editpaymentClose()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <% List<V5.MetaData.DRP.Model.Payment> PaymentList = (List<V5.MetaData.DRP.Model.Payment>)ViewData["PaymentList"];%>
    <%--<div class="mod-tab t20">
        <div class="con style0big">
            <ul>
                <li class="current"><a href="javascript:void(0)"><span>全部（<%=PaymentList.Count%>）</span> </a></li>
            </ul>
        </div>
    </div>--%>
    <!--操作栏 begin-->
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" id="AddBatch" class="btn btn-small fun-a"><i class="icon-add-gray"></i>添加</</a>
            <a href="javascript:void(0)" class="btn btn-small fun-a" id="DeleteBatch" onclick="javascript:DeleteBatch(event);"><i class="icon-del-gray"></i>删除</a>
        </div>
    </div>
    <%--<div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0)" id="AddBatch" class="a-btn">添加</a></li>
                <li><a href="javascript:void(0)" id="DeleteBatch" onclick="javascript:DeleteBatch(event);"
                    class="a-btn">删除</a></li>
            </ul>
        </div>
    </div>--%>
    <!--操作栏 end-->
    <%--<div class="clear h10">
    </div>--%>
    <!--列表 Start-->
    <div class="mod-table">
        <%--<div class="mod-table-head">
            <div class="con style0list">--%>
        <table class="table table-striped table-main" id="content">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 40%;">
                <col style="width: 45%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" id="ckall" name="" value="" onclick="CheckAll(event)"></label>
                    </th>
                    <th class="x-tab">支付方式名称
                    </th>
                    <th class="x-tab">
                        <%--  <i class="icon-resize"></i>--%>支付方式帐号
                    </th>
                    <th class="x-tab">
                        <%-- <i class="icon-resize"></i>--%>操作
                    </th>
                    <th></th>
                </tr>
                <%--  </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div style="height: 280px;" class="con style0line" id="GetPaymentViewFlag">
                <table cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 40%;">
                        <col style="width: 45%;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody id="content">--%>
                <%foreach (V5.MetaData.DRP.Model.Payment payment in PaymentList)
                  { %>
                <tr>
                    <td>
                        <label>
                            <input type="checkbox" id="Checkbox1" name="sub" value="<%=payment.ID %>" onclick="CheckThis()"></label>
                    </td>
                    <td>
                        <%=payment.Name %>
                    </td>
                    <td>
                        <%=payment.QueryArray.Split(',')[0] %>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="bs-docs-example tooltip-demo">
                                <a data-original-title="编辑" data-placement="bottom" href="javascript:void(0)" onclick="editPayment(<%=payment.ID %>)">
                                    <i class="icon-pen-blue"></i></a>
                                <a data-original-title="删除" data-placement="bottom" href="javascript:void(0)" onclick="DeletePayment(event,<%=payment.ID %>)" >
                                    <i class="icon-del-blue"></i></a>
                            </div>
                        </div>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
        <%--</div>
        </div>--%>
    </div>
    <!--列表 End-->
    <%--   </div>--%>
    <script type="text/javascript" language="javascript">
        function EditBtn() {
            var strIDs = new Array();
            $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    strIDs.push($(this).val());
                }
            })
            if (strIDs.length > 0) {
                if (strIDs.length == 1) {
                    location.href = "../../DRPSetting/EditPayment?id=" + strIDs;
                } else {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("只能选择一种支付方式不编辑").change();
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择需要编辑的支付方式").change();
            }
        }
        function DeletePayment(event, id) {
            //if (confirmThis(event, "确定要删除选中的项？")) {
                $.ajax({
                    url: "../../DRPSetting/DeletePayment",
                    data: "IDs=" + id + "",
                    type: "post",
                    success: function (succData) {
                        if (succData == "ok") {
                            window.location.reload();
                        } else {
                            $(".Loading").removeClass("style0green style0red").addClass("style0yellow").change();
                            $("#operateTip").html("请选中要删除的项");
                        }
                    },
                    error: function (errData) {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                });
            //} else {
            //    return false;
            //}
        }
        // 批量删除 listTotalCount列表中数据的条数
        function DeleteBatch(event) {
            var strIDs = new Array();
            $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    strIDs.push($(this).val());
                }
            })
            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                //if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "../../DRPSetting/DeletePayment",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                window.location.reload();

                            } else {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow").change();;
                                $("#operateTip").html("请选中要删除的项");
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red").change();;
                            $("#operateTip").html("删除出现异常，联系管理员");
                        }
                    });
                //} else {
                //    return false;
                //}
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow").change();;
                $("#operateTip").html("请勾选要删除的支付方式");
                return false;
            }
        };


    </script>
</asp:Content>
