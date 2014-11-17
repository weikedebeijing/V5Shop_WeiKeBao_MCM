<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>打印预览</title>
    <style type="text/css">
        *
        {
            font-size: 14px;
            margin: 0;
            padding: 0;
        }
        
        .handlerA
        {
            width: 200px;
            height: 25px;
            line-height: 25px;
            overflow: hidden;
            color: #fff;
            background: #aaa;
            border: 1px solid #aaa;
            text-align: center;
        }
        
        .handlerB
        {
            width: 200px;
            margin: 0 auto;
            height: 90px;
            border: 1px solid #ccc;
            background:#ccc;
        }
        
        .confirmPrintBtn
        {
            background: #0096ff;
            border: 1px solid #0096ff;
            color: #fff;
            padding: 4px 18px;
            font-weight: bold;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .cancelPrintBtn
        {
            background: #999;
            border: 1px solid #999;
            color: white;
            padding: 4px 18px;
            font-weight: bold;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .printSuccessBtn 
        {
            background: #0096ff;
            border: 1px solid #0096ff;
            color: #fff;
            padding: 4px 18px;
            font-weight: bold;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .printFailBtn
        {
             background: #0096ff;
            border: 1px solid #0096ff;
            color: #fff;
            padding: 4px 18px;
            font-weight: bold;
            font-size: 14px;
            vertical-align: middle;
            }
    </style>
    <%--下面是专门控制打印的css--%>
    <style type="text/css" media="print">
        *
        {
            font-size: 14px;
            margin: 0;
            padding: 0;
        }
        
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video
        {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section
        {
            display: block;
        }
        body
        {
            line-height: 1.4em;
        }
        ol, ul
        {
            list-style: none;
        }
        blockquote, q
        {
            quotes: none;
        }
        blockquote:before, blockquote:after, q:before, q:after
        {
            content: '';
            content: none;
        }
        table
        {
            border-collapse: collapse;
            border-spacing: 0;
        }
        
        .extraElement
        {
            display: none;
        }
    </style>
</head>
<body>
    <div id="PrintContent">
    </div>
    <div class="extraElement">
        <input type="hidden" id="expressIDs" value="<%:ViewData["expressIDs"] %>" />
        <div id="popA" style="width: 202px; opacity: 0.8; filter: alpha(opacity=80);">
            <div class="handlerA">
                <span>操作</span></div>
            <div class="handlerB">
                <table>
                    <tr style="height: 50px;">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px;">
                        </td>
                        <td>
                            <input type="button" class="confirmPrintBtn" value="打印" onclick="javascript:printIt();"
                                id="print" style="cursor: pointer;" />
                        </td>
                        <td>
                            <input type="button" class="cancelPrintBtn" onclick="javascript:printCancel();" value="取消"
                                style="cursor: pointer;" />
                        </td>
                        <td style="width: 50px;">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="popB" style="width: 202px; opacity: 0.9; filter: alpha(opacity=90); display: none;">
            <div class="handlerA">
                <span style="color: Red">反馈您的打印结果【非常重要】</span></div>
            <div class="handlerB">
                <table>
                    <tr style="height: 50px;">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 60px;">
                        </td>
                        <td>
                            <input type="button" class="printSuccessBtn" value="打印成功" onclick="javascript:printSuccess();"
                                style="cursor: pointer;" />
                        </td>
                        <td>
                            <input type="button" class="printFailBtn" value="打印失败" onclick="javascript:printFail();"
                                 style="cursor: pointer;" />
                        </td>
                        <td style="width: 60px;">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/easydrag.js" type="text/javascript"></script>
<script type="text/javascript">
    var expressArrayIDs = new Array();
    $(function () {
        expressArrayIDs = $("#expressIDs").val().split(','); // 转换成字符串数组

        for (var i = 0; i < expressArrayIDs.length; i++) {

            $.ajax({
                url: "/OrderForm/ExpressPrintTemplate",
                data: { "id": expressArrayIDs[i] },
                type: "post",
                async: false,
                dataType: "html",
                success: function (data) {
                    $("#PrintContent").append(data);
                }
            });
        }
    })

    // 打印成功后【当用户确定打印成功后才会修改订单的打印状态】
    function printSuccess() {
        var isOk = false;
        // 打印完成后执行
        $.ajax({
            url: "/orderform/ChangeOrderPrintState",
            data: { "orderIDs": JSON.stringify(expressArrayIDs) }, // 必须是json格式传到后台才会被AppHelper.JsonDeserialize解析
            async: false, // 让它同步执行
            type: "post",
            success: function (successdata) {
                if (successdata == "ok") {
                    isOk = true;
                }
            }
        });
        if (isOk = true) {
            window.history.go(-1);
        }
    };

    // 打印失败
    function printFail() {
        $("#popA").css("display", "block");
        $("#popB").css("display", "none");
    };


    // 打印
    function printIt() {
        // 打印 【IE 和 google默认打印浏览器打印后才往下执行，firefox 会另开一个线程。但是都无法判断是否已打印】
        window.print();

        $("#popA").css("display", "none");
        $("#popB").css("display", "block");
    };

    // 取消打印
    function printCancel() {
        window.history.go(-1);
    };


    // 弹出框保持居中操作
    $(function () {

        showDiv($("#popA"));
        $("#popA").easydrag();
        showDiv($("#popB"));
        $("#popB").easydrag();
        function showDiv(obj) {
            //$(obj).show();
            center(obj);
            $(window).scroll(function () {
                center(obj);
            });
            $(window).resize(function () {
                center(obj);
            });
        }
        function center(obj) {

            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = $(obj).height();
            var popupWidth = $(obj).width();

            $(obj).css({
                "position": "absolute",
                "top": (windowHeight - popupHeight) / 2 + $(document).scrollTop() - 150, // $(document).scrollTop():滚动的高度
                "left": (windowWidth - popupWidth) / 2
            });
        }
    });

</script>
