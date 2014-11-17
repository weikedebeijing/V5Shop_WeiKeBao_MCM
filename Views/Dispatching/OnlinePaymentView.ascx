<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
 <%=Combres.WebExtensions.CombresLink("PagerJs")%>

<div class="mod-table-head">
    <div class="con style01">
        <table border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 17%;">
                <col style="width: 8px;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input value="" name="" id="ckall" type="checkbox"></label>
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>运送到
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>首件数
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>
                        <div class="iconbg-arrow up">
                            首费</div>
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>续件数
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>续费
                    </th>
                    <th class="x-tab">
                        <i class="icon-resize"></i>操作
                    </th>
                    <th>
                    </th>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line">
        <table border="0" cellpadding="5" cellspacing="0">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 17%;">
                <col style="width: 8px;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <%
                 
                    foreach (V5.MetaData.Order.Model.LogisticsCompany logisticsCompany in Model.DataSource)
                    {
                            
                %>
                <tr class="tr-Current">
                    <td>
                        <div class="cell">
                            <label>
                                <input value="<%=logisticsCompany.ID %>" name="sub" type="checkbox"></label><!--<span class="flag-gray"></span>--></div>
                    </td>
                    <td>
                        <div class="cell">
                            <input type="text" name="" id="" /></div>
                    </td>
                    <td>
                        <div class="cell">
                            <input type="text" name="" id="RuleConditionItme2Text1" /></div>
                    </td>
                    <td>
                        <div class="cell">
                            <input type="text" name="" id="Text2" />
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <input type="text" name="" id="Text3" /></div>
                    </td>
                    <td>
                        <div class="cell">
                            <input type="text" name="" id="Text4" /></div>
                    </td>
                    <td>
                        <div class="cell">
                            <span class="c07"><a class="r15" href="../../Dispatching/UpdateLogistics?ID=<%=logisticsCompany.ID %>">
                                编辑</a><a href="javascript:void(0)" class="LogisticsDelete" dir="<%=logisticsCompany.ID %>">删除</a></span></div>
                    </td>
                    <td>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
