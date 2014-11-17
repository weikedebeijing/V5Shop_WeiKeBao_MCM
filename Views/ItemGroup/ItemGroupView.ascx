<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%var products = Model.DataSource; %>
<div class="mod-table-head">
    <div class="con style01">
        <table cellspacing="0" cellpadding="0" border="0">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tr>
                <th>
                    <label>
                        <input type="checkbox" style="display:none;" value="" name="" id="ckallChecked" />
                    </label>
                </th>
                <th class="x-tab">
                    商品名称
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>原价
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>商家编码
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>库存
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>排序
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>操作
                </th>
                <th>
                </th>
            </tr>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line" style="height: auto">
        <table cellspacing="0" cellpadding="5" border="0" id="ItemGroup">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <% foreach (var product in products)
               {%>
            <tr class="tr-Current" id="str_<%:product.ID %>">
                <td>
                    <div class="cell">
                        <label>
                            <input id="checkbox_<%:product.ID %>" style="display:none;" type="checkbox" value="<%:product.ID %>" name="productID" />
                        </label>
                    </div>
                </td>
                <td>
                    <div class="cell">
                        <%:product.Name%></div>
                </td>
                <td>
                    <div class="cell" name="SalesPrice">
                        <%:product.SalesPrice%></div>
                </td>
                <td>
                    <div class="cell">
                        <%:product.OuterCode%></div>
                </td>
                <td>
                    <div class="cell">
                        <%:product.Stock%></div>
                </td>
                <td>
                    <div class="cell">
                        <input name="SortOrder" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                            class="w50 h20" type="text" />
                    </div>
                </td>
                <td>
                    <div class="cell">
                        <span class="c07"><a href="#" onclick="javascript:DeleteRow(event);">删除</a> </span>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <%} %>
        </table>
        <input type="hidden" id="sendDatas" name="sendDatas" />
        <input type="hidden" id="isReductionValidate" name="isReductionValidate" />
        <%--<input type="button" id="part-ReductionTest" value="test" onclick="javascript:btnReductConfirm();" />--%>
    </div>
</div>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">


    // 主页面提交时触发的事件  （如果没有赋值排序的ID 默认就是0,要根据 productID 找 sortOrder 因为sortOrder可以不填写）
    function submitConfirm() {
        var productIDs = $("input[name=productID]");

        var sendDatas = "";
        var productID = "";
        var sortOrderID = "";
        for (var i = 0; i < productIDs.length; i++) {
            productID = $(productIDs[i]);

            sortOrderID = $("input[name=SortOrder]", productID.parents("tr")).val();

            if (sortOrderID.length == 0 || sortOrderID == "") {
                sortOrderID = "0";
            }
            sendDatas += productID.val() + "|" + sortOrderID + ",";

        }

        // 商品id + sortOrderID
        sendDatas = sendDatas.substring(0, sendDatas.length - 1);
        if (sendDatas.length > 0) {
            //$("#sendDatas").val(sendDatas);
            // 把要提交到后台的值返回给调用的函数
            return sendDatas;
        } else {
            return "";
        }
    };

    // 逻辑删除当前要删除的行的数据 把当前行移除
    function DeleteRow(event) {
        // 移除当前行
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        $(eventSrc).parents("tr").remove();
    };
</script>
