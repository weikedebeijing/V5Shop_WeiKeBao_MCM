<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%var awardSets = (List<V5.MetaData.WeiXin.Model.Award>)ViewData["awardSets"]; %>
<%var activityAward = (V5.MetaData.WeiXin.Model.ActivityAwards)ViewData["activityAward"]; %>
<%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardsManageView>)ViewData["awardRecords"]; %>

<div class="btn">
    <a href="javascript:void(0);" onclick="javascript:myAwardRecord();" class="btn-a">查看我的奖项</a>
</div>
<div class="explain">
    <h2 class="explain-title">活动说明</h2>
    <p class="explain-text">
        <%=activityAward.AwardContentName.ToString().Replace("\n", "<br>") %>
    </p>
</div>
<div class="explain">
    <h2 class="explain-title">活动时间</h2>
    <p class="explain-text">
        <%:activityAward.StartDate %>到<%:activityAward.FinishDate %><br />
    </p>
</div>
<div class="explain">
    <h2 class="explain-title">奖项设置</h2>
    <p class="explain-text">
        <%foreach (var item in awardSets)
          { %>
        <%if (item.AwardGrade == "一等奖")
          { %>
              一等奖：<%:item.CommodityName%>；<br />
        <%}
          else if (item.AwardGrade == "二等奖")
          {%>
              二等奖：<%:item.CommodityName%>；<br />
        <%}
          else if (item.AwardGrade == "三等奖")
          {%>
             三等奖：<%:item.CommodityName%>；
           <%} %>
        <%} %>
    </p>
</div>
<div class="explain">
    <h2 class="explain-title">中奖名单</h2>
    <div class="explain-list">
        <ul class="explain-list-ul">
            <%foreach (var item in awardRecords)
              {%>
            <%
                  var phoneNum = item.MobilePhone;
                  if (!string.IsNullOrEmpty(phoneNum) && phoneNum.Length == 11)
                  {
                      phoneNum = phoneNum.Substring(0, 3) + "****" + phoneNum.Substring(7, 4);
                  }
                  else
                  {
                      phoneNum = "";
                  }  
            %>
            <li class="explain-list-li"><span class="grade"><%:item.AwardGrade %></span><span class="mobile">&nbsp;<%:phoneNum%></span><span class="name"><%:item.NickName != null ?item.NickName: ""  %></span></li>
            <%} %>
        </ul>
    </div>
</div>
