<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script src="../../Scripts/bootstrap/BootstrapAllselect.js"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var DistributorsQuery = new Object();
        DistributorsQuery.Groups = new Array(2);
        DistributorsQuery.Groups[0] = "q1";
        var CurrentPageSize = 15;
    </script>
    <!-- reset begin -->
    <div id="reset" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">重置密码</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="inputPassword">新密码</label>
                    <div class="controls">
                        <input type="password" id="inputPassword" placeholder="请输入密码">
                        <span class="help-block">密码为数字和大小写字母组合，长度为6－15位。</span>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" onclick="savePassWord()" aria-hidden="true">保存</button>
        </div>
    </div>
    <!-- reset end -->

    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="myModal">
        <div class="modal-header">
            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
            <h3 id="myModalLabel">分销商信息</h3>
        </div>
        <div class="modal-body">
            <div class="mongerinfo">
                <h5>基本信息</h5>
                <dl class="baseinfo">
                    <dd class="peopleinfo">
                        <div class="pic-header">
                            <img id="img" src="">
                        </div>
                        <div class="infor">
                            昵称：<span id="NickName"></span><br />
                            姓名：<span id="TrueName"></span><br />
                            角色：<span id="RoleID"></span><br />
                            账号：<span id="LoginName"></span><br />
                            QQ号：<span id="Question"></span>
                        </div>
                    </dd>
                    <dd class="shopinfo">微店<img id="QRUrl" src=""></dd>
                </dl>
                <h5>提现账户</h5>
                <dl class="payinfo" id="payinfo">
                </dl>
                <h5>收货地址</h5>
                <div class="address" id="address">
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button aria-hidden="true" data-dismiss="modal" class="btn">关闭</button>
        </div>
    </div>
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" onclick="IsFrozenOrNormal(event,0,'more')" class="btn btn-small fun-a"><i class="icon-close-gray"></i>批量冻结</a>
            <a href="javascript:void(0)" onclick="IsFrozenOrNormal(event,1,'more')" class="btn btn-small fun-a"><i class="icon-open-gray"></i>批量解冻</a>
            <a href="javascript:void(0)" onclick="showSetPw()" class="btn btn-small fun-a reset"><i class="icon-clock-gray"></i>重置密码</a>
        </div>
        <div class="span3 funbar-r">
            <form class="form-search">
                <div class="bs-docs-example">
                    <input type="text" id="Name" data-provide="typeahead" placeholder="请输入分销店铺/帐号" class="input-large search-query" />
                    <input type="text" style="display: none" />
                    <button class="btn-search" id="btnSelect" type="button"></button>
                </div>
            </form>
        </div>
    </div>
    <div class="main">
        <!--table begin-->
        <div id="mod-table">
            <% 
                Html.RenderAction("GetDistributorsList", new { pageIndex = 1, pageSize = 15, searchName = "" });
            %>
        </div>
        <!--table end-->
        <!--page begin-->
        <div class="page">
            <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
            <div class="page-select">
                每页显示
       
                <div class="btn-group dropup">
                    <button id="btnPageSize" class="btn">15</button>
                    <input type="hidden" id="hidPageSize" value="15" />
                    <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                    <ul class="dropdown-menu selectpage" id="numbers">
                        <li><a href="javascript:void(0)">15</a></li>
                        <li><a href="javascript:void(0)">20</a></li>
                        <li><a href="javascript:void(0)">30</a></li>
                        <li><a href="javascript:void(0)">40</a></li>
                        <li><a href="javascript:void(0)">50</a></li>
                    </ul>
                </div>
                条
     
            </div>

            <div class="pagination pagination-right" id="turn-ul">
                <%--   <ul id="turn-ul">
                    <li class="disabled"><a href="#">|&lt;</a></li>
                    <li class="disabled"><a href="#">&lt;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="#">12</a></li>
                    <li><a href="#">&gt;</a></li>
                    <li><a href="#">&gt;|</a></li>
                </ul>--%>
            </div>
        </div>
        <!--page end-->
    </div>

    <script type="text/javascript">
        //重置密码
        var tempdistributorsList = new Array();
        function showSetPw() {
            $("input[name='sub']:checked").each(function () {
                tempdistributorsList.push($(this).val());
            });
            if (tempdistributorsList.length == 0) {
                Show("请先勾选再进行批量操作", "prompt");
            } else {
                $(".error").removeClass("error");
                $('#reset').modal('show');
            }
        }
        function savePassWord() {
            $(".error").removeClass("error");
            var password = $("#inputPassword").val();
            var reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,16}$/;
            if (!reg.test(password)) {
                $("#inputPassword").parent().parent().addClass("error");
            } else {
                $.ajax({
                    type: "post",
                    url: "../../CustomerManage/SetCustomerPassWord",
                    data: { "ids": JSON.stringify(tempdistributorsList), "inputPassword": password },
                    success: function (jsonRes) {
                        $('#reset').modal('hide');
                        Show("操作成功", "success");
                    }
                })

            }

        }



        function FillName() {
            $.ajax({
                type: "post",
                url: "../../CustomerManage/GetAllCustomerAndShopName",

                success: function (jsonRes) {
                    $("#Name").attr("data-source", jsonRes);
                }
            })
        }

        $(function () {

            GetDistributorsView(1, CurrentPageSize);

            FillName();

            $("#btnSelect").click(function () {
                DistributorsQuery.Query = $("#Name").val();

                GetDistributorsView(1, CurrentPageSize);
            });


            // enter 键搜索
            document.onkeypress = function () {

                var iKeyCode = -1;
                if (arguments[0]) {
                    iKeyCode = arguments[0].which;
                }
                else {
                    iKeyCode = event.keyCode;
                }
                if (iKeyCode == 13) {
                    // 搜索
                    $("#btnSelect").click();
                }
            }

            $("#numbers li").click(function () {
                $("#btnPageSize").text($(this).text());

                CurrentPageSize = parseInt($("#btnPageSize").text());

                GetDistributorsView(1, CurrentPageSize);
            });

        });

        //查看详细
        function View(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var Id = $(eventSrc).parent().attr("dir");
            $.ajax({
                type: "post",
                url: "../../CustomerManage/GetCustomerDistributionView",
                data: { "ID": Id },
                success: function (res) {

                    if (jsonRes != "{}") {
                        var jsonRes = JSON.parse(res);

                        $("#img").attr("src", jsonRes.customerDistributionReport.LoginUrl);
                        $("#QRUrl").attr("src", jsonRes.customerDistributionReport.QRCodeUrl);
                        $("#NickName").text(jsonRes.customerDistributionReport.NickName);
                        $("#TrueName").text(jsonRes.customerDistributionReport.TrueName);
                        $("#LoginName").text(jsonRes.customerDistributionReport.LoginName);
                        $("#Question").text(jsonRes.customerDistributionReport.Question)
                        if (jsonRes.customerDistributionReport.RoleID == 2) {
                            $("#RoleID").text("分销商");
                        }
                        else {
                            $("#RoleID").text("客户");
                        }
                        if (jsonRes.customerCashAccount !== null) {
                            var str = "";
                            for (var i = 0; i < jsonRes.customerCashAccount.length; i++) {
                                if (jsonRes.customerCashAccount[i].IsDefault == 1) {
                                    str += '<dd class="dd-pay current">';
                                    str += '<div class="pic-logo">';
                                    str += '<img src="' + Getalipay(jsonRes.customerCashAccount[i].Type) + '">';
                                    str += '</div>';
                                    str += '<div class="infor">' + jsonRes.customerCashAccount[i].CashRealName + '<br>' + jsonRes.customerCashAccount[i].CashAccount + '</div>';
                                    str += '<div class="status">（默认）</div>';
                                    str += '</dd>';
                                }
                                else {
                                    str += '<dd class="dd-pay">';
                                    str += '<div class="pic-logo">';
                                    str += '<img src="' + Getalipay(jsonRes.customerCashAccount[i].Type) + '">';
                                    str += '</div>';
                                    str += '<div class="infor">' + jsonRes.customerCashAccount[i].CashRealName + '<br>' + jsonRes.customerCashAccount[i].CashAccount + '</div>';
                                    str += '<div class="status">（默认）</div>';
                                    str += '</dd>';
                                }
                            }
                            $("#payinfo").html(str);
                        }
                        if (jsonRes.address != null) {

                            var address = "";

                            address = "";
                            address = '<span class="name">' + jsonRes.address.Name + '</span>' + jsonRes.address.Moblie + '<br>';
                            address = '' + jsonRes.address.AddressInfo + '';
                            $("#address").text(address);
                        }
                        else {
                            $("#address").text("");
                        }

                        var dialogStr = $("#myModal").prop("outerHTML");
                        $("#myModal").html("");
                        $("#DialogLayer").html(dialogStr);

                        $('#myModal').modal('show');
                    }

                }
            });
        }
        function Getalipay(type) {
            switch (type) {
                case 0:
                    return "http://html.v5portal.com/mcm/content/imagesv2/alipay.png";
                    break;
                case 1:
                    return "http://html.v5portal.com/mcm/content/imagesv2/caifutong.png";
                    break;
                case 2:
                    return "http://html.v5portal.com/mcm/content/imagesv2/kuaiqian.png";
                    break;
            }
        }

        function IsFrozenOrNormal(event, isFrozenOrNormal, isMoreOrSingle) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            // 获取选中的数据
            var distributorsList = new Array();
            if (isMoreOrSingle == "more") {
                $("input[name='sub']:checked").each(function () {
                    distributorsList.push($(this).val());
                });
                if (distributorsList.length == 0) {
                    Show("请先勾选再进行批量操作", "prompt");
                    return;
                }
            }
            else if (isMoreOrSingle == "single") {
                var ID = $(eventSrc).attr("dir");
                distributorsList.push(ID);
            }
            $.ajax({
                type: "post",
                url: "../../CustomerManage/isFrozenOrNormal",
                data: { "srt": JSON.stringify(distributorsList), "isFrozenOrNormal": isFrozenOrNormal },

                success: function (jsonRes) {
                    if (jsonRes == "OK") {
                        $("#DivUpdatalogistics").hide();
                        Show("操作成功", "success");
                        GetDistributorsView(1, CurrentPageSize);
                    }
                    else if (jsonRes == "repeat") {
                        $("#DivUpdatalogistics").hide();
                        Show("不能重复操作", "prompt");

                        GetDistributorsView(1, CurrentPageSize);
                    }
                    else {
                        Show(jsonRes, "error");
                        GetDistributorsView(1, CurrentPageSize);

                    }
                }
            });
        }
    </script>

</asp:Content>

