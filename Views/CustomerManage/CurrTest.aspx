<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        $(function () {
            $('.setExtract').click('show.bs.modal', function () {
                $('#setExtract').modal('show');
                return false;
            })
        });
    </script>
   
    <div id="setExtract" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">佣金提现设置</h3>
  </div>
  <div class="modal-body"> 
  <form class="form-inline">
  <fieldset>
    <legend>提现条件</legend>
    <span class="control-group error"> 
    <label class="control-label">最低提现金额为</label>
    <input type="number" placeholder="100" class="input-small mlr5"><label class="control-label">元</label>     
    <span class="help-inline"></span> 
    </span>
    <span class="control-group"> 
    <label class="checkbox ml15">
      <input type="checkbox">金额
    </label>
    <input type="number" placeholder="100" class="input-small mlr5"><label class="control-label">的整倍数</label>
    </span>
  </fieldset>
    <fieldset class="mt20">
    <legend>佣金发放</legend>
    <label>交易成功后</label>
    <label class="radio mlr5"><input type="radio" name="trade" class="mlr5" checked>立即发放</label>
    <span class="control-group error">      
    <label class="radio ml15">
      <input type="radio" name="trade">
    </label>
    <input type="number" class="input-small mlr5"><label class="control-label">天后发放</label>
    </span>
  </fieldset>
</form> 
    
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">保存</button>
  </div>
</div> 
<!-- addstore end -->  

    <!--tips success begin-->
    <div class="alert alert-success" style="display:none;"><button type="button" class="close" data-dismiss="alert">×</button>批量解冻成功！</div>
    <!--tips success end--> 
    <!--tips err begin-->
    <div class="alert alert-error" style="display:none;"><button type="button" class="close" data-dismiss="alert">×</button>错误提示！</div>
    <!--tips err end-->
    <!--tips warn begin-->
    <div class="alert" style="display:none;"><button type="button" class="close" data-dismiss="alert">×</button>请选择要解冻的信息！</div>
    <!--tips warn end--> 
    <!--function bar begin-->
    <div class="row funbar">
      <div class="span6 funbar-l">
        <a class="btn btn-small fun-a" href="#"><i class="icon-turn-gray"></i>批量转账</a>
        <a class="btn btn-small fun-a" href="#"><i class="icon-no-gray"></i>批量拒绝</a>
        <a class="btn btn-small fun-a" href="#"><i class="icon-remark-gray"></i>批量备注</a>
      </div>
      <div class="span3 funbar-r">
        <form class="form-search">
          <div class="bs-docs-example">
          <input type="text" class="input-large search-query" placeholder="请输入提现帐号" data-provide="typeahead"data-source="[&quot;AlabamaAlabamaAlab&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]">
          <button type="submit" class="btn-search"></button>
          </div>
        </form>
      </div>
    </div>
    <!--function bar end-->
    <div class="main">
    <div class="out-table">
    <!--select begin-->
    <div class="bs-docs-example out-table-bar">
            <ul class="nav nav-pills">
              <li class="dropdown active">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">提现方式<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">支付宝</a></li>
                  <li><a href="#">财付通</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">提现状态<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">已提现</a></li>
                  <li><a href="#">未提现</a></li>
                  <li><a href="#">提现成功</a></li>
                  <li><a href="#">提现失败</a></li>
                </ul>
              </li>
            </ul>
            <div class="nav-right"><a class="setExtract" href="#"><i class="icon-set-back"></i>设置</a></div>
          </div>
    <!--select end-->
    <div class="table-m10">
    <!--table begin-->
    <table class="table table-striped table-main">
    <colgroup>
        <col style="width: 2%">
        <col style="width: 11%;">
        <col style="width: 9%;">
        <col style="width: 9%;">
        <col style="width: 15%;">
        <col style="width: 9%;">
        <col style="width: 9%;">
        <col style="width: 6%;">
        <col style="width: 9%;">
        <col style="width: 6%;">
        <col style="width: 6%;">
        <col style="width: auto;">
    </colgroup>
    <tr class="table-title">
      <th class="first"><label><input type="checkbox"/></label></th>
      <th>提现流水号</th>
      <th>提现账号</th>
      <th>提现方式</th>
      <th>提现金额</th>
      <th>提现时间</th>
      <th>到账时间</th>
      <th>姓名</th>
      <th>联系电话</th>
      <th>状态</th>
      <th>备注</th>
      <th class="last">操作</th>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr class="current">
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr class="tr-red">
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-error-red"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td><label><input type="checkbox"/></label></td>
      <td><div class="cell">13351495215922</div></td>
      <td><div class="cell">mahua123@163.com</div></td>
      <td><div class="cell">支付宝</div></td>
      <td><div class="cell">5000.00</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">2014-05-06  12:06:56</div></td>
      <td><div class="cell">马化腾</div></td>
      <td><div class="cell">15021108999</div></td>
      <td><div class="cell"><i class="icon-ok-green"></i></div></td>
      <td><div class="cell">过几天开通</div></td>
      <td>
        <div class="cell">
          <div class="bs-docs-example tooltip-demo">
            <a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="转账"><i class="icon-turn-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="拒绝"><i class="icon-no-blue"></i></a>
<a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="备注"><i class="icon-remark-blue"></i></a>
          </div>
        </div>
      </td>
    </tr>
    </table>
    <!--table end-->
    </div>
    </div>
    <!--page begin-->
    <div class="page">
      <div class="page-left">当前1~15条,总计234条</div>
      <div class="page-select">
        每页显示
        <div class="btn-group dropup">
          <button class="btn">15</button>
          <button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
          <ul class="dropdown-menu selectpage">
            <li><a href="#">20</a></li>
            <li><a href="#">30</a></li>
            <li><a href="#">40</a></li>
            <li><a href="#">50</a></li>
          </ul>
        </div>
        条
      </div>
      <div class="pagination pagination-right">
              <ul>
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
             </ul>
            </div>
    </div>
    <!--page end-->
    </div>
</asp:Content>