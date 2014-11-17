<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=base|system|common|module|wechat"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var imageGroups = (List<V5.MetaData.DRP.Model.ImageGroup>)ViewData["imageGroups"];
    %>
    <!--title begin-->
    <div class="mod-title">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                轮播图设置</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <!---active begin--->
            <h2 class="title-h2">
                <i class="icon-9square r10"></i><span class="text">选择轮播方式</span></h2>
            <ul class="turnpic-ul l26">
                <li class="turnpic-li current">默认</li>
                <%--<li class="turnpic-li">换灯片</li>
                <li class="turnpic-li">百页窗</li>--%>
            </ul>
            <!---active end--->
            <!---prize begin--->
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">轮播内容</span></h2>
            <!--operate begin-->
            <div class="mod-operate l26 t10">
                <div class="con style0list">
                    <ul class="ul-list">
                        <li><a href="javascript:void(0)" id="add" class="a-btn" onclick="javascript:imageGroupAdd(event);">
                            添加</a></li>
                        <li><a href="javascript:void(0)" class="a-btn" onclick="javascript:imageGroupBatchDel();">
                            删除</a></li>
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
                        <table>
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 20%;">
                                <col style="width: 45%;">
                                <col style="width: 30%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" onclick="CheckAll(event)" id="ckall" name="" value=""></label>
                                    </th>
                                    <th>
                                        轮播图片
                                    </th>
                                    <th>
                                        链接地址
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
                                <col style="width: 5%;">
                                <col style="width: 20%;">
                                <col style="width: 45%;">
                                <col style="width: 30%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody id="tbodyflag">
                                <% foreach (var imageGroup in imageGroups)
                                   { %>
                                <tr dir="trFlag" id="<%:imageGroup.ID %>">
                                    <td>
                                        <div class="cell">
                                            <label>
                                                <input type="checkbox" onclick="CheckThis()" name="sub" value="">
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                 <%--        onload="javascript:DrawImage(this,50,50);" onmouseover="javascript:imgOnmouseover();"--%>
                                            <img width="50" height="23" dir='imageUrl' src="<%:imageGroup.ImageUrl %>"></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span dir="httpUrl">
                                                <%:imageGroup.Hyperlink %></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <div class="mod-operate">
                                                <div class="con style0editdel">
                                                    <a href="javascript:void(0);" class="up" onclick="javascript:imageGroupUp(event);">上移</a>
                                                    <a href="javascript:void(0);" class="down" onclick="javascript:imageGroupDown(event);">
                                                        下移</a> <a href="javascript:void(0);" class="edit" onclick="javascript:imageGroupChose(event);">
                                                            编辑</a> <a href="javascript:void(0);" class="del" onclick="javascript:imageGroupDel(event);">
                                                                删除</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span dir="msg" style="color: Red;"></span>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--table end-->
            <!--弹层开始-->
            <div id="rollImgEditAlert" style="display: none;">
                <!--form begin-->
                <div class="content scroll" style="width: 642px; height: 480px;">
                    <div class="mod-form">
                        <div class="con style0updown">
                            <ul class="list-ul">
                                <li class="list-li">
                                    <div class="div-area">
                                        <span class="star">*</span>
                                        <label class="col-label">
                                            首页轮播图</label>
                                        <span class="col-annotation">建议尺寸为640px*320px</span>
                                    </div>
                                    <div class="div-area">
                                        <div class="file01">
                                            <span class="pic-place" style="line-height: 320px;">
                                                <p style="display: ;" class="nopic" id="noImg">
                                                    暂无图片</p>
                                                <img src='' alt='' id='choseImg' onload="javascript:DrawImage(this,640,320);" style="display: none;" />
                                            </span>
                                            <div class="btn">
                                                <input class="btn-pic" type="button" value="上传图片" />
                                                <input class="inputfile" type="file" id="fileUploadImg" onchange="javascript:btnUpload(event);"
                                                    name="file_upload" />
                                            </div>
                                            <div class="div-area">
                                                <span class="prompt"></span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-li">
                                    <div class="div-area">
                                        <span class="star">*</span><label class="col-label">链接地址</label><span class="col-annotation"></span></div>
                                    <div class="div-area">
                                        <input type="text" value="http://" class="wb100" id="txtTip" />
                                    </div>
                                    <div class="div-area">
                                        <span class="prompt"></span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--form end-->
                <div class="btn">
                    <div class="indiv">
                        <button class="submit01-alert r10" onclick="javascript:layerSave();">
                            保存</button>
                        <button class="reset01-alert" onclick="javascript:popupClose('add');">
                            关闭</button>
                    </div>
                </div>
            </div>
            <!--弹层结束-->
            <!---prize end--->
            <div class="l26 t30 b20">
                <input type="hidden" dir='' id='editImageHelper' />
                <input type="hidden" dir='' id='operationType' />
                <input type="hidden" value="<%:ViewData["SysGroupID"] %>" id="SysGroupID" />
                <button class="submit01 r10" onclick="javascript:btnSaveAll();">
                    保存</button>
                <button onclick="javascript:reset(event);" class="reset01">
                    重置</button>
                <%--<button onclick="SubmitProductInfo()" class="disabled l10">
                    禁用按钮</button>--%>
            </div>
        </div>
    </div>
    <!--form end-->
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script type="text/javascript">
        var imageFlag = -1000; // 给新添加的图片组 做标识

        function imgOnmouseover() {
            // console.log('---->move');
        }

        // 保存全部
        function btnSaveAll() {
            var trs = $("#tbodyflag tr");
            for (var i = 0; i < trs.length; i++) { // 清除之前的提示信息
                $(trs[i]).find("span[dir=msg]").text('');
            }

            //if (trs.length <= 0) {
            //    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
            //    $("#operateTip").html("没有要保存的数据").change();
            //    return false;
            //}

            var sendDatas = "";
            for (var i = 0; i < trs.length; i++) {
                var $imageUrl = $(trs[i]).find("img[dir=imageUrl]").attr("src");

                var $httpUrl = $(trs[i]).find("span[dir=httpUrl]").text().trim();

                if ($imageUrl.length <= 0) {
                    $(trs[i]).find("span[dir=msg]").text("请点击“编辑”图标 并上传图片");
                    return false;
                }

                if ($httpUrl.length <= 0) {
                    $(trs[i]).find("span[dir=msg]").text("请点击“编辑”图标 并填写图片链接");
                    return false;
                }

                sendDatas += $imageUrl + "_" + $httpUrl + "|";
            }
            sendDatas = sendDatas.substring(0, sendDatas.length - 1);
            var SysGroupID = $("#SysGroupID").val();
            $.ajax({
                url: "/ImageGroup/ImageGroupEdit",
                type: "post",
                async: false,
                data: { "sendDatas": sendDatas, "SysGroupID": SysGroupID }, //, "showType": showType
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("保存成功").change();
                    }
                }
            });
        };

        // 图片的编辑(弹层)
        function imageGroupChose(event) {

            $("#editImageHelper").attr("dir", ''); // 每次要重置

            $("#operationType").attr("dir", 'edit');

            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parents("tr"); // 当前的元素

            var imageUrl = currentElement.find("img[dir=imageUrl]").attr("src"); // 编辑的图片

            var httpUrl = currentElement.find("span[dir=httpUrl]").text().trim();

            if (imageUrl.length > 0) {
                $("#choseImg").attr("src", imageUrl);
                $("#choseImg").css("display", "block");
                $("#noImg").css("display", "none");
            } else {
                $("#choseImg").attr("src", '');
                $("#choseImg").css("display", "none");
                $("#noImg").css("display", "block");
            }

            // 获取当前的imageGroupID
            var ID = currentElement.attr("id");
            $("#editImageHelper").attr("dir", ID);

            if (ID == undefined) {
                imageFlag++;
                currentElement.attr("id", imageFlag);
                $("#editImageHelper").attr("dir", imageFlag);
            }
            // 给选择图片 赋值
            //createPopup("rollImgEditAlert");

            popupOperate("rollImgEditAlert", "编辑首页轮播图", 'add');
            $("#txtTip").val(httpUrl);
        }

        // 弹层信息保存
        function layerSave() {
            $(".prompt").text('');
            var operationType = $("#operationType").attr("dir"); // 操作类型 edit：编辑 add：添加

            var imageUrl = $("#choseImg").attr("src");

            var httpUrl = $("#txtTip").val().trim();

            if (imageUrl == "") {
                $("#choseImg").parent("span").siblings("div").children(".prompt").text('请上传图片');
                return false;
            }

            if (!checkUrl(httpUrl)) {
                $("#txtTip").parent("div").next("div").children(".prompt").text("请输入有效的链接地址");
                $("#txtTip").focus();
                return false;
            }

            if (operationType == "add") {
                var $lastTr = $("#tbodyflag").find("tr").last();
                var addStr = getAddImgStr();
                if ($lastTr.html() == null) {
                    $("#tbodyflag").append(addStr);
                } else {
                    $lastTr.after(addStr);
                }

            }

            var imageGroupID = $("#editImageHelper").attr("dir");

            $("#" + imageGroupID).children().find("img[dir=imageUrl]").attr("src", imageUrl);
            $("#" + imageGroupID).children().find("span[dir=httpUrl]").text(httpUrl);

            successTip("保存成功");

            setTimeout(popupClose("add"), 600);
        };


        // 检测url 是否合法
        var checkUrl = function (url) {
            var theurl = url;
            var tomatch = /http:\/\/[A-Za-z0-9\.-]{3,}\.[A-Za-z]{3}/
            if (tomatch.test(theurl)) {
                return true;
            }
            else {
                return false;
            }
        }

        // 检测中文域名
        function fn_checkcndomainname(strdomainname) {
            strdomainname = strdomainname.trim();

            arrayofstrings = strdomainname.split(".");
            if (arrayofstrings.length < 2) {
                return (false); // no enough parts
            }
            for (i = 0; i < arrayofstrings.length; i++) {
                str = arrayofstrings[i].trim();
                // must not exceed 20 chars
                if (str.length == 0 || str.length > 20) {
                    return (false);
                }

                // with only leagal chars
                re = /^[a-za-z0-9-u4e00-u9fa5ufe30-uffa0]+$/g
                if (!re.test(str)) {
                    return (false);
                }

                re = /^-/;
                if (re.test(str))
                    return (false);
                re = /-$/;
                if (re.test(str))
                    return (false);
            }
            return (true);
        }

        // 返回添加的html结构
        function getAddImgStr() {
            imageFlag++;
            $("#editImageHelper").attr("dir", imageFlag);
            var addStr = "";
            addStr += "<tr dir='trFlag' id='" + imageFlag + "'>\n"; // 要换行不然样式会不一致
            addStr += "<td>\n";
            addStr += "<div class='cell'>";
            addStr += "<label><input type='checkbox' onclick='CheckThis()' name='sub' value=''></label>";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>";
            addStr += "<div class='cell'>";
            addStr += "<img dir='imageUrl' width='50' height='30' src='' alt='商品图片' /></td>\n";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>";
            addStr += "<div class='cell'>";
            addStr += "<span dir='httpUrl'>";
            addStr += "</span>";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "<div class='cell'>";
            addStr += "<div class='mod-operate'>";
            addStr += "<div class='con style0editdel'>";
            addStr += "<a href='javascript:void(0);' class='up' onclick='javascript:imageGroupUp(event);'>上移</a>\n";
            addStr += "<a href='javascript:void(0);' class='down' onclick='javascript:imageGroupDown(event);'>下移</a>\n ";
            addStr += "<a href='javascript:void(0);' class='edit' onclick='javascript:imageGroupChose(event);'>编辑</a>\n";
            addStr += "<a href='javascript:void(0);' class='del' onclick='javascript:imageGroupDel(event);'>删除</a>\n";
            addStr += "</div>";
            addStr += "</div>";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "<span dir='msg' style='color: Red;'></span>";
            addStr += "</td>";
            return addStr;
        };


        // 元素增加
        function imageGroupAdd(event) {
            $("#operationType").attr("dir", 'add');

            // 清除之前的弹层数据
            $("#choseImg").attr("src", '');
            $("#txtTip").val('http://');
            $("#choseImg").css("display", "none");
            $("#noImg").css("display", "block");

            popupOperate("rollImgEditAlert", "添加首页轮播图", 'add');
        };

        // 元素删除
        function imageGroupDel(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parents('tr'); // 当前的元素
            currentElement.remove();
            successTip("页面上删除成功，保存后才真正删除");
        };

        // 元素上移
        function imageGroupUp(event) {
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
        function imageGroupDown(event) {
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
            closePopup();
        }

        // 批量删除选中项
        function imageGroupBatchDel() {
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
                successTip("页面上删除成功，保存后才真正删除");
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要删除的项").change();
            }
        };

    </script>
    <script type="text/javascript">

        // 重置 刷新
        function reset(event) {
            if (confirmThis(event, "确定要重置？")) {
                window.location.reload();
            }
        };

        // 上传图片
        function btnUpload(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            // 当前上传控件的id
            var fileUploadImg = $(eventSrc).attr("id");

            $.ajaxFileUpload({
                url: '/ImageGroup/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: fileUploadImg, //文件上传空间的id属性 
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        // 把图片替换默认图片
                        $('#choseImg').css("display", "block"); // 
                        $('#choseImg').attr("src", "/UploadFile/ImageGroup/" + res);
                        $('#noImg').css("display", "none"); ;
                    } else {
                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html(res).change();
                    }
                },
                error: function () {
                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })
        }

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "/ImageGroup/ImageGroupList";
        };

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
