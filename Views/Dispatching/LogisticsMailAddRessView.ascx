<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%--<%=Combres.WebExtensions.CombresLink("PagerJs")%>--%>
<%--<div class="mod-table-head">
    <div class="con style0list">--%>
<table id="content" class="table table-striped table-main">
    <colgroup>
        <col style="width: 5%">
        <col style="width: 10%;">
        <col style="width: 10%;">
        <col style="width: 10%;">
        <col style="width: 15%;">
        <col style="width: 15%;">
        <col style="width: 10%;">
        <col style="width: 15%;">
        <col style="width: 10%;">
        <col style="width: auto;">
    </colgroup>
    <tbody>
        <tr>
            <th>
                <label>
                    <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    发货地址
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    收货地址
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    联系人
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    所在地
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    地址
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    电话
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    公司名称
                </div>
            </th>
            <th class="x-tab">操作
            </th>
            <th></th>
        </tr>
        <%--  </tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line" style="width: 100%">
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <colgroup>
                <col style="width: 5%">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>--%>
        <%foreach (V5.MetaData.Delivery.Model.LogisticsAddress logisticsAddress in Model.DataSource)
          {%>
        <tr class="tr-Current">
            <td>
                <div class="cell">
                    <label>
                        <input value="<%=logisticsAddress.ID %>" name="sub" type="checkbox" onclick="CheckThis()">
                    </label>
                    <!--<span class="flag-gray"></span>-->
                </div>
            </td>
            <td>
                <%if (logisticsAddress.Type == true)
                  {%>
                <input type="radio" checked="checked" name="sendOutGoods" dir="<%=logisticsAddress.ID %>" />
                <span>默认</span>
                <%  }%>
                <% else if (logisticsAddress.Type == false)
                  {%>
                <input type="radio" name="sendOutGoods" dir="<%=logisticsAddress.ID %>" />
                <span>默认</span>
                <%}  %>
            </td>
            <td>
                <% var IsDefault = ""; %>
                <% if (logisticsAddress.IsDefault == false)
                   {%>
                <input type="radio" name="Takedelivery" dir="<%=logisticsAddress.ID %>" />
                <span>默认</span>
                <%  }%>
                <%else if (logisticsAddress.IsDefault == true)
                   { %>
                <input type="radio" name="Takedelivery" dir="<%=logisticsAddress.ID %>" checked="checked" />
                <span>默认</span>
                <%  } %>
                <div class="cell">
                    <%=IsDefault%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsAddress.Contacts%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsAddress.ProvinceName + "\n\n" + logisticsAddress.CityName + "\n\n" + logisticsAddress.DistrictName%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsAddress.Address%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsAddress.Tel%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsAddress.CompanyName%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <div class="bs-docs-example tooltip-demo">
                        <a data-toggle="tooltip" data-placement="bottom" data-original-title="编辑" href="javascript:void(0)" onclick="ModifyLogisticsMailAddRess(<%=logisticsAddress.ID %>)">
                            <i class="icon-pen-blue"></i></a>
                        <a data-toggle="tooltip" data-placement="bottom" data-original-title="删除" href="javascript:void(0)" dir="<%=logisticsAddress.ID %> " onclick="LogisticsDelete(event,<%=logisticsAddress.ID%>)">
                            <i class="icon-del-blue"></i></a>
                    </div>
                </div>
            </td>
            <td></td>
        </tr>
        <% } %>
    </tbody>
</table>
<%-- </div>
</div>--%>
<script type="text/javascript">

    //页数
    var logisticsAddressPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    function LogisticsAddress(logisticsAddressPageIndex, CurrentPageSize) {
        if (CurrentPageSize == "" || CurrentPageSize == undefined) {

            CurrentPageSize = $("#ddlPageSize").text();
        }
        CurrentPageSize = CurrentPageSize;
        //点击事件
        logisticsAddressPageIndex = logisticsAddressPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../Dispatching/GetMailAddressLogistics?groups=' + logisticsAddressQuery.Groups,
            data: { "LogisticsAddressPageIndex": logisticsAddressPageIndex, "CurrentPageSize": CurrentPageSize, "Where": logisticsAddressQuery.Query },
            dataType: "html",
            success: function (responseData) {

                $(".mod-table").html(responseData); //render table 
                //CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: logisticsAddressPageIndex, pagecount: totalPageNumber, buttonClickCallback: LogisticsAddress });
                //if (CurrentPageSizeSum > 0) {
                //    $(".mod-page").show();
                //}
                //else {
                //    $(".mod-page").hide();
                //}

            }
        });

        //分页显示
        var flag = (logisticsAddressPageIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (logisticsAddressPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(logisticsAddressPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(logisticsAddressPageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
    $("#all").text(CurrentPageSizeSum);



    //修改发货地址默认
    $("[name='sendOutGoods']").change(function () {
        var id = $(this).attr("dir");
        $.ajax({
            type: "post",
            url: "../../Dispatching/UpdatesendOutGoods",
            data: { "ID": id },
            success: function (data) {
                LogisticsAddress(1);
            }
        });

    });


    //修改收货地址默认
    $("[name='Takedelivery']").change(function () {
        var id = $(this).attr("dir");
        $.ajax({
            type: "post",
            url: "../../Dispatching/UpdateIsDefault",
            data: { "ID": id },
            success: function (data) {
                LogisticsAddress(1);
            }
        });

    });


    function LogisticsDelete(event, ID) {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        //var ID = $(eventSrc).attr("dir");
        $.ajax({
            type: "post",
            url: "../../Dispatching/MailAddressDelete",
            data: { "id": ID },
            dataType: "json",
            success: function (jsonRes) {
                if (jsonRes == "1") {
                    Show("删除成功", "success");
                    LogisticsAddress(1, $("#ddlPageSize").text());
                }
                else if (jsonRes == "-1") {
                    Show("不能删除默认发货地址、退货地址", "error").change();
                    return;
                }
                else {
                    Show(JSON.stringify(jsonRes), "prompt");

                }
            }
        });
    }

</script>
