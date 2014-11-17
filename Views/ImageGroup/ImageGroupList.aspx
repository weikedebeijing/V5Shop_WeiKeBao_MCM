<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L" style="margin-top:15px;">
        <div class="MCM-C-M">
            <%--添加成功后把结果放到<span>标签中--%>
            <div class="mod-title">
                <div>
                    <div class="Loading" style="display: none;">
                        <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                    </div>
                </div>
            </div>
            <!--标题 begin-->
          
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                
                                <col style="width: 20%px;">
                                <col style="width: 40%;">
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                            
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <%--<th>
                                        <label>
                                            <input name="" id="ckall" type="checkbox" value=""></label>
                                    </th>--%>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>图片组名称
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>备注
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>创建日期
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>操作
                                    </th>
                                   
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0line" style="width: 100%; height: 500px;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                               
                                <col style="width: 20%px;">
                                <col style="width: 40%;">
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                            </colgroup>
                            <tbody id="content">
                                <%var SysGroups = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["SysGroups"]; %>
                                <%for (int i = 0; i < SysGroups.Count(); i++)
                                  { %>
                                <%var SysGroupID = SysGroups[i].ID; %>
                                <tr class="tr-Current">
                                    <td>
                                        <div class="cell">
                                            <%:SysGroups[i].Name%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:SysGroups[i].Remark%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:SysGroups[i].DateCreated%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <div class="mod-operate">
                                                 <div class="con style0editdel">
                                                    <a href="#" onclick="javascript:itemGroupEdit(<%:SysGroupID %>);">
                                                        编辑</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--List End-->
        </div>
        <!--Page Start-->
        <!--Page End-->
    </div>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");

            // 注册全选
            //checkAll();
        });

        // 商品分组的编辑
        function itemGroupEdit(SysGroupID) {
            window.location.href = "/ImageGroup/ImageGroupEdit?SysGroupID=" + SysGroupID + "";
        };

    </script>
</asp:Content>
