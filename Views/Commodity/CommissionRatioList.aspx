<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/jquery.pager.js" type="text/javascript"></script>

    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var CommissionRatioQuery = new Object();
        CommissionRatioQuery.Groups = new Array(2);
        CommissionRatioQuery.Groups[0] = "q1";

    </script>

    <div id="gray-add-prize" style="display: none">

        <div style="width: 500px; height: 200px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>结算方式:</label>
                                </div>
                                <div class="float-l">
                                    <input type="radio" name="SettlementType" id="SettlementType" value="0" checked="checked" />单笔交易金额
                           
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>佣金比率:</label>
                                </div>
                                <div class="float-l">
                                    <input  class="w230" type="text" id="CommissionRate" name="CommissionRate">
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
                <!--content end-->
            </div>
        </div>
        <button style="display: none" name="Submit" id="submit" value="Submit" class="submit01-alert r10">
            保存</button>

        <div class="btn">
            <div class="indiv">
                <button type="button" id="btn" class="submit01-alert r10">
                    保存</button>
                <button class="reset01-alert" onclick="closeCommodtyClassify()">
                    关闭</button>
            </div>
        </div>
    </div>




    <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a class="c16" href="javascript:void(0)"><span>全部（<span id="all"></span>）</span>
                </a></li>
            </ul>
        </div>
    </div>


    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" id="Name" placeholder="请输入联系人名称..." class="search-input"
                        name="">
                </li>
                <li><a class="search-btn" id="btnSelect" href="javascript:void(0)"></a></li>
            </ul>
        </div>
    </div>


    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" id="AllUpdate" onclick="Update(event,'more')" href="javascript:void(0)">批量修改佣金</a></li>
            </ul>
        </div>
    </div>



    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%-- <li class="next"></li>--%>
                    <%-- <li class="prev"></li>--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>

    <div class="clear h10"></div>

    <div class="mod-table">


        <% 
            Html.RenderAction("GetCommissionRatioList", new { CurrentPageIndex = 0 });
   
                 
        %>
    </div>
    <script type="text/javascript">
        var commissionRatioList = new Array();


        function Update(event, singleOrMore) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            // 获取选中的数据
            if (singleOrMore === "single") {
                var id = $(eventSrc).attr("dir");
                commissionRatioList.push(id);
            }
            else if (singleOrMore === "more") {
                $("input[name='sub']:checked").each(function () {
                    commissionRatioList.push($(this).val());
                });
                if (commissionRatioList.length == 0) {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                    $("#operateTip").html("请先勾选再进行批量操作！").change();
                    return;
                };
            }
            popupOperate("gray-add-prize", "修改佣金比率", "gray-add-prize");
            ISinputString("#CommissionRate");
        }


        $(function () {

            GetCommissionRatoView(1);
            $("#btnSelect").click(function () {
                CommissionRatioQuery.Query = $("#Name").val();
                GetCommissionRatoView(1);
            });

            $("#type ul li").click(function () {
                CommissionRatioQuery.Query = "";
                $("#types ul li").removeClass("current");
                CommissionRatioQuery.Groups[0] = "q1";
                GetCommissionRatoView(1);
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


            //保存
            $("#btn").click(function () {
                var commissionRate = $("#CommissionRate").val();
                var settlementType = 0;
                $("input[name='SettlementType']").each(function () {
                    if ($(this).checked == "checked") {
                        settlementType = $(this).val();
                    }
                });
                if (commissionRate == "") {
                    alert("信息不完整");
                    return false;
                }
                $.ajax({
                    type: "post",
                    url: "../../Commodity/ModifyCommissionRate",
                    data: { "Srt": JSON.stringify(commissionRatioList), "CommissionRate": commissionRate },
                    success: function (jsonRes) {
                        if (jsonRes == "OK") {
                            $("#DivUpdatalogistics").hide();
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("操作成功！").change();
                            popupClose('gray-add-prize');
                            GetCommissionRatoView(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                            $("#operateTip").html(JSON.stringify(jsonRes)).change();
                            popupClose('gray-add-prize');
                            GetCommissionRatoView(1);


                        }
                    }
                });

            });


        });

        //关闭
        function closeCommodtyClassify() {
            popupClose('gray-add-prize');
        }



        //验证只能输入小数点和数字
        function ISinputString(input) {
            $(input).keydown(function (event) {
                var keyCode = event.which;
                if (keyCode == 46 || keyCode == 8 || keyCode == 190 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 110) {
                    return true;
                } else { return false }
            }).focus(function () {
                this.style.imeMode = 'disabled';
            });
        }
    </script>





</asp:Content>

