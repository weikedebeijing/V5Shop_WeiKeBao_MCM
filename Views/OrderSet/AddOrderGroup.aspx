<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="MCM-N-L ScrollBar">
  <div class="MCM-C-M "> 
    <!--title begin-->
    <div class="mod-title">
      <div class="con style03"> <a class="icon-back r10" title="返回" href="/OrderSet/OrderGroup"></a>
        <h2>自定义分组</h2>
      </div>
    </div>
    <!--title end-->
    <div class="w960">
      <div class="mod-form float-l">
        <div class="con style05 w230 r10 t10">
          <h5 class="pd-10">按快递公司</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-1">
                <label for="fztj01-1">顺丰</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-2">
                <label for="fztj01-2">申通</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-3">
                <label for="fztj01-3">汇通</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-4">
                <label for="fztj01-4">天天快递</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-5">
                <label for="fztj01-5">宅急送</label>
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w230 r10 t10">
          <h5>按会员等级</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-6">
                <label for="fztj01-6">非注册用户</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-7">
                <label for="fztj01-7">普通会员</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-8">
                <label for="fztj01-8">高级会员</label>
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w230 r10 t10">
          <h5>按打印状态</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-9">
                <label for="fztj01-9">已打印快递单</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-10">
                <label for="fztj01-10">未打印快递单</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-11">
                <label for="fztj01-11">已打印发货单</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-12">
                <label for="fztj01-12">未打印发货单</label>
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w230 r10 t10">
          <h5>按订单来源筛选</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-13">
                <label for="fztj01-13">普通订单</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-14">
                <label for="fztj01-14">货到付款</label>
              </li>
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-15">
                <label for="fztj01-15">分销订单</label>
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w310 r10 t10">
          <h5>按订单商品</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w100 h23">
                <input type="checkbox" name="import" id="fztj01-16">
                <label for="fztj01-16">单品</label>
              </li>
              <li class="w150 h23">
                <input type="checkbox" name="import" id="fztj01-17">
                <input type="text" class="w45">
                <label for="fztj01-17">种商品</label>
              </li>
              <li class="w150 h23">
                <input type="checkbox" name="import" id="fztj01-18">
                <input type="text" class="w45">
                <label for="fztj01-18">种商品以上</label>
              </li>
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-19">
                <label for="fztj01-19">任一商品数量大于</label>
                <input type="text" class="w45">
              </li>
              <li class="w150 h23">
                <input type="checkbox" name="import" id="fztj01-20">
                <label for="fztj01-20">商品总价大于</label>
                <input type="text" class="w45">
              </li>
              <li class="w150 h23">
                <input type="checkbox" name="import" id="fztj01-21">
                <label for="fztj01-21">商品总价小于</label>
                <input type="text" class="w45">
              </li>
              <li class="w150 h23"> 商品名称包含关键字 </li>
              <li class="w150 h23">
                <input type="text" class="v5-input w150">
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w310 r10 t10">
          <h5>按收货地址</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-22">
                <label for="fztj01-22">无可达物流</label>
              </li>
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-23">
                <label for="fztj01-23">非城区地址（地址包含镇、乡、村等）</label>
              </li>
              <li class="w2000 h23"> 商品名称包含关键字 </li>
              <li class="w200 h23">
                <input type="text" class="v5-input w150">
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w310 r10 t10">
          <h5>按其它</h5>
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-24">
                <label for="fztj01-24">同一会员存在未收款订单</label>
              </li>
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-25">
                <label for="fztj01-25">同一会员多订单不同地址</label>
              </li>
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-26">
                <label for="fztj01-26">留言包含关键字</label>
                <input type="text" class="w45">
              </li>
              <li class="w200 h23">
                <input type="checkbox" name="import" id="fztj01-27">
                <label for="fztj01-27">备注包含关键字</label>
                <input type="text" class="w45">
              </li>
              <li class="w2000 h23">会员留言&nbsp;
                <input type="radio" id="yes1" name="panduan1">
                <label for="yes1">是</label>
                &nbsp;
                <input type="radio" id="no1" name="panduan1">
                <label for="no1">否</label>
              </li>
              <li class="w200 h23"> 客服备注&nbsp;
                <input type="radio" id="yes2" name="panduan2">
                <label for="yes2">是</label>
                &nbsp;
                <input type="radio" id="no2" name="panduan2">
                <label for="no2">否</label>
              </li>
            </ul>
          </dl>
        </div>
      </div>
      <div class="mod-form float-l">
        <div class="con style05 w950 r10 t10">
          <dl class="bg01 h200">
            <ul class="l10">
              <li class="w200 h23"> 关联方式（如：单品&amp;顺丰，表示订单商品为单品且快递公司为顺丰） </li>
              <li class="w200 h23">
                <input type="radio" id="yes3" name="panduan3">
                <label for="yes3">&amp;(且)</label>
              </li>
              <li class="w200 h23">
                <input type="radio" id="no3" name="panduan3">
                <label for="no3">|(非)</label>
              </li>
              <li class="w2000 h23">分组名称</li>
              <li class="w200 h23">
                <input type="text" class="v5-input w150">
              </li>
              <li class="w200 h23 t10">
                <input type="checkbox" name="import" id="fztj01-28">
                <label for="fztj01-28">是否高亮显示</label>
              </li>
              <li class="w200 h23">
                <button type="button" class="submit01 t10">保存</button>
                <button type="button" class="submit01 t10 l10">取消</button>
              </li>
            </ul>
          </dl>
        </div>
      </div>
    </div>
  </div>
</div>
</asp:Content>
