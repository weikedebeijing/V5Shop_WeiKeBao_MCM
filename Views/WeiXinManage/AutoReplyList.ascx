<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<!--列表 Start-->
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="style0list" style="width: 100%">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)">
                        </label>
                    </th>
                    <th class="x-tab">
                        自动回复条件
                    </th>
                    <th class="x-tab">
                        自动回复内容
                    </th>
                    <th class="x-tab">
                        匹配类型
                    </th>
                    <th class="x-tab">
                        自动回复次数
                    </th>
                    <th class="x-tab">
                        创建时间
                    </th>
                    <th class="x-tab">
                        操作
                    </th>
                    <th>
                    </th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <%foreach (V5.MetaData.WeiXin.Model.AutoresponderSettings autoresponderSettings in Model.DataSource)
                  {%>
                <tr class="tr-Current">
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=autoresponderSettings.ID %>" name="sub" onclick="CheckThis()">
                            </label>
                            <!--<span class="flag-gray"></span>-->
                        </div>
                    </td>
                    <td>
                        <div class="cell" title="<%=autoresponderSettings.KeyWord%>">
                            <%
                      
                                string strs = "";
                                if (autoresponderSettings.Conditions == 1)
                                {

                                    strs = "用户关注时";

                                }
                                if (autoresponderSettings.Conditions == 2)
                                {

                                    strs = "用户消息包含：" + autoresponderSettings.KeyWord;

                                }

                                if (autoresponderSettings.Conditions == 3)
                                {

                                    strs = "无法匹配时";

                                }
                                if (autoresponderSettings.Conditions == 4) { strs = "点击微商城时"; } 
                      
                            %>
                            <%=strs %>
                            </div>
                    </td>
                    <td>
                        <%
                            string stri = string.Empty;

                            if (autoresponderSettings.Type == "1")
                            {
                                stri = "文本";
                            }
                            else if (autoresponderSettings.Type == "2")
                            {
                                stri = "单图文";
                            }
                            else if (autoresponderSettings.Type == "3")
                            {
                                stri = "多图文";

                            }
                        %>
                        <div class="cell" title=" <%=stri%>">
                            <%=stri%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%string str = "";
                              if (autoresponderSettings.Matchedaegerr == "Contains")
                              {
                                  str = "模糊匹配";
                              }
                              else { str = "精确匹配"; }
                      
                      
                            %>
                            <%=str%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            0
                        </div>
                    </td>
                    <td>
                        <%=autoresponderSettings.rowCreatedDate%>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                <a class="edit"  onclick="GoToLinkUrl(event)"  linkurl="../../WeiXinManage/EditText?ID=<%=autoresponderSettings.ID %>" href="javascript:void(0)">
                                编辑</a> <a class="del" href="javascript:void(0)" name="autoReolyDelect"  onclick="del(event,<%=autoresponderSettings.ID %>)"
                                    dir="<%=autoresponderSettings.ID %>">删除</a></span></div>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>
    </div>
</div>
<!--列表 End-->
<script type="text/javascript">

    //页数
    var AutoReplyIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    // 全部总数
    $("#all").text('<%=ViewData["all"]%>');

    $("#quanbu").text(CurrentPageSizeSum);
    $("#focusOn").text('<%=ViewData["focusOn"]%>');
    $("#keyword").text('<%=ViewData["keyword"]%>');
    $("#Asuccessfuldeal").text('<%=ViewData["Asuccessfuldeal"]%>');
    $("#clickWie").text('<%=ViewData["clickWie"]%>');
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    function AutoresponderSettings(AutoReplyIndex) {

        //点击事件
        AutoReplyIndex = AutoReplyIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../WeiXinManage/GetAutoReply?groups=' + autoReplyQuery.Groups,
            data: { "AutoReplyIndex": AutoReplyIndex, "Where": autoReplyQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: AutoReplyIndex, pagecount: CurrentPageNumber, buttonClickCallback: AutoresponderSettings });
            }
        });

        //分页显示
        var flag = (AutoReplyIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (AutoReplyIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(AutoReplyIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(AutoReplyIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);

</script>
<script type="text/javascript">

    //    $(function () {
    //        $(".autoReolyDelect").click(function () {

    //            if (confirm("您确定要删除？")) {
    //                var autoReply = new Array();
    //                var ID = $(this).attr("dir");
    //                autoReply.push(ID);
    //                $.ajax({
    //                    type: "post",
    //                    url: "../../WeiXinManage/ChangeAutoReply",
    //                    data: { "autoReplyStr": JSON.stringify(autoReply) },
    //                    dataType: "json",
    //                    success: function (jsonRes) {
    //                        if (jsonRes.Code == null && jsonRes.Message == null) {


    //                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
    //                            $("#operateTip").html("删除成功！").change();

    //                            AutoresponderSettings(1);
    //                        }
    //                        else {
    //                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    //                            $.messager.alert('提示', JSON.stringify(jsonRes));

    //                        }
    //                    }
    //                });

    //            }

    //        });
    //    });

</script>
