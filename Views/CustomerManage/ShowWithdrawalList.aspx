<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/bootstrap/BootstrapAllselect.js"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var WithdrawalQuery = new Object();
        WithdrawalQuery.Groups = new Array(4);
        WithdrawalQuery.Groups[0] = "q1";
        

        var pageSize = 15;
        $(function () {
            //获取弹层信息
            var dialogStr = $("#setExtract").prop('outerHTML');
            $("#setExtract").html("");
            $("#DialogLayer").html(dialogStr);

            $('.setExtract').click('show.bs.modal', function () {
                $('#setExtract').modal('show');
                return false;
            })
        });
        function btnSave(obj) {
            $(".error").removeClass("error");
            var MinaAmountCash = $("#MinaAmountCash").val();
            var IntTimes = null;
            var Day = null;
            if (isPriceNumber(MinaAmountCash)) {
                if ($("#IntTimesCheckBox").attr("checked") == "checked") {
                    IntTimes = $("#IntTimes").val();
                    var r = /^\+?[1-9][0-9]*$/;　　//正整数 
                    if (r.test(IntTimes)) {
                        if ($("input[name='trade']:checked").val() == 1) {
                            Day = $("#Day").val();
                            if (!r.test(Day)) {
                                $("#Day").parent().addClass("error");
                                return false;
                            }
                        }
                    } else {
                        $("#IntTimes").parent().addClass("error");
                        return false;
                    }

                }
            } else {

                $("#MinaAmountCash").parent().addClass("error");
                return false;
            }
            $.ajax({
                url: "EditSetCommission",
                data: { "MinaAmountCash": MinaAmountCash, "IntTimes": IntTimes, "Day": Day },
                type: "post",
                async: false,
                cache: false,
                success: function (res) {
                    //alert(res);
                }
            })
            // return false;
            $('#setExtract').modal('hide');
        }
        function isPriceNumber(_keyword) {
            if (_keyword == "0" || _keyword == "0." || _keyword == "0.0" || _keyword == "0.00") {
                _keyword = "0"; return true;
            } else {
                var index = _keyword.indexOf("0");
                var length = _keyword.length;
                if (index == 0 && length > 1) {/*0开头的数字串*/
                    var reg = /^[0]{1}[.]{1}[0-9]{1,2}$/;
                    if (!reg.test(_keyword)) {
                        return false;
                    } else {
                        return true;
                    }
                } else {/*非0开头的数字*/
                    var reg = /^[1-9]{1}[0-9]{0,10}[.]{0,1}[0-9]{0,2}$/;
                    if (!reg.test(_keyword)) {
                        return false;
                    } else {
                        return true;
                    }
                }
                return false;
            }
        }


    </script>
    <% V5.MetaData.Customer.Model.SetCommission setCommission = ViewData["SetCommission"] as V5.MetaData.Customer.Model.SetCommission; %>

    <div id="setExtract" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">佣金提现设置</h3>
        </div>
        <div class="modal-body">
            <form class="form-inline">
                <fieldset>
                    <legend>提现条件</legend>
                    <span class="control-group">
                        <label class="control-label">最低提现金额为</label>
                        <input type="number" placeholder="200" value="<%=setCommission.MinaAmountCash %>" id="MinaAmountCash" class="input-small mlr5">
                        <label class="control-label">元</label>
                        <span class="help-inline"></span>
                    </span>
                    <span class="control-group">
                        <%if (setCommission.IntTimes == null)
                          { %>
                        <label class="checkbox ml15">
                            <input type="checkbox" id="IntTimesCheckBox">金额
                        </label>
                        <input type="number" placeholder="100" class="input-small mlr5" id="IntTimes">
                        <label class="control-label">的整倍数</label>
                        <%}
                          else
                          { %>
                        <label class="checkbox ml15">
                            <input type="checkbox" checked="checked" id="IntTimesCheckBox">金额
                        </label>
                        <input type="number" placeholder="100" value="<%=setCommission.IntTimes %>" id="IntTimes" class="input-small mlr5">
                        <label class="control-label">的整倍数</label>
                        <%} %>
                        <span class="help-inline"></span>
                    </span>
                </fieldset>
                <fieldset class="mt20">
                    <legend>佣金发放</legend>
                    <%if (setCommission.Day == null)
                      {%>

                    <label>交易成功后</label>
                    <label class="radio mlr5">
                        <input type="radio" name="trade" value="0" class="mlr5" checked="checked">立即发放</label>
                    <label class="radio ml15">
                        <input type="radio" name="trade" value="1">
                    </label>
                    <span class="control-group">
                        <input type="number" placeholder="15" class="input-small mlr5" id="Day">
                        <label class="control-label">天后发放</label>
                    </span>
                    <%}
                      else
                      { %>
                    <label class="radio mlr5">
                        <input type="radio" name="trade" value="0" class="mlr5">立即发放</label>
                    <label class="radio ml15">
                        <input type="radio" name="trade" value="1" checked="checked">
                    </label>
                    <span class="control-group">
                        <input type="number" placeholder="15" class="input-small mlr5" value="<%=setCommission.Day %>" id="Day">
                        <label class="control-label">天后发放</label>
                    </span>
                    <%} %>
                </fieldset>
            </form>

        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" onclick="btnSave(this)" aria-hidden="true">保存</button>
        </div>
    </div>


    <div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade in" id="myModal">
        <div class="modal-header">
            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
            <h3 id="myModalLabel">修改备注</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal">
                <!--01 begin-->

                <!--01 end-->
                <!--02 begin-->
                <div class="control-group">
                    <!--error-->
                    <label for="inputPassword" class="control-label">备注</label>
                    <div class="controls">

                        <textarea class="form-control" id="Comment" rows="3"></textarea>
                        <span style="display: none;" class="help-block">请填写备注。</span>
                    </div>
                </div>
                <!--02 end-->
            </form>
        </div>
        <div class="modal-footer">
            <button aria-hidden="true" data-dismiss="modal" class="btn">关闭</button>
            <button aria-hidden="true" data-dismiss="modal" id="Save" class="btn btn-info">保存</button>
        </div>
    </div>


    <div class="row funbar">
        <div class="span6 funbar-l">
            <!--<a class="btn btn-small fun-a" href="#myModal" data-toggle="modal"><i class="icon-add-gray"></i>添加</a>-->
            <a data-toggle="modal" href="javascript:void(0)" onclick="Update(event,'more','yes')" class="btn btn-small fun-a"><i class="icon-turn-gray"></i>批量转账</a>
            <a href="javascript:void(0)" onclick="Update(event,'more','no')" class="btn btn-small fun-a"><i class="icon-no-gray"></i>批量拒绝</a>
            <a href="javascript:void(0)" onclick="UpdateComment(event,'more','')" class="btn btn-small fun-a"><i class="icon-remark-gray"></i>批量备注</a>

        </div>
        <div class="span3 funbar-r">
            <form class="form-search">
                <div class="bs-docs-example">
                    <input type="text" id="Name" data-provide="typeahead" placeholder="请输入提现帐号" class="input-large search-query" />
                    <input type="text" style="display: none" />
                    <button class="btn-search" id="btnSelect" type="button"></button>
                </div>
            </form>
        </div>
    </div>

    <div class="main">
        <div class="out-table">
            <!--select begin-->
            <div class="bs-docs-example out-table-bar">
                <ul class="nav nav-pills">
                    <li id="withdrawWayDropdown" class="dropdown">
                        <a href="javascript:void(0)" id="withdrawWay" data-target="#" data-toggle="dropdown" class="dropdown-toggle">提现方式<b class="caret"></b></a>
                        <ul class="dropdown-menu" id="withdrawWayUl">
                            <li dir="All"><a href="javascript:void(0)">全部</a></li>
                            <li dir="Alipay"><a href="javascript:void(0)">支付宝</a></li>
                            <li dir="Tenpay"><a href="javascript:void(0)">财付通</a></li>
                            <li dir="Bill99"><a href="javascript:void(0)">快钱</a></li>
                        </ul>
                    </li>
                    <li id="withdrawStateDropdown" class="dropdown">
                        <a href="javascript:void(0)" id="withdrawState" data-toggle="dropdown" class="dropdown-toggle">提现状态<b class="caret"></b></a>


                        <ul class="dropdown-menu" id="withdrawStateUl">
                            <li dir="All"><a href="javascript:void(0)">全部</a></li>
                            <li dir="Normal"><a href="javascript:void(0)">处理中</a></li>
                            <li dir="Agree"><a href="javascript:void(0)">提现成功</a></li>
                            <li dir="DisAgree"><a href="javascript:void(0)">提现失败</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="nav-right"><a class="setExtract" href="javascript：void(0)"><i class="icon-set-back"></i>设置</a></div>
            </div>
            <!--select end-->
            <div class="table-m10" id="mod-table">
                <!--table begin-->
                <% 
                    Html.RenderAction("GetWithdrawalList", new { CurrentPageIndex = 0, PageSize = 15, searchName = "" });
                %>
                <!--table end-->
            </div>
        </div>
        <!--page begin-->
        <div class="page">
            <div class="page-left">当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
            <div class="page-select">
                每页显示
       
                <div class="btn-group dropup">
                    <button class="btn" id="btnPageSize">15</button>
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
                <%--     <ul>
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

        function FillName() {
            $.ajax({
                type: "post",
                url: "../../CustomerManage/GetCustomerCashAccount",

                success: function (jsonRes) {
                    $("#Name").attr("data-source", jsonRes);
                }
            })
        }

        $(function () {

            GetWithdrawalList(1, pageSize);

            FillName();

            $("#btnSelect").click(function () {
                WithdrawalQuery.Query = $("#Name").val();
                GetWithdrawalList(1, pageSize);
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

            //查询提现方式
            $("#withdrawWayUl li").click(function () {

                var intext = "提现方式";
                WithdrawalQuery.Groups[1] = "";

                if ($(this).attr("dir") != "All" && $(this).attr("dir") != undefined) {
                    intext = $(this).text();
                    WithdrawalQuery.Groups[1] = $(this).attr("dir");
                    $("#withdrawWayDropdown").addClass("active");
                }
                else {
                    $("#withdrawWayDropdown").removeClass("active");
                }

                var str = "<b class=\'caret\'></b>";
                $("#withdrawWay").html(intext + str);

                GetWithdrawalList(1, pageSize);
            });

            //查询提现状态
            $("#withdrawStateUl li").click(function () {

                var intext = "提现状态";
                WithdrawalQuery.Groups[2] = "";

                if ($(this).attr("dir") != "All" && $(this).attr("dir") != undefined) {
                    intext = $(this).text();
                    WithdrawalQuery.Groups[2] = $(this).attr("dir");
                    $("#withdrawStateDropdown").addClass("active");
                }
                else {
                    $("#withdrawStateDropdown").removeClass("active");
                }

                var str = "<b class=\'caret\'></b>";
                $("#withdrawState").html(intext + str);
                GetWithdrawalList(1, pageSize);
            });
            $("#numbers li").click(function () {
                $("#btnPageSize").text($(this).text());
                pageSize = $("#btnPageSize").text();
                GetWithdrawalList(1, pageSize);
            });

            

        });

        var WithdrawalList = null;
        function Update(event, singleOrMore, isNoOrYes) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            // 获取选中的数据
            WithdrawalList = new Array();
            if (singleOrMore === "single") {
                var id = $(eventSrc).parent().attr("dir");
                WithdrawalList.push(id);
            }
            else if (singleOrMore === "more") {
                $("input[name='sub']:checked").each(function () {
                    WithdrawalList.push($(this).val());
                });
                if (WithdrawalList.length == 0) {
                    Show("请先勾选再进行批量操作", "prompt");
                    return;
                };
            }


            $.ajax({
                type: "post",
                url: "../../CustomerManage/ModifyCashFlowsStatus",
                data: { "Srt": JSON.stringify(WithdrawalList), "isNoOrYes": isNoOrYes },
                success: function (jsonRes) {
                    if (jsonRes == "OK") {
                        $("#DivUpdatalogistics").hide();

                        Show("操作成功", "success");
                        GetWithdrawalList(1, pageSize);
                    }
                    else if (jsonRes == "repeat") {
                        Show("不能重复操作", "prompt");
                        GetWithdrawalList(1, pageSize);
                    }
                    else {
                        Show(JSON.stringify(jsonRes), "error");
                        GetWithdrawalList(1, pageSize);
                    }
                }
            });
        }
        var CommentList = null;
        //修改备注
        function UpdateComment(event, isMoreOrSingle, date) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            CommentList = new Array();

            if (isMoreOrSingle === "single") {
                var id = $(eventSrc).parent().attr("dir");
                $("#Comment").text(date);
                CommentList.push(id);
            }
            else if (isMoreOrSingle === "more") {
                $("input[name='sub']:checked").each(function () {
                    CommentList.push($(this).val());
                });
                $("#Comment").text("");
                if (CommentList.length == 0) {
                    Show("请先勾选再进行批量操作", "prompt");
                    return;
                };
            }
            $("#myModal").modal("show");



        }


        $(function () {
            $("#Save").click(function () {
                var Comment = $("#Comment").val();
                $.ajax({
                    type: "post",
                    url: "../../CustomerManage/ModifyComment",
                    data: { "Srt": JSON.stringify(CommentList), "Comment": Comment },
                    success: function (jsonRes) {
                        if (jsonRes == "OK") {
                            GetWithdrawalList(1, pageSize);
                            Show("操作成功", "success");
                            $("#myModal").modal("hide");
                        }
                        else {
                            Show(JSON.stringify(jsonRes), "error");
                            $("#myModal").modal("hide");
                            GetWithdrawalList(1, pageSize);

                        }
                    }
                });
            });
        });

    </script>

</asp:Content>

