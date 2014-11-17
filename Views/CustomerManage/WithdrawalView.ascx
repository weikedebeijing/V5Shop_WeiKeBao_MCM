<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Util" %>
<table class="table table-striped table-main">
   <colgroup>
        <col style="width: 2%">
        <col style="width: 11%;">
        <col style="width: 9%;">
        <col style="width: 9%;">
        <col style="width: 15%;">
        <col style="width: 9%;">
        <col style="width: 9%;">
        <col style="width: 6%;">
        <col style="width: 9%;">
        <col style="width: 6%;">
        <col style="width: 6%;">
        <col style="width: auto;">
    </colgroup>
    <tbody>
        <tr class="table-title">
            <th class="first">
                <label>
                    <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
            </th>
            <th class="x-tab">提现流水号
                     
            </th>
            <th class="x-tab">提现账号
                       
            </th>
            <th class="x-tab">提现方式
                        
            </th>
            <th class="x-tab">提现金额（元）
                       
            </th>
            <th class="x-tab">提现时间
                       
            </th>

            <th class="x-tab">到账时间
                      
            </th>

            <th class="x-tab">姓名
                     
            </th>

            <th class="x-tab">联系电话
                       
            </th>

            <th class="x-tab">状态
                    
            </th>

            <th class="x-tab">备注
                       
            </th>

            <th class="last">操作
            </th>
        </tr>

        <%foreach (V5.MetaData.Customer.Model.CustomerCashFlow customerCashFlow in Model.DataSource)
          {%>


        <tr>
            <td>

                <label>
                    <input value="<%=customerCashFlow.ID %>" name="sub" type="checkbox" onclick="CheckThis()">
                    <input type="hidden" value="1354" name="name">
                </label>

            </td>
            <td>
                <div class="cell"><%=customerCashFlow.FlowCode %></div>
            </td>
            <td>
                <div class="cell">
                    <%=customerCashFlow.CashAccount %>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%
                                
              string str = "";
              if (customerCashFlow.CashAccountType == (int)AppEnum.CashAccountType.Alipay)
              {
                  str = "支付宝";

              }

              else if (customerCashFlow.CashAccountType == (int)AppEnum.CashAccountType.Tenpay)
              {
                  str = "财付通";
              }

              else if (customerCashFlow.CashAccountType == (int)AppEnum.CashAccountType.Bill99)
              {
                  str = "块钱";
              }
                               
                               
                    %>
                    <%=str %>
                </div>
            </td>
            <td>
                <div class="cell"><span class="c01-1"><%:customerCashFlow.Amount %></span></div>
            </td>
            <td>
                <div class="cell"><%:customerCashFlow.rowCreatedDate %></div>
            </td>

            <td>
                <div class="cell"><%:customerCashFlow.rowModifiedDate %></div>
            </td>

            <td>
                <div class="cell"><%:customerCashFlow.CustomerName %></div>
            </td>
            <td>
                <div class="cell"><%:customerCashFlow.CashPhone %></div>
            </td>
            <td>
                <div class="cell">
                    <%
              string status = "";
              if (customerCashFlow.Status == (int)AppEnum.CashFlowStatusType.Normal)
              {
                  status = "<span class='c01-5'>处理中...</span>";

              }

              else if (customerCashFlow.Status == (int)AppEnum.CashFlowStatusType.Agree)
              {
                  status = "<i class='icon-ok-green'></i>";

              }

              else if (customerCashFlow.Status == (int)AppEnum.CashFlowStatusType.DisAgree)
              {
                  status = "<i class='icon-error-red'></i>";
              }
                      
                    %><%= status%>
                </div>
            </td>
            <td>
                <div class="cell"><%:customerCashFlow.Comment %></div>
            </td>


            <td>
                <div class="cell">
                    <div class="mod-operate">
                        <div class="con style0editdel">



                            <a data-original-title="转账" onclick="Update(event,'single','yes')" data-placement="bottom" data-toggle="tooltip" dir="<%=customerCashFlow.ID %>" href="javascript:void(0)"><i class="icon-turn-blue"></i></a>
                            <a data-original-title="拒绝" onclick="Update(event,'single','no')" dir="<%=customerCashFlow.ID %>" data-placement="bottom" data-toggle="tooltip" href="javascript:void(0)"><i class="icon-no-blue"></i></a>
                            <a data-original-title="备注" data-placement="bottom" onclick="UpdateComment(event,'single','<%=customerCashFlow.Comment %>')" dir="<%=customerCashFlow.ID %>" data-toggle="tooltip" href="javascript:void(0)"><i class="icon-remark-blue"></i></a>
                        </div>
                    </div>
                </div>
            </td>
        </tr>




        <% } %>
    </tbody>
</table>



<script type="text/javascript">


    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    function GetWithdrawalList(CurrentPageIndex, PageSize) {

        if (PageSize == "" || PageSize == undefined) {

            CurrentPageSize = $("#btnPageSize").text();
        }
        //点击事件
        CurrentPageIndex = CurrentPageIndex;

        CurrentPageSize = PageSize;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../CustomerManage/GetWithdrawalList?groups=' + WithdrawalQuery.Groups,
            data: { "CurrentPageIndex": CurrentPageIndex, "PageSize": PageSize, "searchName": WithdrawalQuery.Query },
            dataType: "html",
            success: function (responseData) {

                $("#mod-table").html(responseData); //render table 
                $("a[data-toggle=tooltip]").mouseover(function () { $(this).tooltip('show'); });
                //CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: GetWithdrawalList });
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

