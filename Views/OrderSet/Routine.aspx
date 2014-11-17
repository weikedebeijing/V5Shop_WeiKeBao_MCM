<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../Scripts/jquery-easyui-1.3.2/themes/default/easyui.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Scripts/jquery-easyui-1.3.2/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-easyui-1.3.2/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-easyui-1.3.2/jquery.easyui.min.js" type="text/javascript"></script>
    <link href="../../../Content/Css/css4.0/default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% List<Opened> list = ViewData["list"] as List<Opened>; %>
    <h2>
        订单设置</h2>
    <div class="easyui-tabs" style="width: 1200px; height: 700px">
        <!-- tabs1-->
        <!--订单常规设置 begin-->
        <div title="常规" style="padding: 10px">
            <dl>
                <dt>请选择店铺</dt>
                <dd>
                    <ul>
                        <%foreach (var item in list)
                          { %>
                        <li>
                            <div style="margin-bottom: 15px; margin-top: 15px">
                                <input id="01" type="checkbox" value="checkbox" name="shop" code="<%=item.Code %>"
                                    class="shopTitle" /><span><b><%=item.Title%></b></span></div>
                            <div class="mod-table-head b3">
                                <div class="con style03">
                                    <table width="100%" style="margin-left: 15px;">
                                        <colgroup>
                                            <col style="width: 180px" />
                                            <col style="width: 180px" />
                                            <col style="width: 150px" />
                                            <col style="width: auto" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <input id="11-1" type="checkbox" value="checkbox" code="<%=item.Code %>" name="import"
                                                        state="1" /><span>未付款订单</span>
                                                </th>
                                                <th>
                                                    <input id="11-2" type="checkbox" value="checkbox" code="<%=item.Code %>" name="import"
                                                        state="2" /><span>待发货订单</span>
                                                </th>
                                                <th>
                                                    <input id="11-3" type="checkbox" value="checkbox" code="<%=item.Code %>" name="import"
                                                        state="3" /><span>已发货订单</span>
                                                </th>
                                                <th>
                                                    <input id="11-4" type="checkbox" value="checkbox" code="<%=item.Code %>" name="import"
                                                        state="4" /><span>交易完成订单</span>
                                                </th>
                                                <th>
                                                </th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <%} %>
                    </ul>
                </dd>
            </dl>
            <dl style="top: 30PX">
                <dt>下载频率</dt>
                <dd>
                    <select class="v5-input in200">
                        <option selected="selected" value="手动更新">手动更新</option>
                        <option value="每30分钟">每30分钟</option>
                    </select>
                </dd>
                <dd>
                    <input type="button" value="保存" onclick="Enter()" />
                </dd>
            </dl>
        </div>
        <!--订单常规设置脚本-->
        <script type="text/javascript" language="javascript">
            //全选or 反选
            $(function () {
                $(".shopTitle").click(function () {
                    var current = $(this).attr("code");
                    if (this.checked) {
                        $("input[name='import']").each(function () {
                            if ($(this).attr("code") == current) {
                                $(this).attr("checked", true);
                            }
                        })
                    } else {
                        $("input[name='import']").each(function () {
                            if ($(this).attr("code") == current) {
                                $(this).attr("checked", false);
                            }
                        })
                    }
                });
            });


            //克隆实体类
            function clone(myObj) {
                if (typeof (myObj) != 'object') return myObj;
                if (myObj == null) return myObj;
                var myNewObj = new Object();
                for (var i in myObj) myNewObj[i] = clone(myObj[i]);
                return myNewObj;
            }
            //保存
            function Enter() {
                var shopCode = "";
                var orderState = new Array();
                var objlist = new Array();
                var entity = $.parseJSON('<%=ViewData["json"] %>');

                $("ul li").each(function () {
                    shopCode = $('input[name="shop"]:checked', $(this)).attr("code");
                    $("input[name='import']:checked", $(this)).each(function () {
                        if ($(this).attr("code") == shopCode) {
                            var newobj = clone(entity);
                            newobj.ChannelCode = shopCode;
                            newobj.OrderStatus = $(this).attr("state");
                            objlist.push(newobj);
                        }
                    })
                });
                $.ajax({
                    url: "../../OrderSet/ToList",
                    type: "post",
                    dataType: 'json',
                    data: { "objList": JSON.stringify(objlist) },
                    success: function (result) {
                        if (result.Code == null && result.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("保存成功").change();
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("保存失败").change();
                        }
                    }
                });
            };
        </script>
        <!--订单常规设置 end-->
        <!-- 订单标签设置 begin-->
        <div title="标签" style="padding: 10px">
            <div>
                <input type="button" value="添加标签" id="btnDiv" /></div>
            <br />
            <div id="showDiv" style="display: none;">
                <dl style="line-height: 35px">
                    <dt>添加标签</dt>
                    <dd>
                        <input type="text" style="height: 20px; width: 150px; color: Gray" value="请输入标签名称..."
                            id="addText" />&nbsp;&nbsp;&nbsp;
                        <!--<select style=" height:20px" id="addSelect">
            <option value="">选择背景色</option>
            <option value="红色">红色</option>
            <option value="橙色">橙色</option>
            <option value="黄色">黄色</option>
            <option value="绿色">绿色</option>
            <option value="青色">青色</option>
            <option value="蓝色">蓝色</option>
            <option value="紫色">紫色</option>
        </select>-->
                    </dd>
                    <dd>
                        <input type="button" value="保存" onclick="SaveLable()" /></dd>
                </dl>
            </div>
            <table id="dg" title="标签" class="easyui-datagrid" style="width: 700px; height: 400px">
            </table>
        </div>
        <script type="text/javascript">
            //点击按钮显示DIV
            $(function () {
                $("#btnDiv").click(function () {
                    $("#showDiv").show();
                })
            });

            //点击文本框取消默认值
            $(function () {
                $("#addText").focus(function () {
                    var txt_value = $(this).val();
                    if (txt_value == "请输入标签名称...") {
                        $(this).val("");
                    }
                });
                $("#addText").blur(function () {
                    var txt_value = $(this).val();
                    if (txt_value == "") {
                        $(this).val("请输入标签名称...")
                    }
                })
            })
        </script>
        <!--订单标签设置脚本-->
        <script type="text/javascript">
            $("#dg").datagrid({

                title: '标签',

                iconCls: 'icon-edit',

                width: 700,

                height: 400,

                singleSelect: true,

                idField: 'itemid',

                toolbar: '#tb',

                url: '../../OrderSet/TagAll',

                loadMsg: '正在加载信息...',

                columns: [[
              { field: 'Name', title: '标签名称', width: 60, editor: 'text' },
                //              { field: 'Color', title: '颜色', width: 60, 
                //              editor: {
                //                            type: 'combobox',
                //                            options:
                //                                {
                //                                    valueField: 'id',
                //                                    textField: '要显示的字段名',
                //                                    url: '/Sys/SearchCodeInFunctionModel'
                //                                }
                //                        }
                //              },
              {field: 'action', title: '操作', width: 70, align: 'center',
              formatter: function (value, row, index) {
                  if (row.editing) {
                      if (row.ID == undefined) {
                          var a = '<a href="#" iconCls:"icon-save" onclick="Insertsaverow(' + index + ')">保存</a>';
                          return a;
                      }
                      var s = '<a href="#" iconCls:"icon-save" onclick="UpdateTag(' + index + ',' + row.ID + ')">保存</a>';

                      var c = '<a href="#" onclick="cancelrow(' + index + ',' + row.ID + ')">取消</a>';
                      return s + c;
                  }
                  else {
                      var e = '<a href="#" onclick="editrow(' + index + ',' + row.ID + ')">修改</a>';
                      var d = '<a href="#" iconCls:"icon-remove" onclick="deleterow(' + index + ',' + row.ID + ')">删除</a>';
                      return e + d;
                  }
              }
          }
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
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请输入要添加的标签名").change();
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
        <!-- 订单分组设置 begin-->
        <div title="分组" style="padding: 10px">
            <input type="button" value="添加分组条件" id="btngroup" />
            <div id="tableDiv" style="display: none">
                <table id="tableGroup">
                    <tr>
                        <td>
                            <!--按快递公司-->
                            <div id="expressage">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按快递公司</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" express="sf" data_conditionid="17" name="express"
                                            data_conditiontag="1" /><span>顺丰</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" express="st" data_conditionid="17" name="express"
                                            data_conditiontag="1" /><span>申通</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" express="ht" data_conditionid="17" name="express"
                                            data_conditiontag="1" /><span>汇通</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" express="tt" data_conditionid="17" name="express"
                                            data_conditiontag="1" /><span>天天快递</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" express="zjs" data_conditionid="17" name="express"
                                            data_conditiontag="1" /><span>宅急送</span></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <!--按会员等级-->
                            <div id="member">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按会员等级</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="18" name="express" data_conditiontag="2" /><span>非注册用户</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="18" name="express" data_conditiontag="2" /><span>普通会员</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="18" name="express" data_conditiontag="2" /><span>高级会员</span></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <!--按打印状态-->
                            <div id="print">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按打印状态</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="19" name="express" data_conditiontag="3" /><span>已打印快递单</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="19" name="express" data_conditiontag="3" /><span>未打印快递单</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="19" name="express" data_conditiontag="3" /><span>已打印发货单</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="19" name="express" data_conditiontag="3" /><span>未打印发货单</span></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <!--按订单来源筛选-->
                            <div id="source">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;" /><span>按订单来源筛选</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="20" name="express" data_conditiontag="4" /><span>普通订单</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="20" name="express" data_conditiontag="4" /><span>货到付款</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="20" name="express" data_conditiontag="4" /><span>分销订单</span></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--按订单商品-->
                            <div id="goods">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按订单商品</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="1" name="express" data_conditiontag="5"
                                            id="single" /><span>单品</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="2" name="express" data_conditiontag="5" /><input
                                            type="text" /><span>种商品</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="3" name="express" data_conditiontag="5" /><input
                                            type="text" /><span>种商品以上</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="4" name="express" data_conditiontag="5" /><span>任意商品数量大于</span><input
                                            type="text" /></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="5" name="express" data_conditiontag="5" /><span>商品总价大于</span><input
                                            type="text" /></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="6" name="express" data_conditiontag="5" /><span>商品总价小于</span><input
                                            type="text" /></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" style="display: none" data_conditionid="7"
                                            name="express" data_conditiontag="5" /><span>商品名称包含关键字</span></p>
                                    <p>
                                        <input type="text" id="goodstext" /></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <!--按收货地址-->
                            <div id="address">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按收货地址</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="8" name="express" data_conditiontag="6" /><span>无可达物流</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="9" name="express" data_conditiontag="6" /><span>非城区地址（地址包含镇、乡、村等）</span></p>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" style="display: none" data_conditionid="10"
                                            name="express" data_conditiontag="6" /><span>收货地址包含关键字</span><input type="text" id="taketext" /></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <!--按其他-->
                            <div id="rest">
                                <div>
                                    <p style="text-align: left;">
                                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                                            text-decoration: none; color: #333333;">按其他</span>
                                    </p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="11" id="uncollected" name="express"
                                            data_conditiontag="7" /><span>同一会员存在未收款订单</span></p>
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" data_conditionid="12" id="address" name="express"
                                            data_conditiontag="7" /><span>同一会员多订单不同地址</span></p>
                                </div>
                                <div>
                                    <span>会员留言</span><input type="radio" checked="checked" data_conditionid="13" name="messsge"
                                        data_conditiontag="7" value="true" />是
                                    <input type="radio" data_conditionid="13" name="messsge" data_conditiontag="7" value="false" />否
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" style="display: none" data_conditionid="14"
                                            name="express" data_conditiontag="7" /><span>留言包含关键字</span><input type="text" id="messagetext" /></p>
                                </div>
                                <div>
                                    <span>客服备注</span><input type="radio" checked="checked" data_conditionid="15" name="remark"
                                        data_conditiontag="7" value="true" />是
                                    <input type="radio" data_conditionid="15" name="remark" data_conditiontag="7" value="false" />否
                                </div>
                                <div>
                                    <p style="text-align: left;">
                                        <input type="checkbox" value="checkbox" style="display: none" data_conditionid="16"
                                            name="express" data_conditiontag="7" /><span>备注包含关键字</span><input type="text" id="remarktext" /></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--保存取消操作-->
                            <div>
                                <p style="text-align: left;">
                                    关联方式（如：单品&顺丰，表示订单商品为单品且快递公司为顺丰）</p>
                                <p style="text-align: left;">
                                    <input type="radio" name="relevancy" checked="checked" value="2" />&(且)
                                    <input type="radio" name="relevancy" value="1" />|(或)</p>
                                <p style="text-align: left;">
                                    分组名称</p>
                                <p style="text-align: left;">
                                    <input type="text" id="groupName" /></p>
                                <p style="text-align: left;">
                                    <input type="checkbox" />是否高亮显示</p>
                                <p style="text-align: left;">
                                    <input type="button" value="保存" onclick="SaveGroup()" />&nbsp;&nbsp;<input type="button"
                                        value="取消" id="groupCancel" /></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <table id="groupTable" title="分组" class="easyui-datagrid" style="width: 700px; height: 400px">
            </table>
            <!--操作表格数据-->
            <script type="text/javascript">
                //点击添加分组条件按钮展开DIV
                $("#btngroup").click(function () {
                    $("#tableDiv").show();
                })
                $("#groupCancel").click(function () {
                    $("#tableDiv").hide();
                })



                //添加
                function SaveGroup() {

                    //接收后台传过来的 GroudView
                    var groupView = $.parseJSON('<%=ViewData["GroupView"] %>');
                    //调用克隆方法克隆后台传来的 GroudView
                    var newGroupView = clone(groupView);
                    newGroupView.GroupValues = new Array();
                    //给 GroudView 里面的 Group 赋值
                    newGroupView.Group.LogicType = $('input[name="relevancy"]:checked').val();
                    newGroupView.Group.Name = $("#groupName").val();


                    //再克隆一遍 GroudView 里面的 GroupValues 集合（克隆后是一个对象）
                    var newGroupValue = clone(groupView.GroupValues[0]);
                    //查询按快递公司选中的checkedbox
                    $("#expressage input[data_conditionTag=1]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        newGroupValue.Value = $(this).attr("express");
                        //                    newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });

                    //查询按会员等级选中的checkedbox
                    $("#member input[data_conditionTag=2]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        newGroupValue.Value = $(this).attr("express");
                        // newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });

                    //查询按打印状态选中的checkedbox
                    $("#print input[data_conditionTag=3]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        newGroupValue.Value = $(this).attr("express");
                        // newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });

                    //查询按订单筛选选中的checkedbox
                    $("#source input[data_conditionTag=4]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        newGroupValue.Value = $(this).attr("express");
                        // newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });

                    //查询按订单商品选中的checkedbox
                    $("#goods input[data_conditionTag=5]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        if ($(this).attr("data_conditionid") == "1") {
                            newGroupValue.Value = document.getElementById("single").checked;
                        } else if ($(this).attr("data_conditionid") == "2" || $(this).attr("data_conditionid") == "3") {
                            newGroupValue.Value = $(this).next().val();
                        } else if ($(this).attr("data_conditionid") == "4" || $(this).attr("data_conditionid") == "5" || $(this).attr("data_conditionid") == "6") {
                            newGroupValue.Value = $(this).next().next().val();
                        }
                        //newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });
                    var goods = $("#goodstext").val();
                    if (goods != "") {
                        newGroupValue.Value = goods;
                    }
                    var take = $("#taketext").val();
                    if (take != "") {
                        newGroupValue.Value = take;
                    }
                    var message = $("#messagetext").val();
                    if (message != "") {
                        newGroupValue.Value = message;
                    }
                    var remark = $("#remarktext").val();
                    if (remark != "") {
                        newGroupValue.Value = remark;
                    }
                    //查询按收货地址选中的checkedbox
                    $("#address input[data_conditionTag=6]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        if ($(this).attr("data_conditionid") == "10") {
                            newGroupValue.Value = $(this).next().next().val();
                        } else {
                            if ($(this).attr("checked") == "checked") {
                                newGroupValue.Value = true;
                            }

                        }
                        // newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });

                    //查询按其他选中的checkedbox
                    $("#rest input[data_conditionTag=7]:checked").each(function () {
                        //为克隆后的 newGroupValue 对象赋值 
                        newGroupValue.ConditionID = $(this).attr("data_conditionid");
                        var message = $("input[name='messagetext']").val();
                        if (message != "") {
                            newGroupValue.Value = message;
                        }

                        var remark = $("input[name='remarktext']").val();
                        if (remark != "") {
                            newGroupValue.Value = remark;
                        }

                        var message = $("input[name='messsge']:checked").val();
                        if (message != null) {
                            newGroupValue.Value = true;
                        } else {
                            newGroupValue.Value = false;
                        }
                        var remark = $("input[name='remark']:checked").val();
                        if (remark != null) {
                            newGroupValue.Value = true;
                        } else {
                            newGroupValue.Value = false;
                        }
                        if ($("input[data_conditionid=11]:checked")) {
                            newGroupValue.Value = document.getElementById("uncollected").checked;
                        }
                        if ($("input[data_conditionid=12]:checked")) {
                            newGroupValue.Value = document.getElementById("address").checked;
                        }

                        // newGroupValue.ConditionTagID = $(this).attr("data_conditionidTag");
                    });


                    //将 克隆后的 对象  放到 newGroupView 的 GroupValues中
                    newGroupView.GroupValues.push(newGroupValue);
                    $.ajax({
                        type: "post",
                        dataType: 'json',
                        url: "../../OrderSet/AddGroups",
                        data: { "groupView": JSON.stringify(newGroupView) },
                        success: function (jsonRes) {
                            if (jsonRes.Code == null && jsonRes.Message == null) {
                                $.messager.alert("提示信息", "添加成功");
                                $("#groupTable").datagrid('reload');
                            }
                            else
                                $.messager.alert('添加失败');
                        }
                    })
                }



                //删除
                function DeleteGroup(index, row) {
                    $.messager.confirm('提示', '您是否要删除？', function (r) {
                        if (r) {
                            var groupView = $.parseJSON('<%=ViewData["GroupView"] %>');
                            //调用克隆方法克隆后台传来的 GroudView
                            var newGroupView = clone(groupView);
                            newGroupView.Group.ID = row
                            $.ajax({
                                type: "post",
                                url: "../../OrderSet/GroupDelete",
                                data: { "group": JSON.stringify(newGroupView) },
                                success: function (jsonRes) {
                                    if (jsonRes.Code == null && jsonRes.Message == null) {
                                        
                                        $.messager.alert("提示信息", "删除成功");
                                        $("#groupTable").datagrid('reload');
                                    }
                                    else
                                        $.messager.alert('删除失败');

                                }

                            });

                        }
                    });
                }
            </script>
            <!--分组表格数据绑定-->
            <script type="text/javascript">

                $("#groupTable").datagrid({
                    title: '分组',
                    iconCls: 'icon-edit',
                    width: 700,
                    height: 400,
                    singleSelect: true,
                    idField: 'ID',
                    toolbar: '#tb',
                    url: '../../OrderSet/GetGroupAll',
                    loadMsg: '正在加载信息...',
                    columns: [[
              { field: 'Name', title: '名称', width: 60, editor: 'text' },
              { field: 'Status', title: '状态', width: 60, editor: 'text' },
              { field: 'action', title: '操作', width: 70, align: 'center',
                  formatter: function (value, row, index) {
                      if (row.editing) {
                          if (row.ID == undefined) {
                              var a = '<a href="#" iconCls:"icon-save" onclick="Insertsaverow(' + index + ')">保存</a>';
                              return a;
                          }
                          var s = '<a href="#" iconCls:"icon-save" onclick="UpdateTag(' + index + ',' + row.ID + ')">保存</a>';

                          var c = '<a href="#" onclick="cancelrow(' + index + ',' + row.ID + ')">取消</a>';
                          return s + c;
                      }
                      else {
                          var e = '<a href="#" onclick="editrow(' + index + ',' + row.ID + ')">修改</a>';
                          var d = '<a href="#" iconCls:"icon-remove" onclick="DeleteGroup(' + index + ',' + row.ID + ')">删除</a>';
                          return e + d;
                      }
                  }
              }
        ]],
                    onBeforeEdit: function (index, row) {
                        row.editing = true;
                        $("#groupTable").datagrid('refreshRow', index);
                    },
                    onAfterEdit: function (index, row) {
                        row.editing = false;
                        $("#groupTable").datagrid('refreshRow', index);
                    },
                    onCancelEdit: function (index, row) {
                        row.editing = false;
                        $("#groupTable").datagrid('refreshRow', index);
                    }
                });
            </script>
            <!--  
        <div title="产品线" style="padding: 10px">
            <table id="Linedg" title="产品线" class="easyui-datagrid" style="width: 700px; height: auto">
            </table>
        </div>
        -->
        </div>
        <!-- <script type="text/javascript">


        $("#Linedg").datagrid({

            title: '产品线',

            iconCls: 'icon-edit',

            width: 700,

            height: 400,

            singleSelect: true,

            idField: 'itemid',

            toolbar: '#tb',

            url: '../../Commodity/LineDataGrid',

            loadMsg: '正在加载信息...',

            columns: [[
              { field: 'Name', title: '标签名称', width: 60, editor: 'text' },
              { field: 'action', title: '操作', width: 70, align: 'center',
                  formatter: function (value, row, index) {
                      if (row.editing) {

                          if (row.ID == undefined) {
                              var a = '<a href="#" iconCls:"icon-save" onclick="InsertLine(' + index + ')">保存</a>';
                              return a;
                          }
                          var s = '<a href="#" iconCls:"icon-save" onclick="saveLine(' + index + ',' + row.ID + ')">保存</a>';

                          var c = '<a href="#" onclick="cancelLine(' + index + ',' + row.ID + ')">取消</a>';
                          return s + c;

                      }

                      else {
                          var e = '<a href="#" onclick="editLine(' + index + ',' + row.ID + ')">修改</a>';
                          var d = '<a href="#" iconCls:"icon-remove" onclick="deleteLine(' + index + ',' + row.ID + ')">删除</a>';
                          return e + d;
                      }
                  }
              }
        ]],
            onBeforeEdit: function (index, row) {
                row.editing = true;
                $("#Linedg").datagrid('refreshRow', index);
            },
            onAfterEdit: function (index, row) {
                row.editing = false;
                $("#Linedg").datagrid('refreshRow', index);
            },
            onCancelEdit: function (index, row) {
                row.editing = false;
                $("#Linedg").datagrid('refreshRow', index);
            }
        });

        function editLine(index) {

            $("#Linedg").datagrid('beginEdit', index);

        }
        function deleteLine(index, row) {
            $.messager.confirm('提示', '您是否要删除？', function (r) {
                if (r) {

                    var tag = new Product();
                    tag.entity.ID = row;

                    tag.entity.DateCreated = new Date();
                    tag.entity.DateModified = new Date();
                    var tags = JSON.stringify(tag.entity);
                    $.ajax({
                        type: "post",
                        url: "../../Commodity/lineDelete",
                        data: { "ProductTag": tags },
                        success: function (jsonRes) {
                            if (jsonRes.Code == null && jsonRes.Message == null) {
                                $.messager.alert("提示信息", "删除成功");
                                $("#Linedg").datagrid('reload');
                            }
                            else
                                $.messager.alert('删除失败');

                        }

                    });

                }
            });
        }

        function saveLine(index, row) {

            var name = $('#Linedg').datagrid('getEditor', { index: index, field: 'Name' });
            var tag = new Product();
            tag.entity.ID = row;
            tag.entity.Name = name.target.val();
            tag.entity.DateCreated = new Date();
            tag.entity.DateModified = new Date();
            var tags = JSON.stringify(tag.entity);
            //                $("#Linedg").datagrid('endEdit', index);
            $.ajax({
                type: "post",
                url: "../../Commodity/lineUpdate",
                data: { "ProductTag": tags },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $.messager.alert("提示信息", "修改成功");
                        $("#Linedg").datagrid('reload');
                    }
                    else
                        $.messager.alert('修改失败');

                }

            });

        }

        function cancelLine(index, row) {
            $('#Linedg').datagrid('clearSelections');

            $('#Linedg').datagrid('reload');

            $("#Linedg").datagrid('endEdit', index);

        }

        function InsertLine(index, row) {

            var name = $('#Linedg').datagrid('getEditor', { index: index, field: 'Name' });

            $("#Linedg").datagrid('endEdit', index);
            var tag = new Product();
            tag.entity.Name = name.target.val();
            var tags = JSON.stringify(tag.entity);
            $.ajax({
                type: "post",
                url: "../../Commodity/lineUpdate",
                data: { "ProductTag": tags },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $.messager.alert("提示信息", "添加成功");
                        $("#Linedg").datagrid('reload');
                    }
                    else
                        $.messager.alert('添加失败');

                }

            });

        }

    </script>-->
        <div title="问题订单" style="padding: 10px">
            <div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" value="ckOrder" id="cheOrders" name="cheOrders" /><span>启用问题订单识别
                        </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                            text-decoration: none; color: #333333;">商品问题</span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="1" conditiontagid="1" name="Condition" value="checkbox" /><span>商品总价大于</span><input
                            name="txtCondition" id="txtConditionSum" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="2" conditiontagid="1" name="Condition" value="checkbox" /><span>商品种类大于</span><input
                            name="txtCondition" id="txtConditionCommodity" type="text" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="3" conditiontagid="1" name="Condition" value="checkbox" /><span>商品总量大于</span><input
                            name="txtCondition" type="text" id="txtConditionAggregate" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="4" conditiontagid="1" name="Condition" value="checkbox" /><span>任一单品数量大于</span><input
                            name="txtCondition" id="txtSingle" type="text" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="5" conditiontagid="1" name="Condition" value="checkbox" /><span>付款时间大于</span><input
                            name="txtCondition" type="text" id="txtConditionDate" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="6" conditiontagid="1" value="checkbox" name='Condition' /><span>自动判断库存是否不足</span></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span>包含以下任一商品</span></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="text" conditionid="7" conditiontagid="1" id='txtCondition1' /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                            text-decoration: none; color: #333333;">收货地址问题</span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="8" conditiontagid="2" name="Condition" value="checkbox" /><span>无可达物流
                        </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="9" conditiontagid="2" name="Condition" value="checkbox" /><span>非城区地址（收件地址包含镇、乡、村等）
                        </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span>属于以下任一地区 </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <select id="slProvince" onchange="Province()">
                        </select>
                        <span>
                            <select id="slCity" onchange="City()">
                            </select></span></p>
                </div>
                <input type="hidden" id="hiddenProvince" />
                <input type="hidden" id="hiddenCity" />
                <div>
                    <p style="text-align: left;">
                        <input type="text" id="txtProvince" conditionid="10" conditiontagid="2" /></p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span style="font-family: 应用字体; font-size: 13px; font-weight: bold; font-style: normal;
                            text-decoration: none; color: #333333;">客户问题 </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="11" conditiontagid="3" name="Condition" value="checkbox" />同一客户存在未收款订单
                        </span></p>
                    <p>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="checkbox" conditionid="12" conditiontagid="3" name="Condition" value="checkbox" /><span>同一客户多订单不同地址
                        </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span>客户留言包含以下关键字 </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <input type="text" id='txtQuestion' conditionid="13" conditiontagid="3" /><span> </span>
                    </p>
                </div>
                <div>
                    <p style="text-align: left;">
                        <span>
                            <input type="button" id="bntInsert" value="确定" /></span></p>
                </div>
            </div>
        </div>
        <script type="text/javascript">




            $("#bntInsert").die().live("click", function () {

                if ($("input[name='cheOrders']:checked").val() == "ckOrder") {
                    $.ajax({
                        type: "post",
                        url: "../../OrderSet/GetSuspiciousUpdataTrue"

                    });
                }
                else {
                    $.ajax({
                        type: "post",
                        url: "../../OrderSet/GetSuspiciousUpdataFales"

                    });
                }
                //接收后台传过来的 GroudView
                var groupView = $.parseJSON('<%=ViewData["GroupView"] %>');
                //调用克隆方法克隆后台传来的 GroudView
                var newGroupView = clone(groupView);
                newGroupView.GroupValues = new Array();
                $("input[name='Condition']:checked").each(function () {
                    //再克隆一遍 GroudView 里面的 GroupValues 集合（克隆后是一个对象）
                    var newGroupValue = clone(groupView.GroupValues[0]);
                    //为克隆后的 newGroupValue 对象赋值 
                    newGroupValue.ConditionID = $($(this)).attr("ConditionID");
                    newGroupValue.ConditionTagID = $($(this)).attr("ConditionTagID");
                    newGroupValue.Value = $("input[name='txtCondition']", $(this).parent()).val();
                    newGroupView.GroupValues.push(newGroupValue);
                });


                if ($("#txtCondition1").val() != "") {
                    var newGroupValue = clone(groupView.GroupValues[0]);
                    newGroupValue.ConditionID = $("#txtCondition1").attr("ConditionID");
                    newGroupValue.ConditionTagID = $("#txtCondition1").attr("ConditionTagID");
                    newGroupValue.Value = $("#txtCondition1").val();
                    newGroupView.GroupValues.push(newGroupValue);
                }

                if ($("#slProvince").val() != "default" && $("#slCity").val() != "default" && $("#txtProvince").val != "") {

                    var newGroupValue = clone(groupView.GroupValues[0]);
                    newGroupValue.ConditionID = $("#txtProvince").attr("ConditionID");
                    newGroupValue.ConditionTagID = $("#txtProvince").attr("ConditionTagID");
                    newGroupValue.Value = $("#hiddenProvince").val() + "-" + $("#hiddenCity").val() + "-" + $("#txtProvince").val();
                    newGroupView.GroupValues.push(newGroupValue);

                }
                if ($("#txtQuestion").val() != "") {

                    var newGroupValue = clone(groupView.GroupValues[0]);
                    newGroupValue.ConditionID = $("#txtQuestion").attr("ConditionID");
                    newGroupValue.ConditionTagID = $("#txtQuestion").attr("ConditionTagID");
                    newGroupValue.Value = $("#txtQuestion").val() ;
                    newGroupView.GroupValues.push(newGroupValue);
                
                 }


                $.ajax({
                    type: "post",
                    url: "../../OrderSet/GetGroupValue",
                    data: { "groupViews": JSON.stringify(newGroupView) },
                    success: function (jsonRes) {
                        if (jsonRes.Code == null && jsonRes.Message == null) {
                            $.messager.alert("提示信息", "添加成功");
                            if ("[name=ckOrder]:checked") {
                                $.ajax({
                                    type: "post",
                                    url: "../../OrderSet/GetSuspiciousUpdata",
                                    data: { "groupViews": JSON.stringify(newGroupView) },
                                    success: function (jsonRes) {
                                        if (jsonRes.Code == null && jsonRes.Message == null) {

                                        }
                                    }
                                });


                            }
                        }
                    }
                });


            })

            //加载省市联动数据
            $(function () {
                GetAreaList("slProvince", 1);
                $("#slProvince").change(function () {
                    var $ID = $("#slProvince").val();
                    if ($ID == "default") {
                        $("#slCity").text("");
                        var $defaultOption = $("<option value='default'>-请选择-</option>");
                        $("#slCity").append($defaultOption);

                    } else {

                        GetAreaList("slCity", $ID);
                    }
                })
            })
            function GetAreaList(containerID, ID) {
                $.ajax({
                    url: "../../OrderSet/GetAreaList",
                    type: "get",
                    data: { "ID": ID },
                    success: function (res) {
                        if (res != null) {
                            var jsonRes = JSON.parse(res);
                            $("#" + containerID + "").text("");
                            var $defaultOption = $("<option value='default'>-请选择-</option>");
                            $("#" + containerID + "").append($defaultOption);
                            for (var i = 0; i < jsonRes.length; i++) {
                                var $option = $("<option value='" + jsonRes[i].ID + "'>" + jsonRes[i].Name + "</option>");

                                $("#" + containerID + "").append($option);
                            }
                        }
                    },
                    error: function () {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("error").change();
                    }
                })
            }

            function Province() {
                var productLocation = $("#slProvince").find("option:selected").text();

                $("#hiddenProvince").val(productLocation);

            }

            function City() {
                var City = $("#slCity").find("option:selected").text();

                $("#hiddenCity").val(City);

            }
            

        </script>
</asp:Content>
