<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = new Array();
        searchQuery.Groups[0] = '<%:ViewData["channelCode"] %>';

        searchQuery.Groups[1] = 'All';

        searchQuery.Query = '';
      
    </script>
    <%
        var sysGroups_helpCenters = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["sysGroups"];     
    %>
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul id="allCount">
                <li class="current c16" dir="All"><a href="#">全部（<%:ViewData["AllCount"]%>）</a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" id="txtSearch" class="search-input" placeholder="请输入名称..."/>
                </li>
                <li><a class="search-btn search" href="#"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <div class="mod-condition t20">
        <div class="con style0list">
            <ul id="groupSearch">
                <%foreach (var helperCenter in sysGroups_helpCenters)
                  { %>
                <li dir="<%:helperCenter.ID %>"><a href="#">
                    <%:helperCenter.Name%>（<span id="sysGroup_<%:helperCenter.ID %>"></span>）</a></li>
                <%} %>
            </ul>
        </div>
    </div>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" onclick="javascript:addHeplerCenter();" href="javascript:void(0);">
                    添加</a></li>
                <li><a class="a-btn" href="#" onclick="javascript:deleteBatch(event);">删除</a></li>
                <li><a class="a-btn" href="#" onclick="javascript:groupEdit();">分组编辑</a></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <%--Page Start--%>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul" id="dvPage">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>
            </div>
            <div class="number">
                <div class="r10">
                    当前<span id="numberStart"></span>~<span id="numberEnd"></span>条，总计<span id="pageTotalCount"></span>条</div>
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <%--Page End--%>
    <!--列表 Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <% Html.RenderAction("GetHelperCenterView", new { CurrentPageIndex = 0 });%>
            <%--局部试图 End--%>
        </div>
    </div>
    <input type="hidden" id="returnStrs" value="<%:ViewData["returnStrs"]%>" />
    <!--列表 End-->
    <%--分组编辑弹层 Start--%>
    <div id="groupEditAlert" style="display: none;">
        <div class="content scroll" style="width: 600px; height: 400px;">
            <div class="mod-form">
                <div class="mod-table">
                    <div class="mod-table-head">
                        <div class="con style0list-bg">
                            <%var sysGroupEdits = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["sysGroupEdits"];%>
                            <table>
                                <colgroup>
                                    <col style="width: 705;">
                                    <col style="width: 30%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            分组名称
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
                                    <col style="width: 705;">
                                    <col style="width: 30%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody id="helperCenterGroupForm">
                                    <%foreach (var item in sysGroupEdits)
                                      { %>
                                    <tr dir="sysGroup_data">
                                        <td>
                                            <div class="cell">
                                                <input type="text" class="v5-input in200" dir="<%:item.ID %>" name="sysGroupName"
                                                    value="<%:item.Name%>" />
                                            </div>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementUp(event);">
                                                上移</a> <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementDown(event);">
                                                    下移</a> <a href="javascript:void(0);" class="c07 r15" onclick="javascript:elementAdd(event);">
                                                        添加</a> <a href="javascript:void(0);" class="c07" onclick="javascript:elementDel(event);">
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
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="javascript:saveAll();" class="submit01-alert r10">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('groupEdit')" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--分组编辑弹层 End--%>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript">
        var _groupEditAlertHtml = $("#groupEditAlert").html();
         // 记录删除的 sysGroupIDs 
        var deleteSysGroupIDs = new Array();

        $(function () {
            // 调用分页
            helperCenterView(1);

            // 查询
            txtSearchTips();

            // 给动态生成的分组的数量赋值 以及和为未组的标签赋值
            setCountToSysGroup();
        });

        // 元素上移
        function elementUp(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentElement = $(eventSrc).parent().parent(); // 当前的元素
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

            var currentElement = $(eventSrc).parent().parent(); // 当前的元素
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

        // 元素删除
        function elementDel(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parent().parent(); // 当前的元素

            var deleteSysGroupID = $(eventSrc).parent().prev("td").find("input[name=sysGroupName]").attr("dir");//
    
            if ("-1" != deleteSysGroupID) // 排除新增
            {
              deleteSysGroupIDs.push(deleteSysGroupID);
            }

            currentElement.remove();
        };

        // 元素添加
        function elementAdd(event){
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parent().parent(); // 当前的元素
            
            var addStr = "";
            addStr += "<tr dir='sysGroup_data'>\n"; // 要换行不然样式会不一致
            addStr += "<td>\n";
            addStr += "<div class='cell'>";
            addStr += "<label><input type='text' class='v5-input in200' dir='-1' name='sysGroupName' value='' /></label>";
            addStr += "</div>";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementUp(event);'>上移</a>\n";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementDown(event);'>下移</a>\n ";
            addStr += "<a href='javascript:void(0);' class='c07 r15' onclick='javascript:elementAdd(event);'>添加</a>\n";
            addStr += "<a href='javascript:void(0);' class='c07' onclick='javascript:elementDel(event);'>删除</a>\n";
            addStr += "</td>";
            addStr += "<td>\n";
            addStr += "</td>";
             currentElement.after(addStr);
        };

       
        // 保存
        function saveAll() {
         var deleteTips = false;
         $.map(deleteSysGroupIDs,function(item){
           if (item != -1)
           {
             deleteTips = true;
           }
         });

        
         if (deleteTips){
           if (!confirm('检测到您删除了已有分组,删除后其下的文章也会被删除,确定要继续？')){
              return false;
           };
         }
         
            var eidtorAddSendDatas = "";
            var delSendDatas = "";
            var checkRepeatDatas = "";
            var sysGroups = $("tr[dir=sysGroup_data]");
      
            var sortNumber=100;
            for(var i=0;i<sysGroups.length;i++){
                var sortOrder = sortNumber-i;
                $sysGroupName = $(sysGroups[i]).find("input[name=sysGroupName]");
                if (0 == $sysGroupName.val().length){
                    $sysGroupName.focus();
                    warningTip("请输入分组名称");
                    return false;
                }
                // dir为-1的是新增的
                var sysGroupID = $sysGroupName.attr("dir");
                eidtorAddSendDatas +=$sysGroupName.val()+"_"+sysGroupID+"_"+sortOrder+"|"; // [name_sysGroupID_sortOrder]
                checkRepeatDatas +=$sysGroupName.val()+"|";
            }      
           
                eidtorAddSendDatas = eidtorAddSendDatas.substring(0,eidtorAddSendDatas.length-1);  

                delSendDatas = JSON.stringify(deleteSysGroupIDs);// 要把数组对象转换成json字符串,到后台再转换成数组

                checkRepeatDatas = checkRepeatDatas.substring(0,checkRepeatDatas.length-1);
                if (eidtorAddSendDatas.length <=0)
                {
                  eidtorAddSendDatas = "no data";
                }
               
            $.ajax({
                url: "/HelpCenter/HelpCenterGroupEdit",
                data: {"eidtorAddSendDatas":eidtorAddSendDatas,"delSendDatas":delSendDatas,"checkRepeatDatas":checkRepeatDatas},
                type:"post",
                async: false,
                success: function (returnData) { 
                    if ("ok" == returnData){
                          $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                          $("#operateTip").html("保存成功").change();
                          setTimeout(function(){
                            window.location.href="/HelpCenter/HelpCenterList?MenuCode=C555";
                          },600);
                    }else if ("repeat" == returnData){
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("请检查分组名称不能重复").change();
                    }else if ("no datas" == returnData){
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("没有可以编辑的项").change();
                    }
                },
            });

          
        };

        // 给动态生成的分组的数量赋值
        var setCountToSysGroup = function () {
            
            // 动态生成的标签数量赋值
            var returnStrs = $("#returnStrs").val().split('|'); // 形如 UserGroupID,UserGroupCount|
            for (var i in returnStrs) {
                var returnStr = returnStrs[i].split(',');
                $("#sysGroup_" + returnStr[0]).text(returnStr[1]);
            }
        };

        // 分组查询 点击操作
        $("#groupSearch li").click(function () {
            // 这样就会选中当前选中的项
            $("#groupSearch li").removeClass("current");
            $(this).addClass("current");

            searchQuery.Query = '';
            searchQuery.Groups = $(this).attr("dir");
            // 调用分页
            helperCenterView(1);
        });

        // 点击全部时
        $("#allCount li").click(function () {
            $("#groupSearch li").removeClass("current");
            searchQuery.Query = '';
            searchQuery.Groups = $(this).attr("dir");
            // 调用分页
            helperCenterView(1);
        });

        // 分组编辑
        function groupEdit() {
            $("#groupEditAlert").html(_groupEditAlertHtml);
            popupOperate("groupEditAlert", "分组编辑", 'groupEdit');
            $("#groupEditAlert").html(''); // 一定要清除，不要会有重复的 dom 元素
        };

        // 添加
        function addHeplerCenter() {
            window.location.href = "/HelpCenter/AddHelpCenter?MenuCode=C555"; // ?sysGroupID=" + dataForAdd + "
        };

        // 编辑
        function editHelpCenter(articleID) {
            window.location.href = "/HelpCenter/EditHelpCenter?articleID=" + articleID + "&MenuCode=C555";
        };

        // 批量删除
        function deleteBatch(event) {
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var checkID = $(checks[i]).attr("id");
                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);
                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }
            if (strIDs.length > 0) {
                if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "/HelpCenter/DeleteHelperCenter",
                        data: { IDs: JSON.stringify(strIDs) }, // 会自动转换成 字符串数组
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                window.location.reload();
                                $(".Loading"). removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除出现异常，联系管理员").change();
                        }
                    });
                } else {
                    return false;
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要删除的项").change();
                return false;
            }
        };

        // 单个删除
        function deleteSingle(event, ArticleID) {

            if (confirmThis(event, "确定要删除选中的项？")) {
                $.ajax({
                    url: "/HelpCenter/DeleteHelperCenter",
                    data: { IDs: ArticleID, condiction: "single" }, // 会自动转换成 字符串数组
                    type: "post",
                    success: function (succData) {
                        if (succData == "ok") {
                            window.location.reload();
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功").change();
                        }
                    },
                    error: function (errData) {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");

                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                });
            } else {
                return false;
            }
        };



        // enter 键模糊查询
        document.onkeypress = function () {
            var iKeyCode = -1;
            if (arguments[0]) {
                iKeyCode = arguments[0].which;
            }
            else {
                iKeyCode = event.keyCode;
            }

            if (iKeyCode == 13) {
                var searchCondition = $("#txtSearch").val();
                if (searchCondition == "请输入名称..." || searchCondition.trim() == "") {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入名称").change();
                }
                else {
                    //searchQuery.Groups[0] = '';
                    searchQuery.Groups[1] = '';
                    searchQuery.Query = searchCondition;
                    helperCenterView(1);
                }
            }
        }

        // 全选
        function checkAll(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var checkAllState = $(eventSrc).attr("checked");
            if (checkAllState == "checked") {
                $("#content input[type=checkbox]").attr("checked", "checked");
            } else {
                $("#content input[type=checkbox]").attr("checked", false);
            };

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

        // 查询输入文本框
        function txtSearchTips() {

            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入名称...") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#txtSearch").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入名称...");
                }
            })
        };
    </script>
</asp:Content>
