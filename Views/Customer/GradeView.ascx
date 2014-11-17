<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Util" %>
<table>
    <colgroup>

        <col style="width: 5%;">
        <col style="width: 20%;">
        <col style="width: 20%;">
        <col style="width: 20%;">
        <col style="width: 20%;">
        <col style="width: 15%;">
        <col style="width: auto;">
    </colgroup>
    <tbody id="content">
        <%var Grades = Model.DataSource; %>
        <%var gradeType = ""; %>
        <% var channelType = ""; %>
        <%foreach (var grade in Grades)
          { %>
        <%var GradeID = grade.ID;%>
        <%if (grade.SaleType == (int)AppEnum.ChannelType.WeiXin)
          {
              gradeType = "零售";
          }
          //else
          //{
          //    gradeType = "分销";
          //}%>
        <% if (grade.IsDefault == true)
           {%>
        <tr class="tr-Current">

            <td>
                <div class="cell">
                    <label>
                        <input type="checkbox" id="checkbox_<%:grade.ID %>" name="sub" value="" onclick="CheckThis()" /></label><!--<span class="flag-gray"></span>-->
                </div>
            </td>

            <td>
                <div class="cell">
                    <%:grade.Name%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:gradeType%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <% if (grade.ConsumeAmount > 0 && grade.ConsumeTimes == 0)
                       { %>
                    消费满<%:grade.ConsumeAmount%>元
                    <%}
                       else if (grade.ConsumeTimes > 0 && grade.ConsumeAmount == 0)
                       {%>
                    消费次数达到<%:grade.ConsumeTimes%>
                    <%}
                       else if (grade.ConsumeTimes > 0 && grade.ConsumeAmount > 0)
                       {%>
                    消费满<%:grade.ConsumeAmount%>元 或者 消费次数达到<%:grade.ConsumeTimes%>
                    <%}
                       else
                       {%>
                    无
                    <%} %>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:grade.DiscountRate%>
                    %
                </div>
            </td>
            <td>
                <div class="cell">
                    <div class="mod-operate">
                        <div class="con style0editdel">
                           
                            <a href="javascript:void(0);" class="edit" onclick="javascript:editUserPopup(<%=GradeID %>);">编辑</a> <a href="javascript:void(0);" class="del" id="DeleteSingle" onclick="javascript:DeleteSingle(event,<%:GradeID %>);">删除</a>

                        </div>
                    </div>
                </div>
            </td>
            <td></td>
        </tr>
        <%}
           else
           {%>
        <tr class="tr-Current">

            <td>
                <div class="cell">
                    <label>
                        <input type="checkbox" id="checkbox_<%:grade.ID %>" name="sub" value="" onclick="CheckThis()" /></label><!--<span class="flag-gray"></span>-->
                </div>
            </td>

            <td>
                <div class="cell">
                    <%:grade.Name%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:gradeType%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <% if (grade.ConsumeAmount > 0 && grade.ConsumeTimes == 0)
                       { %>
                    消费满<%:grade.ConsumeAmount%>元
                    <%}
                       else if (grade.ConsumeTimes > 0 && grade.ConsumeAmount == 0)
                       {%>
                    消费次数达到<%:grade.ConsumeTimes%>
                    <%}
                       else if (grade.ConsumeTimes > 0 && grade.ConsumeAmount > 0)
                       {%>
                    消费满<%:grade.ConsumeAmount%>元 或者 消费次数达到<%:grade.ConsumeTimes%>
                    <%}
                       else
                       {%>
                    无
                    <%} %>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:grade.DiscountRate%>
                    %
                </div>
            </td>
            <td>
                <div class="cell">
                    <div class="mod-operate">
                        <div class="con style0editdel">

                            <a href="javascript:void(0);" class="edit" onclick="javascript:editUserPopup(<%=GradeID %>);">编辑</a><a href="#" class="del" id="A1" onclick="javascript:DeleteSingle(event,<%:GradeID %>);">删除</a>
                        </div>

                    </div>
                </div>

            </td>
            <td></td>
        </tr>
        <%} %>
        <%} %>
    </tbody>
</table>
