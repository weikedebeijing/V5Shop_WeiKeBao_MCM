<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%=Combres.WebExtensions.CombresLink("addRoleJs")%>
    <%--<script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script--%>>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/Delivery/logisticsMailAddress.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        var logisticsAddressQuery = new Object();
        logisticsAddressQuery.Groups = new Array(1);
        logisticsAddressQuery.Groups[0] = 'q1';

    </script>
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <%using (Ajax.BeginForm("AddMailAddressLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          { 
        %>
        <span style="display: none" id="HidUpdateTargetId"></span>
         <input type="hidden" name="hideselProvince" id="hideselProvince" />
                <input type="hidden" name="hideselCity" id="hideselCity" />
                <input type="hidden" name="hideselArea" id="hideselArea" />
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">添加收货地址</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="txtContactsError">
                    <label class="control-label" for="inputError">联系人</label>
                    <div class="controls">
                        <input id="txtContacts" name="txtContacts" type="text">
                        <span class="help-inline" id="txtContactsPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="cityError">
                    <label class="control-label" for="inputError">所在地</label>
                    <div class="controls">
                        <select id="selProvince" class="input-small" onchange="GetProvince()" name="selProvince">
                            <% List<V5.MetaData.Area.Model.Area> area = ViewData["Province"] as List<V5.MetaData.Area.Model.Area>;%>
                            <option value="-1">请选择省份</option>
                            <%foreach (var areas in area)
                              {%>
                            <option value="<%:areas.ID %>">
                                <%:areas.Name%></option>
                            <%} %>
                        </select>
                        <select class="input-small" id="selCity" onchange="getSelCity()" name="selCity">
                        </select>
                        <select class="input-small" onchange="getSelArea()" id="selArea" name="selArea">
                        </select>
                        <span class="help-inline" id="cityPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="LogisticsPhoneError">
                    <label class="control-label" for="inputError">详细地址</label>
                    <div class="controls">
                        <input name="LogisticsPhone" id="LogisticsPhone" type="text">
                        <span class="help-inline" id="LogisticsPhonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtZipCodeError">
                    <label class="control-label" for="inputError">邮政编码</label>
                    <div class="controls">
                        <input name="txtZipCode" id="txtZipCode" type="text">
                        <span class="help-inline" id="txtZipCodePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtZoneError">
                    <label class="control-label" for="inputError">固定电话</label>
                    <div class="controls">
                        <input id="txtZone" name="txtZone" maxlength="4" class="input-small" type="text">
                        <input name="txtTelephone" id="txtTelephone" type="text" />
                        <span class="help-inline" id="txtZonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtCellphoneError">
                    <label class="control-label" for="inputError">手机</label>
                    <div class="controls">
                        <input name="txtCellphone" id="txtCellphone" type="text">
                        <span class="help-inline" id="txtCellphonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="txtCompsanyError">
                    <label class="control-label" for="inputError">公司名称</label>
                    <div class="controls">
                        <input name="txtCompsany" id="txtCompsany" type="text">
                        <span class="help-inline" id="txtCompsanyPrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="addBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button class="submit01-alert" style="display: none" id="addSubmit" type="submit" onclick="afterOnSuccess()">
                保存</button>
        </div>
        <%} %>
    </div>
    <%--<div id="gray-add-prize" style="display: none">
        <%using (Ajax.BeginForm("AddMailAddressLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          { 
        %>
        <div style="width: 600px; height: 290px;" class="content scroll">
            <div>
               <span style="display:none" id="HidUpdateTargetId"></span>
                <input type="hidden" name="hideselProvince" id="hideselProvince" />
                <input type="hidden" name="hideselCity" id="hideselCity" />
                <input type="hidden" name="hideselArea" id="hideselArea" />
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>联系人</label></div>
                                <div class="float-l">
                                    <input class="w230" type="text" id="txtContacts" name="txtContacts" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        所在地</label></div>
                                <div class="float-l">
                                    <select class="v5-select" id="selProvince" onchange="GetProvince()" name="selProvince">
                                        <% List<V5.MetaData.Area.Model.Area> area = ViewData["Province"] as List<V5.MetaData.Area.Model.Area>;%>
                                        <option value="-1">请选择省份</option>
                                        <%foreach (var areas in area)
                                          {%>
                                        <option value="<%:areas.ID %>">
                                            <%:areas.Name%></option>
                                        <%} %>
                                    </select>
                                    <select class="v5-select" id="selCity" onchange="getSelCity()" name="selCity">
                                    </select>
                                    <select class="v5-select" onchange="getSelArea()" id="selArea" name="selArea">
                                    </select>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        详细地址</label></div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="LogisticsPhone" id="LogisticsPhone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        邮政编码</label></div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="txtZipCode" id="txtZipCode" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        固定电话</label></div>
                                <div class="float-l">
                                    <input class="w30" type="text" id="txtZone" name="txtZone" maxlength="4" />
                                    <input class="w230" type="text" name="txtTelephone" id="txtTelephone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        手机</label></div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="txtCellphone" id="txtCellphone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        公司名称</label></div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="txtCompsany" id="txtCompsany" />
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
       <button class="submit01-alert"  style="display: none" id="addSubmit" type="submit" onclick="afterOnSuccess()">
                    保存</button>
        <% } %>
             <div class="btn">
            <div class="indiv">
                <button class="submit01-alert" id="addHid" >
                    保存</button>
                <button class="reset01-alert" onclick="closeAddress()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <div style="display: none;" id="editModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <%using (Ajax.BeginForm("UpdataMailAddressLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "ModifyAjaxForm", OnSuccess = "ModifyafterOnSuccess", OnFailure = "ModifyafterOnFailure", UpdateTargetId = "ModifyHidUpdateTargetId" }))
          { 
        %>
        <input type="hidden" id="ModifyHidUpdateTargetId" />
        <input type="hidden" name="ModifyhideselProvince" id="ModifyhideselProvince" />
        <input type="hidden" name="ModifyhideselCity" id="ModifyhideselCity" />
        <input type="hidden" name="ModifyhideselArea" id="ModifyhideselArea" />
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">编辑收货地址</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="ModifytxtContactsError">
                    <label class="control-label" for="inputError">联系人</label>
                    <div class="controls">
                        <input id="ModifytxtContacts" name="ModifytxtContacts" type="text">
                        <span class="help-inline" id="ModifytxtContactsPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifyCityError">
                    <label class="control-label" for="inputError">所在地</label>
                    <div class="controls">
                        <select class="input-small" id="ModifyselProvince" onchange="selProvince()" name="ModifyselProvince">
                        </select>
                        <select class="input-small" id="ModifyselCity" onchange="selCity()" name="ModifyselCity">
                        </select>
                        <select class="input-small" id="ModifyselArea" onchange="selArea()" name="ModifyselArea">
                        </select>
                        <span class="help-inline" id="ModifyCityPrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifyLogisticsPhoneError">
                    <label class="control-label" for="inputError">详细地址</label>
                    <div class="controls">
                        <input name="ModifyLogisticsPhone" id="ModifyLogisticsPhone">
                        <span class="help-inline" id="ModifyLogisticsPhonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifytxtZipCodeError">
                    <label class="control-label" for="inputError">邮政编码</label>
                    <div class="controls">
                        <input name="ModifytxtZipCode" id="ModifytxtZipCode" type="text">
                        <span class="help-inline" id="ModifytxtZipCodePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifytxtZoneError">
                    <label class="control-label" for="inputError">固定电话</label>
                    <div class="controls">
                        <input id="ModifytxtZone" name="ModifytxtZone" maxlength="4" class="input-small" type="text">
                        <input name="ModifytxtTelephone" maxlength="8" id="ModifytxtTelephone" type="text" />
                        <span class="help-inline" id="ModifytxtZonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifytxtCellphoneError">
                    <label class="control-label" for="inputError">手机</label>
                    <div class="controls">
                        <input name="ModifytxtCellphone" id="ModifytxtCellphone" type="text">
                        <span class="help-inline" id="ModifytxtCellphonePrompt" style="display: none;"></span>
                    </div>
                </div>
                <div class="control-group" id="ModifytxtCompsanyError">
                    <label class="control-label" for="inputError">公司名称</label>
                    <div class="controls">
                        <input name="ModifytxtCompsany" id="ModifytxtCompsany" type="text">
                        <span class="help-inline" id="ModifytxtCompsanyPrompt" style="display: none;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="editBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button style="display: none" class="submit01-alert" type="submit" id="Modifybtn">
                保存</button>
            <input type="hidden" name="hidAddressID" id="hidAddressID" />
        </div>
        <%} %>
    </div>
    <%--<div id="gray-modify-prize" style="display: none">
        <%using (Ajax.BeginForm("UpdataMailAddressLogistics", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "ModifyAjaxForm", OnSuccess = "ModifyafterOnSuccess", OnFailure = "ModifyafterOnFailure", UpdateTargetId = "ModifyHidUpdateTargetId" }))
          { 
        %>
        <div style="width: 600px; height: 290px;" class="content scroll">
            <div>
                <input type="hidden" id="ModifyHidUpdateTargetId" />
                <input type="hidden" name="ModifyhideselProvince" id="ModifyhideselProvince" />
                <input type="hidden" name="ModifyhideselCity" id="ModifyhideselCity" />
                <input type="hidden" name="ModifyhideselArea" id="ModifyhideselArea" />
                <!--content begin-->
                <div class="mod-form ">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>联系人</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" id="ModifytxtContacts" name="ModifytxtContacts" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        所在地</label>
                                </div>
                                <div class="float-l">
                                    <select class="width:100px" id="ModifyselProvince" onchange="selProvince()" name="ModifyselProvince">
                                    </select>
                                    <select class="width:100px" id="ModifyselCity" onchange="selCity()" name="ModifyselCity">
                                    </select>
                                    <select class="width:100px" id="ModifyselArea" onchange="selArea()" name="ModifyselArea">
                                    </select>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        详细地址</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="ModifyLogisticsPhone" id="ModifyLogisticsPhone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        邮政编码</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="ModifytxtZipCode" id="ModifytxtZipCode" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        固定电话</label>
                                </div>
                                <div class="float-l">
                                    <input class="w30" type="text" maxlength="4" name="ModifytxtZone" id="ModifytxtZone" />
                                    <input class="w130" type="text" name="ModifytxtTelephone" maxlength="8" id="ModifytxtTelephone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        手机</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="ModifytxtCellphone" id="ModifytxtCellphone" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        公司名称</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" name="ModifytxtCompsany" id="ModifytxtCompsany" />
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
        <input type="hidden" name="hidAddressID" id="hidAddressID" />
        <button style="display: none" class="submit01-alert" type="submit" id="Modifybtn">
            保存</button>
        <% } %>
        <div class="btn">

            <div class="indiv">
                <button class="submit01-alert" id="ModifySubmit">
                    保存</button>
                <button class="reset01-alert" onclick="modifyCloseAddress()">
                    关闭</button>
            </div>
        </div>
    </div>--%>
    <%-- <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a class="c16" href="javascript:void(0)"><span>全部（<span id="all"></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" id="LogisticsName" placeholder="请输入联系人名称..." class="search-input"
                        name="">
                </li>
                <li><a class="search-btn" id="btnSelect" href="javascript:void(0)"></a></li>
            </ul>
        </div>
    </div>
    --%>
    <!--操作栏 begin-->
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" id="addLogisticsMailAddress" class="btn btn-small fun-a"><i class="icon-add-gray"></i>添加</a>
            <a href="javascript:void(0)" onclick="allDelete(event)" class="btn btn-small fun-a"><i class="icon-del-gray"></i>删除</a>
        </div>
        <div class="span3 funbar-r">
            <div class="form-search">
                <div class="bs-docs-example">
                    <input type="text" data-provide="typeahead" id="LogisticsName" placeholder="请输入联系人名称..." class="input-large search-query">
                    <button class="btn-search" id="btnSelect" type="submit"></button>
                </div>
            </div>
        </div>
    </div>
    <%-- <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="javascript:void(0)" id="addLogisticsMailAddress">添加</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="allDelete(event)">删除</a></li>
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
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>--%>
    <!--Page End-->
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div class="main">
        <div class="mod-table">
            <% 
                Html.RenderAction("GetMailAddressLogistics", new { LogisticsAddressPageIndex = 0 });
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
