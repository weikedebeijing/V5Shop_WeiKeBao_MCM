
	var dateHours = [55,50,32,69,52,98,56,74,26,32,50,123,5,12,36,59,87,41,56,23,21,25,23,96]
	var dateWeek = [25,15,14,26,5,86,96]
	 var dateMonth = [100,12,13,3,5,6,7,89,9,10,100,12,3,3,5,6,7,89,9,10,100,12,13,3,5,6,7,89,9,10,4]
	 var XdateHours=['00:00','01:00','02:00','03:00','04:00','05:00','06:00','07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00']
	 var xdateWeek=["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"]
	 var xdateMonth = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
$(function () {

curve(dateHours);
GetConut("today");

$("#followdata li").click(function(){
	if($(this).attr("dir")=="today")
	{
		curve(dateHours,XdateHours);
		}
			if($(this).attr("dir")=="yesToday")
	{
		curve(dateHours,XdateHours);
		}
			if($(this).attr("dir")=="week")
	{
		curve(dateWeek,xdateWeek);
		}
			if($(this).attr("dir")=="month")
	{
		curve(dateMonth,xdateMonth);
		}
	})
});


function GetConut(date)
{
	GetValue(date);
}
	
	
	
	
	 function curve(date,test) 
	 {
		     $('#container').highcharts({
        chart: {
            type: 'column',
            margin: [50, 50, 100, 80,200]
        },
        title: {
            text: '关注人数统计'
        },
        xAxis: {
            categories: test,
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
            min: 0,
            title: {
                text: '数量（人）'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>',
        },
        series: [{
            name: 'Population',
            data:date,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });
	
		 
	 }
		 

	 
	 
	 
	 
	 
function GetValue(date)
 {
var dateItem = ""; //记录 dateHours dateMonth dateWeek
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
case "today":
array = new Array();
dateItem = dateHours;
break;
case "yesToday":
array = new Array();
dateItem = dateHours;
break;
case "week":
array = new Array();
dateItem = dateWeek
break;
case "month":
array = new Array();
dateItem = dateMonth
break;
}
 }