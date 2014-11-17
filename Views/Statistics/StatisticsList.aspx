<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=dashbord|common|system|base"></script>
    <%--    <script src="../../Scripts/highcharts/js/jquery.min.js" type="text/javascript"></script>--%><script
        src="../../Scripts/highcharts/highcharts.js" type="text/javascript"></script>
    <script src="../../Scripts/highcharts/modules/exporting.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%V5.MetaData.WeiXin.View.WinXinStatistical weixinStatisticsView = ViewData["weiXinStatistical"] as V5.MetaData.WeiXin.View.WinXinStatistical; %>
    <script type="text/javascript">
        //按时间计算
        var array = new Array();
        var dateHours = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]


        var dateWeek = ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"]

        var dateMonth = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
        var Conut = "";
        var datetype = "dateHours";
        $(function () {

            GetConut("G", "r1");
            curve("G", dateHours);

            GetConut("D", "d1");
            curve("D", dateHours);
        });

        //给曲线图赋值
        function GetValue(date, rsq) {

            var dateItem = ""; //记录 dateHours  dateMonth dateWeek
            switch (date) {
                case "r1":
                    array = new Array();
                    dateItem = dateHours;
                    break;
                case "r2":
                    array = new Array();
                    dateItem = dateHours;
                    break;
                case "r3":
                    array = new Array();
                    dateItem = dateWeek
                    break;
                case "r4":
                    array = new Array();
                    dateItem = dateMonth
                    break;
                case "d1":
                    array = new Array();
                    dateItem = dateHours;
                    break;
                case "d2":
                    array = new Array();
                    dateItem = dateHours;
                    break;
                case "d3":
                    array = new Array();
                    dateItem = dateWeek
                    break;
                case "d4":
                    array = new Array();
                    dateItem = dateMonth
                    break;


            }
        
            //遍历是否有数据，没有就赋值全部为0
            for (var i = 0; i < dateItem.length; i++) {

                if (rsq == "" || rsq == null || rsq == "[ ]") {
                    array[i] = 0;
                }
                else {

                    //这里判断是否是小时候要截取
                    if (dateItem == dateHours) {
                        var dateWhen = dateItem[i].split(":");
                        array[i] = 0;
                        for (var j = 0; j < rsq.length; j++) {

                            if (dateWhen[0] == rsq[j].DateHour) {
                                array[i] = parseInt(array[i]) + parseInt(rsq[j].Count);

                            }
                            else if (dateWhen[0] != rsq[j].DateHour) { continue; }

                        }


                    }
                    else if (dateItem == dateMonth) {
                        //按月数计算
                        dateWhen = dateItem;
                        array[i] = 0;

                        for (var j = 0; j < rsq.length; j++) {

                            if (dateWhen[i] == rsq[j].DateDay) {
                                array[i] = parseInt(array[i]) + parseInt(rsq[j].Count);


                            }
                            else if (dateWhen[i] != rsq[j].DateDay) { continue; }

                        }
                    }

                    else {
                        array[i] = 0;
                        //按星期计算
                        dateWhen = dateItem;
                        for (var j = 0; j < rsq.length; j++) {

                            if (dateWhen[i] == rsq[j].DateWeek) {
                                array[i] = parseInt(array[i]) + parseInt(rsq[j].Count);
                                //break;
                            }

                            else if (dateWhen[i] != rsq[j].DateWeek) {
                                continue;

                            }

                        }
                    }

                }
            }




        }
        function GetConut(type, date) {

            $.ajax({
                type: "post",
                url: "../../Statistics/GetConut?type=" + type + "&date=" + date,
                dataType: "json",
                async: false,
                success: function (rsq) {

                    //给曲线赋值
                    GetValue(date, rsq);
                }
            });

        }

        function curve(type, date) {


            if (type == "G") {
                //关注
                $('#container').highcharts({
                    title: {
                        text: '关注人数统计',
                        x: -20 //center
                    },
                    chart: {
                        renderTo: 'container',
                        defaultSeriesType: 'area'
                    },

                    credits: {
                        enabled: false,
                        text: 'Highcharts.com',
                        href: 'http://www.highcharts.com',
                        position: {
                            align: 'right',
                            x: -10,
                            verticalAlign: 'bottom',
                            y: -5
                        }
                    },
                    subtitle: {
                        text: '* Jane\'s banana consumption is unknown',
                        align: 'right',
                        x: -10,
                        y: 400
                    },
                    xAxis: {
                        categories: date
                    },
                    yAxis: {
                        title: {
                            text: '数量'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: '人'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                        name: '关注人数',
                        data: array
                    }]
                });
            }
            else if (type == "D") {

                //订单
                $('#orderContainer').highcharts({
                    title: {
                        text: '订单总数统计',
                        x: -20 //center
                    },
                    chart: {
                        renderTo: 'container',
                        defaultSeriesType: 'area'
                    },

                    credits: {
                        enabled: false,
                        text: 'Highcharts.com',
                        href: 'http://www.highcharts.com',
                        position: {
                            align: 'right',
                            x: -10,
                            verticalAlign: 'bottom',
                            y: -5
                        }
                    },
                    subtitle: {
                        text: '* Jane\'s banana consumption is unknown',
                        align: 'right',
                        x: -10,
                        y: 400
                    },


                    xAxis: {
                        categories: date
                    },
                    yAxis: {
                        title: {
                            text: '数量'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: '条'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                        name: '订单数量',
                        data: array
                    }]
                });


            }




        }




        $(function () {

            $("#FocusOn ul li").click(function () {

                $("#FocusOn ul li").removeClass("first current");
                $(this).addClass("first current");
                if ($(this).attr("lang") == "r1") {
                    GetConut('G', $(this).attr("lang"))
                    datetype = 'dateHours';
                    curve("G", dateHours);
                }
                else if ($(this).attr("lang") == "r2") {

                    GetConut('G', $(this).attr("lang"))
                    datetype = 'dateHours';
                    curve("G", dateHours);
                }
                else if ($(this).attr("lang") == "r3") {
                    GetConut('G', $(this).attr("lang"))
                    datetype = 'dateWeek';
                    curve("G", dateWeek);

                }
                else if ($(this).attr("lang") == "r4") {
                    GetConut('G', $(this).attr("lang"))
                    datetype = 'dateMonth';
                    curve("G", dateMonth);

                }
            });


            $("#Order ul li").click(function () {

                $("#Order ul li").removeClass("first current");
                $(this).addClass("first current");
                if ($(this).attr("lang") == "d1") {
                    GetConut('D', $(this).attr("lang"))
                    datetype = 'dateHours';
                    curve('D', dateHours);
                }
                else if ($(this).attr("lang") == "d2") {

                    GetConut('D', $(this).attr("lang"))
                    datetype = 'dateHours';
                    curve('D', dateHours);
                }
                else if ($(this).attr("lang") == "d3") {
                    GetConut('D', $(this).attr("lang"))
                    datetype = 'dateWeek';
                    curve('D', dateWeek);

                }
                else if ($(this).attr("lang") == "d4") {
                    GetConut('D', $(this).attr("lang"))
                    datetype = 'dateMonth';
                    curve('D', dateMonth);

                }
            });

        })
				
		</script>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                任务清单</h1>
        </div>
    </div>
    <div class="result">
        <ul class="result-ul">
            <li class="result-li"><a href="../../OrderForm/OrderList?appCode=PLATFORM&MenuCode=C205"
                class="result-a"><i class="icon-order"></i><span class="text">待发货订单（<b class="color-red"><%=weixinStatisticsView.ToSendTheGoods%></b>）</span>
            </a></li>
            <li class="result-li"><a href="../../WeiXinManage/MessageManageList?appCode=PLATFORM&MenuCode=C365"
                class="result-a"><i class="icon-message"></i><span class="text">待回复留言（<b class="color-green"><%=weixinStatisticsView.ToReply%></b>）</span>
            </a></li>
            <li class="result-li"><a href="../../Product/index?appCode=PLATFORM&MenuCode=C125"
                class="result-a"><i class="icon-product"></i><span class="text">库存预警商品（<b class="color-yellow"><%=weixinStatisticsView.InventoryWarning%></b>）</span>
            </a></li>
        </ul>
    </div>
    <div class="follow">
        <table class="follow-table">
            <tbody>
                <tr>
                    <th>
                        <div class="title">
                            关注统计</div>
                        <div class="count">
                            <i class="icon-chart"></i><span>关注用户总数（<b><%=weixinStatisticsView.TheCurrentFocusOn%></b>）</span></div>
                    </th>
                </tr>
                <tr>
                    <td>
                        <div class="tab-chart" id="FocusOn">
                            <ul class="tab-chart-ul">
                                <li lang="r1" class="first current"><a class="tab-chart-a" href="javascript:void(0);">
                                    今日</a></li>
                                <li lang="r2"><a class="tab-chart-a" href="javascript:void(0);">昨日</a></li>
                                <li lang="r3"><a class="tab-chart-a" href="javascript:void(0);">本周</a></li>
                                <li lang="r4" class="last"><a class="tab-chart-a" href="javascript:void(0);">本月</a></li>
                            </ul>
                        </div>
                        <div class="chart-pic">
                            <div id="container" style="width: 100%; height: 400px; margin: 0 auto">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="follow">
        <table class="follow-table">
            <tbody>
                <tr>
                    <th>
                        <div class="title">
                            订单统计</div>
                        <div class="count">
                            <i class="icon-chart"></i><span>订单总数（<b><%=weixinStatisticsView.AllOrders%></b>）</span></div>
                    </th>
                </tr>
                <tr>
                    <td>
                        <div class="tab-chart" id="Order">
                            <ul class="tab-chart-ul">
                                <li lang="d1" class="first current"><a class="tab-chart-a" href="javascript:void(0);">
                                    今日</a></li>
                                <li lang="d2"><a class="tab-chart-a" href="javascript:void(0);">昨日</a></li>
                                <li lang="d3"><a class="tab-chart-a" href="javascript:void(0);">本周</a></li>
                                <li lang="d4" class="last"><a class="tab-chart-a" href="javascript:void(0);">本月</a></li>
                            </ul>
                        </div>
                        <div id="orderContainer" style="width: 100%; height: 400px; margin: 0 auto">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
