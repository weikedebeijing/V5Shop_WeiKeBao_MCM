<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%--废弃页面不用维护--%>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function senfe_id(sid) {
            show.style.display = sid;
        }
        function Open() {
            $.ajax({
                url: "../../ImportGoods/StartImport",
                dataType: 'json',
                success: function (result) {
                    if (result.Code == null) {
                        window.location.href = "/ImportGoods/ExecuteImport";
                    } else {
                    
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html(result.Message).change();
                    }
                }
            });
        }
    </script>
    <div class="mod-title">
        <div class="con style01">
            <h1>
                商品导入</h1>
        </div>
    </div>
    <!--第一步-->
    <div>
        <!--步骤 begin-->
        <div class="mod-step">
            <div class="con style01">
                <ul>
                    <li class="current"><span class="number">1.</span> <span class="fb">导入选项</span> <span
                        class="arrow"></span></li>
                    <li><span class="number">2.</span> <span class="fb">执行导入</span> <span class="arrow">
                    </span></li>
                    <li><span class="number">3.</span> <span class="fb">导入结果</span> <span class="arrow">
                    </span></li>
                    <%--              <li>
                <span class="number">4.</span>
                <span class="fb">快速发布</span>
              </li>--%>
                </ul>
            </div>
        </div>
        <!--步骤 begin-->
        <div class="hr20 clear">
        </div>
        <div class="mod-form">
            <div class="con style02">
                <ul>
                    <li>
                        <input id="01" type="radio" name="import" checked="checked" onpropertychange="senfe_id('none')">
                        <label for="01">
                            整店导入</label>
                    </li>
                    <%--            <li>
              <input type="radio" name="import" id="02" onpropertychange="senfe_id('');" disabled/>
              <label for="02">部分导入（导入所选商品数据以及店铺分类）</label>
            </li>--%>
                </ul>
            </div>
        </div>
        <div class="mod-form l20">
            <%--<div class="con style01" id="show" style=" display:none">
        <dl>
          <dt class="w100">按销售状态</dt>
          <dd class="l05">
            <input type="checkbox" id="stu-01"/>
            <label class="r25" for="stu-01">在售</label>
            <input type="checkbox" id="stu-02"/>
            <label for="stu-02">仓库中</label>
          </dd>
          <dt class="w100">按店铺类目</dt>
          <dd class="l05">
            <!--级别控件 begin-->
            <div class="level">
              <ul>
                <li>
                  <div> <i>├</i>
                    <input type="checkbox" id="level01" />
                    <label for="level01">苹果专区</label>
                    <ul>
                      <li>
                        <div> <i>├</i>
                          <input type="checkbox" id="level02" />
                          <label for="level02">苹果专区一</label>
                        </div>
                        <ul>
                          <li>
                            <div>
                              <i>├</i>
                              <input type="checkbox" id="level03"/>
                              <label for="level03">苹果专区一</label>
                            </div>
                          </li>
                          <li>
                            <div>
                              <i>├</i>
                              <input type="checkbox" id="level04"/>
                              <label for="level04">苹果专区二</label>
                            </div>
                          </li>
                          <li>
                            <div>
                              <i>├</i>
                              <input type="checkbox" id="level05"/>
                              <label for="level05">苹果专区三</label>
                            </div>
                          </li>
                          <li>
                            <div>
                              <i>├</i>
                              <input type="checkbox" id="level06"/>
                              <label for="level06">苹果专区四</label>
                            </div>
                          </li>
                          <li>
                            <div>
                              <i>├</i>
                              <input type="checkbox" id="level07"/>
                              <label for="level07">苹果专区五</label>
                            </div>
                          </li>
                        </ul>
                      </li>
                      <li>
                        <div>
                          <i>├</i>
                          <input type="checkbox" id="level08"/>
                          <label for="level08">苹果专区二</label>
                        </div>
                      </li>
                      <li>
                        <div>
                          <i>├</i>
                          <input type="checkbox" id="level09"/>
                          <label for="level09">苹果专区三</label>
                        </div>
                      </li>
                      <li>
                        <div>
                          <i>├</i>
                          <input type="checkbox" id="level10"/>
                          <label for="level10">苹果专区四</label>
                        </div>
                      </li>
                      <li>
                        <div>
                          <i>├</i>
                          <input type="checkbox" id="level11"/>
                          <label for="level11">苹果专区五</label>
                        </div>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
            <!--级别控件 end-->
            <div class="clear"></div>
          </dd>
          <dt class="w100">商品覆盖处理</dt>
          <dd class="l05">
            <input type="checkbox" id="opear-01"/>
            <label class="r25" for="opear-01">覆盖已存在商品</label>
          </dd>
        </dl>
      </div>--%>
        </div>
        <div style="margin-left: 30px; margin-top: 20px">
            <input id="b1" class="reset01 r5" type="button" value="开始导入" onclick="Open()" />
        </div>
    </div>
</asp:Content>
