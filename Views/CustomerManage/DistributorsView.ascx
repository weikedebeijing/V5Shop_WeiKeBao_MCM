<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<table class="table table-striped table-main">
    <colgroup>
      <col style="width:2%;">
      <col style="width:13%;">
      <col style="width:10%;">
      <col style="width:18%;">
      <col style="width:12%;">
      <%--<col style="width:7%;">--%>
      <col style="width:10%;">
      <col style="width:15%;">
      <%--<col style="width:10%;">--%>
      <col style="width:10%;">
      <col style="width:auto;">
    </colgroup>
    <tbody>
        <tr class="table-title">
            <th class="first">
                <label>
                    <input value="" name="" id="Checkbox1" type="checkbox" onclick="CheckAll(event)"></label></th>
            <th>分销店铺名称</th>

            <th>微信号</th>
            <th>分销商地区</th>
            <%--<th>分销总额(元)</th>--%>
            <th>联系人</th>
            <th>手机</th>
            <th>申请时间</th>
            <%--<th>分销商等级</th>--%>
            <th>状态</th>
            <th class="last">操作</th>
        </tr>
        <%-- <tr class="table-title">
            <th class="first">
                <label>
                    <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
            </th>
            <th>分销店铺名称
                      
            </th>
            <th>分销商帐号
                      
            </th>
            <th>QQ号
                      
            </th>
            <th>微信号
                      
            </th>
            <th>分销商地区
                       
            </th>

            <th>分销总额（元）
                      
            </th>

            <th>联系人
                       
            </th>
            <th>手机
                       
            </th>
            <th>申请时间
                        
            </th>

            <th>状态
                      
            </th>
            <th class="last">操作
            </th>
        </tr>--%>


        <%
            if (Model.DataSource != null)
            {
                foreach (V5.MetaData.Customer.Model.CustomerDistributionReport customerDistributionReport in Model.DataSource)
                {
                    var str = "";
                    StringBuilder sb = new StringBuilder();
                    if (customerDistributionReport.Status == 0)
                    {
                        str = "<i class='icon-open-green'></i>";

                        sb.Append("<a data-toggle=\"tooltip\"  data-placement=\"bottom\"  data-original-title=\"冻结\"   onclick='IsFrozenOrNormal(event,0,\"single\")' href='javascript:void(0)'><i dir='" + customerDistributionReport.CustomerID + "' class='icon-close-blue'></i></a>");
                    }
                    else if (customerDistributionReport.Status == 1)
                    {
                        str = "<i class='icon-close-red'></i>";

                        sb.Append("<a data-original-title='解冻'   onclick='IsFrozenOrNormal(event,1,\"single\")' data-placement='bottom' data-toggle='tooltip' href='javascript:void(0)'><i dir='" + customerDistributionReport.CustomerID + "' class='icon-open-blue'></i></a>");
                    }
        %>


        <tr>
            <td>

                <label>
                    <input value="<%=customerDistributionReport.CustomerID %>" name="sub" type="checkbox" onclick="CheckThis()">
                    <input type="hidden" value="1354" name="name">
                </label>

            </td>
            <td>

                <div class="cell"><%=customerDistributionReport.Title %></div>
            </td>
            <%--<td>
                <div class="cell">
                    <%=customerDistributionReport.LoginName %>
                </div>
            </td>--%>
           <%-- <td>
                <div class="cell" title="<%=customerDistributionReport.Question  %>"><%=customerDistributionReport.Question  %></div>
            </td>--%>
            <td>
                <div class="cell" title="<%=customerDistributionReport.Answer  %>"><%=customerDistributionReport.Answer  %></div>
            </td>
            <td>
                <div class="cell"><span class="c01-1" title="<%:customerDistributionReport.Address %>"><%:customerDistributionReport.Address %></span></div>
            </td>
           <%-- <td>
                <div class="cell" title="<%:customerDistributionReport.DRP_Amount.ToString("0.00") %>"><%:customerDistributionReport.DRP_Amount.ToString("0.00") %></div>
            </td>--%>
            <td>
                <div class="cell" title="<%:customerDistributionReport.TrueName %>"><%:customerDistributionReport.TrueName %></div>
            </td>
            <td>
                <div class="cell" title="<%:customerDistributionReport.MobilePhone %>"><%:customerDistributionReport.MobilePhone %></div>
            </td>
            <td>
                <div class="cell" title="<%:customerDistributionReport.rowCreatedDate.ToShortDateString() %>"><%:customerDistributionReport.rowCreatedDate.ToShortDateString() %></div>
            </td>
          <%--  <td><div class="cell"><%=customerDistributionReport.LevelID.ToString()+"级" %></div></td>--%>
            <td>
                <div class="cell" title="<%=str%>"><%=str%></div>
            </td>
            <td>
                <div class="cell">

                    <div class="bs-docs-example tooltip-demo">
                        <%=sb.ToString() %>
                        <a data-original-title="查看" dir="<%:customerDistributionReport.CustomerID %>" onclick="View(event)" data-placement="bottom" class="view" data-toggle="tooltip" href="#myModal"><i class="icon-eye-blue"></i></a>
                    </div>
                </div>
            </td>
        </tr>




        <% }

            } %>
    </tbody>
</table>

<script type="text/javascript">
    //页数
    var CurrentPageIndex = 1;
    var CurrentPageSize = 15;
    //总数量

    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少

    var PagesNumber = '<%=Model.PagesNumber%>';
    function GetDistributorsView(CurrentPageIndex, CurrentPageSize) {
        if (CurrentPageSize == undefined || CurrentPageSize == "") {
            CurrentPageSize = $("#btnPageSize").text();
        }

        //点击事件
        CurrentPageIndex = CurrentPageIndex;

        CurrentPageSize = CurrentPageSize;

        $.ajax({
            async: false,
            type: "Post",
            url: '../../CustomerManage/GetDistributorsList',
            data: { "pageIndex": CurrentPageIndex, "pageSize": CurrentPageSize, "searchName": DistributorsQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $("#mod-table").html(responseData);
                $("a[data-toggle=tooltip]").mouseover(function () { $(this).tooltip('show'); });
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: totalPageNumber, buttonClickCallback: GetDistributorsView });

                if (CurrentPageSizeSum > 0) {
                    $(".mod-page").show();
                }
                else {
                    $(".mod-page").hide();
                }
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
    $("#all").text(CurrentPageSizeSum);

</script>
