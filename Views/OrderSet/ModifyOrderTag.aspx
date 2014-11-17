<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L ScrollBar">
        <div class="MCM-C-M ">
            <!--title begin-->
            <div class="mod-title">
                <div class="con style03">
                    <a class="icon-back r10" title="返回" href="/OrderSet/OrderTag"></a>
                    <h2>
                        修改订单标签</h2>
                </div>
            </div>
            <!--title end-->
            <!--添加内容 开始-->
            <div class="mod-operate-detail">
                <div class="mod-title">
                    <div class="con style01">
                        <h1>
                            修改标签</h1>
                    </div>
                </div>
                <div class="mod-form">
                    <div class="con style04">
                        <table>
                            <colgroup>
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" value="请输入标签名称" class="v5-input w150 float-l">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="submit01 t10">
                                            &nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
