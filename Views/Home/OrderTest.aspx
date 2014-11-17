<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="MCM-N-L">
  <div class="MCM-C-M"> 
    <!--标题 begin-->
    <div class="mod-title">
      <div class="con style01">
        <h1>订单列表</h1>
        <span>(共14条)</span> </div>
    </div>
    <!--标题 end--> 
    <!--搜索 begin-->
    <div class="search-bar02">
      <ul class="ul-search">
        <li>
          <input type="text" name="" class="v5-input in360 search" value="请输入订单号、快递单号、买家账号、收件人姓名、电话..." x-webkit-speech="" x-webkit-grammar="builtin:translate" style="color:#999;">
        </li>
        <li><a href="#" class="search-btn"></a></li>
      </ul>
    </div>
    <!--搜索 end--> 
    <!--刷新、设置 begin--> 
    <!--<div class="system-btn">
	  <div class="hr10"></div>
	    <ul>
	      <li class="refresh"><a href="" title="刷新"></a></li>
	    </ul>
	  </div>--><!--刷新功能取消--> 
    <!--刷新、设置 end--> 
    <!--选项卡 begin-->
    <div class="hr10"></div>
    <div class="mod-tab">
      <div class="con style01">
        <ul>
          <li class="current">全部(38)</li>
          <li>直销(10)</li>
          <li>分销(8)</li>
        </ul>
      </div>
    </div>
    <!--选项卡 end--> 
    <!--标签 begin-->
    <div class="label-mod">
      <div class="con style01">
        <ul>
          <li class="current"><a href="#">待发货(10)</a></li>
          <li><a href="#">未付款(10)</a></li>
          <li><a href="#">已发货(1)</a></li>
          <li><a href="#">退款中(2)</a></li>
        </ul>
      </div>
    </div>
    <!--标签 end--> 
    <!--标签 begin-->
    <div class="label-mod">
      <div class="con style01">
        <ul>
          <li><a href="#">无可达物流(10)</a><a class="edit" href="#"></a><a class="del" href="#"></a></li>
          <li><a href="#">申通(10)</a><a class="edit" href="#"></a><a class="del" href="#"></a></li>
          <li class="current"><a href="#">顺丰(1)</a><a class="edit" href="#"></a><a class="del" href="#"></a></li>
          <li><a href="#">圆通(2)</a><a class="edit" href="#"></a><a class="del" href="#"></a></li>
          <li class="add"><a href="#"></a></li>
        </ul>
      </div>
    </div>
    <!--标签 end--> 
    <!--操作栏 begin-->
    <div class="mod-operate">
      <div class="con style01">
        <ul class="btn">
          <li><a href="#" class="a-btn">获取订单</a></li>
          <li class="hidden"><a href="#" class="a-btn">导出订单</a></li>
          <li><a data="0" href="#" class="a-btn">延时收货</a><i class="ico20 show" style="display: none;"></i></li>
          <li><a data="1" href="#" class="a-btn">修改物流</a><i class="ico20 hidden" style="display: none;"></i></li>
          <li><a data="2" href="#" class="a-btn">批量备注</a><i class="ico20 hidden" style="display: none;"></i></li>
          <li><a href="#" class="a-btn">批量打印发货单</a></li>
          <li><a href="#" class="a-btn">批量打印快递单</a></li>
          <li>
            <div class="mod-sign">
              <div class="con style01 hidden"> <a href="#" class="a-btn"><span>标记</span><i></i></a>
                <ul class="w130">
                  <li>
                    <input type="radio" id="sign01" name="sign">
                    <label for="sign01">
                    <span class="red"></span>
                    <p>红色订单</p>
                    </label>
                  </li>
                  <li>
                    <input type="radio" id="sign02" name="sign">
                    <label for="sign02">
                    <span class="blue"></span>
                    <p>蓝色订单</p>
                    </label>
                  </li>
                  <li>
                    <input type="radio" id="sign03" name="sign">
                    <label for="sign03">
                    <span class="green"></span>
                    <p>绿色订单</p>
                    </label>
                  </li>
                  <li><a href="#">取消标签</a></li>
                  <li class="line-none"><a href="#">新建标签并标记</a></li>
                  <li class="line-none"><a href="#">管理标签</a></li>
                </ul>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <!--操作栏 end--> 
    <!--延时收货 开始-->
    <div class="mod-operate-detail" style="display: none;">
      <div class="mod-title">
        <div class="con style01">
          <h1>请选择收货天数</h1>
        </div>
      </div>
      <div class="mod-form">
        <div class="con style04">
          <table>
            <colgroup>
            <col style="width:80px;">
            </colgroup>
            <tbody><tr>
              <td><select class="v5-select w140">
                  <option>3天</option>
                  <option>5天</option>
                  <option>7天</option>
                </select></td>
            </tr>
            <tr>
              <td><button type="button" class="submit01 t10">&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;</button></td>
            </tr>
          </tbody></table>
        </div>
      </div>
    </div>
    <!--延时收货 结束-->
    <div class="mod-operate-detail" style="display: none;">
      <div class="mod-title">
        <div class="con style01">
          <h1>发货设置</h1>
        </div>
      </div>
      <div class="mod-form">
        <div class="con style04">
          <table>
            <colgroup>
            <col style="width:80px;">
            <col style="width:auto;">
            </colgroup>
            <tbody><tr>
              <td><label>物流公司</label></td>
              <td><select class="v5-select w140">
                  <option>顺丰</option>
                  <option>宅急送</option>
                </select></td>
            </tr>
            <tr>
              <td><label>起始快递单号</label></td>
              <td><input type="text" class="v5-input w130 float-l"></td>
            </tr>
            <tr>
              <td></td>
              <td><button type="button" class="submit01 t10">&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;</button></td>
            </tr>
          </tbody></table>
        </div>
      </div>
    </div>
    <div class="mod-operate-detail" style="display: none;">
      <div class="mod-title">
        <div class="con style01">
          <h1>批量备注</h1>
        </div>
      </div>
      <div class="mod-form">
        <div class="con style04">
          <table>
            <colgroup>
            <col style="width:auto;">
            </colgroup>
            <tbody><tr>
              <td><textarea class="v5-textarea w240 h70"></textarea></td>
            </tr>
            <tr>
              <td><button type="button" class="submit01 t10">&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;</button>
                <button type="button" class="submit01 t10">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button></td>
            </tr>
          </tbody></table>
        </div>
      </div>
    </div>
    <!--列表 Start-->
    <div class="mod-table">
      <div class="mod-table-head">
        <div class="con style01">
          <table width="100%" cellspacing="0" cellpadding="0" border="0">
            <colgroup>
            <col style="width:40px;">
            <col style="width:160px;">
            <col style="width:150px;">
            <col style="width:170px;">
            <col style="width:230px;">
            <col style="width:210px;">
            <col style="width:80px;">
            <col style="width:90px;">
            <col style="width:auto;">
            </colgroup>
            <tbody><tr>
              <th><label>
                  <input type="checkbox" value="" name="">
                </label></th>
              <th class="x-tab"><div class="iconbg-arrow down">订单信息</div></th>
              <th class="x-tab"><div class="iconbg-arrow up">商品清单</div></th>
              <th class="x-tab"><div class="iconbg-arrow up">买家信息</div></th>
              <th class="x-tab"><div class="iconbg-arrow down">物流信息</div></th>
              <th class="x-tab"><div class="iconbg-arrow down">留言备注</div></th>
              <th class="x-tab"><div class="iconbg-arrow down">标记</div></th>
              <th class="x-tab">操作</th>
              <th></th>
            </tr>
          </tbody></table>
        </div>
      </div>
      <% Html.RenderPartial("OrderDetail"); %>

    </div>
    <!--列表 End--> 
  </div>
  <!--Page Start-->
  <div class="mod-page">
    <div class="con style01">
      <div class="total">共有20条记录</div>
      <div class="page-show">
        <label>每页最多显示：</label>
        <span class="page-entry"> 20条</span></div>
      <div class="v5-page"> <a href="#">«</a> <span class="current">1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> ... <a href="#">30</a> <a href="#">31</a> <a href="#">»</a> </div>
    </div>
  </div>
  <!--Page End--> 
</div>

</asp:Content>

