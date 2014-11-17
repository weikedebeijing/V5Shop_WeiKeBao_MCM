<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/easydrag.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=default|base|system|common|module|mcm"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
    <style type="text/css">
        #btnSave:hover
        {
            cursor: pointer;
        }
        
        .btn-pic
        {
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="javascript:void(0)" onclick="GoToLinkUrl(event)" title="返回" class="a-btn float-l">
                <i class="icon-back" linkurl="/Logistics/PrintTemplateList"></i></a>
            <h1 class="spanTitle">
                设置模版</h1>
        </div>
    </div>
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <%
                var logisticsCompanys = (List<V5.MetaData.Delivery.Model.LogisticsCompany>)ViewData["logisticsCompanys"];
            %>
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>模版名称</label></div>
                    <div class="float-l">
                        <input type="text" class="w230" id="selfTemplateName" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>快递公司</label></div>
                    <div class="float-l">
                        <select class="w242" name="logisticsCompany" id="logisticsCompany">
                            <option value="All">--选择快递公司--</option>
                            <% if (logisticsCompanys.Count > 0)
                               { %>
                            <%foreach (var lCompany in logisticsCompanys)
                              {
                                  if (lCompany.Status == "0")
                                  {
                                  
                            %>
                            <option value="<%:lCompany.ID %>">
                                <%:lCompany.Name%></option>
                            <%}
                              }%>
                            <%} %>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>尺寸</label></div>
                    <div class="float-l">
                        <select id="measureType">
                            <option value="pxMeasure">像素（px）</option>
                            <option value="mmMeasure">毫米（mm）</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp; 宽&nbsp;<input id="sysTemplateWidth" type="text" onblur="javascript:picAttrChange();"
                            onkeyup="value=value.replace(/[^\d]/g,'')" class="v5-input in50 l5" /><label class="l30">高&nbsp;</label><input
                                id="sysTemplateHeight" onblur="javascript:picAttrChange();" onkeyup="value=value.replace(/[^\d]/g,'')"
                                type="text" class="v5-input in50 l5" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>选择打印项</label></div>
                    <div class="overflow">
                        <%--打印选项设置 Start----------%>
                        <ul class="overflow" id="Template_All">
                            <li class="float-l w150">
                                <input id="ckb_1" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_1">
                                    订单编号</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_2" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_2">
                                    发件人公司</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_3" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_3">
                                    收件人姓名</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_4" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_4">
                                    收件人邮编</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_5" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_5">
                                    发件人姓名</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_6" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_6">
                                    发件人地址</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_7" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_7">
                                    收件人电话</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_8" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_8">
                                    代收金额</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_9" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_9">
                                    发件人电话</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_10" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_10">
                                    发件人邮编</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_11" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_11">
                                    收件人地址</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_12" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_12">
                                    货到付款物流编号</label>
                            </li>
                            <li class="float-l w150">
                                <input id="ckb_13" checked="checked" type="checkbox" onclick="javascript:ckbClick(event);" />
                                <label for="ckb_13">
                                    备注</label>
                            </li>
                        </ul>
                        <%--打印选项设置 End----------%>
                        <!--设置快递单 begin-->
                        <div class="templet">
                            <!--img begin-->
                            <div class="file01 w800 t10">
                                <span id="defaultImg" class="pic-place wb100 h480" style="line-height: 480px;">
                                    <p style="display: ;" class="nopic">
                                        暂无图片</p>
                                </span>
                                <img id="TemplatePic" style="display: none;" src="" alt="请上传图片" />
                                <div class="btn">
                                    <input class="btn-pic" type="button" onclick="$('#fileUploadImg').click();" value="上传图片" />
                                    <input class="inputfile" id="fileUploadImg" type="file" name="choseImg" onchange="javascript:btnUploadFile();" />
                                </div>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                            <!--img end-->
                            <!--label01 begin-->
                            <div class="templet-label">
                                <!--col01 begin-->
                                <div class="col01">
                                    <!--01 begin-->
                                    <div onclick="javascript:DragRule(event);" class="field" id="field_drag1" style="position: absolute;
                                        top: 0px; left: 0px;">
                                        <span class="field-name">订单编号</span><a id="A_1" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--01 end-->
                                    <!--02 begin-->
                                    <div class="field" id="field_drag2" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 35px; left: 0px;">
                                        <span class="field-name">发件人公司</span><a id="A_2" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--02 end-->
                                    <!--03 begin-->
                                    <div class="field" id="field_drag3" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 70px; left: 0px;">
                                        <span class="field-name">收件人姓名</span><a id="A_3" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--03 end-->
                                    <!--04 begin-->
                                    <div class="field" id="field_drag4" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 105px; left: 0px;">
                                        <span class="field-name">收件人邮编</span><a id="A_4" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--04 end-->
                                    <!--05 begin-->
                                    <div class="field" id="field_drag5" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 140px; left: 0px;">
                                        <span class="field-name">发件人姓名</span><a id="A_5" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--05 end-->
                                    <!--06 begin-->
                                    <div class="field" id="field_drag6" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 175px; left: 0px;">
                                        <span class="field-name">发件人地址</span><a id="A_6" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--06 end-->
                                    <!--07 begin-->
                                    <div class="field" id="field_drag7" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 210px; left: 0px;">
                                        <span class="field-name">收件人电话</span><a id="A_7" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--07 end-->
                                    <!--08 begin-->
                                    <div class="field" id="field_drag8" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 245px; left: 0px;">
                                        <span class="field-name">代收金额</span><a id="A_8" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--08 end-->
                                    <!--09 begin-->
                                    <div class="field" id="field_drag9" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 280px; left: 0px;">
                                        <span class="field-name">发件人电话</span><a id="A_9" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--09 end-->
                                    <!--10 begin-->
                                    <div class="field" id="field_drag10" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 315px; left: 0px;">
                                        <span class="field-name">发件人邮编</span><a id="A_10" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--10 end-->
                                    <!--11 begin-->
                                    <div class="field" id="field_drag11" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 350px; left: 0px;">
                                        <span class="field-name">收件人地址</span><a id="A_11" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--11 end-->
                                    <!--12 begin-->
                                    <div class="field" id="field_drag12" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 385px; left: 0px;">
                                        <span class="field-name">货到付款物流编号</span><a id="A_12" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--12 end-->
                                    <div class="field" id="field_drag13" onclick="javascript:DragRule(event);" style="position: absolute;
                                        top: 420px; left: 0px;">
                                        <span class="field-name">备 注</span><a id="A_13" onclick="javascript:closeA(event);"
                                            class="closeA" href="#">X</a>
                                    </div>
                                    <!--12 end-->
                                </div>
                            </div>
                            <!--label01 End-->
                        </div>
                        <!--设置快递单 End-->
                    </div>
                </li>
            </ul>
            <div class="l130 t30 b20">
                <input type="button" id="btnSave" class="submit01 r10" onclick="javascript:SaveState();"
                    value="保存" />
                <button onclick="javascript:cancel()" class="reset01">
                    取消</button>
            </div>
            <%--打印选项设置 End------------%>
        </div>
    </div>
    <!--form end-->
    <%-----------------------------------------------------------%>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script type="text/javascript">
        /*1毫米 约等于 3.78像素*/
        var picWidth;
        var picHeight;
        $(function () {
            // 要实现拖拽的DIV标签
            $('.field').easydrag();

            // 度量单位改变时
            measureTypeChange();
        });

        // 度量单位改变时
        function measureTypeChange() {
            $("#measureType").change(function () {

                var measureType = $("#measureType").val();
                var length = $("#sysTemplateWidth").val();
                var width = $("#sysTemplateHeight").val();
                if (measureType == "pxMeasure") { // px
                    length = length * 3.78;
                    width = width * 3.78;
                } else { // mm 单位
                    length = length / 3.78;
                    width = width / 3.78;
                };

                if (length > 0) {
                    $("#sysTemplateWidth").val(length);
                }
                if (width > 0) {
                    $("#sysTemplateHeight").val(width);
                }


            });
        };

        // 上传图片
        function btnUploadFile() {
            // 在上传图片之前一定要先让用户设置宽和高
            if ($("#sysTemplateWidth").val() == "" || $("#sysTemplateHeight").val() == "") {
                validataPrompt($("#sysTemplateHeight"), "上传文件之前请先设置模版的宽或者高");
                $("#sysTemplateHeight").focus();
                //                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                //                $("#operateTip").html("上传文件之前请先设置模版的宽或者高").change();
                $("#fileUploadImg").val(''); // 如果不清空文件内容，下次将无法上传图片
                return false;
            } else {
                $(".prompt").text('');
            }
            $.ajaxFileUpload({
                url: '/Logistics/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: "fileUploadImg", //文件上传控件的id属性 
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {

                        // 重新设置图片的宽高 (用户输入的宽高)
                        picWidth = $("#sysTemplateWidth").val();
                        picHeight = $("#sysTemplateHeight").val();
                        if ($("#measureType").val() != "pxMeasure") { // px
                            picWidth = picWidth * 3.78;
                            picHeight = picHeight * 3.78;
                        }
                        // 设置图片的宽高
                        $("#TemplatePic").css("width", picWidth);
                        $("#TemplatePic").css("height", picHeight);
                        //                        $(".templet-label").css({ "width": picWidth, "height": picHeight });
                        $("#TemplatePic").css("display", "block");
                        $("#defaultImg").css("display", "none");

                        // 把图片替换成上传的图片
                        $("#TemplatePic").attr("src", "/Images/Logistics/" + res);
                    } else {
                        alert(res);
                    }
                },
                error: function () {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })
        }

        // 点击保存 记住所有checkBox 选中的对应的tip的 坐标 以及当前(快递公司的ID,传到后台获取模板ID)
        function SaveState() {
            // js 验证
            if (!Validate()) {
                return false;
            }

            // 遍历所有的checkBox
            var checks = $("#Template_All input[type=checkbox]");
            var sendDatas = "";
            for (var i = 0; i < checks.length; i++) {
                var checked = $(checks[i]).attr("checked");
                if (checked == "checked") { // 遍历被选中的

                    // 5_67|89 :ID+left坐标+top坐标
                    var check = $(checks[i]).attr("id");
                    // 要传输的ID号
                    var sendID = check.substring(check.indexOf('_') + 1, check.length);

                    // 对应的tip
                    var tip = "#field_drag" + sendID;
                    // 取tip的相对图片的left值
                    var sendLeft = $(tip).css("left");
                    var sendTop = $(tip).css("top");
                    //var sendLeft = $(tip).attr("left");

                    sendLeft = sendLeft.substring(0, sendLeft.indexOf('p'));

                    // 取tip的相对图片的top值
                    var sendTop = $(tip).css("top");
                    sendTop = sendTop.substring(0, sendTop.indexOf('p'));

                    sendTop = parseInt(sendTop) + 1;
                    // 组装发送到后台的数据
                    sendDatas += sendID + '_' + sendLeft + '|' + sendTop + ',';
                }
            }

            if (sendDatas.length > 0) {
                var expressID = $("#logisticsCompany").val();
                var expressName = $("select[name=logisticsCompany]").find('option:selected').text();
                var selfTemplateName = $("#selfTemplateName").val();
                var selfImgUrl = $("#TemplatePic").attr("src");
                sendDatas = sendDatas.substring(0, sendDatas.length - 1);

                var measureType = $("#measureType").val();
                var picWidth = $("#sysTemplateWidth").val();
                var picHeight = $("#sysTemplateHeight").val();
                if (measureType == "pxMeasure") { // px
                    // 不需要处理
                } else { // mm 单位 要转换成px
                    picWidth = picWidth * 3.78;
                    picHeight = picHeight * 3.78;
                };

                // 添加自定义模版
                $.ajax({
                    url: "/Logistics/AddSelfTemplate",
                    data: { "sendDatas": sendDatas, "picWidth": picWidth, "picHeight": picHeight, "expressID": expressID, "expressName": expressName, "templateName": selfTemplateName, "selfImgUrl": selfImgUrl },
                    type: "post",
                    async: false,
                    success: function (returnData) {
                        if (returnData == "ok") {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("添加成功！").change();
                            setTimeout(function () {
                                GoToLinkUrl("", "/Logistics/PrintTemplateList");
                            }, 600);
                        } else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("添加失败,请联系管理员！").change();
                        }
                    }
                });
            };

        }
        // js 验证
        function Validate() {
            $(".prompt").text('');

            if ($("#selfTemplateName").val() == "") {
                $("#selfTemplateName").focus();
                validataPrompt($("#selfTemplateName"), '模版名称不能为空');
                return false;
            }

            if ($("#logisticsCompany").val() == "All") {
                $("#logisticsCompany").focus();
                validataPrompt($("#logisticsCompany"), '请选择快递公司');
                return false;
            }

            if ($("#sysTemplateWidth").val() == "" && $("#sysTemplateHeight").val() != "") {
                $("#sysTemplateWidth").focus();
                validataPrompt($("#sysTemplateWidth"), "模版宽不能为空");
                return false;
            }

            if ($("#sysTemplateHeight").val() == "" && $("#sysTemplateWidth").val() != "") {
                $("#sysTemplateHeight").focus();
                validataPrompt($("#sysTemplateHeight"), "模版高不能为空");
                return false;
            }

            if ($("#sysTemplateWidth").val() == "" && $("#sysTemplateHeight").val() == "") {
                $("#sysTemplateWidth").focus();
                validataPrompt($("#sysTemplateHeight"), "模版宽、高不能为空");
                return false;
            }

            if ($("#TemplatePic").attr("src") == "") {
                $("#TemplatePic").parent().next("div").find(".prompt").text('请上传模版图片');
                return false;
            }
            return true;
        }

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        // 监控tips不能出了范围
        function DragRule(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;


            // 判断当前拖动的对象是谁 必须是 div 不是就转换成 div (防止点击的是<span>)
            if ($(eventSrc).attr("class") == "field-name") {
                eventSrc = $(eventSrc).parent();
            }

            var Left = $(eventSrc).css("left");
            var Top = $(eventSrc).css("top");

            Left = Left.substring(0, Left.indexOf('p'));
            Top = Top.substring(0, Top.indexOf('p'));
            if (Left < 0) {
                $(eventSrc).css("left", "0px");
            }
            if (Top < 0) {
                $(eventSrc).css("top", "0px");
            }
            if (Top > picHeight - 40) {
                $(eventSrc).css("top", picHeight - 40 + "px");  // picHeight-30
            }
            if (Left > picWidth - 136) {
                $(eventSrc).css("left", picWidth - 136 + "px");  // picWidth-136
            }

        };

        // checkBox的点击事件
        function ckbClick(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            // 如果选中了对应的checkBox 将对应的tip显示出来
            if ($(eventSrc).attr("checked") == "checked") { // jquery 的这个版本 要用true 和false判断
                // 当前点击的 checkbox 的id  ckb_12
                var ckbClick = $(eventSrc).attr("id")
                var ckbID = ckbClick.substring(ckbClick.indexOf('_') + 1, ckbClick.length);
                // 让对应的tip 显示
                var tip = "#field_drag" + ckbID;
                $(tip).css("display", "block")
            } else {
                // 当前点击的 checkbox 的id  ckb_12
                var ckbClick = $(eventSrc).attr("id");
                var ckbID = ckbClick.substring(ckbClick.indexOf('_') + 1, ckbClick.length);
                // 让对应的tip 显示
                var tip = "#field_drag" + ckbID;
                $(tip).css("display", "none");
            }


        };

        // 点击a标签关闭时
        function closeA(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentA = $(eventSrc).attr("id");
            var AID = currentA.substring(currentA.indexOf('_') + 1, currentA.length);
            var currentCkeck = "#ckb_" + AID;
            $(currentCkeck).attr("checked", false);

            // 关闭当前的tip
            $(eventSrc).parent().css("display", "none");

        };

        // 焦点离开宽高时的事件
        function picAttrChange() {
            // 如果是 像素单位
            var measureType = $("#measureType").val();

            var length = $("#sysTemplateWidth").val();
            var width = $("#sysTemplateHeight").val();
            if (measureType == "pxMeasure") { // px
                if (width != "") {
                    if (width > 465) {
                        $("#sysTemplateHeight").val(465);
                        validataPrompt($("#sysTemplateHeight"), "推荐高度不超过465px");
                    } else {
                        $(".prompt").text('');
                    }
                } else {
                    $(".prompt").text('');
                }
            } else {
                if (width < 124) {
                    length = length * 3.78;
                    width = width * 3.78;
                    $(".prompt").text('');
                } else {
                    $("#sysTemplateHeight").val(123.1);
                    width = 123.1;
                    validataPrompt($("#sysTemplateHeight"), "推荐高度不超过124mm");
                    length = length * 3.78;
                    width = width * 3.78;
                }

            }




            //            if (width <= 465 || width == "") {
            //                if (measureType == "pxMeasure") { // px
            //                    // 不需要转换  
            //                } else { // mm 单位
            //                    if (width < 124) {
            //                        length = length * 3.78;
            //                        width = width * 3.78;
            //                    } else {
            //                        $("#sysTemplateHeight").val(123.1);
            //                        validataPrompt($("#sysTemplateHeight"), "推荐高度不超过124mm");
            //                        length = length * 3.78;
            //                        width = width * 3.78;
            //                    }
            //                };
            //            } else {
            //                $("#sysTemplateHeight").val(465);
            //                validataPrompt($("#sysTemplateHeight"), "推荐高度不超过465px");

            //            }
            if (length > 0 && width > 0) {
                $("#TemplatePic").css({ "width": length, "height": width });
                //                $(".templet-label").css({ "width": length, "height": width });
            }

        };

        // 取消
        function cancel() {

            GoToLinkUrl("", "/Logistics/PrintTemplateList");

        }
           
    </script>
</asp:Content>
