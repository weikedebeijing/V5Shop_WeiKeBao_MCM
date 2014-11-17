<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
<% List<Grade> Grade = ViewData["GradeID"] as List<Grade>;  %>
<% List<V5.MetaData.Market.Model.Shop> shop = ViewData["shop"] as List<V5.MetaData.Market.Model.Shop>; %>
<% List<Customer> customer = ViewData["customer"] as List<Customer>;%>
<div class="mod-table-head">
    <div class="con style0list">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <colgroup>
                <col style="width:5%">
                <col style="width:13%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)"></label>
                    </th>
                    <th>
                        优惠券面值
                    </th>
                    <th>
                        发放对象
                    </th>
                    <th>
                        已发放
                    </th>
                    <th>
                        已使用
                    </th>
                    <th>
                        未使用
                    </th>
                    <th>
                        截止日期
                    </th>

                    <th>
                        状态
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
    <div class="con style0line" style="width: 100%;">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
            <colgroup>
               <col style="width:5%">
                <col style="width:13%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
                <%
                    foreach (V5.MetaData.Customer.Report.CouponReport coupon in Model.DataSource)
                    {
                            
                %>
                <%string shopType = string.Empty;
                  string shopTypeCode = string.Empty;
                  string gradeTypeID = string.Empty;
                  string customerName = string.Empty;

                  DateTime time = DateTime.Now;
                %>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=coupon.ID %>" name="sub" onclick="CheckThis()"></label><!--<span class="flag-gray"></span>--></div>
                    </td>
                    <td>
                        <%=coupon.Amount%>
                    </td>
                    <td>
                        <%if (coupon.ChannelCode == "" && coupon.GradeID == 0 && coupon.SaleType == " ")
                          {%>
                        <div class="cell">
                            所有会员
                        </div>
                        <% } %>
                        <% if (coupon.ChannelCode != "" && coupon.RoleID != 0 && coupon.SaleType != "")
                           {%>
                        <%
                            if (shop.Count != 0)
                            {
                                for (int i = 0; i < shop.Count; i++)
                                {
                                    if (shop[i].ChannelCode == coupon.ChannelCode)
                                    {
                                        shopTypeCode = shop[i].Title;

                                    }
                                }
                            }
                              
                        %>
                        <%
                            if (customer.Count != 0)
                            {

                                foreach (var item in customer)
                                {
                                    if (item.ID == coupon.RoleID)
                                    {

                                        customerName = item.LoginName;
                                    }

                                }

                            }
                              
                        %>
                        <div class="cell">
                            <%=shopTypeCode %>-<%=customerName%>
                        </div>
                        <%  } %>
                        <%if (coupon.ChannelCode != "" && coupon.RoleID == 0 && coupon.SaleType != "")
                          { %>
                        <%
                              
                            if (shop.Count != 0)
                            {
                                for (int i = 0; i < shop.Count; i++)
                                {
                                    if (shop[i].ChannelCode == coupon.ChannelCode)
                                    {
                                        shopTypeCode = shop[i].Title;

                                    }
                                }
                            }
                        %>
                        <%if (Grade.Count != 0)
                          {

                              for (int i = 0; i < Grade.Count; i++)
                              {
                                  if (Grade[i].ID == coupon.GradeID)
                                  {
                                      gradeTypeID = Grade[i].Name;

                                  }
                              }

                          } %>
                        <div class="cell">
                            <%=shopTypeCode %>-<%=gradeTypeID%>
                        </div>
                        <% }%>
                        <%if (coupon.SaleType != " " && coupon.ChannelCode == "")
                          {%>
                        <%if (coupon.SaleType == "A")
                          {
                              shopType = "零售";
                          }

                          else { shopType = "分销"; }
                        %>
                        <div class="cell">
                            <%=shopType%>-所有会员
                        </div>
                        <%  }%>
                        <%if (coupon.SaleType != " " && coupon.ChannelCode != "" && coupon.GradeID == 0)
                          { %>
                        <%if (coupon.SaleType == "A")
                          {
                              shopType = "零售";
                          }

                          else { shopType = "分销"; }
                        %>
                        <%
                            if (shop.Count != 0)
                            {
                                for (int i = 0; i < shop.Count; i++)
                                {
                                    if (shop[i].ChannelCode == coupon.ChannelCode)
                                    {
                                        shopTypeCode = shop[i].Title;

                                    }
                                }
                            }
                              
                        %>
                        <div class="cell">
                            <%=shopType%>-<%=shopTypeCode%>-所有会员
                        </div>
                        <%  } %>
                        <div class="cell">
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (coupon.Count == null)
                              { %>
                            0
                            <%}
                              else
                              { %>
                            <%=coupon.Count%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (coupon.Already == null)
                              { %>
                            0
                            <%}
                              else
                              { %>
                            <%=coupon.Already%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (coupon.Unused == null)
                              { %>
                            0
                            <%}
                              else
                              { %>
                            <%=coupon.Unused%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=coupon.DateExpired%></div>
                    </td>
                    <td>
                         <%if (coupon.Status == "N" && time <= coupon.DateExpired)
                          {%>
                        <span class="c06">进行中</span>
                        <% } %>
                        <%
                           else if (  coupon.Status == "D")
                            { %>
                        <span class="c01-5">已作废</span>
                        <%     
                            }
                        %>
                        <%
                           else 
                            { %>
                        <span class="c03">已过期</span>
                        <%    
                            }
                        %>
                    </td>
                    <td>
                        <div class="cell">
                            <span class="c07"><a name="DivCoupon" style="color: #06c" onclick="DivCoupon(<%=coupon.ID %>,event)"
                                href="javascript:void(0)">作废</a></span></div>
                    </td>
                    <td>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<!--列表 End-->
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
    //全部
    $("#QuanBu").text('<%=ViewData["quanBu"]%>');
    //直销
    $("#ZhiXiao").text('<%=ViewData["zhiXiao"]%>');
    //分销
    $("#FenXiao").text('<%=ViewData["fenXiao"]%>');
    $("#jxz").text('<%=ViewData["tempJXZ"]%>');
    $("#gq").text('<%=ViewData["temoGQ"]%>');
    $("#zf").text('<%=ViewData["temoZF"] %>');
    //获取要执行的URL
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
    }

    function CouponView(CurrentPageIndex) {

        //点击事件

        CurrentPageIndex = CurrentPageIndex;

        $.ajax({
            async: false,
            type: "Post",
            url: '../../Promotion/GetShowCouponView?Groups=' + couponQuery.Groups,
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": couponQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $("#mod-table").html(responseData); //render table 
                //  CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: CouponView });




                //                if ((couponQuery.Groups[0] == "q1" || couponQuery.Groups[0] == "q2" || couponQuery.Groups[0] == "q3")
                //                 && (couponQuery.Groups[1] == undefined || couponQuery.Groups[1] == "")) {
                //                    //alert('<%=ViewData["jxz"]%>');


                //                }


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
