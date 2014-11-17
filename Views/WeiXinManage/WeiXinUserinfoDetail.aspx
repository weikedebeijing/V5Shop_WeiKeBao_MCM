<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
        <div class="MCM-C-M">
            <!--title begin-->
            <div class="mod-title">
                <div class="con style03">
                    <div class="con style0h1">
                        <a href="/WeiXinManage/WeiXinUserManageList?MenuCode=C340" title="返回" class="a-btn float-l">
                            <i class="icon-back t6"></i></a>
                        <h1 class="spanTitle">
                            用户信息查看</h1>
                    </div>
                </div>
            </div>
            <!--title end-->
            <%var userInfoDetail = (V5.MetaData.WeiXin.Model.UserInfoDetail)ViewData["userInfoDetail"]; %>
            <%--详细信息 Start --%>
            <div class="mod-box">
                <div class="con style02">
                    <table class="c01-1">
                        <col class="w78" />
                        <col class="w310" />
                        <col class="w78" />
                        <col class="w310" />
                        <col style="width: auto;" />
                        <%if (null == userInfoDetail)
                          { %>
                        无数据
                        <%}
                          else
                          { %>
                        <tr>
                            <td class="fb">
                                用户昵称：
                            </td>
                            <td>
                                <%:userInfoDetail.NickName%>
                            </td>
                            <td class="fb">
                                关注状态：
                            </td>
                            <td>
                                <%if (userInfoDetail.Subscribe == "0")
                                  { %>
                                用户取消关注
                                <%}
                                  else
                                  {%>
                                用户已关注
                                <%} %>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="fb">
                                用户性别：
                            </td>
                            <td>
                                <%if (userInfoDetail.Sex == "1")
                                  {%>
                                男
                                <%}
                                  else
                                  {%>
                                女
                                <%} %>
                            </td>
                            <td class="fb">
                                所在地区：
                            </td>
                            <td>
                                <%:userInfoDetail.Country %>&nbsp;<%:userInfoDetail.Province%>&nbsp;<%:userInfoDetail.City%>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="fb">
                                用户语言：
                            </td>
                            <td>
                                <%:userInfoDetail.Language %>
                            </td>
                            <td class="fb">
                                关注时间：
                            </td>
                            <td>
                                <%if (null != userInfoDetail.SubscribeTime)
                                  { %>
                                <%:userInfoDetail.SubscribeTime %>
                                <%} %>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
            <%--详细信息 End --%>
        </div>
    </div>
</asp:Content>
