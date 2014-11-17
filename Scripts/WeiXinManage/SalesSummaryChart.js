$(function () {
    $('#container').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: '销量走势'
        },
        xAxis: {
            categories: ChartxAxis,
            labels: {
                rotation: -45,
                align: 'right',
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }

        ,
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}件',
                style: {
                    color: '#eb6400'
                }
            },
            min: 0,//不显示负数
            title: {
                text: '销量',
                style: {
                    color: '#eb6400'
                }
            }
        }, { // Secondary yAxis
            title: {
                text: '销售额',
                style: {
                    color: '#00acec'
                }
            },
            min: 0,//不显示负数
            labels: {
                format: '{value} 元',
                style: {
                    color: '#00acec'
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
  
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: '#FFFFFF'
        },
        series: [{
            name: '销售额',
            color: '#00acec',
            type: 'spline',
            yAxis: 1,
            data: ChartamountData,
            tooltip: {
                valueSuffix: '元'
            }

        }, {
            name: '销量',
            color: '#eb6400',
            type: 'spline',
            data: ProductCountData,
            tooltip: {
                valueSuffix: '件'
            }
        }]
    });
});
