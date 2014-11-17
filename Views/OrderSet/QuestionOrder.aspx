<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Content/Css/css4.0/default.css" rel="stylesheet" type="text/css" />
    <link href="../../../Content/Css/css4.0/product.css" rel="stylesheet" type="text/css" />
    <script src="../../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/orderset.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%V5.MetaData.Order.Model.GroupValue commodity1 = ViewData["commodity1"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity2 = ViewData["commodity2"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity3 = ViewData["commodity3"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity4 = ViewData["commodity4"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity5 = ViewData["commodity5"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity6 = ViewData["commodity6"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue commodity7 = ViewData["commodity7"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue address = ViewData["address"] as V5.MetaData.Order.Model.GroupValue; %>
    <%V5.MetaData.Order.Model.GroupValue Client = ViewData["Client"] as V5.MetaData.Order.Model.GroupValue; %>
    <!--加载 start-->
    <!--加载end-->
    <!--Left Start-->
    <div class="MCM-N-L">
        <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
        <div class="MCM-C-M">
            <!--标题 begin-->
            <div class="mod-title" style="margin-bottom: 0px; margin-top: 18px;">
            </div>
            <%-- <div class="mod-title">
                <div class="con style01">
                    <h1>
                        订单设置</h1>
                </div>
            </div>--%>
            <!--标题 end-->
            <!--选项卡 begin-->
            <%--    <div class="mod-tab">
                <div class="con style01">
                    <ul>--%>
            <%--<li><a>标签</a></li>--%>
            <%--<li>分组</li>--%>
            <%--           <li class="current"><a class="c16">问题订单</a></li>
                    </ul>
                </div>
            </div>--%>
            <!--选项卡 end-->
            <!--问题订单内容分类  开始-->
            <div class="w960">
                <div class="mod-form float-l">
                    <div class="con style05 w270 r10 t10">
                        <h5>
                            商品问题</h5>
                        <dl class="bg06 h250">
                            <ul class="l10">
                                <li class="w200 h23">
                                    <input id="fztj01-1" type="checkbox" conditionid="1" conditiontagid="1" name="Condition">
                                    <label for="fztj01-1">
                                        商品总价大于</label>
                                    <%if (commodity1 != null)
                                      { %>
                                    <input type="text" class="w45 l24" name="txtCondition" value="<%=commodity1.Value %>" />
                                    <%  } %>
                                    <%else
                                        { %>
                                    <input type="text" class="w45 l24" name="txtCondition" />
                                    <%     } %>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-2" type="checkbox" conditionid="2" conditiontagid="1" name="Condition">
                                    <label for="fztj01-2">
                                        商品种类大于</label>
                                    <%if (commodity2 != null)
                                      { %>
                                    <input type="text" class="w45 l24" name="txtCondition" value="<%=commodity2.Value %>" />
                                    <%  } %>
                                    <%else
                                        {%>
                                    <input type="text" class="w45 l24" name="txtCondition" />
                                    <% } %>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-3" type="checkbox" conditionid="3" conditiontagid="1" name="Condition">
                                    <label for="fztj01-3">
                                        商品总量大于</label>
                                    <%if (commodity3 != null)
                                      { %>
                                    <input type="text" name="txtCondition" class="w45 l24" value="<%=commodity3.Value%>" />
                                    <% } %>
                                    <%else
                                        {  %>
                                    <input type="text" name="txtCondition" class="w45 l24" />
                                    <% } %>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-4" type="checkbox" conditionid="4" conditiontagid="1" name="Condition">
                                    <label for="fztj01-4">
                                        任一单品数量大于</label>
                                    <%if (commodity4 != null)
                                      { %>
                                    <input type="text" name="txtCondition" class="w45" value="<%=commodity4.Value %>" />
                                    <%    } %>
                                    <%else
                                        { %>
                                    <input type="text" name="txtCondition" class="w45" />
                                    <%} %>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-5" type="checkbox" conditionid="5" conditiontagid="1" name="Condition">
                                    <label for="fztj01-5">
                                        付款时间大于</label>
                                    <%if (commodity5 != null)
                                      { %>
                                    <input type="text" name="txtCondition" class="w45 l24" value="<%=commodity5.Value %>" />
                                    <% } %>
                                    <%else
                                        {%>
                                    <input type="text" name="txtCondition" class="w45 l24" />
                                    <%    }  %>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-6" type="checkbox" conditionid="6" conditiontagid="1" value="checkbox">
                                    <label for="fztj01-6">
                                        自动判断库存是否不足</label>
                                </li>
                                <li class="w200 h23">包含以下任一商品（多个请用|分割）</li>
                                <li class="w200 h23">
                                    <%if (commodity7 != null)
                                      {%>
                                    <input type="text" class="v5-input w150" conditionid="7" conditiontagid="1" value="<%=commodity7.Value %>"
                                        id='txtCondition1' />
                                    <%  } %>
                                    <%else
                                        { %>
                                    <input type="text" class="v5-input w150" conditionid="7" conditiontagid="1" id='txtCondition1' />
                                    <%  } %>
                                </li>
                            </ul>
                        </dl>
                    </div>
                </div>
                <div class="mod-form float-l">
                    <div class="con style05 w270 r10 t10">
                        <h5>
                            收货地址问题</h5>
                        <dl class="bg06 h250">
                            <ul class="l10">
                                <li class="w200 h23">
                                    <input id="fztj01-22" conditionid="8" conditiontagid="2" name="Condition" type="checkbox">
                                    <label for="fztj01-22">
                                        无可达物流</label>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-23" conditionid="9" conditiontagid="2" name="Condition" type="checkbox">
                                    <label for="fztj01-23">
                                        非城区地址（地址包含镇、乡、村等）</label>
                                </li>
                                <li class="w2000 h23">属于以下任一地区（添加地区）</li>
                                <li class="w200 h23">
                                    <select class="v5-select w100" id="slProvince" onchange="Province()">
                                    </select>
                                    <select class="v5-select w100" id="slCity" onchange="City()">
                                    </select>
                                    <input type="hidden" id="hiddenProvince" />
                                    <input type="hidden" id="hiddenCity" />
                                </li>
                                <li class="w200 h23 t10">
                                    <%if (address != null)
                                      { %>
                                    <input type="text" class="v5-input w150" id="txtProvince" conditionid="10" conditiontagid="2"
                                        value="<%=address.Value %>" />
                                    <%   } %>
                                    <%else
                                        {%>
                                    <input type="text" class="v5-input w150" id="Text2" conditionid="10" conditiontagid="2" />
                                    <%  } %>
                                </li>
                            </ul>
                        </dl>
                    </div>
                </div>
                <div class="mod-form float-l">
                    <div class="con style05 w270 r10 t10">
                        <h5>
                            客户问题</h5>
                        <dl class="bg06 h250">
                            <ul class="l10">
                                <li class="w200 h23">
                                    <input id="fztj01-133" type="checkbox" conditionid="11" conditiontagid="3" name="Condition">
                                    <label for="fztj01-133">
                                        同一客户存在未收款订单</label>
                                </li>
                                <li class="w200 h23">
                                    <input id="fztj01-144" type="checkbox" conditionid="12" conditiontagid="3" name="Condition">
                                    <label for="fztj01-144">
                                        同一客户多订单不同地址</label>
                                </li>
                                <li class="w2000 h23">客户留言包含以下关键字</li>
                                <li class="w200 h23">
                                    <%if (Client != null)
                                      { %>
                                    <input type="text" class="v5-input w150" id='txtQuestion' conditionid="13" conditiontagid="3"
                                        value="<%=Client.Value %>" />
                                    <%   } %>
                                    <% else
                                        {%>
                                    <input type="text" class="v5-input w150" id='txtQuestion' conditionid="13" conditiontagid="3" />
                                    <%} %>
                                </li>
                            </ul>
                        </dl>
                    </div>
                </div>
                <ul class="l10 h200 float-l t20">
                    <li class="w200 h23">请确认以上信息准确无误</li>
                    <li class="w200 h23">
                        <input id="fztj01-155" type="checkbox" name='cheOrders'>
                        <label for="fztj01-155" name="cheOrders">
                            启用问题订单</label>
                    </li>
                    <li class="w200 h23">
                        <button class="submit01" type="button" value="ckOrder" id="bntInsert">
                            确定</button>
                    </li>
                </ul>
            </div>
            <!--问题订单内容分类  结束-->
        </div>
    </div>
    <!--Left End-->
    <script type="text/javascript">
        //克隆实体类
        function clone(myObj) {
            if (typeof (myObj) != 'object') return myObj;
            if (myObj == null) return myObj;
            var myNewObj = new Object();
            for (var i in myObj) myNewObj[i] = clone(myObj[i]);
            return myNewObj;
        }
        $("#bntInsert").die().live("click", function () {


            if ($("input[name='cheOrders']").attr("checked") == "checked") {

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
                newGroupValue.Value = $("#hiddenProvince").val() + $("#hiddenCity").val() + $("#txtProvince").val();
                newGroupView.GroupValues.push(newGroupValue);

            }
            if ($("#txtQuestion").val() != "") {

                var newGroupValue = clone(groupView.GroupValues[0]);
                newGroupValue.ConditionID = $("#txtQuestion").attr("ConditionID");
                newGroupValue.ConditionTagID = $("#txtQuestion").attr("ConditionTagID");
                newGroupValue.Value = $("#txtQuestion").val();
                newGroupView.GroupValues.push(newGroupValue);

            }


            $.ajax({
                type: "post",
                url: "../../OrderSet/GetGroupValue",
                data: { "groupViews": JSON.stringify(newGroupView) },
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加成功！").change();
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
