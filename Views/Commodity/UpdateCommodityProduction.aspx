<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <style type="text/css">
        .l150
        {
            margin: 149px;
        }
        .l155
        {
            margin: 169px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  V5.MetaData.Product.Model.ProductLine productLine = ViewData["productLine"] as V5.MetaData.Product.Model.ProductLine; %>
    <div class="mod-title">
        <div class="con style03">
            <div class="con style0h1">
                <a href="../../Commodity/CommodityProduction" title="返回" class="a-btn float-l"><i
                    class="icon-back t6"></i></a>
                <h1 class="spanTitle">
                    修改产品线</h1>
            </div>
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
            <%using (Ajax.BeginForm("UpdateProductLine", "Commodity", new AjaxOptions() { HttpMethod = "post", OnSuccess = "afterOnSuccess", OnBegin = "AjaxForm", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
              { 
          
            %>
            <div class="con style01">
               <span style="display:none" id="HidUpdateTargetId"></span>
                <input type="hidden" id="hidUpdateId" name="hidUpdateId" value="<%=productLine.ID %>" />
                <dl>
                    <dt>产品线名称<span style="color: Red;">*</span></dt>
                    <dd class="l155">
                        <input type="text" name="txtProduct" id="txtProduct" value="<%=productLine.Name %>"
                            class="v5-input w150" />
                        <span class="spMessage"></span>
                    </dd>
                    <dt>经销折扣：<span style="color: Red;">*</span>零售折扣× </dt>
                    <dd class="l150" style="padding-left: 20px">
                        <input class="v5-input w150" type="text" name="txtWholeSalePriceRate" value="<%=productLine.WholeSalePriceRate %>"
                            id="txtWholeSalePriceRate">%
                    </dd>
                    <dt>代销折扣：<span style="color: Red;">*</span>零售折扣×</dt>
                    <dd class="l150" style="padding-left: 20px">
                        <input class="v5-input w150" type="text" name="txtDistributionPriceRate" value="<%=productLine.DistributionPriceRate %>"
                            id="txtDistributionPriceRate">% <span class="spMessage">
                        </span>
                    </dd>
                    <dt>建议零售折扣：<span style="color: Red;">*</span>建议零售折扣×</dt>
                    <dd class="l130" style="padding-left: 20px">
                        <input class="v5-input w150" type="text" name="txtSalesPriceRate" value="<%=productLine.SalesPriceRateMin %>"
                            id="txtSalesPriceRate" style="width: 54px">% - <input class="v5-input w150" type="text"
                                name="txtSalesPriceRate1" value="<%=productLine.SalesPriceRateMax %>" id="txtSalesPriceRate1" style="width: 54px">%<span class="spMessage"></span>
                    </dd>
                    <dt class="w130"></dt>
                    <dd class="l130" style="margin-left: 150px;">
                        <button type="submit" class="submit01 t10" name="Submit" value="Submit">
                            保存</button>
                        <button type="button" class="reset02 l10 t10" onclick="javascript:btnCancel();">
                            取消</button>
                    </dd>
                    <%--         <dt class="w130">
                        <button type="button" class="submit01">
                            取消</button>
                    </dt>--%>
                </dl>
            </div>
            <% } %>
        </div>
    </div>
    <div id="ModifySuccess" style="display: none" title="提示">
        修改成功
    </div>
    <div id="ModifyAborted" style="display: none" title="提示">
        修改失败
    </div>
    <script type="text/javascript">
        function afterOnSuccess() {
            if ($("#HidUpdateTargetId").html() == "ok") {
                $(".spMessage").text("");
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("修改成功！").change();
                $("input").val("");

            }
        }
        function afterOnFailure() {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
            $("#operateTip").html("添加失败！").change();

        };

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "../../Commodity/CommodityProduction";
        };





        function AjaxForm() {

            if ($("#txtProduct").val() == "") {
                $("#txtProduct").focus();
                $(".spMessage").text("");
                $("#txtProduct").siblings(".spMessage").text("请输入产品线名称");
                return false;
            }


            else if ($("#txtWholeSalePriceRate").val() == "") {
                $("#txtWholeSalePriceRate").focus();
                $(".spMessage").text("");
                $("#txtWholeSalePriceRate").siblings(".spMessage").text("请输入经销商折扣");
                return false;
            }
            else if ($("#txtDistributionPriceRate").val() == "") {
                $("#txtDistributionPriceRate").focus();
                $(".spMessage").text("");
                $("#txtDistributionPriceRate").siblings(".spMessage").text("请输入代销商折扣");
                return false;
            }
            else if ($("#txtSalesPriceRate").val() == "" || $("#txtSalesPriceRate1").val() == "") {

                $(".spMessage").text("");
                $("#txtSalesPriceRate").siblings(".spMessage").text("请输入建议零售价格");
                return false;
            }


            else if (isNaN($("#txtWholeSalePriceRate").val())) {
                $("#txtWholeSalePriceRate").focus();
                $(".spMessage").text("");
                $("#txtWholeSalePriceRate").siblings(".spMessage").text("请输入数字类型");
                return false;
            }
            else if (isNaN($("#txtDistributionPriceRate").val())) {
                $("#txtDistributionPriceRate").focus();
                $(".spMessage").text("");
                $("#txtDistributionPriceRate").siblings(".spMessage").text("请输入数字类型");
                return false;
            }
            else if (isNaN($("#txtSalesPriceRate").val()) || isNaN($("#txtSalesPriceRate").val())) {

                $(".spMessage").text("");
                $("#txtSalesPriceRate").siblings(".spMessage").text("请输入数字类型");
                return false;
            }

        }

 
    </script>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  V5.MetaData.Product.Model.ProductLine productLine = ViewData["productLine"] as V5.MetaData.Product.Model.ProductLine; %>
    <% List<V5.MetaData.Product.Model.ProductType> productTypeList = ViewData["BrandInProduct"] as List<V5.MetaData.Product.Model.ProductType>; %>
    <div class="MCM-C-M ">
        <!--title begin-->
        <div class="mod-title">
            <div class="con style03">
                <a href="../../Commodity/CommodityProduction" title="返回" class="icon-back r10"></a>
                <h2>
                    修改商品产品线</h2>
            </div>
        </div>
        <!--title end-->
    </div>
    <div class="mod-title">
        <div class="con style01">
            <h1>
                商品类目-品牌</h1>
        </div>
    </div>
    <div class="mod-table">
        <ul class="float-l l10">
            <%foreach (var productType in productTypeList)
              {
             
            %>
            <li class="h23">
                <input id="cpx-lm-01" name="ProductType" value="<%=productType.TBCID %>" type="checkbox" />
                <span>
                    <%=productType.Name%></span> </li>
            <%  } %>
        </ul>
        <ul class="float-l l10">
        </ul>
    </div>
    <!--添加内容 开始-->
    <div class="h15">
    </div>
    <div class="mod-title">
        <div class="con style01">
            <h1>
                产品线名称</h1>
        </div>
        <ul class="l10">
            <li class="w100 h23">
                <input class="v5-input w210 float-l" type="text" id="textProductLine" value="<%=productLine.Name %>" />
            </li>
            <li class="w100 h23">
                <button class="submit01 t10" type="button">
                    &nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</button>
            </li>
        </ul>
    </div>
    <input type="hidden" id="hidProductLineBrand" />
    <input type="hidden" id="hidProductTypeID" />
    <input type="hidden" id="hidBrandID" />
    <script type="text/javascript">
     
        var entity = $.parseJSON('<%=ViewData["ProductLineBrand"] %>');
        //克隆实体类
        function clone(myObj) {
            if (typeof (myObj) != 'object') return myObj;
            if (myObj == null) return myObj;
            var myNewObj = new Object();
            for (var i in myObj) myNewObj[i] = clone(myObj[i]);
            return myNewObj;
        }
        $(function () {

            var TBCID = "";
            var sumName = "";
            var BrandID = "";
        
            if (entity.productLineBrandList != null) {

                $("[name='ProductType']").each(function () {

                    for (var i = 0; i < entity.productLineBrandList.length; i++) {
                        if ($(this).val() == entity.productLineBrandList[i].TBCID) {
                            $(this).attr("checked", "checked");
                            TBCID = $(this).val();
                            sumName = $(this).siblings("span").text() + ":";
                            $("#hidProductTypeID").val($(this).val());
                        }
                        else { $(this).attr("checked", false); }
                    }
                })
                $.ajax({
                    type: "post",
                    url: "../../Commodity/GetProductBrand",
                    data: { "srt": TBCID },
                    dataType: "json",
                    success: function (jsonRes) {
                        var str = "";
                        if (jsonRes != "" && jsonRes != undefined) {
                            for (var i = 0; i < jsonRes.length; i++) {

                                str += "<li class='h23'> <input id='cpx-lm-05' Name='Brand' onchange='Brand(this)'  type='checkbox' value='" + jsonRes[i].ID + "'><label >" + jsonRes[i].Name + "</label>   </li>";
                            }
                            $(".mod-table ul").next("ul").html(str);

                            for (var i = 0; i < entity.productLineBrandList.length; i++) {
                                $("[Name='Brand']").each(function () {
                                    if ($(this).val() == entity.productLineBrandList[i].BrandID) {
                                        sumName += $(this).siblings().text() + ",";
                                        $("#hidProductLineBrand").val(sumName);
                                        BrandID += $(this).val() + ",";

                                        $("#hidBrandID").val(BrandID);
                                        $(this).attr("checked", "checked")


                                    }


                                })

                            }
                        }


                    }

                });


            }


        })


        var str = "";
        $("input[name='ProductType']").change(function () {

            $("input[name='ProductType']").attr('checked', false);
            $(this).attr('checked', "checked");
            if ($(this).attr("checked") == "checked") {
                str = $(this).siblings("span").text() + ":";
                $("#hidProductTypeID").val($(this).val());
                $.ajax({
                    type: "post",
                    url: "../../Commodity/GetProductBrand",
                    data: { "srt": $(this).val() },
                    dataType: "json",
                    success: function (jsonRes) {
                        var str = "";
                        if (jsonRes != "" && jsonRes != undefined) {
                            for (var i = 0; i < jsonRes.length; i++) {
                                str += "<li class='h23'> <input id='cpx-lm-05' Name='Brand' onchange='Brand(this)'  type='checkbox' value='" + jsonRes[i].ID + "'><label >" + jsonRes[i].Name + "</label>   </li>";
                            }

                            $(".mod-table ul").next("ul").html(str);

                        }
                        else { $("li", $("input[name='ProductType']").parents("ul").siblings("ul")).remove(); }

                    }

                });
            }

            else {
                //$(".mod-table ul").next().next().remove();
                $("li", $(this).parents("ul").siblings("ul")).remove();
            }
        });



        var brandiD = "";
        function Brand(a) {
            if ($(a).attr("checked") == "checked") {
                $("#hidProductLineBrand").val(str += $(a).next().text() + "、");
                brandiD += $(a).val() + ",";
                $("#hidBrandID").val(brandiD);
            }

        }



        $(".submit01").click(function () {
        
            var ProductTypeName = "";
            var ProductTypevalues = $("input[name='ProductType']:checked").val();

            $("input[name='ProductType']:checked").each(function () {

                ProductTypeName = $(this).siblings("span").text() + ":";

            });
            var productLineView = $.parseJSON('<%=ViewData["ProductLineView"] %>');
            var newproductLineView = clone(productLineView);
            newproductLineView.productLineBrandList = new Array();
            newproductLineView.productLine.Name = $("#textProductLine").val();
            newproductLineView.productLine.ID = '<%=  ViewData["ID"] %>';

            $("input[Name='Brand']").each(function () {
                var newproductLineBrandList = clone(productLineView.productLineBrandList[0])
                newproductLineBrandList.TBCID = ProductTypevalues;
                newproductLineBrandList.BrandID = $(this).val();
                newproductLineView.productLineBrandList.push(newproductLineBrandList);
                ProductTypeName += $(this).siblings().text() + ",";

            });
            newproductLineView.productLine.Description = ProductTypeName.substring(0, ProductTypeName.length - 1);

            $.ajax({
                type: "post",
                url: "../../Commodity/UpdateProductLine",
                data: { "ProductLineStr": JSON.stringify(newproductLineView) },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        alert("操作成功");
                        str = "";
                        brandiD = "";

                    }

                }
            });
        });
    </script>
</asp:Content>--%>
