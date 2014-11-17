<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=dashboard"></script>

    <%--<script type="text/javascript" src="../../Scripts/chart-prismatical.js"></script>
    <script type="text/javascript" src="../../Scripts/chart-order.js"></script>--%>
    
    <script type="text/javascript" src="../../Scripts/highcharts/highcharts.js"></script>
    <script src="../../Scripts/highcharts/modules/exporting.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <%--<div class="MAIN"> --%>
  <!--right begin-->
  <div class="bar-success"> 
      <% V5.MetaData.WeiXin.View.WinXinStatistical WebChat = ViewData["WeiChatSta"] as V5.MetaData.WeiXin.View.WinXinStatistical; %>
    <!--big title begin-->
    <div class="tiptitle"> <span id="Stitle" ></span><br/>
      以下是您<span class="colorred">未处理</span>的任务清单： </div>

    <!--big title end--> 
    <!--list begin-->
    <div class="tasks">
      <ul class="listTasks">
        <li><a href="../../OrderForm/OrderList?appCode=PLATFORM&MenuCode=C205" class="listTasks-a"><span class="number"><%=WebChat.ToSendTheGoods %></span><span class="text">待发货订单</span></a></li>
        <li><a href="../../WeiXinManage/MessageManageList?appCode=PLATFORM&MenuCode=C365" class="listTasks-a"><span class="number"><%=WebChat.ToReply %></span><span class="text">待回复留言</span></a></li>
        <li><a href="../../Product/index?appCode=PLATFORM&MenuCode=C125" class="listTasks-a"><span class="number"><%=WebChat.InventoryWarning %></span><span class="text">库存预警商品</span></a></li>
                <li class="wechat"><a href="javascript:void(0);" onclick="SetAdults();" class="listTasks-a" data-toggle="popover" title="" data-content="1、登录公众平台   2、点击功能>商户功能>维权仲裁" data-original-title="查看维权单："><span class="number"><%=WebChat.AllAdults %></span><span class="text">维权仲裁</span></a></li>
      </ul>
    </div>
    <!--list end-->
    <div class="clear"></div>
    <!--small title-->
        <div class="smallTitle homestl"><i class="icon-box"></i><span class="text">关注统计</span> </div>
    <!--small title--> 
    <!--date begin-->
        <div class="chartselect">
        <ul id="followdata" class="nav nav-tabs dataul">
          <li dir="r1" class="active"><a href="#today" data-toggle="tab">今日</a></li>
          <li dir="r2"><a href="#yestoday" data-toggle="tab">昨日</a></li>
          <li dir="r3"><a href="#week" data-toggle="tab">本周</a></li>
          <li dir="r4"><a href="#month" data-toggle="tab">本月</a></li>
        </ul>
        <p class="followcount">关注用户总数<b><%=WebChat.TheCurrentFocusOn %></b></p>
     </div>
    <!--date end-->
    <!--chart begin--> 
    <div id="container" class="homechartborder"></div>
    <!--chart end-->
    <!--small title-->
        <div class="smallTitle homestl"><i class="icon-box"></i><span class="text">订单统计</span> </div>
    <!--small title--> 
    <!--date begin-->
    <div class="chartselect" id="Order">
        <ul id="orderdata" class="nav nav-tabs dataul">
                <li dir="d1" class="active"><a href="#today" data-toggle="tab">今日</a></li>
          <li dir="d2"><a href="#yestoday" data-toggle="tab">昨日</a></li>
          <li dir="d3"><a href="#week" data-toggle="tab">本周</a></li>
          <li dir="d4"><a href="#month" data-toggle="tab">本月</a></li>
        </ul>
        <p class="followcount">订单总数<b><%=WebChat.AllOrders %></b></p>
     </div>
    <!--date end-->
    <!--chart begin--> 
    <div id="containerOrder" class="homechartborder" ></div>
    <!--chart end-->
    
     
  </div>
  <!--right end--> 
<%--</div>--%>
  <script>
      $(".LEFT").hide();
      // JavaScript Document
      //按时间计算
      var dateHours = [55, 50, 32, 69, 52, 98, 56, 74, 26, 32, 50, 123, 5, 12, 36, 59, 87, 41, 56, 23, 21, 25, 23, 96]
      var dateWeek = [25, 15, 14, 26, 5, 86, 96]
      var dateMonth = [100, 12, 13, 3, 5, 6, 7, 89, 9, 10, 100, 12, 3, 3, 5, 6, 7, 89, 9, 10, 100, 12, 13, 3, 5, 6, 7, 89, 9, 10, 4]
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
                      type: 'column'
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
                      categories: date,
                      labels: {
                          rotation: -45,
                          align: 'right',
                          style: {
                              fontSize: '13px',
                              fontFamily: 'Verdana, sans-serif'
                          }
                      }
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
              $('#containerOrder').highcharts({
                  title: {
                      text: '订单总数统计',
                      x: -20 //center
                  },
                  chart: {
                      renderTo: 'container',
                      type: 'column'
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
                      categories: date,
                      labels: {
                          rotation: -45,
                          align: 'right',
                          style: {
                              fontSize: '13px',
                              fontFamily: 'Verdana, sans-serif'
                          }
                      }
                    
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

          $("#orderdata li").click(function () {
             
                if ($(this).attr("dir") == "d1") {
                  GetConut('D', $(this).attr("dir"));
                  curve("D", dateHours);
              }
                if ($(this).attr("dir") == "d2") {
                  GetConut('D', $(this).attr("dir"));
                  curve("D", dateHours);
              }
                if ($(this).attr("dir") == "d3") {
                  GetConut('D', $(this).attr("dir"));
                  curve("D", dateWeek);
              }
                if ($(this).attr("dir") == "d4") {
                  GetConut('D', $(this).attr("dir"));
                  curve("D", dateMonth);
              }
          })

          $("#followdata li").click(function () {
              if ($(this).attr("dir") == "r1") {
                  GetConut('G', $(this).attr("dir"));
                  curve("G", dateHours);
              }
              if ($(this).attr("dir") == "r2") {
                  GetConut('G', $(this).attr("dir"));
                  curve("G", dateHours);
              }
              if ($(this).attr("dir") == "r3") {
                  GetConut('G', $(this).attr("dir"));
                  curve("G", dateWeek);
              }
              if ($(this).attr("dir") == "r4") {
                  GetConut('G', $(this).attr("dir"));
                  curve("G", dateMonth);
              }
          })

          //加载页面Title以及用户名称
          //1--获取当前时间
          var title;
          var myDate = new Date();
          var dayHour = myDate.getHours();
          if (parseInt(dayHour) >= 0 && parseInt(dayHour) <12)
          {
              title = "早上好，";
          }
          else if (parseInt(dayHour) >= 12 && parseInt(dayHour) < 18)
          {
              title = "下午好，";
          }
          else if (parseInt(dayHour) >= 18 && parseInt(dayHour) < 24) {
              title = "晚上好，";
          }
          var User = $(".dropdown-toggle").html().trim().replace("&nbsp;","$");
          var Users= User.substring(User.indexOf("\n"),User.lastIndexOf("\n")).trim().split("$");
          
          if (Users.length > 0)
          {
              title += Users[0] + "！";

          }
          $("#Stitle").text(title);

      });

   
      
  </script>
</asp:Content>
