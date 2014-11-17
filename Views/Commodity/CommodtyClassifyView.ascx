<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
<!--列表 Start-->
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 45%;">
                    <col style="width: 40%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input type="checkbox" value="" name="ckall" id="ckall" onclick="CheckAll(event)">
                            </label>
                        </th>
                        <th>商品分类
                        </th>
                        <th>店铺渠道
                        </th>
                        <th>操作
                        </th>
                        <th></th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 45%;">
                    <col style="width: 40%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <%foreach (V5.MetaData.Product.Messaging.ProductNameTemporary productLine in Model.DataSource)
                  {%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=productLine.Id %>" name="sub" onclick="CheckThis()">
                            </label>
                            <!--<span class="flag-gray"></span>-->
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productLine.Name%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productLine.ChannelCode%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <%--                                <%if (productLine.ChannelCode == "分销商城")
                                      { %>
                                    <a dir="<%=productLine.Id %>" onclick="edit(event)" href="javascript:void(0)" class="edit">
                                        编辑</a><a class="del" href="javascript:void(0)" dir="<%=productLine.Id %>" onclick="ClassifyDelect                                          (event)">删除</a>
                                    <%  }%>
                                    <%else if (productLine.ChannelCode == "微商城")
                                        { %>--%>
                                    <a dir="<%=productLine.Id %>" onclick="edit(event)" href="javascript:void(0)"
                                        class="edit">编辑</a><a class="del" href="javascript:void(0)" dir="<%=productLine.Id %>"
                                            onclick="allDelectClassify(event,'single')">删除</a>
                                    <%--  <% }%>
                                    <%else
                                        { %>
                                    <span class="c07" style="color: Red">该店铺分类基础数据不可以编辑</span>
                                    <%} %>--%>
                                </div>
                    </td>
                    <td></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 0;
    //显示多少显示数字条
    var CurrentPageSize = 20;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    function ClassifyView(CurrentPageIndex) {

        //点击事件
        CurrentPageIndex = CurrentPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../Commodity/CategoryList?groups=' + ClassifyQuery.Groups,
            data: { "CategoryPageIndex": CurrentPageIndex, "appCode": appCode },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                // CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: ClassifyView });
            }
        });
        //分页显示
        var flag = (CurrentPageIndex * CurrentPageSize) > CurrentPageSizeSum;

        $("#pages").text(CurrentPageSize * (CurrentPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(CurrentPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(CurrentPageIndex * CurrentPageSize);
        }
    };
    $("#sum").text(CurrentPageSizeSum);




</script>
<script type="text/javascript">

    function ClassifyDelect(event) {

        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        if (confirmThis(event, "您确定要删除？")) {
            var ID = $(eventSrc).attr("dir");

            $.ajax({
                type: "post",
                url: "../../Commodity/DeleteClassigy",
                data: { "ID": ID },
                success: function (jsonRes) {


                    if (jsonRes == "-1") {

                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                        $("#operateTip").html("请先删除店铺类目！").change();

                    }
                    else if (jsonRes == "-2") {

                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                        $("#operateTip").html("默认店铺类目不能删除！").change();
                        ClassifyView(1);

                    }
                    else if (jsonRes == "1") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功！").change();
                        ClassifyView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                        $("#operateTip").html(JSON.stringify(jsonRes)).change();


                    }
                }
            });

        }

    };

    //查看详细和编辑链接的跳转
    function GoToLinkUrl(event) {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        var linkUrl = $(eventSrc).attr("linkUrl");
        var linkUrlParts = linkUrl.split('?');
        if (linkUrlParts.length > 1) {//原本已经带参数
            linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
        } else {
            linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode;
        }

        window.location.href = linkUrl;
    }



    function edit(event) {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        var ID = $(eventSrc).attr("dir");
        popupOperate("gray-edit-prize", "修改分类", "gray-edit-prize");
        $.ajax({
            type: "post",
            url: "../../Commodity/ClassifyUpdata",
            data: { "ID": ID },
            success: function (jsonRes) {
                if (jsonRes != "") {
                    $("#edithidIrrigationDitch").val(jsonRes.ChannelCode);
                    $("#editCategoryId").val(jsonRes.ID);
                    $("#edittexName").val(jsonRes.Name);

                    classify(jsonRes.ParentID);
                    irrigationDitch();
                }
            }
        });





    }


    function classify(ParentID) {

        $("#editselClassify").attr('disabled', true);
        var selClassify = $("#editselClassify")[0];
        for (var i = selClassify.length - 1; i >= 0; i--)
            selClassify.options[i] = null;
        var opt = new Option("没有分类", "0");
        selClassify.options.add(opt);
        $.ajax({
            type: "post",
            url: "../../Commodity/GetCommodity",
            dataType: "json",
            success: function (data) {

                if (data != null && data.list.length > 0) {
                    for (var i = 0; i < data.list.length; i++) {
                        var opt = new Option(data.list[i].text, data.list[i].value);
                        selClassify.options.add(opt);
                        if (ParentID == 0) {
                            opt.selected[0] = true;

                        }
                        else if ($("#editCategoryId").val() == data.list[i].value) {
                            opt.selected = true;
                        }
                    }
                }
            }
        });
    }

    function irrigationDitch() {

        //显示渠道
        $("#editselIrrigationDitch").attr('disabled', true);
        var selIrrigationDitch = $("#editselIrrigationDitch")[0];
        for (var i = selClassify.length - 1; i >= 0; i--)
            selIrrigationDitch.options[i] = null;
        var opt = new Option("请选择渠道", "-1");
        selIrrigationDitch.options.add(opt);
        $.ajax({
            type: "post",
            url: "../../Commodity/GetOpened",
            dataType: "json",
            success: function (data) {
                if (data != null && data.list.length > 0) {

                    for (var i = 0; i < data.list.length; i++) {
                        var opt = new Option(data.list[i].text, data.list[i].value);
                        selIrrigationDitch.options.add(opt);

                        if ($("#edithidIrrigationDitch").val() == data.list[i].value) {
                            opt.selected = true;
                        }
                    }
                }
            }
        });

    }

</script>
<!--列表 End-->
