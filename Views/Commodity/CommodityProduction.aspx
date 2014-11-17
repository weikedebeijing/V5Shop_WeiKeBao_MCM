<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Commodity/commodityProductionjs.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <input type="hidden" id="HidUpdateTargetId" value='' />
   <span style="display:none" id="editHidUpdateTargetId"/>
    <div id="gray-add-prize" class="gray-bg" style="display: none">
        <%using (Ajax.BeginForm("AddProductLine", "Commodity", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          { 
          
        %>
        <div style="width: 600px; height: 300px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span><label>产品线名称:</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtProduct" id="txtProduct" class="w150" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span><label>经销折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        零售折扣×</label>
                                    <input class="w150" type="text" name="txtWholeSalePriceRate" id="txtWholeSalePriceRate">%</div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span>
                                    <label>
                                        代销折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        零售折扣×</label>
                                    <input class="w150" type="text" name="txtDistributionPriceRate" id="txtDistributionPriceRate">%</div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <!--only coupon display begin-->
                            <li class="list-li">
                                <div class="float-l w120">
                                    <span class="star">*</span>
                                    <label>
                                        建议零售折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        建议零售折扣×</label>
                                    <input class="w150" type="text" name="txtSalesPriceRate" id="txtSalesPriceRate" style="width: 54px">%
                                    -
                                    <input class="v5-input w150" type="text" name="txtSalesPriceRate1" id="txtSalesPriceRate1"
                                        style="width: 54px">%</div>
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
        <div class="btn">
            <div class="indiv">
                <button type="submit" name="Submit" value="Submit" class="submit01-alert r10">
                    保存</button>
                <button class="reset01-alert" onclick="closeCommodtyProduction()">
                    关闭</button>
            </div>
        </div>
        <% } %>
    </div>
    <div id="gray-edit-prize" class="gray-bg" style="display: none">
        <%using (Ajax.BeginForm("UpdateProductLine", "Commodity", new AjaxOptions() { HttpMethod = "post", OnBegin = "editAjaxForm", OnSuccess = "editafterOnSuccess", OnFailure = "editafterOnFailure", UpdateTargetId = "editHidUpdateTargetId" }))
          { 
          
        %>
           <input type="hidden" id="edithidUpdateId" name="edithidUpdateId"/>
        <div style="width: 600px; height: 300px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span><label>产品线名称:</label></div>
                                <div class="float-l">
                                    <input type="text" name="edittxtProduct" id="edittxtProduct" class="w150" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span><label>经销折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        零售折扣×</label>
                                    <input class="w150" type="text" name="edittxtWholeSalePriceRate" id="edittxtWholeSalePriceRate">%</div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w90">
                                    <span class="star">*</span>
                                    <label>
                                        代销折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        零售折扣×</label>
                                    <input class="w150" type="text" name="edittxtDistributionPriceRate" id="edittxtDistributionPriceRate">%</div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <!--only coupon display begin-->
                            <li class="list-li">
                                <div class="float-l w120">
                                    <span class="star">*</span>
                                    <label>
                                        建议零售折扣：</label></div>
                                <div class="float-l">
                                    <label>
                                        建议零售折扣×</label>
                                    <input class="w150" type="text" name="edittxtSalesPriceRate" id="edittxtSalesPriceRate"
                                        style="width: 54px">% -
                                    <input class="v5-input w150" type="text" name="edittxtSalesPriceRate1" id="edittxtSalesPriceRate1"
                                        style="width: 54px">%</div>
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
        <div class="btn">
            <div class="indiv">
                <button type="submit" name="Submit" value="Submit" class="submit01-alert r10">
                    保存</button>
                <button class="reset01-alert" onclick="closeeditCommodtyProduction()">
                    关闭</button>
            </div>
        </div>
        <% } %>
    </div>
    <div class="mod-tab t20">
        <div class="con style0big">
            <ul>
                <%--         <li><a href="../Commodity/CommodityConvention">常规</a></li>--%>
                <li><a href="../Commodity/CommodityClassify?appCode=C002&MenuCode=C135">分类</a></li>
                <%--<li><a>标签</a></li>--%>
                <li class="current"><a class="c16" href="../Commodity/CommodityProduction">产品线</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" id="Add" href="javascript:void(0)">添加</a></li>
                <li><a class="a-btn" onclick="DeleteAll(event)" href="javascript:void(0)" id="DeleteAll">
                    删除</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <%-- <ul class="turn-ul">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>--%>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>
    <!--列表 Start-->
    <div class="clear h10">
    </div>
    <div class="mod-table">
        <% Html.RenderAction("GetBrand", new { CurrentPageIndex = 0 });%>
    </div>
</asp:Content>
