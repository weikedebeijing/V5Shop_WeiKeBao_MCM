<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script src="../../Scripts/bootstrap/BootstrapAllselect.js"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var CommissionRatioQuery = new Object();
        CommissionRatioQuery.Groups = new Array(2);
        CommissionRatioQuery.Groups[0] = "q1";

        var PageSize = 15;

    </script>
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">批量修改佣金比例</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal">
              
                    <div class="control-group" id="commissionError">
                        <label class="control-label" for="inputError">分销推广佣金比例</label>
                        <div class="controls">
                            <input id="CommissionRate" name="CommissionRate" class="input-small" placeholder="0" type="number">%
                            <span class="help-inline" style="display: none;">请输入分销推广佣金比例</span>
                        </div>
                    </div>
                    <div class="control-group" id="nextCommissionError">
                        <label class="control-label" for="inputError">产品销售佣金比例</label>
                        <div class="controls">
                            <input id="NextCommissionRate" name="NextCommissionRate" class="input-small" placeholder="0" type="number">%
                            <span class="help-inline" style="display: none;">请输入产品销售佣金比例</span>
                        </div>
                    </div>
              
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="btn" data-dismiss="modal" aria-hidden="true">保存</button>
        </div>
    </div>
    <%--<div aria-hidden="false" aria-labelledby="myModalLabel"  role="dialog" tabindex="-1" class="modal hide fade in" id="myModal" style="display: none;">
        <div class="modal-header">
            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
            <h3 id="myModalLabel">添加佣金比率</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal">
                <!--02 begin-->
                <div class="control-group">
                    <!--error-->
                    <label for="inputPassword" class="control-label">佣金比率</label>
                    <div class="controls">
                        <input type="text" placeholder="佣金比率" id="CommissionRate" name="CommissionRate">%
       
                        <span style="display: none;" class="help-block">请填写佣金比率。</span>
                    </div>
                </div>
                <!--02 end-->
            </form>
        </div>
        <div class="modal-footer">
            <button aria-hidden="true" data-dismiss="modal" onclick="" class="btn">关闭</button>
            <button aria-hidden="true" id="btn" data-dismiss="modal" class="btn btn-info">保存</button>
        </div>
    </div>--%>





    <div class="row funbar">
        <div class="span6 funbar-l">
            <!--<a class="btn btn-small fun-a" href="#myModal" data-toggle="modal"><i class="icon-add-gray"></i>添加</a>-->
            <a data-toggle="modal" href="javascript:void(0)" id="AllUpdate" onclick="Update(event,'more', '')" class="btn btn-small fun-a"><i class="icon-pen-gray"></i>批量修改</a>
        </div>
        <%--        <div class="span3 funbar-r">
            <form class="form-search">
                <div class="bs-docs-example">
                    <input type="text" id="Name" data-provide="typeahead" placeholder="请输入商品分类" class="input-large search-query">
                    <button class="btn-search" id="btnSelect" type="button"></button>
                </div>
            </form>
        </div>--%>
    </div>



    <div class="main">
        <!--table begin-->
        <div id="mod-table">
            <% 
                Html.RenderAction("GetCommissionRatioList", new { CurrentPageIndex = 0, PageSize = 15 });
            %>
        </div>
        <!--table end-->
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

        var commissionRatioList = null;

        //显示隐藏佣金提示

        function Update(event, singleOrMore, data) {
            ClearCss();
            $("#CommissionRate").val("");
            $("#NextCommissionRate").val("");
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            commissionRatioList = new Array();
            // 获取选中的数据
            if (singleOrMore === "single") {
                var id = $(eventSrc).parent().attr("dir");
                var commission;
                var nextCommission;
                if (data != "")
                {
                    commission = data.split('#')[0];
                    nextCommission = data.split('#')[1];
                }
                $("#CommissionRate").val(commission);
                $("#NextCommissionRate").val(nextCommission);
                commissionRatioList.push(id);
            }
            else if (singleOrMore === "more") {
                $("input[name='sub']:checked").each(function () {
                    commissionRatioList.push($(this).val());
                });
                if (commissionRatioList.length == 0) {
                    Show("请先勾选再进行批量操作", "prompt");
                    return;
                };
            }

            $("#myModal").modal("show");
            ISinputString("#CommissionRate");
            ISinputString("#NextCommissionRate");
        }


        $(function () {

            GetCommissionRatoView(1);
            $("#btnSelect").click(function () {
                CommissionRatioQuery.Query = $("#Name").val();
                GetCommissionRatoView(1, btnPageSize);
            });

            $("#type ul li").click(function () {
                CommissionRatioQuery.Query = "";
                $("#types ul li").removeClass("current");
                CommissionRatioQuery.Groups[0] = "q1";
                GetCommissionRatoView(1, btnPageSize);
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


            $("a").click(function () {

                if ($(this).attr("data-original-title") == "编辑") {
                    $(".control-group").removeClass("error")
                    $(".controls span").css("display", "none");
                }
            });

            //保存
            $("#btn").click(function () {
                ClearCss();
                var commissionRate = $("#CommissionRate").val();
                var nextCommissionRate=$("#NextCommissionRate").val();
                var settlementType = 0;
                $("input[name='SettlementType']").each(function () {
                    if ($(this).checked == "checked") {
                        settlementType = $(this).val();
                    }
                });
                var msg = "";
                if (commissionRate == "") {
                    $("#commissionError .controls span").css("display", "block");
                    $("#commissionError").addClass("error")
                    //Show("信息不完整", "prompt");
                    msg += $("#commissionError .controls span").text()+",";
                }
                if (nextCommissionRate == "") {
                    $("#nextCommissionError .controls span").css("display", "block");
                    $("#nextCommissionError").addClass("error")
                    //Show("信息不完整", "prompt");
                    msg += $("#commissionError .controls span")+",";
                }
                if (msg != "")
                { return false; }
                $(".controls span").css("display", "none");
                $.ajax({
                    type: "post",
                    url: "../../Commodity/ModifyCommissionRate",
                    data: { "Srt": JSON.stringify(commissionRatioList), "CommissionRate": commissionRate, "NextCommissionRate": nextCommissionRate },
                    success: function (jsonRes) {
                        if (jsonRes == "OK") {
                            $("#DivUpdatalogistics").hide();
                            Show("操作成功", "success");
                            $("#myModal").modal("hide");
                            GetCommissionRatoView(1, $("#btnPageSize").text());
                        }
                        else {
                            Show(JSON.stringify(jsonRes), "error");
                            $("#myModal").modal("hide");
                            GetCommissionRatoView(1, $("#btnPageSize").text());
                        }
                    }
                });

            });


            $("#numbers li").click(function () {
                $("#btnPageSize").text($(this).text());

                btnPageSize = parseInt($("#btnPageSize").text());

                GetCommissionRatoView(1, btnPageSize);
            });




        });
        //验证只能输入小数点和数字
        function ISinputString(input) {
            $(input).keydown(function (event) {
                var keyCode = event.which;
                if (keyCode == 46 || keyCode == 8 || keyCode == 190 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 110) {
                    return true;
                } else { return false }
            });
        }

        //清除弹出层样式
        function ClearCss()
        {
            //清空之前的验证样式
            $("#nextCommissionError .controls span").css("display", "none");
            $("#nextCommissionError").removeClass("error")
            $("#commissionError .controls span").css("display", "none");
            $("#commissionError").removeClass("error")
            
        }
    </script>

</asp:Content>

