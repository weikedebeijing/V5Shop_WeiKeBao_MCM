<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%var SalesSummaryReportList = (List<V5.MetaData.WeiXin.Report.SalesSummaryReport>)ViewData["SalesSummaryReportList"]; %>
    <div class="salesSummary">
        <!--big title begin-->
        <div class="bigTitle">
            <div class="bigTitle-name"><i class="icon-dashboard"></i><span class="text">分销商销售概况</span></div>

        </div>
        <!--big title end-->
        <!--small title-->
        <div class="smallTitle">
            <i class="icon-box"></i><span class="text">所有分销商销售指标</span>
        </div>
        <!--small title-->
        <!--boxinfor begin-->
        <div class="boxinfor">
            <ul class="boxinfor-ul">
                <li class="date">今天</li>
                <li>
                    <label class="title">新增分销商</label><span class="data"><%=SalesSummaryReportList[0].NewDistributors %></span></li>
                <li>
                    <label class="title">现有分销商</label><span class="data"><%=SalesSummaryReportList[0].DistributorsCount %></span></li>
                <li>
                    <label class="title">销售数量</label><span class="data"><%=SalesSummaryReportList[0].SaleCount %></span></li>
                <li>
                    <label class="title">订单数量</label><span class="data"><%=SalesSummaryReportList[0].OrderCount %></span></li>
                <li>
                    <label class="title">销售金额（元）</label><span class="data"><%=SalesSummaryReportList[0].AmountCount.ToString("0.00") %></span></li>
                <li>
                    <label class="title">佣金金额（元）</label><span class="data"><%=SalesSummaryReportList[0].BrokeragCount.ToString("0.00") %></span></li>
            </ul>
            <ul class="boxinfor-ul">
                <li class="date">昨天</li>
                <li>
                    <label class="title">新增分销商</label><span class="data"><%=SalesSummaryReportList[1].NewDistributors %></span></li>
                <li>
                    <label class="title">现有分销商</label><span class="data"><%=SalesSummaryReportList[1].DistributorsCount %></span></li>
                <li>
                    <label class="title">销售数量</label><span class="data"><%=SalesSummaryReportList[1].SaleCount %></span></li>
                <li>
                    <label class="title">订单数量</label><span class="data"><%=SalesSummaryReportList[1].OrderCount %></span></li>
                <li>
                    <label class="title">销售金额（元）</label><span class="data"><%=SalesSummaryReportList[1].AmountCount.ToString("0.00") %></span></li>
                <li>
                    <label class="title">佣金金额（元）</label><span class="data"><%=SalesSummaryReportList[1].BrokeragCount.ToString("0.00") %></span></li>
            </ul>
            <ul class="boxinfor-ul">
                <li class="date">近30天</li>
                <li>
                    <label class="title">新增分销商</label><span class="data"><%=SalesSummaryReportList[2].NewDistributors %></span></li>
                <li>
                    <label class="title">现有分销商</label><span class="data"><%=SalesSummaryReportList[2].DistributorsCount %></span></li>
                <li>
                    <label class="title">销售数量</label><span class="data"><%=SalesSummaryReportList[2].SaleCount %></span></li>
                <li>
                    <label class="title">订单数量</label><span class="data"><%=SalesSummaryReportList[2].OrderCount %></span></li>
                <li>
                    <label class="title">销售金额（元）</label><span class="data"><%=SalesSummaryReportList[2].AmountCount.ToString("0.00") %></span></li>
                <li>
                    <label class="title">佣金金额（元）</label><span class="data"><%=SalesSummaryReportList[2].BrokeragCount.ToString("0.00") %></span></li>
            </ul>

        </div>
        <!--boxinfor end-->
        <!--small title-->
        <div class="smallTitle">
            <i class="icon-box"></i><span class="text">所有分销商销售走势</span>
        </div>
        <!--small title-->
        <!--chart begin-->
        <div id="container" class="chartborder"></div>
        <!--chart end-->
    </div>
    <div class="mt20"></div>
    <!--right end-->
    <script>
        var ChartxAxis = [<%=ViewData["xAxis"]%>];
        var ChartamountData = [<%=ViewData["amountData"]%>];
        var ProductCountData = [<%=ViewData["productCountData"]%>];
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=dashboard"></script>
    <script type="text/javascript" src="http://html.v5portal.com/mcm/content/js/highcharts.js"></script>
    <script src="../../Scripts/WeiXinManage/SalesSummaryChart.js"></script>
</asp:Content>
