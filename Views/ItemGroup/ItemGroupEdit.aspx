<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <%--添加成功后把结果放到<span>标签中--%>
          <div class="mod-title">
                <div>
                    <div class="Loading" style="display: none;">
                        <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                    </div>
                </div>
            </div>
        <div class="mod-form">
            <!--title begin-->
            <div class="mod-title">
                <a href="/ItemGroup/ItemGroupList" title="返回">
                    <button type="button" class="returnBtn t5">
                        返回</button></a><span class="spanTitle">商品组设置</span>
            </div>
            <!--title end-->
            <%--<%using (Ajax.BeginForm("ItemGroupEdit", "ItemGroup", new { }, new AjaxOptions() { HttpMethod = "post", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>--%>
            <div class="con style01">
                <dl>
                    <dt class="w130" style="font-size: 14px">分组名称:</dt>
                    <dd class="l130">
                        <% if (ViewData["SysGroupName"] != null)
                           { %>
                        <span style="font-size: 14px">
                            <%:ViewData["SysGroupName"] %></span>
                        <%} %>
                    </dd>
                    <dt class="w130">
                        <select class="v5-select" id="ProductType" name="productCategoryType">
                            <option>商品分类</option>
                            <%var productCategorys = (List<V5.MetaData.Product.Model.ProductCategory>)ViewData["productCategorys"]; %>
                            <%foreach (var pCategory in productCategorys)
                              {%>
                            <option value="<%:pCategory.ID %>">
                                <%:pCategory.Name %></option>
                            <%} %>
                        </select>
                    </dt>
                    <dd class="l130" id="dd_Search">
                        <input type="text" class="v5-input w150" id="txtSearch" value="请输入商品名称或商家编码" />
                        <button type="button" class="submit01" onclick="javascript:btnSearch();">
                            查询</button>
                    </dd>
                    <!------------------------局部试图开始-->
                    <div class="mod-customer-cx">
                        <div class="mod-table">
                            <div id="ItemGroupList">
                                <%-- 此处是局部试图--%>
                            </div>
                        </div>
                    </div>
                    <!------------------------局部试图结束-->
                    <div style="margin-bottom:40px;">
                        <button type="button" class="submit01 t10" onclick="javascript:saveAll();">
                            保存</button>
                        <%--<button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel();" />
                        <%--class="submit01 w70 t10 fb l54"
                        取消</button>--%>
                    </div>
                   <span id="UpdateTargetHiddenID" style="display: none"></span>
                    <input type="hidden" id="SysGroupID" value="<%:ViewData["SysGroupID"] %>" />
                </dl>
            </div>
        </div>
    </body>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");

            // 查询文本框事件
            txtTips();

            // 初始加载
            innitEvent();
        });

        // 点击保存
        function saveAll() {
            // 调用试图中的方法
            var sendDatas = submitConfirm();
            if (sendDatas.length <=0){
            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
            $("#operateTip").html("没有要编辑的商品数据").change();
                return false;
            }

            var SysGroupID = $("#SysGroupID").val();
            $.ajax({
                url: "/ItemGroup/ItemGroupEdit",
                data: {"sendDatas":sendDatas,"SysGroupID":SysGroupID},
                type:"post",
                success:function(returnData){
                   if (returnData == "ok"){
                   $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html("保存成功").change();
                   }
                },
            });
        };

        // 初始加载
        function innitEvent() {
            LoadTitle();
        };

        function LoadTitle() {
            // 第一次加载表头
            $.ajax({
                url: "/ItemGroup/GetItemGroupView",
                data: { "ProductType": "", "txtSearch": "" },
                type: "post",
                dataType: "html",
                success: function (returnData) {
                    if (returnData == "no result") {
                        return;
                    } else if (returnData != null) {
                        $("#ItemGroupList").html(returnData);
                    }
                }
            });
        };

        
        // 点击查询时触发
        function btnSearch() {

            // 获取当前选中的商品分类 的ID
            var categoryID = $("#ProductType").val();

            // 获取当前搜索文本中的值
            var txtSearch = $("#txtSearch").val();

            if (ProductType == "商品分类" && txtSearch == "请输入商品名称或商家编码") { // 不返回任何结果
                return;
            }

            $.ajax({
                url: "/ItemGroup/GetItemGroupView",
                data: { "categoryID": categoryID, "txtSearch": txtSearch },
                type: "post",
                dataType: "html",
                success: function (returnData) {
                    if (returnData == "no result") {
                        return;
                    } else if (returnData != null) {
                        $("#ItemGroupList").html(returnData);
                    }
                }
            });


        };

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "/ItemGroup/ItemGroupList";
        };

        // 查询文本框的事件
        function txtTips() {
            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入商品名称或商家编码") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#txtSearch").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入商品名称或商家编码");
                }
            });
        }

    </script>
</asp:Content>
