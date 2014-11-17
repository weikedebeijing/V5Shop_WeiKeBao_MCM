<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%=Combres.WebExtensions.CombresLink("addRoleJs")%>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/Delivery/logisticsCompanyjs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        var logisticsQuery = new Object();
        logisticsQuery.Groups = new Array(1);
        logisticsQuery.Groups[0] = 'q1';



    </script>
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <%using (Ajax.BeginForm("AddLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          { 
          
        %>
        <span style="display: none" id="HidUpdateTargetId"></span>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">添加物流公司</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="txtLogisticsError">
                    <label class="control-label" for="inputError">物流名称</label>
                    <div class="controls">
                        <input name="txtLogistics" id="txtLogistics" type="text">
                        <span class="help-inline" id="txtLogisticsPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtJaneSpellError">
                    <label class="control-label" for="inputError">物流编号</label>
                    <div class="controls">
                        <input name="txtJaneSpell" id="txtJaneSpell" type="text">
                        <span class="help-inline" id="txtJaneSpellPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="StautsError">
                    <label class="control-label" for="inputError">使用状态</label>
                    <div class="controls">
                        <input type="radio" name="rdStatus" id="rdStatus0" value="0" checked="checked" />&nbsp;启用&nbsp;&nbsp;
                        <input type="radio" name="rdStatus" id="rdStatus1" value="1" />&nbsp;禁用
                        <span class="help-inline" id="StautsPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="LogisticsPhoneError">
                    <label class="control-label" for="inputError">联系电话</label>
                    <div class="controls">
                        <input name="LogisticsPhone" id="LogisticsPhone" type="text" />
                        <span class="help-inline" id="LogisticsPhonePrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="addBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button type="submit" id="addCompany" style="display: none">
            </button>
        </div>
        <%} %>
    </div>
    <%-- <div id="divCompant" style="display: none">
        <!--content begin-->
      <div style="width: 500px; height: 160px;" class="content scroll">
            <div class="mod-form 137">
                <%using (Ajax.BeginForm("AddLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
                  { 
          
                %>
                <span style="display: none" id="HidUpdateTargetId"></span>
                <div class="con style0alert b10">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>物流名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="txtLogistics" id="txtLogistics" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    物流编号</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="txtJaneSpell" id="txtJaneSpell" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    使用状态</label>
                            </div>
                            <div class="float-l">
                                <input type="radio" name="rdStatus" id="rdStatus0" value="0" checked="checked" /><label
                                    for="rdStatus0">启用</label>
                                <input type="radio" name="rdStatus" id="rdStatus1" value="1" /><label for="rdStatus1">禁用</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    联系电话</label>
                            </div>
                            <div class="float-l">
                                <input class="w230" type="text" name="LogisticsPhone" id="LogisticsPhone">
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
                <button type="submit" id="addCompany" style="display: none">
                </button>
                <% } %>
            </div>
            <!--content end-->
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="javascript:addCompany();">
                    保存</button>
                <button class="reset01-alert r10" onclick="companyClose()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <div style="display: none;" id="editModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
         <%using (Ajax.BeginForm("SetUpdateLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "ModifyAjaxForm", OnSuccess = "ModifyafterOnSuccess", OnFailure = "ModifyafterOnFailure", UpdateTargetId = "ModifyHidUpdateTargetId" }))
          { 
        %>
        <input type="hidden" id="ModifyHidUpdateTargetId" />
        <input type="hidden" name="ModifyHidLogisticsCompanyID" id="ModifyHidLogisticsCompanyID" />
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">编辑物流公司</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="ModifytxtLogisticsError">
                    <label class="control-label" for="inputError">物流名称</label>
                    <div class="controls">
                        <input name="ModifytxtLogistics" id="ModifytxtLogistics" type="text">
                        <span class="help-inline" id="ModifytxtLogisticsPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifytxtJaneSpellError">
                    <label class="control-label" for="inputError">物流编号</label>
                    <div class="controls">
                        <input name="ModifytxtJaneSpell" id="ModifytxtJaneSpell"  type="text">
                        <span class="help-inline" id="ModifytxtJaneSpellPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="StatusError">
                    <label class="control-label" for="inputError">使用状态</label>
                    <div class="controls">
                        <input type="radio" name="ModifyrdStatus" value="0" id="ModifyrdStatus0" />&nbsp;启用&nbsp;&nbsp;
                        <input type="radio" name="ModifyrdStatus" value="1" id="ModifyrdStatus1"  />&nbsp;禁用
                        <span class="help-inline" id="StatusPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifyLogisticsPhoneError">
                    <label class="control-label" for="inputError">联系电话</label>
                    <div class="controls">
                        <input  name="ModifyLogisticsPhone" id="ModifyLogisticsPhone" type="text" />
                        <span class="help-inline" id="ModifyLogisticsPhonePrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="editBtn" data-dismiss="modal" aria-hidden="true">保存</button>
              <button type="submit" id="updateCompany" style="display: none">
            </button>
        </div>
        <%} %>
    </div>
    <%--<div id="divModifyCompant" style="display: none">
        <%using (Ajax.BeginForm("SetUpdateLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "ModifyAjaxForm", OnSuccess = "ModifyafterOnSuccess", OnFailure = "ModifyafterOnFailure", UpdateTargetId = "ModifyHidUpdateTargetId" }))
          { 
        %>
        <input type="hidden" id="ModifyHidUpdateTargetId" />
        <input type="hidden" name="ModifyHidLogisticsCompanyID" id="ModifyHidLogisticsCompanyID" />
        <div style="width: 500px; height: 160px;" class="content scroll">
            <!--content begin-->
            <div class="mod-form 137">
                <div class="con style0alert b10">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>物流名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="ModifytxtLogistics" id="ModifytxtLogistics" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    物流编号</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="ModifytxtJaneSpell" id="ModifytxtJaneSpell" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    使用状态</label>
                            </div>
                            <div class="float-l">
                                <input type="radio" checked="checked" name="ModifyrdStatus" value="0" id="ModifyrdStatus0" /><label
                                    for="ModifyrdStatus0">
                                    启用</label>
                                <input type="radio" name="ModifyrdStatus" value="1" id="ModifyrdStatus1" /><label
                                    for="ModifyrdStatus1">禁用</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    联系电话</label>
                            </div>
                            <div class="float-l">
                                <input class="w230" type="text" name="ModifyLogisticsPhone" id="ModifyLogisticsPhone" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <button type="submit" id="updateCompany" style="display: none">
            </button>
            <!--content end-->
        </div>
        <% } %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="updateCompany()" type="button">
                    保存</button>
                <button class="reset01-alert" onclick="ModifycompanyClose()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <%--<div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a href="javascript:void(0)"><span>全部（<span id="all"></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <div class="mod-search">
          <div class="con style0list">
            <ul>
              <li>
                <input type="text" id="LogisticsName" placeholder="请输入物流公司名称..." class="search-input">
              </li>
              <li><a id="btnSelect"  class="search-btn" href="#"></a></li>
            </ul>
          </div>
        </div>
    --%>
    <!--操作栏 begin-->
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" id="AddLogisticsCompany" class="btn btn-small fun-a"><i class="icon-add-gray"></i>添加</a>
            <a href="javascript:void(0)" onclick="allDeleteLogisticsCompany(event)" id="AllDeleteLogisticsCompany" class="btn btn-small fun-a"><i class="icon-del-gray"></i>删除</a>
        </div>
        <div class="span3 funbar-r">
            <div class="form-search">
                <div class="bs-docs-example">
                    <input type="text" data-provide="typeahead" id="LogisticsName" placeholder="请输入物流公司名称..." class="input-large search-query">
                    <button class="btn-search" id="btnSelect" type="submit"></button>
                </div>
            </div>
        </div>
    </div>
    <%-- <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="javascript:void(0)" id="AddLogisticsCompany">添加</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="allDeleteLogisticsCompany(event)"
                    id="AllDeleteLogisticsCompany">删除</a></li>
            </ul>
        </div>
    </div>--%>
    <!--操作栏 end-->
    <!--Page Start-->
    <%--<div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>--%>
    <!--Page End-->
    <%-- <div class="clear h10">
    </div>--%>
    <!--列表 Start-->
    <div class="main">
        <div class="mod-table">
            <% 
                Html.RenderAction("LogisticsList", new { LogisticsCompanyPageIndex = 0 });
            %>
        </div>
        <div class="page">
            <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
            <div class="page-select">
                每页显示
       
                    <div class="btn-group dropup">
                        <button class="btn" id="ddlPageSize">15</button>
                        <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                        <ul class="dropdown-menu selectpage" id="numbers">
                             <li><a href="#">15</a></li>
                            <li><a href="#">20</a></li>
                            <li><a href="#">30</a></li>
                            <li><a href="#">40</a></li>
                            <li><a href="#">50</a></li>
                        </ul>
                    </div>
                条
     
            </div>
            <div class="pagination pagination-right" id="turn-ul">
                <%--<ul>
                        <li class="disabled"><a href="#">|&lt;</a></li>
                        <li class="disabled"><a href="#">&lt;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">12</a></li>
                        <li><a href="#">&gt;</a></li>
                        <li><a href="#">&gt;|</a></li>
                    </ul>--%>
            </div>
        </div>
    </div>
    <!--列表 End-->
</asp:Content>
