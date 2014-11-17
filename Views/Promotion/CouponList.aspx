<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Coupom/couponJs.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 查询条件 begin -->
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var couponQuery = new Object();
        couponQuery.Groups = new Array(3);
        couponQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        couponQuery.Groups[1] = 'q1'; 
    </script>
    <div style="display: none" id="addCoupon">
        <%using (Ajax.BeginForm("AddCoupon", "Promotion", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
          { 
        %>
        <div class="content scroll">
            <!--content begin-->
            <div class="mod-form">
                <div style="width: 840px; height: 400px;">
                    <div class="con style0alert b20">
                        <input type="hidden" id="CustomerID" name="CustomerID" />
                        <input type="hidden" id="HidUpdateTargetId" name="HidUpdateTargetId" />
                        <ul class="list-ul">
                            <li class="list-li">
                                <input type="radio" name="user" onclick="ChanageType(event)" id="grade" checked="checked"
                                    value="grade" /><label for="grade">按等级</label>
                                <input type="radio" name="user" onclick="ChanageType(event)" id="member" value="member" /><label
                                    for="member">按会员</label>
                            </li>
                            <li class="list-li">
                                <div id="divgrade">
                                    <div class="float-l w130">
                                        <span class="star">*</span><label>优惠券发放对象</label></div>
                                    <div class="float-l">
                                        <select name="shopType" onchange="shopTypeChange(event)" id="shopTypeChangeID" class="width:100px">
                                            <option>所有</option>
                                            <option value="A">零售</option>
                                            <option value="B">分销</option>
                                        </select>
                                        <select onchange="typeCodeChanging(event)" style="display: none" name="shopTypeCode"
                                            id="typeCodeChange" class="width:100px">
                                            <option id="changeTypeCode">全网店铺</option>
                                        </select>
                                        <select style="display: none" name="gradeTypeID" id="gradeTypeID" class="width:100px">
                                            <option id="changeGradeID" value="0" tip="要动态组装的数据">所有会员等级</option>
                                        </select>
                                    </div>
                                    <div class="float-l">
                                        <span class="prompt"></span>
                                    </div>
                                </div>
                            </li>
                            <li class="list-li">
                                <div id="divMember" style="display: none">
                                    <%--<div class="float-l w130"><span class="star"></span></div>--%>
                                    <div class="float-l">
                                        <label>
                                            <input type="text" value="请输入会员名称..." onblur="Nameblur(event)" onfocus="Namefocus(event)"
                                                id="userName" class="w230">
                                            <button class="submit01" type="button" onclick="btnSearch()">
                                                查询</button></label></div>
                                    <div class="clear h10">
                                    </div>
                                    <div class="float-l">
                                        <label>
                                            <div class="mod-table">
                                                <div class="mod-table-head">
                                                    <div class="con style0list">
                                                        <table>
                                                            <colgroup>
                                                                <col style="width: 5%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th>
                                                                        <label>
                                                                            <input type="checkbox" onclick="LayerCheckAll(event)" id="layerckall"></label>
                                                                    </th>
                                                                    <th>
                                                                        会员帐号
                                                                    </th>
                                                                    <th>
                                                                        帐号状态
                                                                    </th>
                                                                    <th>
                                                                        会员来源
                                                                    </th>
                                                                    <th>
                                                                        会员等级
                                                                    </th>
                                                                    <th>
                                                                        交易总金额
                                                                    </th>
                                                                    <th>
                                                                        交易次数
                                                                    </th>
                                                                    <th>
                                                                        客单价
                                                                    </th>
                                                                    <th>
                                                                        最近交易时间
                                                                    </th>
                                                                    <th>
                                                                    </th>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="mod-table-main">
                                                    <div class="con style0line">
                                                        <table id="tabLayer">
                                                            <colgroup>
                                                                <col style="width: 5%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 15%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        有效期至</label></div>
                                <div class="float-l">
                                    从
                                    <input class="w120" name="DateStart" id="DateStart" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59'})">
                                    到
                                    <input class="w120" name="DateFinish" id="DateFinish" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59'})">
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span>
                                    <label>
                                        选择优惠券金额</label></div>
                                <div class="float-l">
                                    <select class="width:100px" name="Amount">
                                        <option value="5">5元</option>
                                        <option value="10">10元</option>
                                        <option value="20">20元</option>
                                        <option value="30">30元</option>
                                        <option value="50">50元</option>
                                    </select>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--content end-->
        </div>
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="javascript:btnSub();" class="submit01-alert r10">
                    保存</button>
                <button type="submit" id="realSub" style="display: none;">
                    保存</button>
                <button class="reset01-alert" id="btnclose" onclick="popupClose('add_Coupon')">
                    关闭</button>
            </div>
        </div>
        <% } %>
    </div>
    <!--选项卡 begin-->
    <div class="mod-tab t20" style="display:none">
        <div class="con style0big" id="type">
            <ul>
                <li class="current" dir="q1"><a href="javascript:void(0)"><span>全部（<span id="QuanBu"></span>）</span>
                </a></li>
                <li dir="q2"><a href="javascript:void(0)"><span>零售（<span id="ZhiXiao"></span>）</span>
                </a></li>
                <li dir="q3"><a href="javascript:void(0)"><span>分销（<span id="FenXiao"></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" id="TexUser" class="search-input" value="请输入优惠券面值..." style="color: #999;" />
                </li>
                <li><a href="javascript:void(0)" class="search-btn" id="btnSelect"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <div class="mod-condition t20">
        <div class="con style0list" id="types">
            <ul>
                <li dir="d1"><a href="javascript:void(0)">进行中（<span id="jxz"><%=ViewData["tempJXZ"]%></span>）</a></li>
                <li dir="d2"><a href="javascript:void(0)">过期（<span id="gq"><%=ViewData["temoGQ"]%></span>）</a></li>
                <li dir="d3"><a href="javascript:void(0)">作废（<span id="zf"><%=ViewData["temoZF"] %></span>）</a></li>
            </ul>
        </div>
    </div>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list" id="favourable">
                <li><a class="a-btn" href="javascript:void(0)" onclick="AddCoupon()" id="Add">添加</a></li><%----%>
                <li><a class="a-btn" href="javascript:void(0)" id="cancel">作废</a></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <!--分页 begin-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%--   <li class="next"></li>
                <li class="prev"></li>--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>
    <!--分页 end-->
    <div class="clear h10">
    </div>
    <script type="text/javascript">
        var url = window.location.href;
        var parameter = url.substring(url.indexOf('?') + 1);
        parameter = parameter.split('&');
        var appCode = parameter[0].replace("appCode=", "");
        var reg = /MenuCode=/g;
        var MenuCode = "";
        for (var i = 0; i < parameter.length; i++) {
            reg.lastIndex = 0;
            if (reg.test(parameter[i])) {
                MenuCode = parameter[i].replace("MenuCode=", "");
                break;
            }
        }

        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {

            $("#type").css("display", "none");
//            $("#favourable").css("display", "none");
            //                       $(".mod-operate").css("display", "none");


            //                        var tt = document.getElementById("dvType");
            //                        tt.style.display = "none";
        }





    </script>
    <!--操作栏 end-->
    <!--列表 Start-->
    <div class="mod-table" id="mod-table">
        <% 
            Html.RenderAction("GetShowCouponView", new { CurrentPageIndex = 0 });
        %>
    </div>
    <!--列表 End-->
</asp:Content>
