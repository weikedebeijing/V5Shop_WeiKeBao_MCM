<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
      <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/DrpSetting/emailConfigJs.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("AddEmailConfig", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
        <span id="UpdateTargetHiddenID" style="display: none"></span>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">邮件服务设置</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">

                <div class="control-group" id="LoginIDError">
                    <label class="control-label" for="inputError">发件邮箱</label>
                    <div class="controls">
                        <input id="LoginID" name="LoginID" type="text">
                        <span class="help-inline" id="LoginIDPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="NameError">
                    <label class="control-label" for="inputError">发件人</label>
                    <div class="controls">
                        <input id="Name" name="Name" type="text">
                        <span class="help-inline" id="NamePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="SmtpError">
                    <label class="control-label" for="inputError">SMTP服务器</label>
                    <div class="controls">
                        <input id="Smtp" name="Smtp" type="text">
                        <span class="help-inline" id="SmtpPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="PortError">
                    <label class="control-label" for="inputError">SMTP端口号</label>
                    <div class="controls">
                        <input id="Port" name="Port" type="text">
                        <span class="help-inline" id="PortPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="LoginPassError">
                    <label class="control-label" for="inputError">SMTP密码</label>
                    <div class="controls">
                        <input type="password" id="LoginPass" name="LoginPass">
                        <span class="help-inline" id="LoginPassPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtEmailError">
                    <label class="control-label" for="inputError">测试邮件地址</label>
                    <div class="controls">
                        <input type="text" id="txtEmail" name="txtEmail">&nbsp;
                        <button class="btn" onclick="btnSendTest()">测试邮件发送</button>
                        <span class="help-inline" id="txtEmailPrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="addBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button class="submit01 t10" id="submit" style="display: none" type="submit">
                保存</button>
        </div>
        <%} %>
    </div>
    <%--<div id="gray-add-EmailConfig" style="display: none">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("AddEmailConfig", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
       <span id="UpdateTargetHiddenID" style="display: none"></span>
        <div style="width: 490px; height: 300px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form ">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>发件邮箱</label></div>
                                <div class="float-l">
                                    <input type="text" id="LoginID" name="LoginID" class="w230" /><span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        发件人</label></div>
                                <div class="float-l">
                                    <input type="text" id="Name" name="Name" class="w230" /><span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        SMTP服务器</label></div>
                                <div class="float-l">
                                    <input type="text" id="Smtp" name="Smtp" class="w230" />
                                    <span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        SMTP端口号</label></div>
                                <div class="float-l">
                                    <input type="text" id="Port" name="Port" class="w230" />
                                    <span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        SMTP密码</label></div>
                                <div class="float-l">
                                    <input type="password" id="LoginPass" name="LoginPass" class="w230" /><span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                </div>
                                <div class="float-l">
                                    <button class="submit01 t10" id="submit" style="display: none" type="submit">
                                        保存</button>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        测试邮件地址</label>
                                </div>
                                <div class="float-l">
                                    <input id="txtEmail" type="text" name="txtEmail" class="w230" /><input type="button"
                                        value="测试邮件发送" onclick="btnSendTest()" class="btn03">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--content end-->
            </div>
        </div>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="btnsubmit()">
                    保存</button>
                <button class="reset01-alert" onclick="emailConfigClose()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <div style="display: none;" id="editModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditEmailConfig", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "EditAjaxFormValidata", OnSuccess = "EditafterOnSuccess", OnFailure = "EditafterOnFailure", UpdateTargetId = "EditUpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
        <input type="hidden" id="id" name="id" />
        <input type="hidden" id="EditUpdateTargetHiddenID" value="" />
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">邮件服务设置</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">

                <div class="control-group" id="EditLoginIDError">
                    <label class="control-label" for="inputError">发件邮箱</label>
                    <div class="controls">
                        <input id="EditLoginID" name="EditLoginID" type="text">
                        <span class="help-inline" id="EditLoginIDPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditNameError">
                    <label class="control-label" for="inputError">发件人</label>
                    <div class="controls">
                        <input id="EditName" name="EditName" type="text">
                        <span class="help-inline" id="EditNamePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditSmtpError">
                    <label class="control-label" for="inputError">SMTP服务器</label>
                    <div class="controls">
                        <input id="EditSmtp" name="EditSmtp" type="text">
                        <span class="help-inline" id="EditSmtpPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditPortError">
                    <label class="control-label" for="inputError">SMTP端口号</label>
                    <div class="controls">
                        <input id="EditPort" name="EditPort" type="text">
                        <span class="help-inline" id="EditPortPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="EditLoginPassError">
                    <label class="control-label" for="inputError">SMTP密码</label>
                    <div class="controls">
                        <input type="password" id="EditLoginPass" name="EditLoginPass">
                        <span class="help-inline" id="EditLoginPassPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="Div7">
                    <label class="control-label" for="inputError">测试邮件地址</label>
                    <div class="controls">
                        <input type="text" id="EdittxtEmail" type="text" name="EdittxtEmail">&nbsp;
                        <button class="btn" name="EditbtnSendTest" onclick="EditbtnSendTest()" value="测试邮件发送" id="EditbtnSendTest">测试邮件发送</button>
                        <span class="help-inline" id="Span7" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="editBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button class="submit01 t10" id="Editsubmits" style="display: none" type="submit">
                保存</button>
        </div>
        <%} %>
    </div>
    <%--<div id="gray-Edit-EmailConfig" style="display: none">
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditEmailConfig", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "EditAjaxFormValidata", OnSuccess = "EditafterOnSuccess", OnFailure = "EditafterOnFailure", UpdateTargetId = "EditUpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
        <input type="hidden" id="id" name="id" />
        <input type="hidden" id="EditUpdateTargetHiddenID" value="" />
        <div style="width: 470px; height: 300px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>发件邮箱</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditLoginID" name="EditLoginID" class="w230" /><span class="spMessage">
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>发件人</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditName" name="EditName" class="w230" /><span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>SMTP服务器</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditSmtp" name="EditSmtp" class="w230" />
                                    <span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>SMTP端口号</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="EditPort" name="EditPort" class="w230" />
                                    <span class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>SMTP密码</label>
                                </div>
                                <div class="float-l">
                                    <input type="password" id="EditLoginPass" name="EditLoginPass" class="w230" /><span
                                        class="spMessage"></span>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                </div>
                                <div class="float-l">
                                    <button class="submit01 t10" id="Editsubmits" style="display: none" type="submit">
                                        保存</button>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>测试邮件地址</label>
                                </div>
                                <div class="float-l">
                                    <input id="EdittxtEmail" type="text" name="EdittxtEmail" class="w230"><input type="button"
                                        name="EditbtnSendTest" onclick="EditbtnSendTest()" value="测试邮件发送" id="EditbtnSendTest"
                                        class="btn03">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--content end-->
            </div>
        </div>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="Editsubmit()">
                    保存</button>
                <button class="reset01-alert" onclick="editEmailConfigClose()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <% List<V5.MetaData.DRP.Model.EmailConfig> emailConfigList = (List<V5.MetaData.DRP.Model.EmailConfig>)ViewData["EmailConfigList"];%>
    <!--标题 end-->


    <%--<div class="mod-tab t20">
        <div class="con style0big">
            <ul>
                <li class="current"><a href="javascript:void(0)"><span>全部（<%=emailConfigList.Count%>）</span> </a></li>
            </ul>
        </div>
    </div>--%>

    <!--操作栏 begin-->
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" id="addEmailConfig" class="btn btn-small fun-a"><i class="icon-add-gray"></i>添加</</a>
            <a href="javascript:void(0)" class="btn btn-small fun-a" id="A1" onclick="javascript:DeleteBatch(event);"><i class="icon-del-gray"></i>删除</a>
        </div>
    </div>
    <%-- <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0)" id="addEmailConfig" class="a-btn">添加</a></li>
    <li><a href="javascript:void(0)" id="DeleteBatch" onclick="javascript:DeleteBatch(event);"
        class="a-btn">删除</a></li>
    </ul>
        </div>
    </div>--%>
    <!--操作栏 end-->
    <%-- <div class="clear h10">
    </div>--%>
    <!--列表 Start-->
    <div class="mod-table">
        <%-- <div class="mod-table-head">
            <div class="con style0list">--%>
        <table class="table table-striped table-main" id="content">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 30%;">
                <col style="width: 30%;">
                <col style="width: 25%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" id="ckall" name="" value="" onclick="CheckAll(event)"></label>
                    </th>
                    <th>发件人姓名
                    </th>
                    <th>
                        <%--  <i class="icon-resize"></i>--%>发件人邮件
                    </th>
                    <th>
                        <%-- <i class="icon-resize"></i>--%>邮件服务器
                    </th>
                    <th>操作
                    </th>
                    <th></th>
                </tr>
                <%-- </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div class="con style0line" id="GetPaymentViewFlag">
                <table>
                    <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 30%;">
                        <col style="width: 30%;">
                        <col style="width: 25%;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <tbody id="content">--%>
                <%foreach (V5.MetaData.DRP.Model.EmailConfig emailConfig in emailConfigList)
                  { %>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" id="Checkbox1" name="sub" value="<%=emailConfig.ID %>" onclick="CheckThis()" /></label>
                        </div>
                    </td>
                    <td>
                        <%=emailConfig.Name%>
                    </td>
                    <td>
                        <%=emailConfig.LoginID%>
                    </td>
                    <td>
                        <i class="icon-resize"></i>
                        <%=emailConfig.Smtp%>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="bs-docs-example tooltip-demo">
                                <a data-original-title="编辑" data-placement="bottom" onclick="editEmailConfig(<%=emailConfig.ID %>)" href="javascript:void()">
                                    <i class="icon-pen-blue"></i></a>
                                <a data-original-title="删除" data-placement="bottom" href="javascript:void()" onclick="DeleteEmailConfig(event,<%=emailConfig.ID %>)">
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
    <!--Left End-->
    <script type="text/javascript" language="javascript">
        $(function () {
            // 默认把操作结果隐藏
            // 注册全选
            // checkAll();
        });
        function EditBtn() {
            var strIDs = new Array();
            $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    strIDs.push($(this).val());
                }
            })
            if (strIDs.length > 0) {
                if (strIDs.length == 1) {
                    location.href = "../../DRPSetting/EditEmailConfig?id=" + strIDs + "&MenuCode=C530";
                } else {
                    Show("只能选择一种邮件配置编辑", "prompt");
                }
            } else {
                Show("请选择需要编辑的邮件配置", "prompt");
            }
        }
        function DeleteEmailConfig(event, id) {
            //if (confirmThis(event, "确定要删除选中的项？")) {
            $.ajax({
                url: "../../DRPSetting/DeleteEmailConfig",
                data: "IDs=" + id + "",
                type: "post",
                success: function (succData) {
                    if (succData == "ok") {
                        Show("删除成功", "success");
                        window.location.reload();
                    } else {
                    }
                },
                error: function (errData) {
                    Show("删除出现异常，联系管理员", "error");
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
                    url: "../../DRPSetting/DeleteEmailConfig",
                    data: "IDs=" + strIDs + "",
                    type: "post",
                    success: function (succData) {
                        if (succData == "ok") {
                            Show("删除成功", "success");
                            window.location.reload();
                        } else {
                            Show("请选中要删除的项", "prompt").change();
                        }
                    },
                    error: function (errData) {
                        Show("删除出现异常，联系管理员", "error");
                    }
                });
                //} else {
                //    return false;
                //}
            } else {
                Show("请勾选要删除的邮件配置", "prompt").change();
                return false;
            }
        };

    </script>
</asp:Content>
