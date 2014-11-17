<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <style type="text/css">
        .default_Img
        {
            width: 50px;
            height: 50px;
            border: 1px solid black;
        }
        
        .upImg
        {
            background: url(../../Content/Css/images/shopDecorate/124578fileUploadimg.png) no-repeat;
            background-position: 5px -100px;
            display: inline-block;
            width: 25px;
            height: 25px;
        }
        .downImg
        {
            background: url(../../Content/Css/images/shopDecorate/124578fileUploadimg.png) no-repeat;
            background-position: 5px -164px;
            display: inline-block;
            width: 25px;
            height: 25px;
        }
        
        .deleteImg
        {
            background: url(../../Content/Css/images/shopDecorate/124578fileUploadimg.png) no-repeat;
            background-position: 5px -195px;
            display: inline-block;
            width: 25px;
            height: 25px;
        }
        
        .addImg
        {
            background: url(../../Content/Css/images/shopDecorate/124578fileUploadimg.png) no-repeat;
            background-position: 5px -231px;
            display: inline-block;
            width: 25px;
            height: 25px;
        }
        
        .fileImage_hidden
        {
            width: 25px;
            height: 25px;
            position: absolute;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }
        
        .default_Img
        {
            width: 50px;
            height: 50px;
            border: 1px solid black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M ">
            <%--添加成功后把结果放到<span>标签中--%>
            <div class="mod-title">
                <div>
                    <div class="Loading" style="display: none;">
                        <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                    </div>
                </div>
            </div>
            <!--title begin-->
            <div class="mod-title">
                <a href="/HelpCenter/HelpCenterList" title="返回">
                    <button type="button" class="returnBtn">
                        返回</button></a><span class="spanTitle">内容组编辑</span>
            </div>
            <!--title end-->
            <!--添加内容 开始-->
            <div>
                <div class="mod-form">
                    <div class="con style01">
                        <%var sysGroups = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["sysGroups"]; %>
                        <div id="helperCenterGroupForm">
                            <div>
                                <table>
                                    <tr>
                                        <td style="width: 250px;">
                                            分组名称:
                                        </td>
                                        <td style="width: 100px;">
                                            操 作:
                                        </td>
                                        <td style="width: auto;">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <% foreach (var sysGroup in sysGroups)
                               { %>
                            <div dir="sysGroup_data" style="">
                                <input type="text" class="v5-input in200" dir="<%:sysGroup.ID %>" name="sysGroupName"
                                    value="<%:sysGroup.Name%>" />
                                <a href="javascript:void(0);" class="deleteImg" onclick="javascript:sysGroupDel(event);">
                                </a><a href="javascript:void(0);" class="upImg" onclick="javascript:sysGroupUp(event);">
                                </a><a href="javascript:void(0);" class="downImg" onclick="javascript:sysGroupDown(event);">
                                </a><a href="javascript:void(0);" class="addImg" onclick="javascript:sysGroupAdd(event);">
                                </a>
                            </div>
                            <%}%>
                            <div style="margin-top: 20px;">
                                <button type="button" onclick="javascript:saveAll();" class="submit01 t10">
                                    保存</button>
                               <%-- <button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel()">
                                    取消</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--添加内容 结束-->
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 记录删除的 sysGroupIDs 
        var deleteSysGroupIDs = new Array();
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
            var sysGroups = $("#helperCenterGroupForm div[dir=sysGroup_data]");
            
            var sortNumber=100;
            for(var i=0;i<sysGroups.length;i++){
                var sortOrder = sortNumber-i;
                $sysGroupName = $(sysGroups[i]).find("input[name=sysGroupName]");
                if (0 == $sysGroupName.val().length){
                    $sysGroupName.focus();
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
//                          setTimeout(function(){
//                            window.location.href="/HelpCenter/HelpCenterList";
//                          },3);
                    }else if ("repeat" == returnData){
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("请检查分组名称不能重复").change();
                    }else if ("no datas" == returnData){
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("没有可以编辑的项").change();
                    }
                },
            });

          
        };

        // 导航元素增加
        function sysGroupAdd(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var currentElement = $(eventSrc).parent("div"); // 当前的元素
           
            var addStr = "";
            addStr += "<div dir='sysGroup_data'>\n"; // 要换行不然样式会不一致
            addStr += "<input type='text' class='v5-input in200' dir='-1' name='sysGroupName' value='' />\n";
            addStr += "<a href='javascript:void(0);' class='deleteImg' onclick='javascript:sysGroupDel(event);'></a>";
            addStr += "<a href='javascript:void(0);' class='upImg' onclick='javascript:sysGroupUp(event);'></a>";
            addStr += "<a href='javascript:void(0);' class='downImg' onclick='javascript:sysGroupDown(event);'></a>";
            addStr += "<a href='javascript:void(0);' class='addImg' onclick='javascript:sysGroupAdd(event);'></a>";
            addStr += "</div>\n";

            currentElement.after(addStr);

        };

        // 导航元素删除
        function sysGroupDel(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            
            var deleteSysGroupID = $(eventSrc).siblings("input[name=sysGroupName]").attr("dir");//
            
            if ("-1" != deleteSysGroupID) // 排除新增
            {
              deleteSysGroupIDs.push(deleteSysGroupID);
            }
           
            var currentElement = $(eventSrc).parent("div"); // 当前的元素
            currentElement.remove();
        };

        // 导航元素上移
        function sysGroupUp(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentElement = $(eventSrc).parent("div"); // 当前的元素
            var preElement = currentElement.prev("div"); // 上一个元素

            if (preElement.attr("dir") == undefined) {// 第一个不能上移
                return;
            };
            var currentElementHtml = currentElement.html();
            var preElementHtml = preElement.html();

            // 交换内容
            currentElement.html(preElementHtml);
            preElement.html(currentElementHtml);
        };

        // 导航元素下移
        function sysGroupDown(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var currentElement = $(eventSrc).parent("div"); // 当前的元素
            var nextElement = currentElement.next("div"); // 上一个元素

            if (nextElement.attr("dir") == undefined) {// 最后一个不能下移
                return;
            };
            var currentElementHtml = currentElement.html();
            var nextElementHtml = nextElement.html();

            // 交换内容
            currentElement.html(nextElementHtml);
            nextElement.html(currentElementHtml);
        };

        // 取消
        function btnCancel(){
           window.location.href="/HelpCenter/HelpCenterList";
        };
    </script>
</asp:Content>
