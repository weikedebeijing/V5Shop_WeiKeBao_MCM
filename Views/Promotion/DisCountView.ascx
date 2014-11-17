<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<% var Products = Model.DataSource; %>
<div class="mod-table-head">
    <div class="con style0list" style="width:99%">
        <table cellspacing="0" cellpadding="0" border="0">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tr>
                <th>
                    <label>
                        <input type="checkbox" value="" name="" id="discountAll_Check" />
                    </label>
                </th>
                <th class="x-tab">
                    商品名称
                </th>
                <th class="x-tab">
                   <%-- <i class="icon-resize"></i>--%>原价
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>折扣（0~10）%
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>优惠价
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>商家编码
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>库存
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
        <%--此处通过部分视图返回打折列表--%>
        <table cellspacing="0" cellpadding="5" border="0" id="DiscountContent">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <% foreach (var product in Products)
               {%>
            <tr class="tr-Current">
                <td>
                    <div class="cell">
                        <label>
                            <input type="checkbox" id="checkbox_<%:product.ID %>" value="" name="sub" />
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
                        <input name="DiscountNumber" onkeyup="value=value.replace(/[^\d]/g,'')" class="w50 h20" />
                    </div>
                </td>
                <td>
                    <div class="cell" name="CurrentPrice">
                        </div>
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
                        <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a> </span>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <%} %>
        </table>
             <input type="hidden" id="sendDiscountDatas" name="sendDiscountDatas" />
             <input type="hidden" id="isDiscountValidate" name="isDiscountValidate" />

             <%--<input type="button" id="Part-DiscountTest" value="test" onclick="javascript:btnDiscountConfirm();" />--%>
    </div>
</div>

<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        // 注册全选
        checkAll();

        // 注册输入"打折"离开的事件
        txtDiscountLeave();

        // 注册输入“折扣”离开的事件
        DiscountPriceLeave();
    });

    // "确定" 这个方法是最后提交整个页面的时候执行的(AddPromotion.aspx页面调用的)
    function btnDiscountConfirm() {
     
        // 如果选中的是部分商品 并且选中了打折 才会向后台提交
        if ($("#part-p").attr("checked") == "checked" && $("#all-p1").attr("checked") == "checked") {
            // 获取所有选中的checkBox的ID和减的现金
            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            // 存储的形如 3_4,4_6，8_9 的数据
            var sendDiscountDatas = "";
            var checks = $("#DiscountContent input[type=checkbox]");
            
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");
                    // 当前行的“打折”
                    var discountPrice = $("input[name=DiscountNumber]", $(checks[i]).parents("tr")).val();

                    if (discountPrice.length == 0) { // 如果选中了checkBox却没有给"打折"赋值 就默认的赋值为10  
                        discountPrice = 10;
                    }
                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);

                    strID = strID + "_" + discountPrice + ",";
                    sendDiscountDatas += strID

                    // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "打折"
                }
            }

            // 如果存储id的数组不为空
            if (sendDiscountDatas.length <= 0) {
                // 给验证码置为 false
                $("#isDiscountValidate").val("false");
                // 清空要传递给后台的数据
                $("#sendReductDatas").val("");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择要打折的商品").change();
                return false;
            }

            // 使用贱招 将要传递到后台的数据放到隐藏域中

            sendDiscountDatas = sendDiscountDatas.substring(0, sendDiscountDatas.length - 1); // 去除最后一个","
            //sendDiscountDatas += "|";
            $("#sendDiscountDatas").val(sendDiscountDatas);
            $("#isDiscountValidate").val("true");
        }
    };

    // 输入"打折"离开的事件
    function txtDiscountLeave() {

        // #txtDiscountNum：是 addRomotion.aspx中的
        $("#txtDiscountNum").blur(function () {
            // 要限制是在选中的部分商品时
            if ($("#part-p").attr("checked") != "checked") {
                return false;
            }
            if ($(this).val() != "") {
                if ($(this).val() <= 0 || $(this).val() >= 10) {
                    //alert('请输入 0~10 之间的数');
                    return false;
                }

                // 把所有的"打折"文本框都赋值此值
                $(".tr-Current input[name=DiscountNumber]").val($(this).val());

                // 要循环赋值 这样可以把优惠价也赋值上去
                var strs = $(".tr-Current input[name=DiscountNumber]");
                for (var i = 0; i < strs.length; i++) { //$("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                    // 获取每一当前行减的现金 优惠价=原价x打折
                    var discountPrice = $("input[name=DiscountNumber]", $(strs[i]).parents("tr")).val();

                    // 获取对应行的原价
                    var salePrice = $("div[name=SalesPrice]", $(strs[i]).parents("tr")).text();

                    // 获取"优惠价"的列 并赋值
                    var currentPrice1 = parseInt(salePrice) * (parseFloat(discountPrice) / 10);
                    var currentPrice = $("div[name=CurrentPrice]", $(strs[i]).parents("tr")).text(currentPrice1+'.00');
                }

            }
        });
    };

    // 当用户输入"折扣" 并且离开的时候自动填充到"优惠价"一栏
    function DiscountPriceLeave() {
        // 要循环遍历 "折扣"文本框 触发文本框改变的事件
        var discounts = $("#DiscountContent input[name=DiscountNumber]");

        $(discounts).change(function () {
            // 当前操作的对象

            // "打折"
            var disCount = $(this).val();
            disCount = parseFloat(disCount);
            if (disCount <= 0 || disCount >= 10) {
//                alert('请输入 0~10 之间的数');
                $(this).val("");
                return false;
            }
            // 对应的原价
            var salePrice = $("div[name=SalesPrice]", $(this).parents("tr")).text();
            salePrice = parseFloat(salePrice);
            // 优惠价 = 原价x折扣
            var currentprice1 = salePrice * (disCount / 10);
            var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1);
        });
    };

    // 全选
    function checkAll() {
        $("#discountAll_Check").click(function () {
            var checkAllState = $("#discountAll_Check").attr("Checked");
            if (checkAllState == "checked") {
                $("#DiscountContent input[type=checkbox]").attr("checked", "checked");
            } else {
                $("#DiscountContent input[type=checkbox]").attr("checked", false);
            };
        });
    };

    // 逻辑删除当前要删除的行的数据 把当前行移除
    function DeleteRow(event) {
        if (confirm('确定要删除？')) {
            // 移除当前行
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            $(eventSrc).parents("tr").remove();
        }
    };

 </script>
