<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <style type="text/css">
        .colorTyle
        {
            color: #6b6969;
        }
    </style>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="/WeiXinCustomerCardType/CustomerCardTypeList?MenuCode=C365" title="返回" class="a-btn float-l">
                <i class="icon-back"></i></a>
            <h1 class="spanTitle">
                创建会员卡</h1>
            <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <!---name begin--->
            <h2 class="title-h2">
                <i class="icon-line r10"></i><span class="text">设置会员卡</span></h2>
            <ul class="list-ul l26">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>名称</label></div>
                    <div class="float-l">
                        <input type="text" id="CustomerCardName" class="w230" name="name" value="" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>编号</label></div>
                    <div class="float-l">
                        <input type="text" class="w150" name="name" value="" id="CardFrontNumer" placeholder="如有前缀请输入" />
                        <input type="text" class="w150" name="name" value="" id="CardStartNumber" placeholder="请输入起始卡号" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>发放数量</label></div>
                    <div class="float-l">
                        <input type="text" id="CreateNum" class="w230" name="name" value="" onkeyup="value=value.replace(/[^\d]/g,'')"
                                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            剔除卡号末位数字</label></div>
                    <div class="float-l">
                        <input type="text" id="RemoveEndNumber" class="w230" name="name" value="" /><span>用"|"分割</span></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>上传卡样</label></div>
                    <div class="float-l">
                        <!--file begini-->
                        <div class="file01">
                            <span class="pic-place w300 h150">
                                <p id="noImg" style="line-height: 150px; display: ;" class="nopic">
                                    暂无图片</p>
                                <img src='' alt='' id='choseImg' onload="javascript:DrawImage(this,300,150);" style="display: none;" />
                            </span>
                            <div class="btn">
                                <input class="btn-pic" type="button" onclick="fileUploadImg.click()" value="上传图片" />
                                <input class="inputfile" type="file" name="file_upload" id="fileUploadImg" onchange="javascript:btnUpload(event);" />
                            </div>
                        </div>
                        <!--file end-->
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <!---column begin--->
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">领取卡需要提供字段内容</span></h2>
            <!--operate begin-->
            <div class="mod-operate l26 t10">
                <div class="con style0list">
                    <ul class="ul-list">
                        <li><a href="javascript:void(0)" class="a-btn" id="add-column" onclick="javascript:AddFields();">
                            添加</a></li>
                        <li><a href="#" class="a-btn" onclick="javascript:batchDel();">批量删除</a></li>
                    </ul>
                </div>
            </div>
            <!--operate end-->
            <div class="clear h10">
            </div>
            <!--table begin-->
            <div class="mod-table l26">
                <div class="mod-table-head">
                    <div class="con style0list-bg">
                        <%var SelfFieldNames = (List<V5.MetaData.WeiXin.Model.SelfFieldName>)ViewData["SelfFieldNames"];%>
                        <table>
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 80px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 250px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" onclick="CheckAll(event)" id="ckall" name="" value=""></label>
                                    </th>
                                    <th>
                                        字段
                                    </th>
                                    <th>
                                        内容格式
                                    </th>
                                    <th>
                                        可为空
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0dotted">
                        <table>
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 80px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 250px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody id="tbodyflag">
                                <%foreach (var item in SelfFieldNames)
                                  { %>
                                <tr dir="tr" id="<%:item.ID %>">
                                    <td>
                                        <div class="cell">
                                            <label>
                                                <input type="checkbox" onclick="CheckThis()" name="sub" dir="<%:item.ID %>" value="" />
                                                <input type="hidden" dir="IsAllowNull" value="<%:item.IsAllowNull %>" />
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell" dir="fieldName">
                                            <%:item.FieldName %></div>
                                    </td>
                                    <td>
                                        <div class="cell" dir="textInputValue">
                                            <%:item.TextInputValue %></div>
                                    </td>
                                    <td>
                                        <div class="cell" dir="IsAllowNull">
                                            <%var isAllowNull = item.IsAllowNull; %>
                                            <%if (isAllowNull == true)
                                              {%>
                                            是
                                            <%}
                                              else
                                              { %>
                                            否
                                            <%} %>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementUp(event);">
                                            上移</a> <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementDown(event);">
                                                下移</a> <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementEdit(event);">
                                                    编辑</a> <a href="javascript:void(0);" class="c07" onclick="javascript:elementDel(event);">
                                                        删除</a>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--table end-->
            <!---column end--->
            <div class="l26 t30 b20">
                <button class="submit01 r10" onclick="javascript:saveAll();">
                    保存</button>
                <button onclick="javascript:cancel()" class="reset01">
                    取消</button>
                <%-- <button onclick="SubmitProductInfo()" class="disabled l10">
                    禁用按钮</button>--%>
            </div>
        </div>
    </div>
    <!-----弹层开始-->
    <div id="AddFieldsAlert" style="display: none;">
        <div class="content" style="width:550px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <%var selfTextInputTypes = (List<V5.MetaData.WeiXin.Model.SelfTextInputType>)ViewData["SelfTextInputTypes"];%>
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    字段名称
                                </label>
                            </div>
                            <div class="float-l">
                                <input type="text" class="w230 colorTyle" id="fieldName" name="fieldName" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    内容类型
                                </label>
                            </div>
                            <div class="float-l">
                                <select id="textInputType" name="textInputType" class="w242">
                                    <option>请选择内容类型</option>
                                    <%foreach (var item in selfTextInputTypes)
                                      { %>
                                    <option value="<%:item.TextInputKey %>">
                                        <%:item.TextInputValue %></option>
                                    <%} %>
                                </select>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    字段可空
                                </label>
                            </div>
                            <div class="float-l">
                                <select id="isAllowNull" name="isAllowNull" class="w242">
                                    <option>字段是否可为空</option>
                                    <option value="False">否</option>
                                    <option value="True">是</option>
                                </select>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="javascript:layerSave();">
                    保存</button>
                <button class="reset01-alert" onclick="javascript:closeLayer();">
                    关闭</button>
            </div>
        </div>
    </div>
    <!-----弹层结束-->
    <!--form end-->
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        var operationType = "";
        var trID = -1000;

        // 初始化
        $(function () {

        });

        // 验证
        var validateDatas = function () {
            var customerCardName = $("#CustomerCardName").val().trim();
            var cardFrontNumer = $("#CardFrontNumer").val().trim(); // 可为空
            var cardStartNumber = $("#CardStartNumber").val().trim();
            var createNum = $("#CreateNum").val().trim();
            var RemoveEndNumber = $("#RemoveEndNumber").val().trim();
            var cardImgUrl = $("#choseImg").attr("src").trim();

            $(".prompt").text("");

            if (customerCardName == "") {
                $("#CustomerCardName").parent().next().find(".prompt").text("名称不能为空");
                $("#CustomerCardName").focus();
                return false;
            }

            if (customerCardName.length > 16) {
                $("#CustomerCardName").parent().next().find(".prompt").text("会员卡名称长度不能大于16");
                $("#CustomerCardName").focus();
                return false;
            }

            if (cardFrontNumer.length > 25) {
                $("#CardFrontNumer").parent().next().find(".prompt").text("会员卡前缀长度不能大于25");
                $("#CardFrontNumer").focus();
                return false;
            }

     
            if (cardStartNumber == "") {
                $("#CardStartNumber").parent().next().find(".prompt").text("会员起始卡号不能为空");
                $("#CardStartNumber").focus();
                return false;
            }

            if (cardStartNumber.length > 32) {
                $("#CardStartNumber").parent().next().find(".prompt").text("会员起始卡号长度不能大于32");
                $("#CardStartNumber").focus();
                return false;
            }

            if (createNum == "") {
                $("#CreateNum").parent().next().find(".prompt").text("发放数量不能为空");
                $("#CreateNum").focus();
                return false;
            } //consumeTimesAdd >= 4294967296 

            if (createNum >= 4294967295) {
                $("#CreateNum").parent().next().find(".prompt").text("发放数量不能大于4294967295");
                $("#CreateNum").focus();
                return false;
            }

            if (RemoveEndNumber.length > 8) {
                $("#RemoveEndNumber").parent().next().find(".prompt").text("剔除末尾数字不能大于8位");
                $("#RemoveEndNumber").focus();
                return false;
            }

            if (cardImgUrl == "") {
                $("#choseImg").parent().parent().parent().next().find(".prompt").text("请上传卡样");
                return false;
            }

            return true;
        };

        // 保存全部
        var saveAll = function () {
            if (!validateDatas()) {
                return false;
            };

            var customerCardName = $("#CustomerCardName").val().trim();
            var cardFrontNumer = $("#CardFrontNumer").val().trim(); // 可为空
            var cardStartNumber = $("#CardStartNumber").val().trim();
            var createNum = $("#CreateNum").val().trim();
            var removeEndNumber = $("#RemoveEndNumber").val().trim();
            var cardImgUrl = $("#choseImg").attr("src").trim();

            var selfFieldNameDatas = "";
            var trs = $("#tbodyflag tr");
            for (var i = 0; i < trs.length; i++) {
                var fieldName = $(trs[i]).find("div[dir=fieldName]").text().trim();
                var textInputValue = $(trs[i]).find("div[dir=textInputValue]").text().trim(); //textInputValue
                var IsAllowNull = $(trs[i]).find("div[dir=IsAllowNull]").text().trim();
                if (IsAllowNull == "是") {
                    IsAllowNull = "True";
                } else {
                    IsAllowNull = "False";
                }

                selfFieldNameDatas += fieldName + "&" + textInputValue + "&" + IsAllowNull + "@";
            }
            selfFieldNameDatas = selfFieldNameDatas.substring(0, selfFieldNameDatas.length - 1);

            var sendDatas = {
                "customerCardName": customerCardName,
                "cardFrontNumer": cardFrontNumer,
                "cardStartNumber": cardStartNumber,
                "createNum": createNum,
                "removeEndNumber": removeEndNumber,
                "cardImgUrl": cardImgUrl,
                "selfFieldNameDatas": selfFieldNameDatas
            };

            $.ajax({
                url: "/WeiXinCustomerCardType/AddCustomerCardType",
                data: sendDatas,
                type: "post",
                success: function (data) {
                    if (data == "ok") {
                        successTip("添加成功");
                        setTimeout(function () {
                            window.location.href = "/WeiXinCustomerCardType/CustomerCardTypeList?MenuCode=C365";
                        }, 600);
                    } else if (data == "error") {
                        errorTip("服务器异常，请联系管理员");
                    }
                }
            });
        };


        //------设置会员卡 start------------------>


        //------设置会员卡 end--------------------> 

        //------上传图片 Start------------------->
        var btnUpload = function (event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            // 当前上传控件的id
            var fileUploadImg = $(eventSrc).attr("id");

            $.ajaxFileUpload({
                url: '/WeiXinCustomerCardType/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: fileUploadImg, //文件上传空间的id属性 
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        $('#choseImg').css("display", "block"); // 
                        $('#choseImg').attr("src", "/UploadFile/WeiXin/CustomerCard/" + res);
                        $('#noImg').css("display", "none"); ;
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function () {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })
        }
        //------上传图片 End--------------------->

        //------领取卡需要提供字段内容 start---------> 

        // 保存弹层内容
        var layerSave = function () {
            $(".prompt").text('');
            var fieldName = $('#fieldName').val().trim();
            var textInputKey = $('#textInputType').val();
            var textInputValue = $("#textInputType").find('option:selected').text().trim();

            var isAllowNull = $("#isAllowNull").val();
            if (fieldName.length <= 0) {
                validataPrompt($('#fieldName'), '请输入字段名称');
                $('#fieldName').focus();
                return false;
            }

            if (textInputKey == "请选择内容类型") {
                validataPrompt($('#textInputType'), '请选择内容类型');
                return false;
            }

            if (isAllowNull == "字段是否可为空") {
                validataPrompt($("#isAllowNull"), '请选择字段是否可为空');
                return false;
            }

            if (operationType == "Add") { // 如果是添加操作
                var $lastTr = $("#tbodyflag").find("tr").last();
                var addStr = getTrElement();

                if ($lastTr.html() == null) {
                    $("#tbodyflag").append(addStr);
                } else {
                    $lastTr.after(addStr);
                }
            }
            $("#" + trID).children().find("div[dir=fieldName]").text('');
            $("#" + trID).children().find("div[dir=textInputValue]").text('');
            $("#" + trID).children().find("div[dir=IsAllowNull]").text('');

            $("#" + trID).children().find("div[dir=fieldName]").text(fieldName);
            $("#" + trID).children().find("div[dir=textInputValue]").text(textInputValue);

            if (isAllowNull == "True") {
                isAllowNull = "是";
            } else {
                isAllowNull = "否";
            }
            $("#" + trID).children().find("div[dir=IsAllowNull]").text(isAllowNull);

            successTip("保存成功");
            setTimeout(popupClose('AddFields'), 600);
        };

        // 编辑
        var elementEdit = function (event) {
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parents("tr"); // 当前的元素
            trID = currentElement.attr("id");

            var fieldName = $("#" + trID).children().find("div[dir=fieldName]").text().trim();
            var textInputValue = $("#" + trID).children().find("div[dir=textInputValue]").text().trim();
            var IsAllowNull = $("#" + trID).children().find("div[dir=IsAllowNull]").text().trim();



            $("select[name=textInputType]").find("option").each(function () { // 让字段的类型选中
                var currentValue = $(this).text().trim();
                if (currentValue == textInputValue) {
                    $(this).attr("selected", "selected");
                }
            });

            $("select[name=isAllowNull]").find("option").each(function () { // 让字段可空选中
                var currentValue = $(this).text().trim();
                if (currentValue == IsAllowNull) {
                    $(this).attr("selected", "selected");
                }
            });
            operationType = "edit";
            popupOperate("AddFieldsAlert", "编辑字段", 'AddFields');
            $("#fieldName").val(fieldName);
        };

        // 元素删除
        function elementDel(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parents('tr'); // 当前的元素
            currentElement.remove();
            successTip("删除成功");
        };


        // 添加字段弹层
        var AddFields = function () {
            operationType = "Add"; // 操作的类型
            popupOperate("AddFieldsAlert", "添加字段", 'AddFields');
            // 还原
            $("select[name=textInputType]").find("option").each(function () { // 让字段的类型选中
                var currentValue = $(this).text().trim();
                if (currentValue == "请选择内容类型") {
                    $(this).attr("selected", "selected");
                }
            });

            $("select[name=isAllowNull]").find("option").each(function () { // 让字段可空选中
                var currentValue = $(this).text().trim();
                if (currentValue == "字段是否可为空") {
                    $(this).attr("selected", "selected");
                }
            });
        };

        // 返回添加的html结构
        function getTrElement() {
            trID++;
            var addStr = "";
            addStr += "<tr dir='tr' id='" + trID + "'>\n"; // 要换行不然样式会不一致
            addStr += "<td>\n";
            addStr += "<div class='cell'>";
            addStr += "<label><input type='checkbox' onclick='CheckThis()' name='sub' value=''></label>";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>";
            addStr += "<div class='cell' dir='fieldName'>\n";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>";
            addStr += "<div class='cell' dir='textInputValue'>\n";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>";
            addStr += "<div class='cell' dir='IsAllowNull'>\n";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementUp(event);'>上移</a>\n";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementDown(event);'>下移</a>\n ";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementEdit(event);'>编辑</a>\n";
            addStr += "<a href='javascript:void(0);' class='c07' onclick='javascript:elementDel(event);'>删除</a>\n";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "</td>";
            return addStr;
        };

        // 元素上移
        function elementUp(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentElement = $(eventSrc).parents('tr'); // 当前的元素
            var preElement = currentElement.prev("tr"); // 上一个元素

            if (preElement.attr("dir") == undefined) {// 第一个不能上移
                return;
            };
            var currentElementHtml = currentElement.html();
            var preElementHtml = preElement.html();

            // 交换内容
            currentElement.html(preElementHtml);
            preElement.html(currentElementHtml);
        };

        // 元素下移
        function elementDown(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentElement = $(eventSrc).parents("tr"); // 当前的元素
            var nextElement = currentElement.next("tr"); // 上一个元素

            if (nextElement.attr("dir") == undefined) {// 最后一个不能下移
                return;
            };
            var currentElementHtml = currentElement.html();
            var nextElementHtml = nextElement.html();

            // 交换内容
            currentElement.html(nextElementHtml);
            nextElement.html(currentElementHtml);
        };

        // 关闭弹层
        function closeLayer() {
            popupClose('AddFields');
        }

        // 批量删除选中项
        function batchDel() {
            var checkIDs = new Array();
            var checks = $("#tbodyflag input[type=checkbox]");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var trID = $(checks[i]).parents("tr").attr("id");
                    // 把id 放到集合中去 形如2,4,5
                    checkIDs.push(trID);
                }
            }

            if (checkIDs.length > 0) {
                var trs = $("#tbodyflag tr"); // 当前的元素

                for (var i = 0; i < checkIDs.length; i++) {
                    for (var j = 0; j < trs.length; j++) {
                        if ($(trs[j]).attr("id") == checkIDs[i]) {
                            $(trs[j]).remove();
                        }
                    }
                }
                successTip("删除成功");

            } else {
                warningTip("请勾选要删除的项");
            }
        };

        var cancel = function () {
            if (confirm("确定要取消？，取消后更改将不会保存")) {
                window.location.href = "/WeiXinCustomerCardType/CustomerCardTypeList";
            }
        };



        //------领取卡需要提供字段内容 end---------> 

        /*
        下面是通用的方法----------------------------------------------------------
        */
        // 去除前后空格
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
        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        var successTip = function (msg) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(msg).change();
        };

        var warningTip = function (msg) {
            $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
            $("#operateTip").html(msg).change();
        };

        var errorTip = function (msg) {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html(msg).change();
        };
    </script>
</asp:Content>
