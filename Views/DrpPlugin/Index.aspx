<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/dialog/artDialog.js" type="text/javascript"></script>
    <script src="../../../Scripts/dialog/jquery.artDialog.js" type="text/javascript"></script>
    <link href="../../../Scripts/dialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="../../../Scripts/Plugin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <%List<V5.MetaData.DRP.Model.Category> InitView = ViewData["InitView"] as List<V5.MetaData.DRP.Model.Category>; %>
        <!--加载 start-->
        <%--添加成功后把结果放到<span>标签中--%>
        <%--  <div class="Loading" id="ResultTip">
        </div>--%>
        <div class="MCM-N-L">
            <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
            <div class="MCM-C-M">
                <!--搜索 begin-->
                <div class="search-bar02">
                    <ul class="ul-search">
                        <%--<li><input type="text" style="color:#999;" x-webkit-grammar="builtin:translate" x-webkit-speech="" value="请输入会员帐号..." class="v5-input in250 search" name=""> </li>
                  <li><a class="search-btn" href="#">查询</a></li> --%>
                    </ul>
                </div>
                <!--选项卡 begin-->
                <div class="label-mod">
                    <div class="con style01" id="type">
                        <ul>
                            <li class="current" dir="All"><a href="#">全部</a></li>
                            <li dir="1"><a href="#">待联络</a></li>
                            <li dir="2"><a href="#">已联络</a></li>
                            <li dir="3"><a href="#">有意向</a></li>
                            <li dir="4"><a href="#">已加盟</a></li>
                        </ul>
                    </div>
                </div>
                <div class="h10">
                </div>
                <!--Page Start-->
                <div class="mod-page">
                    <div class="style01">
                        <div class="mod-footer-page">
                           <div class="r10">
                            当前<span id="pages"></span>~<span id="number"></span>条，总计<span id="sum"></span>条</div>
                            <div class="footer-p-div2 tac">
                                <%--<div class="footer-p-div2 tac">
                    </div>--%>
                            </div>
                            <%-- <div class="float-r tar">
                        共有(<span id="span"></span>)条记录</div>--%>
                        </div>
                    </div>
                </div>
                <!--Page End-->
                <select id="slProvince" class="w230">
                    <option value="-1">-请选择-</option>
                    <% foreach (var category in InitView)
                       { %>
                    <option value="<%=category.ID %>">
                        <%=category.Name%></option>
                    <%} %>
                </select>
                <div class="h10">
                </div>
                <div style="clear: both;">
                    <!--放表格的容器-->
                    <div id="flexigridDiv">
                        <% 
                            
                            Html.RenderAction("GetTaobaoShop", new { CurrentPageIndex = 0, Where = "" });//首次加载，实际上不需要出现数据，数据有ajax请求呈现，这里将currentIndex置为0
                        %>
                    </div>
                    <!--放表格的容器-->
                </div>
            </div>
        </div>
        <div class="mod-form" id="div1" style="width: 300px; display: none">
            <div class="con style01">
                <!--1 start-->
                <dl>
                    <dt class="w50">QQ：</dt>
                    <dd>
                        <input name="qq" class="v5-input in200" onblur="blursearchkey(this,'qqError')" />
                        <br />
                        <div name="error" id='qqError' style="margin-left: 50px; color: Red">
                        </div>
                    </dd>
                    <dt class="w50">电话：</dt>
                    <dd>
                        <input name="tel" class="v5-input in200" onblur="blursearchkey(this,'telError')" />
                        <div name="error" id='telError' style="margin-left: 50px; color: Red">
                        </div>
                    </dd>
                    <dt class="w50">Email：</dt>
                    <dd>
                        <input name="email" class="v5-input in200" onblur="blursearchkey(this,'emailError')" />
                        <div name="error" id='emailError' style="margin-left: 50px; color: Red">
                        </div>
                    </dd>
                    <dt class="w50">Weibo：</dt>
                    <dd>
                        <input name="weibo" class="v5-input in200" />
                    </dd>
                </dl>
            </div>
        </div>
        <div class="mod-form" style="width: 300px; display: none" id="div2">
            <div>
                <dl>
                    <dd>
                        <label class="r25">
                            <input type="radio" value="1" name="status" />待联络</label>
                        <label class="r25">
                            <input type="radio" value="2" name="status" />已联络</label>
                        <label class="r25">
                            <input type="radio" value="3" name="status" />有意向</label>
                        <label>
                            <input type="radio" value="4" name="status" />已加盟</label>
                    </dd>
                    <dd style="margin-top: 10px">
                        <textarea rows="5" cols="54" id="remark" style="width: 297px; height: 103px;"></textarea>
                    </dd>
                </dl>
            </div>
        </div>
    </body>
    <script type="text/javascript" language="javascript">
        // 全局变量 切换渠道时候用
        var openedCode = $("#openedCode").val();
        $(function () {
            // 默认把操作结果隐藏
            //            $("#ResultTip").css("display", "none");
            SelectByGroupClick(1);
            $("#slProvince").change(function () {
                SelectByGroupClick(1);
            })
            $("#type ul li").bind("click", function () {
                if ($(this).attr("class") == undefined || $(this).attr("class").indexOf("current") == -1) {
                    $("#type ul li").removeClass("current");
                    $(this).addClass("current");
                    SelectByGroupClick(1);
                } else {
                }
            })
            //            // 注册全选
            //            checkAll();

            //            // 加载部分视图
            //            GetGradeView();

            //            // 注册 全部、直销、分销
            //            SelectGroup();

        });

        function blursearchkey(obj, error) {
            if ($(obj).val() != "" && $(obj).val() != undefined) {
                if (error == 'qqError') {
                    var reg = /^\d{5,10}$/;
                    if (!reg.test($(obj).val())) {
                        $("#" + error).html("请输入正确的QQ号");
                    } else {
                        $("#" + error).html("");
                    }
                } else if (error == "telError") {
                    var reg = /^(\d{3,4}(-)(\d){7,8})|(\d){11}|(\d){7,8}$/;
                    if (!reg.test($(obj).val())) {
                        $("#" + error).html("请输入正确的电话号码");
                    } else {
                        $("#" + error).html("");
                    }
                } else if (error == "emailError") {
                    var reg = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/;
                    if (!reg.test($(obj).val())) {
                        $("#" + error).html("请输入正确的邮件");
                    } else {
                        $("#" + error).html("");
                    }
                }
            }
        }
    </script>
</asp:Content>
