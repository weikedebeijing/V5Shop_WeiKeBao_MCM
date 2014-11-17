<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M ">
            <!--title begin-->
            <div class="mod-title">
                <div class="con style03">
                    <div class="con style0h1">
                        <a href="/WeiXinManage/MessageManageList?MenuCode=C345" title="返回" class="a-btn float-l">
                            <i class="icon-back t6"></i></a>
                        <h1 class="spanTitle">
                            留言回复查看</h1>
                    </div>
                </div>
            </div>
            <!--title end-->
            <!--添加内容 开始-->
            <div>
                <div class="mod-form">
                    <div class="con style01">
                        <%var LeaveMessage_UserInfos = (List<V5.MetaData.WeiXin.Report.LeaveMessage_UserInfoReport>)ViewData["LeaveMessage_UserInfos"]; %>
                        <%var replyMessages = (List<V5.MetaData.WeiXin.Model.ReplyMessage>)ViewData["replyMessages"]; %>
                        <div>
                            <%foreach (var item in LeaveMessage_UserInfos)
                              { %>
                            <div>
                                <span style="color: Blue; display: inline-block; width: 100px;">
                                    <%:item.NickName%></span> <span style="width: 150px; display: inline-block;">
                                        <%:item.LeaveDate%></span> <span style="width: 50px; display: inline-block;">留言:</span>
                                <div style="width: 300px; margin: 10px 0px 10px 100px;">
                                    <%:item.LeaveContent%></div>
                            </div>
                            <%foreach (var replyMessage in replyMessages)
                              { %>
                            <%if (replyMessage.LeaveMessageID == item.LeaveMessageID)
                              {%>
                            <div>
                                <span style="color: Blue; display: inline-block; width: 100px;">平台</span> <span style="width: 150px;
                                    display: inline-block;">
                                    <%:replyMessage.ReplyDate%></span> <span style="width: 50px; display: inline-block;">
                                        回复:</span>
                                <div style="width: 300px; margin: 10px 0px 10px 100px;">
                                    <%:replyMessage.ReplyContent%></div>
                            </div>
                            <br />
                            <%} %>
                            <%} %>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
            <!--添加内容 结束-->
        </div>
    </div>
</asp:Content>
