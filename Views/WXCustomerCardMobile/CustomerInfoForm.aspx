<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.Framework.Web.Mvc" %>
<%@ Import Namespace="V5.Framework.Web.Enum" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>会员卡</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/membershipcard.css" />
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body class="membershipcard-bg">
    <!--title begin-->
    <section class="detail-title">
    <h1 class="title-h1">填写会员卡资料</h1>
  </section>
    <!--title end-->
    <!--detail list begin-->
    <section id="flag">
    <%var selfFieldNames = (List<V5.MetaData.WeiXin.Model.SelfFieldName>)ViewData["selfFieldNames"]; %>
    <ul class="memberform-ul">
      <%foreach (var item in selfFieldNames)
        { %>
         <%var isAllowNull = item.IsAllowNull == true ? "1" : "0"; %>
         <li class="memberform-li">
         <div class="column01"><label><%:item.FieldName %>:</label></div>
         <div class="column02">
         <%if (item.TextInputKey != "DateTime") {%>
         <%:SelfFieldHtmlHepler.ShowSelfHtml(null, item.TextInputKey, item.ID, item.IsAllowNull, item.FieldName)%>
         <%} else{%>
           <input type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'})" id="<%:item.ID %>" validate="DateTime" isAllowNull='<%:isAllowNull %>' fieldName=<%:item.FieldName %> />
         <%} %>
         </div>
         </li>
      <%} %>
      <%--<li class="memberform-li">
        <div class="column01"><label>生日2:</label></div>
        <div class="column02">
          <div class="l33">
          <select>               
            <option value="1">1985年</option>
            <option value="131">1695年</option>
          </select>
          </div>
          <div class="m33">
          <select>               
            <option value="1">1月</option>
            <option value="131">2月</option>
          </select>
          </div>
          <div class="r33">
          <select>               
            <option value="1">1日</option>
            <option value="131">1日</option>
          </select>
          </div>
        </div>
      </li>--%> 
    </ul>
    <div class="btn-div"><button class="submit" type="button" onclick="javascript:saveAll();">提交</button></div>
  </section>
    <!--detail list end-->
    <footer>
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
  </footer>
</body>
</html>
<script src="../../Scripts/jscommon.js" type="text/javascript"></script>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

    // 保存
    var saveAll = function () {
        var elements = $("#flag").find("input[type=text]");
        for (var i = 0; i < elements.length; i++) {
            var fieldNameID = $(elements[i]).attr("id");

            var isAllowNull = $(elements[i]).attr("isAllowNull");
            var fieldName = $(elements[i]).attr("fieldName");

            var validate = $(elements[i]).attr("validate");
            var result = validateElement(isAllowNull, fieldName, validate, fieldNameID);
            if (!result) {
                return false;
            }

        }
    };

    // 验证元素
    var validateElement = function (isAllowNull, fieldName, validate, fieldNameID) {
        //debugger;
        var result = true;
        var $field = $("#" + fieldNameID + ""); // 当前元素
        var fieldValue = $field.val().trim(); // 值

        /*
        01-验证是否为空
        */
        if (isAllowNull == "0" && fieldValue.length <= 0) { // 不允许为空 直接返回
            alert(fieldName + "不能为空");
            $field.focus();
            result = false;
            return result;
        }

        /*
        02-根据不同的文本类型验证
        */
        switch (validate) {
            case "Text":
                {

                } break;
            case "MobilePhone":
                {
                    if (fieldValue.length != 11) { // 手机号码11位
                        $field.val('');
                        $field.focus();
                        alert(fieldName + "格式不正确");
                        result = false;
                    }
                } break;
            case "DateTime":
                {
                } break;
            case "Money":
                {
                    if (!IsNum($field)) {
                        $field.val('');
                        $field.focus();
                        alert(fieldName + "格式不正确");
                        result = false;
                    }
                } break;
        }
        return result;
    }

     // 去空格
    if (!String.prototype.trim) {
        String.prototype.trim = function () {
            var str = this.replace(/^\s+/, ""),
                    end = this.length - 1,
                    ws = /\s/;
            while (ws.test(this.charAt(end))) {
                end--;
            }
            return this.slice(0, end + 1);
        }
    }
</script>
