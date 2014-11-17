<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/Js/Common.js"></script>
    <script src="../../Scripts/Commodity/commodtyClassifyjs.js" type="text/javascript"></script>
    <script type="text/javascript">
        var ClassifyQuery = new Object();
        ClassifyQuery.Groups = new Array(1);


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="gray-add-prize" style="display: none">
        <span style="display: none" id="HidUpdateTargetId"></span>
        <span style="display: none" id="editHidUpdateTargetId"></span>
        <%using (Ajax.BeginForm("AddCommodity", "Commodity", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFrom", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          {  %>
        <div style="width: 500px; height: 200px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>店铺名称:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w242" id="IrrigationDitch" name="selIrrigationDitch">
                                    </select>
                                    <input type="hidden" id="hidIrrigationDitch" name="hidIrrigationDitch" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                      <li class="list-li"style="display:none">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>上级分类:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w242" id="selClassify" onchange="changeselClassify()" name="selClassify">
                                    </select>
                                    <input type="hidden" id="hidClassify" name="hidClassify" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star"></span>
                                    <label>
                                        分类名称:</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230 " type="text" id="texName" name="texName">
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
        <button style="display: none" name="Submit" id="submit" value="Submit" class="submit01-alert r10">
            保存</button>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button type="button" id="btn" class="submit01-alert r10">
                    保存</button>
                <button class="reset01-alert" onclick="closeCommodtyClassify()">
                    关闭</button>
            </div>
        </div>
    </div>
    <div id="gray-edit-prize" style="display: none">
        <%using (Ajax.BeginForm("UpdataCommodity", "Commodity", new AjaxOptions() { HttpMethod = "post", OnBegin = "editAjaxFrom", OnSuccess = "editafterOnSuccess", OnFailure = "editafterOnFailure", UpdateTargetId = "editHidUpdateTargetId" }))
          { 
        %>
        <div style="width: 500px; height: 200px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>店铺名称:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w242" id="editselIrrigationDitch" name="editselIrrigationDitch">
                                    </select>
                                    <input type="hidden" id="edithidIrrigationDitch" name="edithidIrrigationDitch" />
                                    <%--value="<%=productCategory.ChannelCode %>"--%>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li" style="display:none">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>上级分类:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w242" id="editselClassify" onclick="selClassify()" name="editselClassify">
                                    </select>
                                    <input type="hidden" id="edithidClassify" name="edithidClassify" />
                                    <input type="hidden" name="editCategoryId" id="editCategoryId" /><%--value="<%=productCategory.ID %>"--%>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star"></span>
                                    <label>
                                        分类名称:</label>
                                </div>
                                <div class="float-l">
                                    <input class="w230" type="text" id="edittexName" name="edittexName" />
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
        <button name="Submit" style="display: none" value="Submit" id="editsubmit" class="submit01-alert r10">
            保存</button>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button name="Submit" value="button" id="editbtn" class="submit01-alert r10">
                    保存</button>
                <button class="reset01-alert" onclick="closeeditCommodtyClassify()">
                    关闭</button>
            </div>
        </div>
    </div>
    <%   List<V5.MetaData.Product.Messaging.Classify> classify = ViewData["GetOpenedOrSum"] as List<V5.MetaData.Product.Messaging.Classify>;  %>
    <div class="mod-tab t20" style="display: none">
        <div class="con style0big">
            <ul>
                <%--     <li><a href="../Commodity/CommodityConvention">常规</a></li>--%>
                <li class="current"><a class="c16" href="../Commodity/CommodityClassify?appCode=C002&MenuCode=C135">分类</a></li>
                <%--<li><a>标签</a></li>--%>
                <li><a href="../Commodity/CommodityProduction">产品线</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-tab t20">
        <div class="con style0big" id="status">
            <ul>
                <%foreach (var item in classify)
                  {
                %>
                <li class="current" name="Shop" dir="<%=item.ChannelCode %>"><a href="javascript:void(0)">
                    <%=item.Name %>（<%=item.Count%>）</a></li>
                <%  } %>
            </ul>
        </div>
    </div>
    <div class="mod-operate t20" id="Operate">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="javascript:void(0)" id="Add">添加</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="allDelectClassify(event,'more')"
                    id="AllDelectClassify">删除</a></li>
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
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <div class="mod-table">
        <%   Html.RenderAction("CategoryList", new { CategoryPageIndex = 0 }); %>
    </div>
    <script type="text/javascript">

        var appCode = GetUrlAppCode();
        var menuCode = GetUrlMenuCode();
        if (appCode == 'PLATFORM' && appCode != "" && appCode != null) {


            $(".mod-tab t20").hide();
        }
        else if (appCode == 'C002' && appCode != "" && appCode != null) {
            $(".mod-tab t20").css("display", "block");

            $(".mod-tab t20 ul li").show();



        }

    </script>
    <!--Left End-->
    <script type="text/javascript">
        $(function () {
            //            if (appCode == "C002") {
            //                $("#status>ul>li[dir='C002']").trigger("click");
            //            }
            if (appCode == "PLATFORM") {
                $("#status>ul>li[dir='C001']").trigger("click");
            }
        });
    </script>
</asp:Content>
