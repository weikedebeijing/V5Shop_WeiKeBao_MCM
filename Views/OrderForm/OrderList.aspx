<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Order.Model.Report" %>
<%@ Import Namespace="V5.MetaData.Order.Model" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%=Combres.WebExtensions.CombresLink("OrderListJs")%>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/modifyordertagid.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/product/productDetailJs.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--  <object id="factory" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="../../PrintThirdPart/smsx.cab#Version=6,6,440,26">
    </object>--%>
    <script type="text/javascript">

        // 打印预览
        function printPreview() {
            var printQueue = new Array();
            var checks = $("#contentForCheck input[type=checkbox]");

            //  将要打印的orderID 加入打印队列
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var checkID = $(checks[i]).attr("id");
                    var strID = checkID.substring(checkID.indexOf('_') + 1, checkID.length);

                    $.ajax({
                        url: "/OrderForm/ExpressPrintTemplate",
                        data: { "id": strID, "condition": "checkIsCanPrtint" },
                        async: false, // 让它同步执行
                        success: function (returnData) {
                            if (returnData == "Can Print") {
                                printQueue.push(strID); //  将要打印的orderID 加入打印队列
                            } else if (returnData == "no template") {
                                // alert('要打印的订单号为 ' + strID + ' 没有找到此公司对应的模板');
                            } else if (returnData == 'no company') {
                                // alert('要打印的订单号为 ' + strID + ' 没有找到对应的快递公司');
                            }
                        }
                    });
                }
            };

            if (printQueue.length > 0) {
                window.location.href = "/OrderForm/PrintPreview?expressIDs=" + printQueue + "";
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("没有符合打印的订单").change();
            }
        }

        var OrderQuery = new Object();
        OrderQuery.Groups = new Array(6);
        OrderQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        OrderQuery.Groups[1] = "X1";

    </script>
    <div id="gray-view01" style="display: none">
        <div style="width: 700px; height: 400px;" class="content scroll">
            <!--order detail begin-->
            <!--title begin-->
            <div class="mod-title">
                <div class="con style03">
                    <h2>订单信息</h2>
                </div>
            </div>
            <!--title end-->
            <div class="mod-table-main t5">
                <div class="con style03">
                    <table style="width: 100%;">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <td class="td_bg">订单号
                                </td>
                                <td>
                                    <span id="OrderNumber"></span>
                                </td>
                                <td class="td_bg">创建时间
                                </td>
                                <td>
                                    <span id="CreateDate"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">支付方式
                                </td>
                                <td>
                                    <span id="Type"></span>
                                </td>
                                <td class="td_bg">备注
                                </td>
                                <td>
                                    <span id="Remark"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--order detail end-->
            <!--members detail begin-->
            <!--title begin-->
            <div class="mod-title t15">
                <div class="con style03">
                    <h2>会员信息</h2>
                </div>
            </div>
            <!--title end-->
            <div class="mod-table-main t5">
                <div class="con style03">
                    <table style="width: 100%;">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <td class="td_bg">买家账号
                                </td>
                                <td colspan="3">
                                    <a class="member-account" onclick="CustomerClick()" href="javascript:void(0)"><span
                                        class="text" id="Customer"></span><i id="tag" class="icon-arrowright"></i></a>
                                    <input type="hidden" id="CustomerID"></input>
                                    <!--收起样式class="icon-arrowright"--icon-arrowdown>
                                    <!--member detail begin-->
                                    <div id="CustomerTable" style="display: none;" class="mod-table-main t5">
                                        <div class="con style02">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 13%;" />
                                                    <col style="width: 37%;" />
                                                    <col style="width: 13%;" />
                                                    <col style="width: 37%;" />
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td>会员名称：
                                                        </td>
                                                        <td>
                                                            <span id="TrueName"></span>
                                                        </td>
                                                        <td>会员等级：
                                                        </td>
                                                        <td>
                                                            <span id="LevelIDoRName"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>会员状态：
                                                        </td>
                                                        <td>
                                                            <span id="Freeze"></span>
                                                        </td>
                                                        <td>注册邮箱:
                                                        </td>
                                                        <td>
                                                            <span id="Email"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>注册时间：
                                                        </td>
                                                        <td>
                                                            <span id="RegDate"></span>
                                                        </td>
                                                        <td>最近登录：
                                                        </td>
                                                        <td>
                                                            <span id="RegisterDate"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>会员来源：
                                                        </td>
                                                        <td>
                                                            <span id="CustomerType"></span>
                                                        </td>
                                                        <td>账户余额：
                                                        </td>
                                                        <td>
                                                            <span id="Balance"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>最近消费金额：
                                                        </td>
                                                        <td>
                                                            <span id="ConsumeAmount"></span>
                                                        </td>
                                                        <td>客单价：
                                                        </td>
                                                        <td>
                                                            <span id="PerTranscation"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>消费频次：
                                                        </td>
                                                        <td>
                                                            <span id="frequency">次/月</span>
                                                        </td>
                                                        <td>消费总额：
                                                        </td>
                                                        <td>
                                                            <span id="ConsumeAmountSum"></span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--member detail end-->
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">买家姓名
                                </td>
                                <td>
                                    <span id="ReceivingName"></span>
                                </td>
                                <td class="td_bg">买家电话
                                </td>
                                <td>
                                    <span id="ReceivingMobilePhone"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">消费金额
                                </td>
                                <td>
                                    <span id="consumptionPaidAmount"></span>
                                </td>
                                <td class="td_bg">留言
                                </td>
                                <td>
                                    <span id="ReceivingDescription"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--members detail end-->
            <!--product begin-->
            <!--title begin-->
            <div class="mod-title t15">
                <div class="con style03">
                    <h2>商品信息</h2>
                </div>
            </div>
            <!--title end-->
            <div class="mod-table t5">
                <div class="mod-table-head">
                    <div class="con style0list-bg">
                        <table>
                            <colgroup>
                                <col style="width: 75%" />
                                <col style="width: 15%" />
                                <col style="width: 10%" />
                                <col style="width: auto" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>商品
                                    </th>
                                    <th>单价
                                    </th>
                                    <th>数量
                                    </th>
                                    <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0dotted">
                        <table>
                            <colgroup>
                                <col style="width: 75%" />
                                <col style="width: 15%" />
                                <col style="width: 10%" />
                                <col style="width: auto" />
                            </colgroup>
                            <tbody id="ProductTr">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="mod-box">
                <div class="con style0bg">
                    <ul class="amountpay">
                        <li>
                            <label class="amountpay-label">
                                总金额：</label><span class="amountpay-price" id="Amount"> </span></li>
                        <li>
                            <label class="amountpay-label">
                                运费：</label><span class="amountpay-price" id="Freight"></span></li>
                        <li>
                            <label class="amountpay-label">
                                实际支付：</label><span class="amountpay-price reality-price" id="PaidAmount"></span></li>
                    </ul>
                </div>
            </div>
            <!--product end-->
            <!--record begin-->
            <!--title begin-->
            <div class="mod-title t15">
                <div class="con style03">
                    <h2>操作日志</h2>
                </div>
            </div>
            <!--title end-->
            <div class="mod-box t5">
                <div class="con style0bg">
                    <ul class="dailyrecord" id="log">
                    </ul>
                </div>
            </div>
            <!--record end-->
            <!--form begin-->
            <!--title begin-->
            <div class="mod-title t15">
                <div class="con style03">
                    <h2>修改信息</h2>
                </div>
            </div>
            <!--title end-->
            <div class="mod-form t5">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    收件人</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="txtReceivingName" id="txtReceivingName" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>邮编</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="txtReceivingPostCode" id="txtReceivingPostCode" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    地址</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="txtReceivingAddress" class="w230">
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
                                <input type="text" id="txtReceivingTelePhone" class="w230">
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>快递公司</label>
                            </div>
                            <div class="float-l">
                                <select id="orderLogistics" onchange="changeselOrderLogistics()" name="selLogistics"
                                    class="w240">
                                </select>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>运单编号</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="txtTradeNumber" class="w230">
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    手机号码</label>
                            </div>
                            <div class="float-l">
                                <input type="text" name="txtReceivingMobilePhone" id="txtReceivingMobilePhone" class="w230">
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li" style="display: none">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    是否发货</label>
                            </div>
                            <div class="float-l">
                                <input type="checkbox" name="check" id="check" value="true" class="r5" /><label for="check">是</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <input type="hidden" id="hidExpressCode" />
            <input type="hidden" id="hidExpressName" />
            <!--form end-->
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="submit()" name="Submit" id="Submit">
                    保存</button>
                <button class="reset01-alert" onclick="closeOrderList()">
                    关闭</button>
            </div>
        </div>
    </div>
    <div id="DivUpdatalogistics" class="" style="display: none">
        <div style="width: 300px; height: 50px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w150">
                                    <span class="star">*</span><label>请选择物流公司:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w120" id="Logistics" onchange="javascript:getchangeLogistics()">
                                    </select>
                                    <input type="hidden" id="hidLogistics" />
                                    <input type="hidden" id="hidLogisticsName" />
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
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="addLogistics()" class="submit01-alert r10" id="btnLogistics">
                    保存</button>
                <button class="reset01-alert" onclick="closeDivUpdatalogistics()">
                    关闭</button>
            </div>
        </div>
    </div>
    <!--选项卡 begin-->
    <%--    <%var appCode = ViewData["appCode"].ToString(); %>--%>
    <div class="mod-tab t20">
        <div class="con style0mid" id="status">
            <ul>
                <li dir="X1"><a href="javascript:void(0)">全部（<span lang='QuanBu'></span>）</a></li>
                <li dir="Y1"><a href="javascript:void(0)">等待发货（<span id="tempDFH"></span>）</a></li>
                <li dir="Y2"><a href="javascript:void(0)">问题订单（<span id="tempWTDD"></span>）</a></li>
                <li dir="Y3"><a href="javascript:void(0)">等待付款（<span id="tempDDFK"></span>）</a></li>
                <li dir="Y4"><a href="javascript:void(0)">已发货（<span id="tempYFH"></span>）</a></li>
                <li dir="Y5"><a href="javascript:void(0)">退款中（<span id="tempTKZ"></span>）</a></li>
                <li dir="Y6"><a href="javascript:void(0)">交易成功（<span id="tempJYCG"></span>）</a></li>
                <li dir="Y7"><a href="javascript:void(0)">交易关闭（<span id="tempJYGB"></span>）</a></li>
                <li dir="Y8"><a href="javascript:void(0)">历史订单（<span id="tempLSDD"></span>）</a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 begin-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list-order">
            <ul>
                <li>
                    <input type="text" id="TexUser" placeholder="请输入订单号、快递单号、买家账号..." class="search-input"
                        style="color: #999" />
                </li>
                <li><a href="javascript:void(0)" class="search-btn" id="SelectId"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <div class="mod-condition t20" style="display: none">
        <div class="con style0mid">
            <ul>
                <li dir="Y1"><a href="javascript:void(0)">等待发货（）</a></li>
                <li dir="Y2"><a href="javascript:void(0)">问题订单（）</a></li>
                <li dir="Y3"><a href="javascript:void(0)">等待付款（）</a></li>
                <li dir="Y4"><a href="javascript:void(0)">已发货（）</a></li>
                <li dir="Y5"><a href="javascript:void(0)">退款中（）</a></li>
                <li dir="Y6"><a href="javascript:void(0)">交易成功（）</a></li>
                <li dir="Y7"><a href="javascript:void(0)">交易关闭（）</a></li>
                <li dir="Y8"><a href="javascript:void(0)">历史订单（）</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-condition t20">
        <div class="con style0list" id="Dateof">
            <ul class="clear">
                <li dir="Z1"><a href="javascript:void(0)">今天（<span id="tempToday">0</span>）</a></li>
                <li dir="Z2"><a href="javascript:void(0)">昨天（<span id="tempYesterday">0</span>）</a></li>
                <li dir="Z3"><a href="javascript:void(0)">本周（<span id="tempThisWeek">0</span>）</a></li>
                <li dir="Z4"><a href="javascript:void(0)">本月（<span id="tempThisMonth">0</span>）</a></li>
                <li dir="Z5"><a href="javascript:void(0)">前一个月（<span id="tempAMonthAgo">0</span>）</a></li>
            </ul>
        </div>
    </div>
    <!--等待发货 begin-->
    <div class="mod-condition t20" id="DivToBeShipped" style="display: none;">
        <div class="con style0list" id="logisticss">
            <ul>
            </ul>
        </div>
    </div>
    <!--等待发货 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20" id="operation">
        <div class="con style0list">
            <ul class="ul-list">
                <li id="downloadSetting" style="display: none"><a href="javascript:void(0)" class="a-btn">抓取订单</a></li>
                <li class="hidden"><a class="a-btn" name="lnk_export" href="javascript:void(0)">导出订单</a></li>
                <li style="display: none" onclick="changeorderprice()" id="orderprice"><a class="a-btn" href="javascript:void(0)">订单改价</a></li>
                <li id="delayed" style="display: none;"><a href="javascript:void(0)" class="a-btn">延时收货</a><i
                    class="ico20 show" style="display: none;"></i></li>
                <li id="ModifyLogistics" onclick="modifyLogistics()"><a href="javascript:void(0)"
                    class="a-btn">修改物流</a> <i class="ico20 show" style="display: none;"></i></li>
                <li id="addremark" onclick="addremark()"><a href="javascript:void(0)" class="a-btn">批量备注</a><i class="ico20 " style="display: none;"></i></li>
                <li id="BatchPrint"><a href="javascript:void(0)"
                    class="a-btn">批量打印快递单</a></li>
                <li id="BatchSend"><a href="javascript:void(0)" onclick="javascript:void(0)" class="a-btn">批量发货</a><i class="ico20 show" style="display: none;"></i></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul" id="dvPage">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>
    <div class="print-hide" id="divPrints">
        <a href="javascript:void(0)" dir="PS-Y">隐藏已打印订单</a>
    </div>
    <div class="clear h10">
    </div>
    <!--延时收货 开始-->
    <div class="" style="display: none;" id="takeOverShow">
        <div style="width: 300px; height: 50px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w150">
                                    <span class="star">*</span><label>请选择收货天数:</label>
                                </div>
                                <div class="float-l">
                                    <select class="w100" name="days">
                                        <option value="3">3天</option>
                                        <option value="5">5天</option>
                                        <option value="7">7天</option>
                                    </select>
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
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="delayReceiveTime()">
                    保存</button>
                <button class="reset01-alert" onclick="closetakeOverShow()">
                    关闭</button>
            </div>
        </div>
    </div>
    <!--延时收货 结束-->
    <div class="" style="display: none;" id="Divlogistics">
        <div style="width: 600px; height: 400px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w150">
                                    <span class="star">*</span><label>物流公司：</label>
                                </div>
                                <div class="float-l">
                                    <select class="w180" id="selLogistics" onchange="changeSelLogistics()">
                                    </select><span class="spMessage"></span>
                                    <input type="hidden" id="hiddenLogisticsCode" />
                                    <input type="hidden" id="hiddenLogisticsName" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w150">
                                    <span class="star">*</span><label>
                                        起始快递单号：</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" onblur="blurLogistics()" class="w230" id="txtLogistics">
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
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="SendbtnSubmit()" id="btnSubmit">
                    保存</button>
                <button class="reset01-alert" onclick="closeDivlogistics()">
                    关闭</button>
            </div>
        </div>
    </div>
    <div class="" id="batchRemarkShow" style="display: none;">
        <div style="width: 400px; height: 150px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>备注</label>
                                </div>
                                <div class="float-l">
                                    <textarea class="v5-textarea w240 h150" name="remark"></textarea>
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
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="changeRemark()" name="changeRemark">
                    保存</button>
                <button class="reset01-alert" onclick="closebatchRemarkShow()">
                    关闭</button>
            </div>
        </div>
    </div>


    <div class="" id="DivChangeOrderPrice" style="display: none;">
        <div style="width: 600px; height: 250px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>订单总价:</label>
                                </div>
                                <div class="float-l">
                                    <label id="orderpricespan"></label>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <span class="star">*</span><label>订单折扣或涨价:</label>
                                </div>
                                <div class="float-l">
                                    <input type="text" id="txtOnSale" onblur="return ModifyOrder();" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <label>要给顾客便宜100元，则输入"-100";要提高订单价格100元，则输入"100".</label>
                                </div>

                            </li>

                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>订单总价:</label>
                                </div>
                                <div class="float-l">
                                    <label id="divtxtAmount"></label>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>


                            <li class="list-li">
                                <div class="float-l w120">
                                    <span class="star">*</span><label>调价原因：</label>
                                </div>
                                <div class="float-l">
                                    <textarea style="width: 239px; height: 81px;" id="changepriceremark"></textarea>
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
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="btnchangeorderprice()" name="changeRemark">
                    保存</button>
                <button class="reset01-alert" onclick="closeChangeorderprice()">
                    关闭</button>
            </div>
        </div>
    </div>



    <%--          <div name="pnl_print" style="margin: 0px 0px 10px 8px; display: none">
                <input type="checkbox" id="chk_print" name="chk_print" /><label for="chkHide" style="margin: 0px 0px 0px 8px">隐藏已打印订单</label></div>--%>
    <!--列表 Start-->
    <div style="clear: both;">
    </div>
    <div class="mod-table" id="mod-table">
        <% 
            Html.RenderAction("OrderTableList", new { OrderPageIndex = 0 });
        //分销
        //Html.RenderAction("DistributorList", new { OrderPageIndex = 0 });
                
                
        %>
    </div>
    <!--列表 End-->
    <script type="text/javascript">

        var appCode = GetUrlAppCode();
        var menuCode = GetUrlMenuCode();
        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {
            $("#operation ul").css("display", "none");
            OrderQuery.Groups[1] = "";
            $("#separationLine").hide();

            $(".btn").hide();

            $("#delayed").hide();       // 延时收货
            $("#ModifyLogistics").hide();     // 修改物流
            $("#BatchPrint").hide();    // 批量打印快递单
            $("#BatchSend").hide();     // 批量发货
            $("#addremark").hied(); //批量备注
        }

    </script>
    <script type="text/javascript">

        function iClose() {
            art.dialog.list['D345'].close();
        }
        function zClose() {
            art.dialog.list['D123'].close();
        }
        function jClose() {
            art.dialog.list['D678'].close();
        }
        $(document).ready(function () {
            //初始化切换显示
            var Code = '<%=ViewData["appCode"]%>';
            if (Code == "C002") {
                OrderQuery.Groups[1] = "X3";
                DistributorOrderView(1);
            }

            else if (Code == "PLATFORM") {
                if (OrderQuery.Groups[1] == "X1" || OrderQuery.Groups[1] == "X2") {
                    OrderView(1);
                }
            }
            else { OrderQuery.Groups[1] = "X2"; OrderView(1); }
        });
    </script>
    <script type="text/javascript">
        // 控制轮询订单状态
        var polling = false;
        function clearTask() {
            $.ajax({
                type: "post",
                url: "../../OrderForm/ClearDownloadOrder",
                dataType: "json",
                success: function (jsonRes) {
                    //设置下载成功数量
                    art.dialog({ id: 'D123' }).close();
                    art.dialog({ id: 'D345' }).close();

                    //下载成功弹出
                    art.dialog({
                        id: 'D678',
                        padding: 0,
                        time: 100000,
                        title: false,
                        background: '#000000',
                        content: '<div class="mod-tip"><div  class="con style0green"> <!--style01是成功提示；style02是警告提示；style03是错误提示--><span class="txt">抓取结果：成功' + jsonRes.SuccessCount + '条，失败' + jsonRes.FailCount + '条。<b class="c03 l5 r5"></b></span><i onclick="jClose()" class="close"></i></div> </div>',
                        top: 41,
                        lock: true
                    });
                    OrderView(1);
                }
            });

        }

        function query() {

            if (!polling) return;
            $.ajax({
                type: "post",
                url: "../../OrderForm/GetDownloadOrderStatus",
                dataType: "json",
                success: function (jsonRes) {
                    if (!jsonRes.IsRuning) {

                        // 停止轮询
                        polling = false;
                        //下载订单弹出窗体

                        // 清除下载任务
                        clearTask();
                    }
                    if (jsonRes.IsRuning) {
                        //关闭获取订单提示
                        art.dialog({ id: 'D345' }).close();
                        art.dialog({ id: 'D123' }).close();
                        //显示正在下载数量
                        //                        $("#OrderQuantity").text(jsonRes.SuccessCount);
                        //                        $("#OrderSum").text(jsonRes.TotalCount);
                        //下载订单弹出窗体
                        art.dialog({
                            id: 'D123',
                            padding: 0,
                            title: false,
                            background: '#000000',
                            content: '<div class="mod-tip"><div  class="con style0green"> <!--style01是成功提示；style02是警告提示；style03是错误提示--><span class="txt">正在抓取订单...  第' + jsonRes.SuccessCount + '/' + jsonRes.TotalCount + '条订单<b class="c03 l5 r5"></b></span><i onclick="zClose()" class="close"></i></div> </div>',
                            //content: '<div style="line-height:23px;background:#559304;  min-width: 200px; width: auto;text-align:center;color: #333333;height: 37px;background: none repeat scroll 0 0 #B2E7A7;border-color: #A4DB98;">正在抓取订单...  第' + jsonRes.SuccessCount + '/' + jsonRes.TotalCount + '条订单</div>',
                            top: 38,
                            lock: true
                        });
                    }
                }
            });
        }

        //        // 每隔20秒轮询一次订单下载状态

        setInterval("query()", 10000);
        $(function () {
            //下载订单
            $("#downloadSetting").click(function () {

                //判断是否授权
                $.ajax({
                    url: "../../OrderForm/IsOutOfDate",
                    type: "post",
                    async: false,
                    success: function (res) {

                        if (res == "Isnull") {
                            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                            $("#operateTip").html("您还没有授权店铺“<a style='color: #3980F4;' href='../../Shop/Index?appCode=PLATFORM&MenuCode=C531'> 点击去授权</a>”").change();


                            return;
                        } else if (res != "Isnull" && res != "Success") {
                            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                            $("#operateTip").html(res + "店铺授权已过期,请重新授权").change();
                            return;
                        } else if (res == "Success") {
                            $.ajax({
                                type: "post",
                                url: "../../OrderForm/StartDownloadOrder",
                                dataType: "json",
                                success: function (jsonRes) {
                                    if (jsonRes.Code == null && jsonRes.Message == null) {
                                        // 启动订单轮询
                                        polling = true;
                                        //获取订单弹出窗体

                                        art.dialog({
                                            id: 'D345',
                                            padding: 0,
                                            title: false,
                                            background: '#000000',
                                            content: "<div class='mod-tip'><div class='con style0green'> <!--style01是成功提示；style02是警告提示；style03是错误提示--><span class='txt'>正在抓取...<b class='c03 l5 r5'></b></span><i class='close' onclick='iClose()'></i></div></div>",
                                            top: 41,
                                            lock: true
                                        });
                                    }
                                }
                            });
                        }
                    }
                });


                //时间的查询
                $("#selectDate").click(function () {


                    OrderQuery.Query = $("#start").val() + "," + $("#over").val();
                    OrderView(1);

                });


                // enter 键搜索
                document.onkeypress = function () {

                    var iKeyCode = -1;
                    if (arguments[0]) {
                        iKeyCode = arguments[0].which;
                    }
                    else {
                        iKeyCode = event.keyCode;
                    }
                    if (iKeyCode == 13) {
                        // 搜索
                        $("#SelectId").click();

                    }
                };
            });



            var selType = $("#selLogistics")[0];
            for (var i = selType.length - 1; i >= 0; i--)
                selType.options[i] = null;
            var opt = new Option("请选择物流公司", "0");
            selType.options.add(opt);
            $.ajax({
                type: "post",
                url: "../../OrderForm/GetOrderLogistics",
                dataType: "json",
                data: "oper=getType",
                success: function (data) {
                    if (data != null && data.list.length > 0) {
                        for (var i = 0; i < data.list.length; i++) {
                            var opt = new Option(data.list[i].text, data.list[i].value);
                            selType.options.add(opt);
                            if ($('#hidTypeID').val() == data.list[i].value) {
                                opt.selected = true;
                            }
                        }
                    }
                }
            });


        });
        function addremark() {
            //点击批量备注显示div

            var BatchSend = new Array();
            $("input[name='sub']:checked").each(function () {
                BatchSend.push($(this).val());
            });
            if (BatchSend.length == 0) {
                $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            else { popupOperate("batchRemarkShow", "备注", "div_batchRemarkShow"); }
        }

        $(function () {

            // 全部、分销、直销筛选器
            $(".mod-tab #type  ul li").click(function () {

                $(".mod-tab #type ul li").removeClass("current c16");
                $(this).addClass("current c16");
                $("#BatchSend").hide();
                $("#BatchPrint").hide();
                $("#remark").hide();
                $("#ModifyLogistics").hide();
                OrderQuery.Query = "";
                OrderQuery.Groups[1] = "";

                OrderQuery.Groups[2] = "";
                OrderQuery.Groups[3] = "";
                OrderQuery.Groups[4] = "PS-N";
                OrderQuery.Groups[5] = "";
                OrderQuery.Groups[1] = $(this).attr("dir");
                if ($(this).attr("dir") == "X1" || $(this).attr("dir") == "X2") {
                    OrderView(1);

                }

                else if ($(this).attr("dir") == "X3") { DistributorOrderView(1); }

                // 隐藏订单状态筛选器
                $(" #status ul li").removeClass("current c16");
                // 清除快递公司选中状态
                $(" #logisticss ul li").removeClass("current c16");

                $("#Dateof ul li").removeClass("current c16");
                //清除物流打印状态
                $("#divPrints ul li").removeClass("current c16");
                // 隐藏快递筛选器
                $("#DivToBeShipped").hide();
                // 隐藏打印状态筛选器
                // $("[name='pnl_print']").hide();

            });

            $("#divPrints").click(function () {
                if ($(this).find("a").text() == "隐藏已打印订单") {
                    OrderQuery.Groups[4] = "PS-Y";
                    $("#divPrints a").text("显示已打印订单");
                    OrderView(1);
                }

                else if ($(this).find("a").text() == "显示已打印订单") {
                    OrderQuery.Groups[4] = "PS-N";
                    $("#divPrints a").text("隐藏已打印订单");
                    OrderView(1);
                }

            })

            // 获取打印状态
            var getPrintCondition = function () {

                if ($("input[name='chk_print']").prop("checked")) {
                    return "PS-Y";
                }

                return "PS-N";
            }


            //点击延时收货显示div
            $("#delayed").click(function () {
                var orderNumbers = new Array();

                $("input[name='sub']:checked").each(function () {
                    orderNumbers.push($(this).val());
                });

                if (orderNumbers.length == 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                    return;
                }

                popupOperate("takeOverShow", "延时收货", "div_takeOverShow");

            });

            // 设置按钮显示状态
            var setButtonsDisplay = function (dir) {
                $("#orderprice").hide();
                if (dir == "Y1") {
                    // 等待发货
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").show();     // 修改物流
                    $("#BatchPrint").show();    // 批量打印快递单
                    $("#BatchSend").show();     // 批量发货
                    $("[name='pnl_print']").css("display", "block");
                }
                else if (dir == "Y2") {
                    // 问题订单
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").show();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y3") {
                    // 等待付款

                    $("#orderprice").show();
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").hide();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y4") {
                    // 已发货
                    $("#delayed").show();       // 延时收货
                    $("#ModifyLogistics").show();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y5") {
                    // 退款中
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").hide();     // 修改物流
                    $("#BatchPrint").show();    // 批量打印快递单
                    $("#BatchSend").show();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y6") {
                    // 交易成功
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").hide();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y7") {
                    // 交易关闭
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").hide();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
                else if (dir == "Y8") {
                    // 历史订单
                    $("#delayed").hide();       // 延时收货
                    $("#ModifyLogistics").hide();     // 修改物流
                    $("#BatchPrint").hide();    // 批量打印快递单
                    $("#BatchSend").hide();     // 批量发货
                    $("[name='pnl_print']").css("display", "none");
                }
            }

            // 订单状态筛选器
            $("#status ul li").click(function () {

                OrderQuery.Groups[2] = "";
                OrderQuery.Groups[2] = $(this).attr("dir");
                OrderQuery.Groups[3] = "";
                OrderQuery.Groups[4] = "PS-N";
                OrderQuery.Groups[5] = "";
                $("#status ul li").removeClass("current");
                $("#Dateof ul li").removeClass("current");
                //清除物流打印状态
                $("#divPrints ul li").removeClass("current c16");
                $(this).addClass("current");

                if ($(this).attr("dir") != "Y1") {
                    // 其它状态隐藏快递公司筛选器 
                    $("#DivToBeShipped").hide();
                    // 隐藏打印状态筛选器
                    // $("[name='pnl_print']").hide();
                }

                // 设置按钮显示状态
                //                if (appCode == 'PLATFORM' && appCode != "" && appCode != null) {
                setButtonsDisplay($(this).attr("dir"));
                //                }
                if ($(this).attr("dir") == "Y1") {
                    // 等待发货状态显示快递公司筛选器
                    $("#logisticss ul li").remove();
                    $.ajax({
                        type: "post",
                        url: "../../OrderForm/GetDivide",
                        data: { Divide: OrderQuery.Groups[1], appCode: appCode },
                        dataType: "json",
                        success: function (data) {

                            // 生成快递公司
                            var li = "";
                            if (data != null) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].Name != "") {
                                        li += '<li  dir="' + data[i].Name + '"onclick="ChangeThisSpecName(event)"><a dir=Z15-' + data[i].Name + '  href="javascript:void(0)">' + data[i].Name + '(' + data[i].Conut + ')' + '</a></li>';
                                    }
                                }
                                $("#DivToBeShipped #logisticss ul").append(li);
                                $("#DivToBeShipped").show();
                                //$("[name='pnl_print']").show();
                            }
                        }
                    });

                    OrderQuery.Groups[4] = getPrintCondition();
                }


                if (OrderQuery.Groups[1] == "X1" || OrderQuery.Groups[1] == "X2") {
                    OrderView(1);

                }

                else if (OrderQuery.Groups[1] == "X3") { DistributorOrderView(1); }

            });


            //日期筛选
            $("#Dateof ul li:not(:eq(5))").click(function () {
                $("#Dateof ul li").removeClass("current");
                $("#divPrints ul li").removeClass("current");
                $(this).addClass("current");

                OrderQuery.Groups[3] = "";
                OrderQuery.Groups[4] = "";
                OrderQuery.Groups[5] = $(this).attr("dir");
                OrderView(1);
            });

            $("#chk_print").click(function () {
                // 获取是否隐藏打印状态
                OrderQuery.Groups[4] = getPrintCondition();
                OrderView(1);
            });

            $("#logisticss ul li").click(function () {

                $("#logisticss ul li").removeClass("current");


                $(this).addClass("current");

                OrderQuery.Groups[3] = $(this).attr("dir");
                OrderQuery.Groups[4] = getPrintCondition();

                OrderView(1);

            });
        });

        //创建动态的事件
        function ChangeThisSpecName(event) {

            //浏览器兼容
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            $("#logisticss ul li").removeClass("current");
            $(eventSrc).parent().addClass("current");
            z = escape($(eventSrc).attr("dir"));
            OrderQuery.Groups[3] = escape($(eventSrc).attr("dir"));


            OrderView(1);
        }

        $(function () {

            $("#TexUser").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            })


            $("#SelectId").click(function () {
                $("#status ul li").removeClass("current");
                OrderQuery.Groups[2] = "";

                OrderQuery.Query = $("#TexUser").val();

                OrderView(1);
            });
        });

        function changeSelLogistics() {

            var Logisticsval = $("#selLogistics").find("option:selected").val();
            var Logisticstext = $("#selLogistics").find("option:selected").text();

            $("#hiddenLogisticsName").val(Logisticstext);
            $("#hiddenLogisticsCode").val(Logisticsval);

        };


        function changeorderprice() {

            var orderID = new Array();
            var payment = "";
            var paymentstatus = "";
            var orderprice = "";
            $("input[name='sub']:checked").each(function () {
                orderID.push($(this).val());
                payment = $(this).attr("payment");
                paymentstatus = $(this).attr("paymentstatus");
                orderprice = $(this).attr("orderprice");
            });

            if (orderID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选订单再进行操作！").change();
                return;
            } else if (orderID.length != 1) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("该操作不支持批量操作！").change();
                return;
            }
            if (payment != "WxPay") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("只支持微信支付订单修改价格！").change();
                return;
            }
            if (paymentstatus != "1") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("只支持未付款订单修改价格！").change();
                return;
            }
            $("#changepriceremark").val('');
            $("#txtOnSale").val('');
            $("#txtOnSale").parent().next().children().text("");
            $("#orderpricespan").text(orderprice);
            popupOperate("DivChangeOrderPrice", "修改价格", "div_Changeorderprice");
            //alert($("input [value='" + orderID[0] + "']").attr("name"));
        }

        function btnchangeorderprice() {
            var tempordernumber = "";
            $("input[name='sub']:checked").each(function () {
                tempordernumber = $(this).val();
            });


            var orderpricespan = $("#orderpricespan").text();
            var newamount = $("#divtxtAmount").text();
            if (newamount != "") {
                var num1 = parseFloat(orderpricespan) * 1000000000000;
                var num2 = parseFloat(newamount) * 1000000000000;
                var price = (num2 - num1) / 1000000000000;
                var changepriceremark = $("#changepriceremark").val();
                $.ajax({
                    type: "post",
                    url: "../../OrderForm/ChangePrice",
                    async: false,
                    data: { "price": price, "changepriceremark": changepriceremark, "ordernumber": tempordernumber },
                    success: function (data) {
                        closeChangeorderprice();
                        OrderView(1);

                    }
                });
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请输入正确的订单折扣或涨价！").change();
            }
        }

        function closeChangeorderprice() {
            popupClose('div_Changeorderprice');
        }

        //修改订单信息
        function ModifyOrder() {
            $("#txtOnSale").parent().next().children().text("");
            $("#divtxtAmount").text("");
            var value = $("#txtOnSale").val();
            var amount = $("#orderpricespan").text();

            var newamount = parseFloat(amount) + parseFloat(value) < 0 ? 0 : parseFloat(amount) + parseFloat(value);
            if (isNaN(newamount)) {
                $("#txtOnSale").parent().next().children().text("输入不合法");
            } else {
                $("#divtxtAmount").text(newamount.toFixed(2));
            }
            //   $("#hiddenNewAmount").val(newamount.toFixed(2));
        }


        // 修改物流
        var srt = "";
        function addLogistics() {

            var orderID = new Array();

            $("input[name='sub']:checked").each(function () {
                orderID.push($(this).val());

            });

            if (orderID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            $.ajax({
                type: "post",
                url: "../../OrderForm/CheckSend",
                data: { "srt": JSON.stringify(orderID), "hiddenLogistics": $("#hidLogistics").val() },
                dataType: "json",
                success: function (jsonRes) {

                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        //操作修改状态
                        ModifyOrderTagID(orderID);

                        $("#DivUpdatalogistics").hide();
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("修改成功！").change();
                        closeDivUpdatalogistics();
                        OrderView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                        $("#operateTip").html(JSON.stringify(jsonRes)).change();
                    }
                }
            });
        };

        //显示修改物流弹层
        function modifyLogistics() {
            var BatchSend = new Array();
            $("input[name='sub']:checked").each(function () {
                BatchSend.push($(this).val());
            });
            if (BatchSend.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            popupOperate("DivUpdatalogistics", "修改物流", "div_Updatalogistics");
            var selType = $("#Logistics")[0];
            for (var i = selType.length - 1; i >= 0; i--)
                selType.options[i] = null;
            var opt = new Option("请选择物流公司", "0");
            selType.options.add(opt);
            $.ajax({
                type: "post",
                url: "../../OrderForm/GetOrderLogistics",
                dataType: "json",
                data: "oper=getType",
                success: function (data) {

                    if (data != null && data.list.length > 0) {
                        for (var i = 0; i < data.list.length; i++) {
                            var opt = new Option(data.list[i].text, data.list[i].value);
                            selType.options.add(opt);

                        }
                    }
                }
            });
        };
        function getchangeLogistics() {

            var logisticsValues = $("#Logistics").find("option:selected").val();
            var logisticsName = $("#Logistics").find("option:selected").text();
            $("#hidLogistics").val(logisticsName);
            $("#hidLogisticsName").val(logisticsValues);
        };
        //关闭修改物流弹层
        function closeDivUpdatalogistics() {
            popupClose('div_Updatalogistics');
        }
        //关闭修改备注弹层
        function closebatchRemarkShow() {
            popupClose('div_batchRemarkShow');
        }
        //关闭延时收货
        function closetakeOverShow() {
            popupClose('div_takeOverShow');

        }
        //关闭批量发货
        function closeDivlogistics() {
            popupClose('div_Divlogistics');

        }
    </script>
    <!-- 延时收货 begin -->
    <script type="text/javascript">
        function delayReceiveTime() {

            var orderNumbers = new Array();

            $("input[name='sub']:checked").each(function () {
                orderNumbers.push($(this).val());
            });

            if (orderNumbers.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            //                if (appCode == "C002") {
            //                    $("#operateTip").html("请先勾选订单再进行批量操作！").change();
            //                    return;
            //                }

            var days = $("select[name='days']").val();
            $.ajax({
                url: "/OrderForm/DelayReceiveTime",
                type: "post",

                data: { "multiOrderIDStr": JSON.stringify(orderNumbers), "days": days },
                success: function (result) {
                    if (result == "1") {
                        //操作修改状态
                        ModifyOrderTagID(orderNumbers);
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("延时收货操作成功！").change();
                        closetakeOverShow();
                        OrderView(1);
                    }
                    else {

                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(result).change();

                    }
                }
            });
        };


        $(function () {
            $("button[name='cancel']").click(function () {
                $(".style01 .btn i").hide();
                $(".mod-operate-detail").hide();
            });

            $("#BatchPrint").click(function () {
                $(".mod-operate-detail").hide();
                printPreview();
            })
        });
    </script>
    <!-- 延时收货 end -->
    <!-- 批量修改备注 begin -->
    <script type="text/javascript">

        function changeRemark() {
            var orderNumbers = new Array();

            $("input[name='sub']:checked").each(function () {
                orderNumbers.push($(this).val());
            });

            if (orderNumbers.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                return;
            }
            var remarkVal = $("textarea[name='remark']").val();

            $.ajax({
                url: "/OrderForm/ChangeRemark",
                type: "post",
                dataType: 'json',
                data: { "multiOrderIDStr": JSON.stringify(orderNumbers), "remark": remarkVal },
                success: function (result) {
                    if (result.Code == null && result.Message == null) {

                        //操作修改状态
                        ModifyOrderTagID(orderNumbers);
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("修改备注操作成功！").change();
                        closebatchRemarkShow();
                        OrderView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("修改备注操作失败！").change();

                    }
                }
            });
        };

        //批量发货
        $("#BatchSend").click(function () {


            var BatchSend = new Array();
            $("input[name='sub']:checked").each(function () {

                BatchSend.push($(this).val());
            });
            if (BatchSend.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选订单再进行批量操作！").change();

                return;
            }
            else {

                $("#Divlogistics ul li").not(":eq(0)").not(":eq(0)").remove();

                var li = "";

                for (var i = 0; i < BatchSend.length; i++) {

                    li += '<li class="list-li">';
                    li += '<div class="float-l w150">';
                    li += '<span class="star">*</span><label> 订单编号：</label>';
                    li += '</div>';
                    li += ' <div class="float-l">';
                    li += '' + BatchSend[i] + '';
                    li += '</div>';
                    li += '<div class="float-l">';
                    li += '<span class="prompt"></span>';
                    li += '</div></li>';
                    li += '<li class="list-li">';
                    li += '<div class="float-l w150">';
                    li += '<span class="star">*</span><label> 运单编号：</label>';
                    li += '</div>';
                    li += '<div class="float-l">';
                    li += "<input name='txtLogisticsClone" + i + "' class='w230' type='text'>";
                    li += '</div>';
                    li += '<div class="float-l">';
                    li += '<span class="prompt"></span>';
                    li += '</div></li>';
                    //  td += "<tr > <td style='font-size:10px; font-weight: bold'>" + BatchSend[i] + "</td><td><input name='txtLogisticsClone" + i + "' class='v5-input w130' type='text'></td></tr>";
                    //  td += '<tr><td><div>' + BatchSend[i] + '</div></td><td><div ><input name="txtLogisticsClone' + i + '" class="v5-input w130 float-l" type="text"></div></td></tr>';
                }
                $("#Divlogistics ul li:eq(1)").after(li);
                popupOperate("Divlogistics", "批量发货", "div_Divlogistics");
            }

        });
        //克隆实体类
        function clone(myObj) {

            if (typeof (myObj) != 'object') return myObj;
            if (myObj == null) return myObj;
            var myNewObj = new Object();
            for (var i in myObj) myNewObj[i] = clone(myObj[i]);
            return myNewObj;
        }
        var OrderSendList = $.parseJSON('<%=ViewData["OrderSendList"]  %>');
        //克隆
        var newOrderSendList = clone(OrderSendList);
        //调用克隆的方法
        newOrderSendList.OrderSendLists = new Array();
        function SendbtnSubmit() {

            if ($("#selLogistics").val() == "0") {
                $("#Divlogistics #DeliverGoods .spMessage").text("请选择物流");
                $("#selLogistics").focus();
                return;
            }

            //禁用按钮
            $(this).removeClass("saveBtn").addClass("disabled").attr("disabled", "disabled");
            var i = 0;
            $("input[name='sub']:checked").each(function () {

                var newOrderSendLists = clone(OrderSendList.OrderSendLists[0]);
                newOrderSendList.ExpressCode = $("#hiddenLogisticsCode").val();
                newOrderSendList.ExpressName = $("#hiddenLogisticsName").val();
                newOrderSendLists.OrderNumber = $(this).val();
                newOrderSendLists.ParcelNo = $("[name=txtLogisticsClone" + i + "]").val();
                newOrderSendList.OrderSendLists.push(newOrderSendLists);
                i++;
            });
            $.ajax({
                type: "post",
                url: "../../OrderForm/BatchSend",
                data: { "BatchSend": JSON.stringify(newOrderSendList) },
                dataType: "json",
                success: function (jsonRes) {
                    $("#btnSubmit").addClass("submit01").removeClass("disabled").attr("disabled", false);

                    if (jsonRes.Code == null && jsonRes.Message == null) {

                        $("#Divlogistics").hide();
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("发送成功！").change();
                        //操作修改状态
                        ModifyOrderTagID(BatchSend);
                        closeDivlogistics();
                        OrderView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(jsonRes.Message).change();
                        OrderView(1);
                        closeDivlogistics();
                        // $("#MainContent_MainContent_btnSend").attr('disabled', false);
                        return;
                    }
                }
            });
        };

        function blurLogistics() {
            var list = $("input[name='sub']:checked");
            var paddleft = $("#txtLogistics").val().replace(/[^0-9]/ig, "");
            var num = parseInt(paddleft);

            if ($("#txtLogistics").val() != "") {
                for (var i = 0; i < list.length; i++) {
                    var a = parseInt(num + i);
                    $("[name=txtLogisticsClone" + i + "]").val(a);
                }
            }


        };
    </script>
    <!-- 批量修改备注 end -->
    <!-- 订单导出 begin -->
    <script type="text/javascript">

        $(function () {

            $("a[name='lnk_export']").click(function () {

                // 获取选中的订单
                var orderNumbers = new Array();
                $("input[name='sub']:checked").each(function () {
                    orderNumbers.push($(this).val());
                });
                if (orderNumbers.length == 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                    $("#operateTip").html("请先勾选订单再进行批量操作！").change();
                    return;
                }

                // 跳转导出订单页面
                var url = "/OrderForm/ExportOrder?multiOrderNo=" + orderNumbers;
                //alert(url);
                $(this).attr("target", "_blank");
                $(this).attr("href", url);
            });
        });

        //查看详细和编辑链接的跳转
        function GoToLinkUrl(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var linkUrl = $(eventSrc).attr("linkUrl");
            var linkUrlParts = linkUrl.split('?');
            if (linkUrlParts.length > 1) {//原本已经带参数
                linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
            } else {
                linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode;
            }

            window.location.href = linkUrl;
        }

        $("#divMore").click(function () {
            if ($("#divDateTime").css("display") == "none") {
                $("#divDateTime").css("display", "block");
                $("#divMore i").css("display", "block");

            }
            else {
                $("#divDateTime").css("display", "none");
                $("#divMore i").css("display", "none");
            }
        });
        var orderjsonRes = "";
        function getSelectView(id) {
            $(".prompt").text("");
            popupOperate("gray-view01", "订单详细", "gray-view01");

            $.ajax({
                type: "post",
                url: "../../OrderForm/GetOrdelView",
                data: { "id": id },
                dataType: "json",
                success: function (jsonRes) {
                    orderjsonRes = jsonRes;
                    if (jsonRes != "" && jsonRes != undefined) {
                        var str = "";
                        $("#OrderNumber").text(jsonRes.Order.OrderNumber);
                        $("#CreateDate").text(jsonRes.Order.rowCreatedDate);
                        if (jsonRes.Order.Payment == "Alipay_Standard") {
                            str = "支付宝(担保交易)";
                        }
                        else if (jsonRes.Order.Payment == "Alipay_Instant") {
                            str = "支付宝(即时到帐)";
                        }
                        else if (jsonRes.Order.Payment == "Alipay_Wap") {
                            str = "支付宝(手机端)";

                        } else if (jsonRes.Order.Payment == "WxPay") {
                            str = "微信支付";
                        }
                        //else if (jsonRes.Order.Payment == "p") {
                        //    str = "营销活动";

                        //}
                        //else if (jsonRes.Order.Payment == "T") {
                        //    str = "支付宝";
                        //}


                        $("#Type").text(str);
                        $("#Remark").text(jsonRes.Order.Remark);
                        $("#Customer").text(jsonRes.Order.Customer);
                        $("#ReceivingName").text(jsonRes.Invoice.ReceivingName);
                        $("#ReceivingMobilePhone").text(jsonRes.Invoice.ReceivingMobilePhone);
                        $("#Amount").text("￥" + jsonRes.Order.Amount.toFixed(2));
                        $("#Freight").text("￥" + jsonRes.Order.Freight.toFixed(2));
                        $("#PaidAmount").text("￥" + jsonRes.Order.PaidAmount.toFixed(2));
                        $("#CustomerID").val(jsonRes.Order.CustomerID);
                        $("#consumptionPaidAmount").text(jsonRes.Order.PaidAmount);
                        $("#ReceivingDescription").text(jsonRes.Invoice.ReceivingDescription);

                        //修改信息
                        $("#txtReceivingName").val(jsonRes.Invoice.ReceivingName);
                        $("#txtReceivingPostCode").val(jsonRes.Invoice.ReceivingPostCode);
                        $("#txtReceivingAddress").val(jsonRes.Invoice.ReceivingAddress);
                        $("#txtReceivingTelePhone").val(jsonRes.Invoice.ReceivingTelePhone);
                        $("#txtTradeNumber").val(jsonRes.Order.ParcelNo);
                        $("#txtReceivingMobilePhone").val(jsonRes.Invoice.ReceivingMobilePhone);
                        $("#hidExpressCode").val(jsonRes.Order.ExpressCode);
                        $("#hidExpressName").val(jsonRes.Order.ExpressName);
                        OrderLogistics();
                        $("#ProductTr tr").remove();

                        var td = "";
                        //商品
                        for (var i = 0; i < jsonRes.OrderProduct.length; i++) {
                            td += '<tr><td><div class="pro-info"> <div class="pro-info-img"><a  class="pro-info-img-a" href="javascript:void(0)">';
                            td += '<img  width="84" height="84" src="' + jsonRes.OrderProduct[i].ProductURL + '"></a></div>';
                            td += '<div class="pro-info-text"><span class="name"><a class="c07" href="javascript:void(0)" >' + jsonRes.OrderProduct[i].ProductName + '</a></span>';
                            td += ' <span class="info">' + jsonRes.OrderProduct[i].PropertyText + '<br> 商品编码：' + jsonRes.OrderProduct[i].ItemOuterCode + '</span></div></div></td>';
                            td += '<td><div class="cell"><span class="c01-4">' + jsonRes.OrderProduct[i].Price + '</span></div></td>';
                            td += ' <td><div class="cell">' + jsonRes.OrderProduct[i].Count + '</div></td> <td></td></tr>';
                        }
                        $("#ProductTr").append(td);
                        getOrderLog(jsonRes.Order.OrderNumber);
                    }

                }
            });
        }

        //获取订单日志
        function getOrderLog(orderNumber) {
            if (orderNumber != undefined && orderNumber != "") {

                $.ajax({
                    type: "post",
                    url: "../../OrderForm/GetOrderLog",
                    data: { "orderNumber": orderNumber },
                    dataType: "json",
                    success: function (jsonRes) {
                        var li = "";
                        if (jsonRes != "no")
                            $("#log li").remove();
                        for (var i = 0; i < jsonRes.length; i++) {
                            li += '<li><span class="dailyrecord-col01" id="OperatedBy">' + jsonRes[i].OperatedBy + '</span>';
                            li += '<span class="dailyrecord-col02" id="DateCreated">' + jsonRes[i].DateCreated + '</span>';
                            li += '<span class="dailyrecord-col03" id="CreatedBy">' + jsonRes[i].CreatedBy + '</span> </li>';
                        }
                        $("#log").append(li);
                    }
                });
            }
        }

        function CustomerClick() {
            $.ajax({
                type: "post",
                url: "../../OrderForm/GetOrderCustomer",
                data: { "id": $("#CustomerID").val() },

                success: function (res) {

                    if ($("#CustomerTable").css("display") === "none") {
                        $("#CustomerTable").css("display", "block");
                        $("#tag").attr("class", "icon-arrowdown");

                    }
                    else { $("#CustomerTable").css("display", "none"); $("#tag").attr("class", "icon-arrowright"); }


                    if (res != "no") {
                        var jsonRes = JSON.parse(res);
                        $("#TrueName").text(jsonRes.TrueName);
                        $("#LevelIDoRName").text(jsonRes.LevelIDoRName);
                        $("#Freeze").text(jsonRes.Status === 1 ? "冻结" : "正常");

                        $("#Email").text(jsonRes.Email == null ? "" : jsonRes.Email);
                        $("#RegDate").text(jsonRes.RegDate.replace("T", "\n").replace(/\..*/g, ""));
                        $("#RegisterDate").text(jsonRes.rowModifiedDate.replace("T", "\n").replace(/\..*/g, ""));
                        $("#CustomerType").text(jsonRes.CodeToTitle);
                        $("#Balance").text("0");
                        $("#ConsumeAmount").text(jsonRes.LastConsumeAmount.toFixed(2));
                        $("#ConsumeAmountSum").text(jsonRes.ConsumeAmount);
                        $("#PerTranscation").text(jsonRes.UnitPrice);
                        $("#frequency").text(jsonRes.ConsumptionFrequency + " 次/月");
                    }

                    else if (res == "no") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                        $("#operateTip").html("无法查询到会员详细信息！").change();

                        $("#CustomerTable").css("display", "none");
                        $("#tag").attr("class", "icon-arrowright");
                        return false;
                    }

                }
            });
        };

        function OrderLogistics() {
            var selType = $("#orderLogistics")[0];
            for (var i = selType.length - 1; i >= 0; i--)
                selType.options[i] = null;
            var opt = new Option("请选择物流公司", "0");
            selType.options.add(opt);
            $.ajax({
                type: "post",
                url: "../../OrderForm/GetOrderLogistics",
                dataType: "json",
                data: "oper=getType",
                success: function (data) {

                    if (data != null && data.list.length > 0) {

                        for (var i = 0; i < data.list.length; i++) {
                            var opt = new Option(data.list[i].text, data.list[i].value);
                            selType.options.add(opt);
                            var values = $("#hidExpressCode").val();

                            if (values == data.list[i].value) {

                                opt.selected = true;
                            }
                        }
                    }
                }
            });
        }
        //修改信息

        function submit() {

            var isPhone = /^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
            var tel = /^[0-9]{6}$/;


            if ($("#txtReceivingName").val() == "") {

                $("#txtReceivingName").focus();
                $(".prompt").text("");

                $(".prompt", $("#txtReceivingName").parent().parent()).text("请填写收件人");
                return;
            }
            else if (!tel.test($("#txtReceivingPostCode").val())) {
                $("#txtReceivingPostCode").focus();
                $(".prompt").text("");

                $(".prompt", $("#txtReceivingPostCode").parent().parent()).text("请输入正确的邮编");
                return false;


            }
            else if ($("#txtReceivingAddress").val() == "") {
                $("#txtReceivingAddress").focus();
                $(".prompt").text("");

                $(".prompt", $("#txtReceivingAddress").parent().parent()).text("请输入地址");
                return false;


            }
            else if ($("#orderLogistics").val() == "0") {
                $("#orderLogistics").focus();
                $(".prompt").text("");
                $(".prompt", $("#orderLogistics").parent().parent()).text("请选择物流公司");

                return;
            }
            else if ($("#txtTradeNumber").val() == "" || isNaN($("#txtTradeNumber").val())) {

                $("#txtTradeNumber").focus();
                $(".prompt").text("");

                $(".prompt", $("#txtTradeNumber").parent().parent()).text("请输入正确的运单号");
                return;
            }
            else if (!mobile.test($("#txtReceivingMobilePhone").val())) {
                if ($("#txtReceivingTelePhone").val() == "" || !isPhone.test($("#txtReceivingTelePhone").val())) {
                

                    $("#txtReceivingMobilePhone").focus();
                    $(".prompt").text("");
                    $(".prompt", $("#txtReceivingMobilePhone").parent().parent()).text("请正确填写手机号码或联系电话");
                    return false;
                }
            }

            if (orderjsonRes != "") {

                orderjsonRes.Invoice.ReceivingName = $("#txtReceivingName").val();
                orderjsonRes.Invoice.ReceivingMobilePhone = $("#txtReceivingMobilePhone").val();
                orderjsonRes.Invoice.ReceivingTelePhone = $("#txtReceivingTelePhone").val();
                orderjsonRes.Invoice.ReceivingAddress = $("#txtReceivingAddress").val();
                orderjsonRes.Invoice.ReceivingPostCode = $("#txtReceivingPostCode").val();
                orderjsonRes.Order.ParcelNo = $("#txtTradeNumber").val();
                orderjsonRes.Order.ExpressCode = $("#hidExpressCode").val();
                orderjsonRes.Order.ExpressName = $("#hidExpressName").val();

                $.ajax({
                    type: "post",
                    url: "../../OrderForm/UpdateLogistics",

                    data: { "orderViewStr": JSON.stringify(orderjsonRes), "check": $("#check").val() },
                    success: function (data) {

                        if (data == "ok") {

                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $(".spMessage").text("");
                            $("#operateTip").html("修改成功！").change();
                            closeOrderList();
                            OrderView(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色

                            $("#operateTip").html("修改失败！").change();
                        }
                    }
                });
            }
        }


        function changeselOrderLogistics() {
            //物流编码
            var Logistics = $("#orderLogistics").find("option:selected").val();
            $("#hidExpressCode").val(Logistics);
            //物流名称
            var Logisticstext = $("#orderLogistics").find("option:selected").text();
            $("#hidExpressName").val(Logisticstext);
        };

        //关闭
        function closeOrderList() {
            popupClose('gray-view01');
        };

    </script>
    <!--  订单导出 end -->
    <%
        switch (ViewData["menuCode"].ToString())
        {
            case "C205":
    %>
    <script type="text/javascript">
        $(function () {
            $("#ModifyLogistics").hide();
            $("#addremark").hide();
            $("#BatchPrint").hide();
            $("#BatchSend").hide();
            $("#status>ul>li[dir='X1']").trigger("click");
        });
    </script>
    <%   break;
            case "C210":
    %>
    <script type="text/javascript">
        $(function () {

            $("#status>ul>li[dir='Y3']").trigger("click");
        });
    </script>
    <%   break;
            case "C215":
    %>
    <script type="text/javascript">
        $(function () {

            $("#status>ul>li[dir='Y4']").trigger("click");
        });
    </script>
    <%
         break;
            case "C220":
    %>
    <script type="text/javascript">
        $(function () {

            $("#status>ul>li[dir='Y5']").trigger("click");
        });
    </script>
    <%
         break;
            case "C225":
    %>
    <script type="text/javascript">
        $(function () {

            $("#status>ul>li[dir='Y8']").trigger("click");
        });
    </script>
    <%
         break;
            case "C230":
    %>
    <script type="text/javascript">
        $(function () {
            $("#ModifyLogistics").hide();
            $("#addremark").hide();
            $("#BatchPrint").hide();
            $("#BatchSend").hide();
            $("#downloadSetting").click();

            $("#status>ul>li[dir='X1']").trigger("click");
        });
    </script>
    <%  break;

        } %>
</asp:Content>
