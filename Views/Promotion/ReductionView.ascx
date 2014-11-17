<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var Products = Model.DataSource; %>
<div class="mod-table-head">
    <div class="con style0list" style="width:99%">
        <table cellspacing="0" cellpadding="0" border="0">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tr>
                <th>
                    <label>
                        <input type="checkbox" value="" name="" id="ckallChecked" />
                    </label>
                </th>
                <th class="x-tab">
                    商品名称
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>原价
                </th>
                <th class="x-tab">
                    <%--<i class="icon-resize"></i>--%>减现金
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
        <table cellspacing="0" cellpadding="5" border="0" id="ReductionContent">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <% foreach (var product in Products)
               {%>
            <tr class="tr-Current" id="str_<%:product.ID %>">
                <td>
                    <div class="cell">
                        <label>
                            <input id="checkbox_<%:product.ID %>" type="checkbox" value="" name="sub" />
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
                        <input name="ReductionNumber" class="w50 h20" />
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
                        <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a>
                        </span>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <%} %>
        </table>
          <input type="hidden" id="sendReductDatas" name="sendReductDatas" />
          <input type="hidden" id="isReductionValidate" name="isReductionValidate" />
          <%--<input type="button" id="part-ReductionTest" value="test" onclick="javascript:btnReductConfirm();" />--%>
        
    </div>
</div>
<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        // 注册全选
        checkAll();

        // 注册输入"减价"离开的事件
        txtReductionLeave();

        // 注册输入“减现金”离开的事件
        ReductionPriceLeave();
    });

    // "确定" 这个方法是最后提交整个页面的时候执行的(AddPromotion.aspx页面调用的)
    function btnReductConfirm() {
        // 如果选中的是部分商品 并且选中了减现金 才会向后台提交
  
        if ($("#part-p").attr("checked") == "checked" && $("#part-p1").attr("checked") == "checked") {
            // 获取所有选中的checkBox的ID和减的现金
            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            //var sendReductDatas = new Array();        // 存储的形如 3_4,4_6，8_9 的数据
            var sendReductDatas="";
            var checks = $("#ReductionContent input[type=checkbox]");
            //alert(checks.length-1);
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");
                    // 当前行的减的现金
                    var reductPrice = $("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                    if (reductPrice.length == 0) { // 如果选中了checkBox却没有给"减现金"赋值 就默认的赋值为0
                        reductPrice = "0";
                    }
                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);

                    strID = strID + "_" + reductPrice+",";
                    sendReductDatas += strID

                    // 把id 放到集合中去 形如3_4,4_6，8_9 前面是id 后面是 "减现金"
                    //sendReductDatas.push(strID);
                }
            }

            // 如果存储id的数组不为空
            if (sendReductDatas.length <= 0) {
                // 给验证码置为 false
                $("#isReductionValidate").val("false");
                // 清空要传递给后台的数据
                $("#sendReductDatas").val("");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择要减现金的商品").change();
                return false;
            }

            // 使用贱招 将要传递到后台的数据放到隐藏域中

            sendReductDatas = sendReductDatas.substring(0, sendReductDatas.length - 1); // 去除最后一个","
            //sendReductDatas += "|";
            $("#sendReductDatas").val(sendReductDatas);
            $("#isReductionValidate").val("true");
        }
    }

    // 当用户输入"减现金" 并且离开的时候自动填充到"优惠价"一栏
    function ReductionPriceLeave() {
        // 要循环遍历 "减现金"文本框 触发文本框改变的事件
        var discounts = $("#ReductionContent input[name=ReductionNumber]");

        $(discounts).change(function () {
            // 当前操作的对象
            //            event = event ? event : window.event;
            //            var eventSrc = event.srcElement ? event.srcElement : event.target;

            // "减现金"
            //var disCount = $(eventSrc).val();
            var reduction = $(this).val();

            reduction = parseFloat(reduction);


            if (reduction <= 0) {
                //alert('请输入正数');
                $(this).val("");
                return false;
            }

            // 金钱的文本自动填上.00
            // 先要判断是否含有'.'
            var value = $(this).val();
            if (value.indexOf('.') <= 0) {
                $(this).val(reduction + '.00');
            }


            // 对应的原价
            var salePrice = $("div[name=SalesPrice]", $(this).parents("tr")).text();
            salePrice = parseFloat(salePrice);
            // 优惠价 = 原价-减现金
            var currentprice1 = salePrice - reduction;
            if (currentprice1 < 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("减现金不能小于原价").change();
                return false;
            }
            if (value.indexOf('.') <= 0) {
                var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1 + '.00');
            } else {
                var currentPrice = $("div[name=CurrentPrice]", $(this).parents("tr")).text(currentprice1);
            }
            
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

    // 输入"减价"离开的事件
    function txtReductionLeave() {

        // #txtReductionNum：是 addRomotion.aspx中的
        $("#txtReductionNum").blur(function () {
            // 要限制是在选中的部分商品时
            if ($("#part-p").attr("checked") != "checked") { 
               return false;
            }
            if ($(this).val() <= 0) {
//                alert('请输入正数');
                return false;
            }
            var isOverSalePrice = false;
            if ($(this).val() != "") {
                // 把所有的"减现金"文本框都赋值此值
                $(".tr-Current input[name=ReductionNumber]").val($(this).val());

                // 要循环赋值 这样可以把优惠价也赋值上去
                var strs = $(".tr-Current input[name=ReductionNumber]");
                for (var i = 0; i < strs.length; i++) { //$("input[name=ReductionNumber]", $(checks[i]).parents("tr")).val();
                    // 获取每一当前行减的现金 优惠价=原价-现金
                    var reductPrice = $("input[name=ReductionNumber]", $(strs[i]).parents("tr")).val();

                    // 获取对应行的原价
                    var salePrice = $("div[name=SalesPrice]", $(strs[i]).parents("tr")).text();

                    // 获取"优惠价"的列 并赋值
                    var currentPrice1 = parseFloat(salePrice) - parseFloat(reductPrice);
                    if (currentPrice1 <= 0) {
                        isOverSalePrice = true;
                    }
                    var currentPrice = $("div[name=CurrentPrice]", $(strs[i]).parents("tr")).text(currentPrice1+'.00');
                }

                if (isOverSalePrice == true) { // 如果原价小于减现金
                    $("#txtReductionNum").val("");
                    $(".tr-Current input[name=ReductionNumber]").val(""); // 减现金
                    $(".tr-Current div[name=CurrentPrice]").text(""); // 优惠价

                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请检查有的商品价钱小于减的现金").change();
                }

            }

        });
    };

    // 全选
    function checkAll() {
        $("#ckallChecked").click(function () {
            var checkAllState = $("#ckallChecked").attr("Checked");
            if (checkAllState == "checked") {
                $("#ReductionContent input[type=checkbox]").attr("checked", "checked");
            } else {
                $("#ReductionContent input[type=checkbox]").attr("checked", false);
            };
        });
    };
</script>
