<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../Content/Css/css4.0/default.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Css/css4.0/order.css" rel="stylesheet" type="text/css" />
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%V5.MetaData.Customer.Report.CustomerReport customer = ViewData["ID"] as V5.MetaData.Customer.Report.CustomerReport;%>
    <form id="TestandVerify ">
    <div class="MCM-C-M ">
        <div class="mod-title">
         <div class="con style0h1">
            <h1 class="spanTitle">会员详情</h1>
          </div>
        </div>

        <div>
            <div class="Loading" style="display: none;">
                <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
            </div>
        </div>
        <script type="text/javascript">
            var appCode = GetUrlAppCode();
            var menuCode = GetUrlMenuCode();      
        </script>
        <!--订单信息 begin-->
        <div class="mod-box">
            <div class="con style02">
                <table class="c01-1">
                    <col class="w100" />
                    <col class="w310" />
                    <col class="w78" />
                    <col class="w310" />
                    <col style="width: auto;" />
                    <tr>
                        <td class="fb">
                            会员名称：
                        </td>
                        <td>
                            <%=customer.TrueName %>
                        </td>
                        <td class="fb">
                            会员等级：
                        </td>
                        <td>
                            <%=customer.LevelIDoRName %>
                        </td>
                        <td class="fb">
                            会员状态：
                        </td>
                        <%var Freeze = string.Empty; %>
                        <%if (customer.IsLock == false)
                          {
                              Freeze = "正常";

                          }
                          else { Freeze = "冻结"; }
                        %>
                        <td>
                            <%=Freeze%>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="fb">
                            注册邮箱:
                        </td>
                        <td>
                            <%=customer.Email%>
                        </td>
                        <td class="fb">
                            注册时间：
                        </td>
                        <td>
                            <%=customer.RegDate%>
                        </td>
                        <td class="fb">
                            最近登录：
                        </td>
                      
                        <td>
                          <%=customer.RegisterDate%>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="fb">
                            会员来源：
                        </td>
                        <%var str = string.Empty; %>
                        <%if (customer.Type == "A")
                          {
                              str = "零售商城";

                          }
                          else { str = "分销商城"; }
                
                        %>
                        <td>
                            <%=str %>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="mod-box">
            <div class="con style02">
                <table class="c01-1">
                    <col class="w100" />
                    <col class="w310" />
                    <col class="w78" />
                    <col class="w310" />
                    <col style="width: auto;" />
                    <tr>
                        <td class="fb">
                            账户余额：
                        </td>
                        <td colspan="3">
                            <%= customer.Balance%>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="mod-box">
            <div class="con style02">
                <table class="c01-1">
                    <col class="w100" />
                    <col class="w310" />
                    <col class="w78" />
                    <col class="w310" />
                    <col style="width: auto;" />
                    <tr>
                        <td class="fb">
                            最近消费金额：
                        </td>
                        <td>
                            <%=customer.ConsumeAmount%>
                        </td>
                        <td class="fb">
                            客单价：
                        </td>
                        <td>
                            <%= ViewData["PerTranscation"]%>
                        </td>
                        <td class="fb">
                            消费频次：
                        </td>
                        <td>
                            <%=ViewData["frequency"]%>
                            次/月
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="fb">
                            消费总额：
                        </td>
                        <td>
                            <%=customer.ConsumeAmountSum%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</asp:Content>
