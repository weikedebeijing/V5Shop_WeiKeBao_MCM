<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/jquery-easyui-1.3.2/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/orderset.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
        <div class="MCM-C-M">
            <!--标题 begin-->
            <div class="mod-title">
                <div class="con style01">
                    <h1>
                        订单设置</h1>
                </div>
            </div>
            <!--标题 end-->
            <!--选项卡 begin-->
            <div class="mod-tab">
                <div class="con style01">
                    <ul>
                        <li><a >常规</a></li>
                        <li class="current"><a class="c16">标签</a></li>
                        <%--<li>分组</li>--%>
                        <li><a>问题订单</a></li>
                    </ul>
                </div>
            </div>
            <!--选项卡 end-->
            <!--操作栏 begin-->
            <div class="mod-operate">
                <div class="con style01">
                    <ul class="btn">
                        <li><a href="/OrderSet/AddOrderTag" class="a-btn">添加标签</a> </li>
                    </ul>
                </div>
            </div>
            <!--操作栏 end-->
            <!--列表 Start-->
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="x-tab">
                                        标签名称
                                    </th>
                                    <th class="x-tab">
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
                    <div style="height: 280px;" class="con style01">
                        <table border="0" cellspacing="0" cellpadding="5" name="tags">
<%--                            <colgroup>
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr class="tr-Current">
                                    <td>
                                        <div class="cell">
                                            紧急处理</div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a class="r15" href="添加或编辑商品-分类.html">编辑</a> <a target="_blank"
                                                href="">删除</a> </span>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="cell">
                                            须回电</div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a class="r15" href="添加或编辑商品-分类.html">编辑</a> <a target="_blank"
                                                href="">删除</a> </span>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>--%>
                        </table>
                    </div>
                </div>
            </div>
            <!--列表 End-->
        </div>
    </div>
    <!--订单标签设置脚本-->
    <script type="text/javascript">
        $('[name="tags"]').datagrid({

            //title: '标签',
            iconCls: 'icon-edit',
            width: 700,

            height: 400,

            singleSelect: true,

            idField: 'itemid',

            toolbar: '#tb',

            url: '../../OrderSet/TagAll',

            loadMsg: '正在加载信息...',

            columns: [[
              { field: 'Name',  width: 100 },
              { field: 'action', width: 70, align: 'center' }

        ]],
            onBeforeEdit: function (index, row) {
                row.editing = true;
                $("#dg").datagrid('refreshRow', index);
            },
            onAfterEdit: function (index, row) {
                row.editing = false;
                $("#dg").datagrid('refreshRow', index);
            },
            onCancelEdit: function (index, row) {
                row.editing = false;
                $("#dg").datagrid('refreshRow', index);
            }
        });

        function editrow(index) {
            $("#dg").datagrid('beginEdit', index);
        }

        //删除
        function deleterow(index, row) {
            $.messager.confirm('提示', '您是否要删除？', function (r) {
                if (r) {
                    var entity = $.parseJSON('<%= ViewData["tagJson"]%>');
                    entity.ID = row
                    $.ajax({
                        type: "post",
                        url: "../../OrderSet/TagDelete",
                        data: { "orderTag": JSON.stringify(entity) },
                        success: function (jsonRes) {
                            if (jsonRes.Code == null && jsonRes.Message == null) {
                                $.messager.alert("提示信息", "删除成功");
                                $("#dg").datagrid('reload');
                            }
                            else
                                $.messager.alert('删除失败');

                        }

                    });

                }
            });
        }

        //修改
        function UpdateTag(index, row) {
            var name = $('#dg').datagrid('getEditor', { index: index, field: 'Name' });
            //                var color = $('#dg').datagrid('getEditor', { index: index, field: 'Color' });
            var entity = $.parseJSON('<%= ViewData["tagJson"]%>');
            entity.ID = row;
            entity.Name = name.target.val();
            //                entity.Color = color;
            $("#dg").datagrid('endEdit', index);
            $.ajax({
                type: "post",
                url: "../../OrderSet/TagAddUpdate",
                data: { "orderTag": JSON.stringify(entity) },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $("#dg").datagrid('reload');
                        $.messager.alert("提示信息", "修改成功");
                    }
                    else
                        $.messager.alert('修改失败');
                }
            });

        }

        //添加
        function SaveLable() {
            var lablaName = $("#addText").val();
            if (lablaName == "请输入标签名称...") {
                alert("请输入要添加的标签名！！！");
            }
            //                    var color = $("#addSelect  option:selected").val();
            var entity = $.parseJSON('<%= ViewData["tagJson"]%>');
            entity.Name = lablaName;
            //                    entity.Color = color;
            $.ajax({
                type: "post",
                dataType: 'json',
                url: "../../OrderSet/TagAddUpdate",
                data: { "orderTag": JSON.stringify(entity) },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $.messager.alert("提示信息", "添加成功");
                        $("#dg").datagrid('reload');
                    }
                    else
                        $.messager.alert('添加失败');
                }
            })
        }

    </script>
    <!-- 订单标签设置 end-->
</asp:Content>
