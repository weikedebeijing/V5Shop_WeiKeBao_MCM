<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="server">
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--加载 start-->
        <div>
         <div class="Loading" style="display: none;">
          <span id="operateTip"></span>&nbsp;&nbsp;
          <a href="javascript:void(0)">X</a> 
         </div>
</div>
    <!--加载end-->
    <!--Left Start-->
    <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
    <div class="MCM-C-M" style="margin-top:15px;">
        <!--标题 begin-->
        
        <!--标题 end-->
        <!--选项卡 begin-->
     
        <!--选项卡 end-->
        <!--操作栏 begin-->
        <div class="mod-operate">
            <div class="con style01">
                <ul class="btn">
                     <li><a class="a-btn" href="../../WeiXinManage/AddOddImageText">添加单图文消息</a></li>
                     <li><a class="a-btn" href="../../WeiXinManage/AddEvenImageText">添加多图文消息</a></li>
                    <li><a class="a-btn" href="#" id="DeleteAll">删除</a></li>
             </ul>
            </div>
        </div>
        <!--操作栏 end-->
     <div class="sourcelist">
                <%    Html.RenderAction("GetPictureClassify", new { PictureClassifyPageIndex = 0 }); %>
            </div>
    </div>
    <!--Left End-->

    <div class="mod-page" style="display: none">
        <div class="style01">
            <div class="mod-footer-page">
                <div>
                    每页最多显示：15条</div>
                <div class="footer-p-div2 tac">
                </div>
            </div>
        </div>
    </div>
 
      
</asp:Content>

