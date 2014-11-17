<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <%=Combres.WebExtensions.CombresLink("editRoleJs")%>
    <%--   <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>--%>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
    <style type="text/css">
    
   
        
        
        .input-text
        {
            text-align: right;
            width: 4em;
            
        }
        .area-group
        {
            text-align: left;
        }
        
        table
        {
            border-color: #BBBBBB;
            border-style: solid;
            border-width: 1px 0 0 1px;
        }
        table th
        {
            background-color: #F5F5F5;
            font-weight: 400;
            height: 32px;
        }
        
        
        
  
     
        .title
        {
            font-weight: bold;
            background-color: #cccccc;
        }
        
        .text
        {
            width: 50px;
        }
        
   h2{margin:0px;padding:0px;font-size:12px;font-weight:bold;}
.bton{border:1px solid #CCC;background:#DDD;}
.cont{padding:10px;}
#main{width:400px;margin:0px auto;}
#selectItem{background:#FFF;position:absolute;top:0px;left:center;border:1px solid #000;overflow:hidden;margin-top:10px;width:600px;z-index:2; overflow:visible;}
#preview{margin:1px;border:1px solid #CCC;}
#result{border:1px solid #CCC;margin-top:10px;}
.tit{line-height:20px;height:20px;margin:1px;padding-left:10px;}
.bgc_ccc{background:#CCC;}
.bgc_eee{background:#eee;}
.c_999{color:#999}
.pointer{cursor:pointer;}
.left{float:left;}
.right{float:right;}
.cls{clear:both;font-size:0px;height:0px;overflow:hidden;}
#bg{background:#FFFFFF;filter:alpha(opacity=70);opacity:0.7;width:100%;;position:absolute;left:0px;top:0px;display:none;z-index:1; }
.hidden{display:none;}
.move{cursor:move;}

.clearfix:after {
    clear: both;
    content: "";
    display: block;
    height: 0;
}

.dcity {
    display: block;
    vertical-align: middle;
    z-index: 1;
}

.gcity, .province-list {
    display: inline-block;
}
.ecity {
    float: left;
    height: 30px;
    margin-right: 1px;
    padding-right: 8px;
    position: relative;
 
}


.dialog-areas li span.group-label {
    display: inline-block;
    font-weight: 700;
    margin-right: 5px;
    padding: 5px 0 5px 10px;
    width: 70px;
}

.trigger {
    cursor: pointer;
    height: 8px;
    padding: 2px;
    width: 8px;
}
.dialog-areas li span.group-label {
    font-weight: 700;
}

.dialog-areas .even {
    background-color:  #ECF4FF;
}

.dialog-areas .even span.gareas {
    background-color: #ECF4FF;
    border-color: #ECF4FF;
}

.citys {
    background-color: #FFFEC6;
    border: 1px solid #F7E4A5;
    display: none;
    float: right;
    left: 0;
    position: absolute;
    top: 23px;
    width: 214px;
    z-index: 20000;
}
province-list {
    width: 450px;
}
.gcity, .province-list {
    display: inline-block;
}

.gcity, .province-list {
    display: inline-block;
}


.dialog-areas .even .showCityPop .gareas {
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
}
.dialog-areas .even span.gareas {
    background-color: #ECF4FF;
    border-color: #ECF4FF;
}
.dialog-areas .showCityPop .gareas {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    z-index: 56000;
}
.dialog-areas span.gareas {
    border: 1px solid #FFFFFF;
    display: inline-block;
    height: 17px;
    margin-right: 3px;
    padding: 4px 4px 1px;
    position: relative;
    white-space: nowrap;
}

.dialog-areas .showCityPop .gareas {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    z-index: 56000;
   
    
}
.dialog-areas li span.areas {
    display: inline-block;
    margin-right: 3px;
    padding: 4px 0 1px 4px;
    
}
.showCityPop .citys {
    display: block;
    z-index: 55900;  
}

 .area-group {
    display: block;
    padding-right: 3em;
    font-size:12px;
}
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%V5.MetaData.Delivery.Model.DeliveryTemplate onlinePaymentList = ViewData["deliveryTemplate"] as V5.MetaData.Delivery.Model.DeliveryTemplate; %>
    <%List<V5.MetaData.Delivery.Messaging.ToDeliveryFee> DeliveryFee = ViewData["deliveryFeeList"] as List<V5.MetaData.Delivery.Messaging.ToDeliveryFee>; %>
    <%  V5.MetaData.Delivery.Messaging.ToDeliveryFee DeliveryFeeModel = ViewData["deliveryFee"] as V5.MetaData.Delivery.Messaging.ToDeliveryFee; %>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="javascript:void(0)" onclick="GoToLinkUrl(event)" title="返回" class="a-btn float-l">
                <i class="icon-back" linkurl="Transportation"></i></a>
            <h1 class="spanTitle">
                修改运费模板</h1>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <div class="mod-form t20">
        <div class="con style0page">
            <%Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("UpdataTransporttion", "Dispatching", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFrom", OnFailure = "afterOnFailure", OnSuccess = "afterOnSuccess", UpdateTargetId = "HidUpdateTargetId" }))
              { %>
            <button type="submit" id="realSub" style="display: none">
                保存</button>
            <input type="hidden" id="HidResult" name="HidResult" />
           <span style="display:none" id="HidUpdateTargetId"></span>
            <input type="hidden" id="Valuation" value="<%=onlinePaymentList.Valuation%>" />
            <input type="hidden" id="hidID" name="hidID" value="<%=onlinePaymentList.ID %>" />
            <input type="hidden" id="hidIrrigationDitch" value="<%=onlinePaymentList.ConsignAreaID %>" />
            <input type="hidden" id="hidLogistics" value="<%=onlinePaymentList.ExpressID %>" />
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>模板名称：</label></div>
                    <div class="float-l">
                        <input id="TextName" type="text" name="TextName" class="w230" value="<%=onlinePaymentList.Name%>" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            物流公司：</label></div>
                    <div class="float-l">
                        <select id="AddressType" name="AddressType" class="w230">
                        </select>
                        <span class="unit">还没有物流公司，</span> <a class="c07" href="LogisticsCompanyList?appCode=PLATFORM&MenuCode=C410">
                            点击这里去添加</a></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            发货地址：</label></div>
                    <div class="float-l">
                        <select id="LogisticsAddress" name="LogisticsAddress" class="width:100px">
                        </select>
                        <span class="unit">还没有发货地址，</span> <a class="c07" href="LogisticsMailAddress?appCode=PLATFORM&MenuCode=C405">
                            点击这里去添加</a>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            支持类型：</label></div>
                    <div class="float-l">
                        <%if (onlinePaymentList.Supports == "mops")
                          { %>
                        <input id="checkbox01" type="radio" name="Supports" checked="checked" value="mops" />
                        <label class="r25" for="checkbox01">
                            在线付款</label>
                        <% } %>
                        <%else
                            { %>
                        <input id="Radio1" type="radio" name="Supports" value="mops" checked="checked" />
                        <label class="r25" for="Radio1">
                            在线付款</label>
                        <%   } %>
                        <%if (onlinePaymentList.Supports == "cod")
                          { %>
                        <input id="checkbox02" name="Supports" type="radio" checked="checked" value="cod" />
                        <label class="r25" for="checkbox02">
                            货到付款</label>
                        <br />
                        <% } %>
                        <%else
                            { %>
                        <input id="Radio2" name="Supports" type="radio" value="cod" />
                        <label class="r25" for="Radio2">
                            货到付款</label>
                        <%   } %>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            物流保价</label></div>
                    <%if (onlinePaymentList.EnableInsurance == true)
                      {%>
                    <div class="float-l">
                        <input id="uEnableInsurance" type="checkbox" checked="checked" name="EnableInsurance"
                            value="EnableInsurance" /><label for="uEnableInsurance">是</label></div>
                    <div style="display: block;" id="divEnable" class="mod-box clear l130">
                        <div class="con style0bg">
                            <span>费率：</span><input type="text" id="InsuranceRate" name="InsuranceRate" class="w100"
                                value="<%=onlinePaymentList.InsuranceRate %>"><span>%</span> <span class="l15">最低保价费：</span><input
                                    type="text" id="InsuranceFee" name="InsuranceFee" class="w100" value="<%=onlinePaymentList.InsuranceFee %>"><span>元</span>
                        </div>
                    </div>
                    <%  } %>
                    <%else
                        {%>
                    <div class="float-l">
                        <input id="aEnableInsurance" type="checkbox" name="EnableInsurance" value="EnableInsurance" /><label
                            for="aEnableInsurance">是</label></div>
                    <div style="display: none;" id="divEnable1" class="mod-box clear l130">
                        <div class="con style0bg">
                            <span>费率：</span><input type="text" id="InsuranceRate" name="InsuranceRate" class="w100"><span>%</span>
                            <span class="l15">最低保价费：</span><input type="text" id="InsuranceFee" name="InsuranceFee"
                                class="w100"><span>元</span>
                        </div>
                    </div>
                    <%  } %>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            计费方式：</label></div>
                    <div class="float-l">
                        <div class="float-l">
                            <% string getCheckedPiece = "";
                               string getcheckedHeavy = "";
                               string getcheckedVolume = "";

                               string disabledPiece = "";
                               string disabledHeavy = "";
                               string disabledVolume = "";
                  
                  
                            %>
                            <%
                             
                                if (onlinePaymentList.Valuation == 0)
                                {
                                    getCheckedPiece = "checked=checked";
                                }
                                else
                                {

                                    getCheckedPiece = "";
                                    disabledPiece = "disabled=disabled";


                                }

                                if (onlinePaymentList.Valuation == 1)
                                {
                                    getcheckedHeavy = "checked=checked";
                                }
                                else { getcheckedHeavy = ""; disabledHeavy = "disabled=disabled"; }
                                if (onlinePaymentList.Valuation == 3)
                                {
                                    getcheckedVolume = "checked=checked";
                                }
                                else { getcheckedVolume = ""; disabledVolume = "disabled=disabled"; }
                  
                            %>
                            <input id="checkbox04" type="radio" name="Valuation" onchange="GetValuations(event)"
                                value="0" <%=getCheckedPiece %> <%=disabledPiece %> />
                            <label class="r25" for="checkbox04">
                                按件数</label>
                            <input id="checkbox05" type="radio" name="Valuation" onchange="GetValuations(event)"
                                <%=getcheckedHeavy %> <%=disabledHeavy %>value="1" />
                            <label class="r25" for="checkbox05">
                                按重量</label>
                            <input id="checkbox06" type="radio" name="Valuation" onchange="GetValuations(event)"
                                <%=getcheckedVolume %><%=disabledVolume %> value="3" />
                            <label class="r25" for="checkbox06">
                                按体积</label>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <%string initialWorkpiece = ""; %>
                    <%string TheFirstFee = "";  %>
                    <%string Continued = ""; %>
                    <%string Renew = ""; %>
                    <%if (onlinePaymentList.Valuation == 0)
                      {
                          initialWorkpiece = "首件(件)";
                          TheFirstFee = "首费(元)";
                          Continued = "续件(件)";
                          Renew = "续费(元)";
                      }
                      else if (onlinePaymentList.Valuation == 1)
                      {

                          initialWorkpiece = "首重(kg)";
                          TheFirstFee = "首费(元)";
                          Continued = "续重(kg)";
                          Renew = "续费(元)";
                      }
                      else if (onlinePaymentList.Valuation == 3)
                      {
                          initialWorkpiece = "首体积(m³)";
                          TheFirstFee = "首费(元)";
                          Continued = "续体积(m³)";
                          Renew = "续费(元)";

                      }
                    %>
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            运费：</label></div>
                    <div class="float-l">
                        <div id="PressPaper">
                            <span>默认运费：</span><input type="text" class="w100" id="NumberStartStandard" name="StartStandard0"
                                value="<%=DeliveryFeeModel.StartStandard %>" /><span><%=initialWorkpiece%></span>
                            <span class="l15">费用：</span><input type="text" class="w100" id="NumberStartFee" name="StartFee0"
                                value="<%=DeliveryFeeModel.StartFee %>" /><span><%=TheFirstFee %></span> <span class="l15">
                                    每增加：</span><input type="text" class="w100" id="NumberAddStandard" name="StartAddStandard0"
                                        value="<%=DeliveryFeeModel.AddStandard %>" /><span><%=Continued %></span>
                            <span class="l15">费用增加：</span><input type="text" class="w100" id="NumberAddFee" name="StartAddFee0"
                                value="<%=DeliveryFeeModel.AddFee%>" /><span><%=Renew %></span>
                        </div>
                        <div class="mod-table-main t10">
                            <%if (DeliveryFee.Count > 1)
                              { %>
                            <div class="mod-table-main t10">
                                <div class="con style03" id="tbl-except">
                                    <table style="width: 800px;" id="myPressPaperTable">
                                        <colgroup>
                                            <col style="width: 34%;">
                                            <col style="width: 15%;">
                                            <col style="width: 15%;">
                                            <col style="width: 15%;">
                                            <col style="width: 15%;">
                                            <col style="width: 6%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td class="td_bg">
                                                    运送到
                                                </td>
                                                <td class="td_bg">
                                                    <span id="initialWorkpiece">
                                                        <%=initialWorkpiece%></span>
                                                </td>
                                                <td class="td_bg">
                                                    <span id="collectFees">
                                                        <%=TheFirstFee%></span>
                                                </td>
                                                <td class="td_bg">
                                                    <span id="Continued">
                                                        <%=Continued%></span>
                                                </td>
                                                <td class="td_bg">
                                                    <span id="Renew">
                                                        <%=Renew%></span>
                                                </td>
                                                <td class="td_bg">
                                                    操作
                                                </td>
                                            </tr>
                                            <%var i = 0; %>
                                            <%foreach (var item in DeliveryFee)
                                              {%>
                                            <% if (item.Destination != "1")
                                               { %>
                                            <% i++; %>
                                            <tr id="trRow<%=i %>">
                                                <td>
                                                    <div>
                                                        <%=item.Area%></div>
                                                    <div class="mod-operate float-r">
                                                        <div class="con style0editdel">
                                                            <a class="del" id="edit<%=i %>" title="编辑运送区域" onclick="openBg(1,event);openSelect(1);"
                                                                href="javascript:void(0)">编辑</a>
                                                        </div>
                                                    </div>
                                                    <input value="<%=item.Destination %>" id="number" name="furniture_areas_n<%=i %>"
                                                        type="hidden">
                                                    <input value="<%=item.Area %>" id="numberName" name="furniture_areas_name_n<%=i %>"
                                                        type="hidden">
                                                </td>
                                                <td>
                                                    <input id="StartStandard_<%=i %>" class="w100" value="<%=item.StartStandard %>" name="StartStandard<%=i %>"
                                                        type="text">
                                                </td>
                                                <td>
                                                    <input id="StartFee_<%=i %>" class="w100" value="<%=item.StartFee %>" name="StartFee<%=i %>"
                                                        type="text">
                                                </td>
                                                <td>
                                                    <input id="StartAddStandard_<%=i %>" class="w100" value="<%=item.AddStandard %>"
                                                        name="StartAddStandard<%=i %>" type="text">
                                                </td>
                                                <td>
                                                    <input id="StartAddFee_<%=i %>" class="w100" value="<%=item.AddFee%>" name="StartAddFee<%=i %>"
                                                        type="text">
                                                </td>
                                                <td>
                                                    <div class="mod-operate">
                                                        <div class="con style0editdel">
                                                            <a class="del" name="de_<%=i %>" href="javascript:void(0) " onclick="dlRow('trRow<%=i %>');Delect(<%=item.ID %>)">
                                                                删除</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%  }%>
                                            <%     }   %>
                                        </tbody>
                                    </table>
                                    <%    } %>
                                    <%else
                                        { %>
                                    <div class="con style03" id="tbl-except" style="display: none">
                                        <table id="myPressPaperTable" width=" 800px">
                                            <colgroup>
                                                <col style="width: 34%;">
                                                <col style="width: 15%;">
                                                <col style="width: 15%;">
                                                <col style="width: 15%;">
                                                <col style="width: 15%;">
                                                <col style="width: 6%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <td class="td_bg">
                                                        运送到
                                                    </td>
                                                    <td class="td_bg">
                                                        <span id="initialWorkpiece">
                                                            <%=initialWorkpiece%></span>
                                                    </td>
                                                    <td class="td_bg">
                                                        <span id="collectFees">
                                                            <%=TheFirstFee%></span>
                                                    </td>
                                                    <td class="td_bg">
                                                        <span id="Continued">
                                                            <%=Continued%></span>
                                                    </td>
                                                    <td class="td_bg">
                                                        <span id="Renew">
                                                            <%=Renew%></span>
                                                    </td>
                                                    <td class="td_bg">
                                                        操作
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <%  } %>
                                </div>
                                <div class="t10">
                                    <a class="btn-gradient-blue" id="J_AddRule" onclick="InsertRow()" href="javascript:void(0)">
                                        为指定地区城市设置运费</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <%} %>
            <div class="l130 t20 b20">
                <button type="button" onclick="javascript:btnSub();" class="submit01">
                    保存</button>
            </div>
        </div>
    </div>
    <div class="mod-table-main l130">
        <!--列表 End-->
        <div id="bg">
        </div>
        <div id="selectItem" class="hidden">
            <div class="tit bgc_ccc move">
                <h2 class="left">
                    请选择城市</h2>
                <span class="pointer right" onclick="openBg(0,event);openSelect(0);">[取消]</span>
                <span class="pointer right" onclick="makeSure();">[确定]</span>
                <%-- 记录编辑的ID--%>
                <input type="hidden" id="hidMakeSure" />
                <%-- 记录编辑时保存城市hideID--%>
                <input type="hidden" id="hidArea" />
                <input type="hidden" id="hidAreaName" />
            </div>
            <div class="cls">
            </div>
            <div class="cont">
                <div class="selectSub dialog-areas">
                    <ul id="J_CityList">
                        <li>
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_0" name="J_Group_0" class="J_Group" type="checkbox" value="310000,320000,330000,340000,360000" />
                                        <label for="J_Group_0">
                                            华东</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li class="even">
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_1" name="J_Group_1" class="J_Group" type="checkbox" value="110000,120000,140000,370000,130000,150000">
                                        <label for="J_Group_1">
                                            华北</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_2" name="J_Group_2" class="J_Group" type="checkbox" value="430000,420000,410000">
                                        <label for="J_Group_2">
                                            华中</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li class="even">
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_3" name="J_Group_3" class="J_Group" type="checkbox" value="440000,450000,350000,460000">
                                        <label for="J_Group_3">
                                            华南</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_4" name="J_Group_4" class="J_Group" type="checkbox" value="210000,220000,230000">
                                        <label for="J_Group_4">
                                            东北</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li class="even">
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_5" name="J_Group_4" class="J_Group" type="checkbox" value="610000,650000,620000,640000,630000">
                                        <label for="J_Group_5">
                                            西北</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_6" name="J_Group_6" class="J_Group" type="checkbox" value="500000,530000,520000,540000,510000">
                                        <label for="J_Group_6">
                                            西南</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                        <li class="even">
                            <div class=" dcity clearfix">
                                <div class="ecity gcity">
                                    <span class="group-label">
                                        <input id="J_Group_7" name="J_Group_7" class="J_Group" type="checkbox" value="810000,820000,710000">
                                        <label for="J_Group_7">
                                            港台澳</label>
                                    </span>
                                </div>
                                <div class="province-list">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function btnSub() {


            var tr = $("tr:last").find("td a").attr("id");

            if (tr != undefined) {
                var trRow = tr.substring(4, tr.length);

                $("#HidResult").val(trRow);
            }
            else { $("#HidResult").val(0); }

            $("#realSub").submit();



        }
        var tag = $("[name='Valuation']").attr("id");
        function GetValuations(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var conf = confirmThis(event, "切换计价方式后，所设置当前模板的运输信息将被清空，确定继续么？")
            if (conf) {

                $('#myPressPaperTable tr').not("tr:eq(0)").remove();
                tag = $(eventSrc).attr("id");
                $("#tbl-except").hide();
                if (tag == "checkbox04") {

                    $("#defaultUnit").text("首件(件)");
                    $("#defaultMoney").text("首费(元)");
                    $("#defaultAddUnit").text("续件(件)");
                    $("#defaultAddMoney").text("续费(元)");

                }
                else if (tag == "checkbox05") {


                    $("#defaultUnit").text("首重(kg)");
                    $("#defaultMoney").text("首费(元)");
                    $("#defaultAddUnit").text("续重(kg)");
                    $("#defaultAddMoney").text("续费(元)");


                }
                else if (tag == "checkbox06") {

                    $("#defaultUnit").text("首体积(m³)");
                    $("#defaultMoney").text("首费(元)");
                    $("#defaultAddUnit").text("续体积(m³)");
                    $("#defaultAddMoney").text("续费(元)");

                }

            }
            else {
                $("#" + tag + "").attr("checked", true);
                return false;


            }
        }




        //添加行
        function InsertRow() {

            if (tag == "checkbox04") {

                $("#initialWorkpiece").text("首件(件)");
                $("#collectFees").text("首费(元)");
                $("#Continued").text("续件(件)");
                $("#Renew").text("续费(元)");
                $("#tbl-except").css("display", "block");
            }
            else if (tag == "checkbox05") {


                $("#initialWorkpiece").text("首重(kg)");
                $("#collectFees").text("首费(元)");
                $("#Continued").text("续重(kg)");
                $("#Renew").text("续费(元)");
                $("#tbl-except").css("display", "block");

            }
            else if (tag == "checkbox06") {

                $("#initialWorkpiece").text("首体积(m³)");
                $("#collectFees").text("首费(元)");
                $("#Continued").text("续体积(m³)");
                $("#Renew").text("续费(元)");
                $("#tbl-except").css("display", "block");
            }






            var tableRow = document.getElementById("myPressPaperTable");
            var row_index = tableRow.rows.length;
            var trRow = tableRow.insertRow(row_index);
            trRow.id = "trRow" + row_index;
            var cel1 = trRow.insertCell(0);
            cel1.innerHTML = '<div> 未添加地区</div> <div class="mod-operate float-r"><div class="con style0editdel"> <a  id="edit' + row_index + '"  onclick="openBg(1,event);openSelect(1);" title="编辑运送区域" class="del" href="javascript:void(0)">编辑</a></div></div><input type="hidden" name="furniture_areas_n' + row_index + '"><input type="hidden" name="furniture_areas_name_n' + row_index + '">';
            var cel2 = trRow.insertCell(1);
            cel2.innerHTML = "<input id='StartStandard_" + row_index + "' class='w30' type='text' value='1' name='StartStandard" + row_index + "' />";
            var cel3 = trRow.insertCell(2);
            cel3.innerHTML = "<input id='StartFee_" + row_index + "' class='w30' type='text' name='StartFee" + row_index + "'/>";
            var cel4 = trRow.insertCell(3);
            cel4.innerHTML = "<input id='StartAddStandard_" + row_index + "' class='w30' type='text' value='1' name='StartAddStandard" + row_index + "' />";
            var cel5 = trRow.insertCell(4);
            cel5.innerHTML = "<input id='StartAddFee_" + row_index + "' class='w30' type='text' name='StartAddFee" + row_index + "'/>";
            var cel6 = trRow.insertCell(5);
            cel6.innerHTML = "<div class='mod-operate'><div class='con style0editdel'><a name='de_" + row_index + "'  class='del' href='javascript:void(0)'  onclick=\"dlRow('trRow" + row_index + "')\"> 删除</a></div> </div>";
            var Rowsindex = 0;
            $("#myPressPaperTable tr").not("tr:eq(0)").each(function () {

                Rowsindex++;

                ISinputString("#StartStandard_" + Rowsindex + "");
                ISinputString("#StartFee_" + Rowsindex + "");
                ISinputString("#StartAddStandard_" + Rowsindex + "");
                ISinputString("#StartAddFee_" + Rowsindex + "");

            });

        }

        //删除行
        function dlRow(RowId) {

            var itemsCheckbox = $("#J_CityList :input[type='checkbox']");
            var deleteRow = document.getElementById(RowId).rowIndex;
            var items = "";
            var item = "";
            items = $("#edit" + deleteRow + "").parents("td").find("input[type='hidden']").val();
            document.getElementById("myPressPaperTable").deleteRow(deleteRow);
            //多选框解锁
            item = items.split(',');

            for (var i = 0; i < item.length; i++) {

                for (var j = 0; j < itemsCheckbox.length; j++) {

                    if (item[i] == itemsCheckbox[j].value) {
                        itemsCheckbox[j].disabled = false;
                    }
                }

            }

            //重新设置ID
            var index = 0;
            $("#myPressPaperTable tr:not(:first)").each(function () {
                index++;
                $("td:first a", $(this)).attr("id", "edit" + index);
                $("td:first input:eq(0)", $(this)).attr("name", "furniture_areas_n" + index);


                $("td:first input:eq(1)", $(this)).attr("name", "furniture_areas_name_n" + index);

                $("td:eq(1) input", $(this)).attr("name", "StartStandard" + index);
                $("td:eq(2) input", $(this)).attr("name", "StartFee" + index);
                $("td:eq(3) input", $(this)).attr("name", "StartAddStandard" + index);
                $("td:eq(4) input", $(this)).attr("name", "StartAddFee" + index);

                $("td:eq(1) input", $(this)).attr("id", "StartStandard_" + index);
                $("td:eq(2) input", $(this)).attr("id", "StartFee_" + index);
                $("td:eq(3) input", $(this)).attr("id", "StartAddStandard_" + index);
                $("td:eq(4) input", $(this)).attr("id", "StartAddFee_" + index);
            })
        }

        function Delect(ID) {
            if (ID !== undefined) {
                $.ajax({
                    type: "post",
                    async: false,
                    data: { id: ID },
                    url: "../../Dispatching/Delect",
                    success: function (data) {
                    }


                });

            }
        }

        //编辑
        function openBg(state, event) { //遮照打开关闭控制

            if (state == 1) {
                //浏览器兼容
                event = event ? event : window.event;
                var eventSrc = event.srcElement ? event.srcElement : event.target;
                $("#hidMakeSure").val($(eventSrc).attr("id"));
                $("#hidArea").val($(eventSrc).parents("td").find("input").attr("name"));
                $("#hidAreaName").val($(eventSrc).parents("td").find("input").next().attr("name"));
                //获取当前所选择
                var itemsCheckboxs = $(eventSrc).parents("td").find("input").val();
                var itemCheckbox = "";

                //获取所有的记录选择地区的ID
                var itemHidden = "";
                var items = $("#J_CityList input[type='checkbox']");
                var itemsHidden = $("#myPressPaperTable input[type='hidden']");

                for (var i = 0; i < itemsHidden.length; i++) {

                    itemHidden += itemsHidden[i].value + ",";
                }
                if (itemsHidden !== "") {

                    //判断是否选择是就禁用
                    var itemsHiddens = itemHidden.split(',');
                    for (var j = 0; j < itemsHiddens.length; j++) {
                        for (var i = 0; i < items.length; i++) {
                            if (itemsHiddens[j] == items[i].value) {
                                $(items[i]).attr("disabled", "disabled");
                                $(items[i]).attr("checked", false);
                            }
                        }
                    }
                }
                //判断是否是当前的选择如果是就解禁
                if (itemsCheckboxs !== undefined) {
                    if (itemsCheckboxs !== "") {
                        itemCheckbox = itemsCheckboxs.split(',');
                        for (var i = 0; i < itemCheckbox.length; i++) {
                            for (var j = 0; j < items.length; j++) {
                                if (itemCheckbox[i] == items[j].value) {
                                    $(items[j]).attr("disabled", false);
                                    $(items[j]).attr("checked", "checked");
                                }
                            }
                        }
                    }
                }
                document.getElementById("bg").style.display = "block";
                var h = document.body.offsetWidth > document.documentElement.offsetWidth ? document.body.offsetWidth : document.documentElement.offsetWidth;
                //alert(document.body.offsetHeight);
                //alert(document.documentElement.offsetHeight);

                document.getElementById("bg").style.height = h + "px";
            }
            else {


                document.getElementById("bg").style.display = "none";
            }
        }
        function openSelect(state) { //选择城市层关闭打开控制
            if (state == 1) {

                document.getElementById("selectItem").style.display = "block";

                document.getElementById("selectItem").style.left = (document.getElementById("bg").offsetWidth - document.getElementById("selectItem").offsetWidth) / 7 + "px";
                document.getElementById("selectItem").style.top = document.body.scrollTop + 420 + "px";
            }
            else {
                document.getElementById("selectItem").style.display = "none";
                $("#J_CityList input[type='checkbox']").each(function () {

                    if ($(this).attr("checked") == "checked") {
                        $(this).attr("checked", false);
                        $(this).attr("disabled", false);
                    }
                })
            }
        }




        $(function () {
            //动态添加地区显示
            $.ajax({
                type: "post",
                async: false,
                dataType: "json",
                url: "../../Dispatching/GetTransportation",
                success: function (data) {



                    //华东
                    var str = "";
                    //华北
                    var NorthChinaStr = "";
                    //华中
                    var CentralChinaStr = "";
                    //华南
                    var SouthChinaStr = "";
                    //东北
                    var NortheastStr = "";
                    //西北
                    var NorthwestStr = "";
                    //西南
                    var SouthwestStr = "";
                    //港澳台
                    var HongKongStr = "";
                    //子集
                    var city = "";
                    if (data != null) {
                        var j_group_0 = Split($("#J_Group_0"));
                        var j_group_1 = Split($("#J_Group_1"));
                        var j_group_2 = Split($("#J_Group_2"));
                        var j_group_3 = Split($("#J_Group_3"));
                        var j_group_4 = Split($("#J_Group_4"));
                        var j_group_5 = Split($("#J_Group_5"));
                        var j_group_6 = Split($("#J_Group_6"));
                        var j_group_7 = Split($("#J_Group_7"));


                        for (var j = 0; j < data.list.length; j++) {

                            for (var i = 0; i < j_group_0.length; i++) {
                                //华东

                                if (data.list[j].value == j_group_0[i]) {
                                    str += '<div class="ecity"><span class="gareas"><input  name="J_Group_0_Province"   id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"  ></span><div class="citys" id="citys_' + j_group_0[i] + '"></div></div>';



                                }


                            }

                            for (var i = 0; i < j_group_1.length; i++) {
                                //华北
                                if (data.list[j].value == j_group_1[i]) {
                                    NorthChinaStr += '<div class="ecity"><span class="gareas"><input name="J_Group_1_Province"  id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_1[i] + '"></div></div>';
                                }


                            }
                            for (var i = 0; i < j_group_2.length; i++) {
                                //华中
                                if (data.list[j].value == j_group_2[i]) {

                                    CentralChinaStr += '<div class="ecity"><span class="gareas"><input name="J_Group_2_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_2[i] + '"></div></div>';

                                }
                            }

                            for (var i = 0; i < j_group_3.length; i++) {
                                //华南
                                if (data.list[j].value == j_group_3[i]) {

                                    SouthChinaStr += '<div class="ecity"><span class="gareas"><input name="J_Group_3_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_3[i] + '"></div></div>';

                                }
                            }

                            for (var i = 0; i < j_group_4.length; i++) {
                                //东北
                                if (data.list[j].value == j_group_4[i]) {

                                    NortheastStr += '<div class="ecity"><span class="gareas"><input name="J_Group_4_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_4[i] + '"></div></div>';

                                }
                            }

                            for (var i = 0; i < j_group_5.length; i++) {
                                //西北
                                if (data.list[j].value == j_group_5[i]) {

                                    NorthwestStr += '<div class="ecity"><span class="gareas"><input name="J_Group_5_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_5[i] + '"></div></div>';

                                }
                            }

                            for (var i = 0; i < j_group_6.length; i++) {
                                //西南
                                if (data.list[j].value == j_group_6[i]) {

                                    SouthwestStr += '<div class="ecity"><span class="gareas"><input name="J_Group_6_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_6[i] + '"></div></div>';

                                }
                            }

                            for (var i = 0; i < j_group_7.length; i++) {
                                //港澳台
                                if (data.list[j].value == j_group_7[i]) {

                                    HongKongStr += '<div class="ecity"><span class="gareas"><input name="J_Group_7_Province" id="J_Province_' + data.list[j].value + '" class="J_Province" type="checkbox" lang="' + data.list[j].text + '" value="' + data.list[j].value + '"><label for="J_Province_' + data.list[j].value + '">' + data.list[j].text + '</label><span class="check_num"></span><img class="trigger" src="http://img01.taobaocdn.com/tps/i1/T1XZCWXd8iXXXXXXXX-8-8.gif"></span><div class="citys" id="citys_' + j_group_7[i] + '"></div></div>';

                                }
                            }

                        }

                        $("#J_CityList li:eq(0) .clearfix .province-list").append(str);
                        $("#J_CityList li:eq(1) .clearfix .province-list").append(NorthChinaStr);
                        $("#J_CityList li:eq(2) .clearfix .province-list").append(CentralChinaStr);
                        $("#J_CityList li:eq(3) .clearfix .province-list").append(SouthChinaStr);
                        $("#J_CityList li:eq(4) .clearfix .province-list").append(NortheastStr);
                        $("#J_CityList li:eq(5) .clearfix .province-list").append(NorthwestStr);
                        $("#J_CityList li:eq(6) .clearfix .province-list").append(SouthwestStr);
                        $("#J_CityList li:eq(7) .clearfix .province-list").append(HongKongStr);
                    }
                    //遍历子集
                    var city;
                    var item = $(".province-list .ecity .gareas input");

                    for (var i = 0; i < item.length; i++) {
                        for (var j = 0; j < data.list.length; j++) {

                            if (item[i].value == data.list[j].value) {
                                //清空
                                city = "";

                                for (var c = 0; c < data.list[j].citylist.length; c++) {
                                    //alert(data.list[j].citylist[c].text);

                                    city += '<span class="areas"> <input lang="' + data.list[j].citylist[c].text + '" value="' + data.list[j].citylist[c].value + '" id="J_City_' + data.list[j].citylist[c].value + '" name="J_City_' + data.list[j].citylist[c].value + '" class="J_City" type="checkbox"><label for="J_City_' + data.list[j].citylist[c].value + '">' + data.list[j].citylist[c].text + '</label></span>';
                                }

                            }

                        }

                        city += '<p style="text-align:right;"><input class="close_button" type="button" value="关闭"></p>';
                        $("#citys_" + item[i].value + "").append(city);
                    }

                }



            });
            //判断是否显示
            $(".trigger").click(function () {

                var item = $(".province-list .ecity .gareas input");
                var province_list = $(".province-list .ecity");
                if ($(this).parent().next().css("display") == "block") {
                    for (var i = 0; i < item.length; i++) {
                        $("#citys_" + item[i].value + "").css("display", "none")
                    }
                    for (var i = 0; i < province_list.length; i++) {
                        $(province_list[i]).removeClass("showCityPop");
                    }

                    $(this).parent().next().css("display", "none");
                    $(this).parent().parent().removeClass("showCityPop");
                }

                else {
                    for (var i = 0; i < item.length; i++) {
                        $("#citys_" + item[i].value + "").css("display", "none")
                    }
                    for (var i = 0; i < province_list.length; i++) {
                        $(province_list[i]).removeClass("showCityPop");
                    }
                    $(this).parent().parent().addClass("showCityPop");
                    $(this).parent().next().css("display", "block")

                }

            })
            //关闭按钮
            $(".close_button").click(function () {
                $(this).parent().parent().css("display", "none");
                $(this).parent().parent().parent().removeClass("showCityPop");

            })
            //全部省市华东
            $("[name='J_Group_0_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })

            //全部省市华北
            $("[name='J_Group_1_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })

            //全部省市华中
            $("[name='J_Group_2_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })

            //全部省市华南
            $("[name='J_Group_3_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })
            //全部省市东北
            $("[name='J_Group_4_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })



            //全部省市西北
            $("[name='J_Group_5_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })

            //全部省市西南
            $("[name='J_Group_6_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })
            //全部省市港澳台
            $("[name='J_Group_7_Province']").each(function () {
                $(this).change(function () {
                    if ($(this).attr("checked") === "checked") {

                        var citys = $("#citys_" + $(this).val() + " .areas input");

                        for (var i = 0; i < citys.length; i++) {
                            if ($(citys[i]).attr("disabled") === undefined || $(citys[i]).attr("disabled") === false) {

                                $(citys[i]).attr("checked", true);
                            }


                        }

                    }
                    else { $("#citys_" + $(this).val() + " .areas input").attr("checked", false); }
                });
            })



            //华东
            $("[name='J_Group_0']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_0_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_0_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_0_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_0_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })
            //华北
            $("[name='J_Group_1']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_1_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_1_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_1_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_1_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })

            //华中
            $("[name='J_Group_2']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_2_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_2_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_2_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_2_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })



            //华南
            $("[name='J_Group_3']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_3_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_3_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_3_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_3_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })


            //东北
            $("[name='J_Group_4']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_4_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_4_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_4_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_4_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })


            //西北
            $("[name='J_Group_5']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_5_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_5_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_5_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_5_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })

            //西南
            $("[name='J_Group_6']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_6_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_6_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_6_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_6_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })

            //港台澳
            $("[name='J_Group_7']").change(function () {
                if ($(this).attr("checked") === "checked") {
                    $("[name='J_Group_7_Province']").each(function () {

                        if ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false) {

                            $(this).attr("checked", true);
                        }

                        else { $(this).attr("checked", false); }



                        //全部省市
                        $("[name='J_Group_7_Province']").each(function () {
                            $("#citys_" + $(this).val() + " .areas input").each(function () {
                                if ($(this).attr("disabled") == undefined || $("#citys_" + $(this).val() + " .areas input").attr("disabled") == false) {
                                    $(this).attr("checked", true);

                                }
                                else { $(this).attr("checked", false); }

                            });

                        })

                    })
                }
                else {
                    $("[name='J_Group_7_Province']").attr("checked", false);
                    //全部省市
                    $("[name='J_Group_7_Province']").each(function () {
                        $("#citys_" + $(this).val() + " .areas input").attr("checked", false);
                    });

                }
            })

        })
        //字符截取
        function Split(group) {
            var j_group = group.val().split(',');
            return j_group;
        }
        //地区选择点击确定
        function makeSure() {
            //alert(1);
            //$("makeSureItem").innerHTML = $("previewItem").innerHTML;
            var makeSure = $("#hidMakeSure").val()
            var hidArea = $("#hidArea").val();
            var hidAreaName = $("#hidAreaName").val();
            //添加地区显示到表格
            var items = $("#J_CityList .clearfix .province-list :input[type='checkbox']");

            var values = "";
            var text = "";
            for (var i = 0; i < items.length; i++) {
                if (items[i].checked === true) {

                    values += items[i].value + ",";
                    text += items[i].lang + "、";


                }
            }

            if (text != "") {

                //furniture_areas_name_n

                $("#" + makeSure + "").parent().parent().prev("div").text(text.substring(0, text.length - 1));

                $("[name='" + hidAreaName + "']").val(text.substring(0, values.length - 1));
                $("[name='" + hidArea + "']").val(values.substring(0, values.length - 1));
            }

            openBg(0, "event");
            openSelect(0);

        }
        $(function () {

            ISinputString("#NumberStartFee");
            ISinputString("#NumberAddFee");
            onlyNum("#NumberStartStandard");
            onlyNum("#NumberAddStandard");
            ISinputString("#InsuranceFee");
            ISinputString("#InsuranceRate");
            var Rowsindex = 0;
            $("#myPressPaperTable tr").not("tr:eq(0)").each(function () {

                Rowsindex++;

                ISinputString("#StartStandard_" + Rowsindex + "");
                ISinputString("#StartFee_" + Rowsindex + "");
                ISinputString("#StartAddStandard_" + Rowsindex + "");
                ISinputString("#StartAddFee_" + Rowsindex + "");

            });

            //            $("#input").keydown(function (event) {
            //                var keyCode = event.which;
            //                if (keyCode == 46 || keyCode == 8 || keyCode == 190 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 110) {
            //                    return true;
            //                } else { return false }
            //            }).focus(function () {
            //                this.style.imeMode = 'disabled';
            //            });
        });
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
        //文本框只能输入数字，不能输入小数点和字母 by john
        function onlyNum(input) {
            $(input).keydown(function (event) {
                var keyCode = event.which;
                if (keyCode == 46 || keyCode == 8 || keyCode == 37 || keyCode == 39 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105))
                { return true; }
                else { return false }
            }).focus(function ()
            { this.style.imeMode = 'disabled'; });
        }

        function AjaxFrom() {


            if ($("#TextName").val() == "") {
                $(".prompt", $("#TextName").parent().parent()).text("请输入运费模板");
                $("#TextName").focus();
                return false;
            }
            else if ($("#AddressType").val() == "0") {
                $(".prompt").text("");

                $(".prompt", $("#AddressType").parent().parent()).text("请选择物流公司");
                $("#AddressType").focus();
                return false;

            }
            else if ($("#LogisticsAddress").val() == "0") {
                $(".prompt").text("");

                $(".prompt", $("#LogisticsAddress").parent().parent()).text("请选择发货地址");
                $("#LogisticsAddress").focus();
                return false;

            }

            if ($("#checkbox03").prop("checked")) {

                if ($("#InsuranceRate").val() == "") {
                    $(".prompt").text("");

                    $(".prompt", $("#InsuranceRate").parent().parent()).text("费率不能为空");
                    $("#InsuranceRate").focus();
                    return false;

                }

                else if ($("#InsuranceFee").val() == "") {
                    $(".prompt").text("");

                    $(".prompt", $("#InsuranceFee").parent().parent()).text("最低保费不能为空");
                    $("#InsuranceFee").focus();
                    return false;

                }
                else if (isNaN($("#InsuranceFee").val())) {
                    $(".prompt").text("");

                    $(".prompt", $("#InsuranceFee").parent().parent()).text("请输入数字类型");
                    $("#InsuranceFee").focus();
                    return false;
                }
                else if (isNaN($("#InsuranceRate").val())) {

                    $(".prompt").text("");

                    $(".prompt", $("#InsuranceRate").parent().parent()).text("请输入数字类型");
                    $("#InsuranceRate").focus();
                    return false;
                }

            }

            if ($("#NumberStartStandard").val() == "") {
                $(".prompt").text("");

                $("#spMessage").text("请输入默认运费");
                $("#NumberStartStandard").focus();
                return false;
            }

            else if (isNaN($("#NumberStartStandard").val())) {
                $(".prompt").text("");

                $("#spMessage").text("请输入数字类型");
                $("#NumberStartStandard").focus();
                return false;
            }

            else if ($("#NumberStartFee").val() == "") {

                $(".prompt").text("");

                $("#spMessage").text("请输入费用");
                $("#NumberStartFee").focus();
                return false;

            }

            else if (isNaN($("#NumberStartFee").val())) {

                $(".prompt").text("");

                $("#spMessage").text("请输入数字类型");
                $("#NumberStartFee").focus();
                return false;

            }
            else if ($("#NumberAddStandard").val() == "") {
                $(".prompt").text("");

                $("#spMessage").text("请输入续件数");
                $("#NumberAddStandard").focus();
                return false;

            }
            else if (isNaN($("#NumberAddStandard").val())) {

                $(".prompt").text("");

                $("#spMessage").text("请输入数字类型");
                $("#NumberAddStandard").focus();
                return false;

            }


            else if ($("#NumberAddFee").val() == "") {
                $(".prompt").text("");

                $("#spMessage").text("请输入续费");
                $("#NumberAddFee").focus();
                return false;

            }
            else if (isNaN($("#NumberAddFee").val())) {

                $(".prompt").text("");

                $("#spMessage").text("请输入数字类型");
                $("#NumberAddFee").focus();
                return false;


            }

            if ($("#tbl-except").css("display") == "block") {
                var Rowsindex = 0;
                var IsNull = true;
                $("#myPressPaperTable tr").not("tr:eq(0)").each(function () {

                    Rowsindex++;
                    if ($("[name='furniture_areas_n" + Rowsindex + "']").val() == "") {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请选择地区");
                        IsNull = false;
                    }

                    else if ($("[name='StartStandard" + Rowsindex + "']").val() == "") {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入文本");
                        $("[name='StartStandard" + Rowsindex + "']").focus();
                        IsNull = false;
                    }

                    else if (isNaN($("[name='StartStandard" + Rowsindex + "']").val())) {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入数字类型");
                        $("[name='StartStandard" + Rowsindex + "']").focus();
                        IsNull = false;
                    }


                    else if ($("[name='StartFee" + Rowsindex + "']").val() == "") {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入文本");
                        $("[name='StartFee" + Rowsindex + "']").focus();
                        IsNull = false;
                    }
                    else if (isNaN($("[name='StartFee" + Rowsindex + "']").val())) {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入数字类型");
                        $("[name='StartFee" + Rowsindex + "']").focus();
                        IsNull = false;
                    }

                    else if ($("[name='StartAddStandard" + Rowsindex + "']").val() == "") {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入文本");
                        $("[name='StartAddStandard" + Rowsindex + "']").focus();
                        IsNull = false;
                    }

                    else if (isNaN($("[name='StartAddStandard" + Rowsindex + "']").val())) {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入数字类型");
                        $("[name='StartAddStandard" + Rowsindex + "']").focus();
                        IsNull = false;
                    }
                    else if ($("[name='StartAddFee" + Rowsindex + "']").val() == "") {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入文本");
                        $("[name='StartAddFee" + Rowsindex + "']").focus();
                        IsNull = false;
                    }

                    else if (isNaN($("[name='StartAddFee" + Rowsindex + "']").val())) {
                        $(".prompt").text("");

                        $("#tbl-except p .spMessage").text("请输入数字类型");
                        $("[name='StartAddFee" + Rowsindex + "']").focus();
                        IsNull = false;
                    }
                });

                if (IsNull) {

                    return true;
                }
                else { return false; }

            }
        }

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "../../Dispatching/Transportation";
        };
        function afterOnSuccess() {
            if ($("#HidUpdateTargetId").html() == "ok") {
                $(".Loading").removeClass("style03 style02").addClass("style01"); //黄色
                $("#operateTip").html("修改成功！").change();
                //window.location.href = "../../Dispatching/Transportation?appCode=PLATFORM&MenuCode=C420";
                GoToLinkUrl("", "../../Dispatching/Transportation");
            }
            else if ($("#HidUpdateTargetId").html() == "repeat") {

                $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
                $("#operateTip").html("不能修改重复的运费模板名称！").change();
                return;

            }


        }
        function afterOnFailure() {
            $(".Loading").removeClass("style01 style02").addClass("style03");
            $("#operateTip").html("修改失败！").change();
        }

        //加载物流公司
        $(function () {

            var addressType = $("#AddressType")[0];
            for (var i = addressType.length - 1; i >= 0; i--)
                addressType.options[i] = null;
            var opt = new Option("请选择物流公司", "0");
            addressType.options.add(opt);
            $.ajax({
                type: "post",
                url: "../../Dispatching/GetDespatchingLogistics",
                dataType: "json",
                data: "oper=getType",
                success: function (data) {
                    if (data != null && data.list.length > 0) {
                        for (var i = 0; i < data.list.length; i++) {
                            var opt = new Option(data.list[i].text, data.list[i].value);
                            addressType.options.add(opt);
                            var values = $("#hidLogistics").val();

                            if (data.list[i].value == values) {
                                opt.selected = true;
                            }
                        }
                    }
                }
            });
            $("#AddressType").change(function () {
                var Logistics = $("#AddressType").find("option:selected").val();
                //$("#hiddenLogistics").val(Logistics);
            });
            var LogisticsAddress = $("#LogisticsAddress")[0];
            //                        for (var i = LogisticsAddress.length - 1; i >= 0; i--)
            //                            LogisticsAddress.options[i] = null;
            //                        var opt = new Option("请选择物流公司", "0");
            //                        LogisticsAddress.options.add(opt);
            $.ajax({
                type: "post",
                url: "../../Dispatching/GetLogisticsAddress",
                dataType: "json",

                success: function (data) {
                    if (data != null && data.list.length > 0) {
                        for (var i = 0; i < data.list.length; i++) {
                            var opt = new Option(data.list[i].text, data.list[i].value);
                            LogisticsAddress.options.add(opt);

                            if ($("#").val() == data.list[i].value) {

                                opt.selected = true;
                            }

                        }
                    }
                }
            });
        });

        $(function () {

            $("#uEnableInsurance").change(function () {

                if ($(this).attr("checked") == "checked") {

                    $("#divEnable").css("display", "block");


                }
                else { $("#divEnable").css("display", "none"); }

            })

            $("#aEnableInsurance").change(function () {

                if ($(this).attr("checked") == "checked") {

                    $("#divEnable1").css("display", "block");


                }
                else { $("#divEnable1").css("display", "none"); }

            })

        })

       

    </script>
</asp:Content>
