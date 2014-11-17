<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <!--KindEitor所需样式-->
    <link href="../../../Scripts/KindEditor/Editor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=product"></script>
    <%--<link href="../../../Content/Css/css4.0/product.css" rel="stylesheet" type="text/css" />--%>
    <%-- <link href="../../../Content/Css/controls/css/Controls.css" rel="stylesheet" type="text/css" />--%>

    <script src="../../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title">
        <div class="con style0h1">
            <h1 id="addProductFlag" class="spanTitle"></h1>
            <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
            <script type="text/javascript">
                var appCode = GetUrlAppCode();
                var menuCode = GetUrlMenuCode();
                $("#goBack").attr("href", "../../Product/index?appCode=" + appCode + "&MenuCode=" + menuCode + "");
            </script>
        </div>
    </div>
    <!--title end-->
    <!--tab begin-->
    <div class="mod-tab">
        <div class="con style0big">
            <div class="">
                <!--“分销商城”、“淘宝一店”不可用时加 class="unable"-->
                <ul id="ulImpowerChannel">
                    <li id="liBaseData" class="current"><a href="javascript:void(0);" class="c16" title="平台商品">
                        <i class="icon-platform float-l"></i><span>平台商品</span></a><input type='hidden' value='PLATFORM' /></li>
                    <%--<li id="liFenxiaoData" class="unable"><a href="javascript:void(0);" title="分销商城"><i
                        class="icon-fenxiao03 float-l"></i><span>分销商城</span></a><input type='hidden' value='C002' /></li><!--图标变亮class="icon-fenxiao"变灰class="icon-fenxiao03"-->--%>
                </ul>
            </div>
        </div>
    </div>
    <!--tab end-->
    <div class="mod-form t20">
        <div class="con style0page">
            <!--baseInfo begin-->
            <div id="baseInfoContainer">
                <input id="hiddenProductID" type="hidden" name="name" value="" />
                <input id="hiddenTBPID" type="hidden" name="name" value="" />
                <input id="hiddenProductCategoryID" type="hidden" name="name" value="" />
                <input id="hiddenSEOTitle" type="hidden" name="name" value="" />
                <input id="hiddenKeyword" type="hidden" name="name" value="" />
                <input id="hiddenSEOKeyword" type="hidden" name="name" value="" />
                <input id="hiddenSEODescription" type="hidden" name="name" value="" />
                <input id="hiddenTBNO" type="hidden" name="name" value="" />
                <input id="hiddenTBView" type="hidden" name="name" value="" />
                <input id="hiddenLocalView" type="hidden" name="name" value="" />
                <input id="hiddenProductNo" type="hidden" name="name" value="" />
                <ul class="list-ul">
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>商品类目</label>
                        </div>
                        <div class="float-l">
                            <input id="txtProductCategory" type="text" class="w230" name="name" value="" readonly="readonly" />
                        </div>
                        <div class="float-l">
                            <a href="javascript:void(0)" id="spEdit" class="btn-gradient-blue">编 辑</a>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                商品标题</label>
                        </div>
                        <div class="float-l">
                            <input id="txtProductTitle" type="text" class="w230" name="name" value="" maxlength="49">
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                成本价</label>
                        </div>
                        <div class="float-l">
                            <input id="txtProductCostPrice" type="text" class="w230" name="name" value=""><span
                                class="unit">元</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                零售价</label>
                        </div>
                        <div class="float-l">
                            <input id="txtProductPriceA" type="text" class="w230" name="name" value=""><span
                                class="unit">元</span>
                            <input id="hiddenSalePrice" type="hidden" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li" style="display: none;">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                产品线</label>
                        </div>
                        <div class="float-l">
                            <select id="slProductLine" class="w230" onchange="SelectThisProductLine(event)">
                                <option value="default"></option>
                            </select>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li" style="display: none;">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                经销商采购价</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtJingxiaoA" type="text" name="name" value="" /><span class="unit">元</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li" style="display: none;">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                代销商采购价</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtDaixiaoA" type="text" name="name" value="" /><span class="unit">元</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li" style="display: none;">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                建议零售价</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtLingshouA" type="text" name="name" value="" readonly="readonly" /><span
                                class="unit">元</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li" style="display: none;">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                享经销价最小购买</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtJingxiaoMinCount" type="text" name="name" value="" /><span
                                class="unit">件</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span id="spStereMes" class="star"></span>
                            <label>
                                物流体积</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtStere" type="text" name="name" value="" /><span class="unit">立方米</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span id="spKilogramMes" class="star"></span>
                            <label>
                                物流重量</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="txtKilogram" type="text" name="name" value="" /><span class="unit">千克</span>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                </ul>
            </div>
            <!--baseInfo end-->
            <!--propertyAndSpec begin-->
            <div id="propertyAndSpecContainer" style="clear: both;">
                <ul class="list-ul" id="propertyContainer">
                </ul>
                <ul class="list-ul" id="foodSecurityContainer" style="display: none;">
                    <li class="list-li">
                        <input class="w230" id="hiddenFoodSecurityID" type="hidden" name="name" value="" />
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                生产许可证编号</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityProductionLicenseNo" type="text" name="name"
                                value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                产品标准号</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityProductionNo" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                厂名</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityFactoryName" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                厂址</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityFactoryAddress" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                厂家联系方式</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityFactoryTel" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                配料表</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityBurdenSheet" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                储藏方法</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityStorageMethod" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                保质期</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityGuaranteePeriod" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                食品添加剂</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecurityFoodAdditives" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                供货商</label>
                        </div>
                        <div class="float-l">
                            <input class="w230" id="foodSecuritySupplier" type="text" name="name" value="" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                生产日期</label>
                        </div>
                        <div class="float-l">
                            <input class="w230 Wdate" id="foodSecurityProduceDateStart" type="text" name="name"
                                value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />&nbsp;~&nbsp;<input class="w230 Wdate"
                                    id="foodSecurityProduceDateEnd" type="text" name="name" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star" style=""></span>
                            <label>
                                进货日期</label>
                        </div>
                        <div class="float-l">
                            <input class="w230 Wdate" id="foodSecurityPurchaseDateStart" type="text" name="name"
                                value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />&nbsp;~&nbsp;<input class="w230 Wdate"
                                    id="foodSecurityPurchaseDateEnd" type="text" name="name" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                </ul>
                <div class="specContainer" style="display: none;">
                    <!--这里的class是一个容器标记，名字和 id="specContainer" 相同，下面的也是类似-->
                    <ul class="list-ul" id="specContainer">
                    </ul>
                    <%-- 暂时没有做规格的颜色预览功能--%>
                    <%--  <div style="clear: both; margin-left: 130px;">
                            <table id="specColorTable" border="0" cellpadding="0" cellspacing="0" style="display: none;">
                                <tr>
                                    <td style="width: 120px;">
                                        颜色
                                    </td>
                                    <td>
                                        图片（无图片可不填）
                                    </td>
                                </tr>
                            </table>
                        </div>--%>
                    <ul class="list-ul" style="display: none;">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star" style=""></span>
                                <label>
                                </label>
                            </div>
                            <div class="float-l">
                                <table class="specCombineTable" style="display: none;">
                                    <tr style="background-color: #e6e6e6;">
                                    </tr>
                                </table>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="specContainerForDestribution" style="display: none;">
                    <ul class="list-ul" id="specContainerForDestribution">
                    </ul>
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star" style=""></span>
                                <label>
                                </label>
                            </div>
                            <div class="float-l">
                                <table class="specCombineTable" style="display: none;">
                                    <tr style="background-color: #e6e6e6;">
                                    </tr>
                                </table>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="specContainerForTaobao" style="display: none;">
                    <ul class="list-ul" id="specContainerForTaobao">
                    </ul>
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star" style=""></span>
                                <label>
                                </label>
                            </div>
                            <div class="float-l">
                                <table class="specCombineTable" style="display: none;">
                                    <tr style="background-color: #e6e6e6;">
                                    </tr>
                                </table>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--propertyAndSpec end-->
            <!--extendInfo begin-->
            <ul class="list-ul" id="extendInfoContainer">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            商品数量</label>
                    </div>
                    <div class="float-l">
                        <input class="w230" id="txtProductCount" type="text" name="name" value="" /><span
                            class="unit">件</span>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            商家编码</label>
                    </div>
                    <div class="float-l">
                        <input class="w230" id="txtProductCodeA" type="text" name="name" value="" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            商品图片</label>
                    </div>
                    <div class="float-l">
                        <div id="upImgDiv" style="height: 135px; width: 550px;">
                            <div id="uploadImgUpload">
                                <div class="uploadImgItem">
                                    <div class="uploadImgItemPreview">
                                        <div class="previewContainer">
                                            <img id="file_upload_img_1" src="../../Images/Default.png" alt="商品图片" onload="DrawImage(this,90,90)"
                                                style="display: block; margin: 0 auto" />
                                        </div>
                                        <div class="operateImg">
                                            <div sort="left">
                                                ←
                                            </div>
                                            <div sort="right">
                                                →
                                            </div>
                                            <div sort="delete">
                                                ×
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uploadImgBtn">
                                        <button class="uploadButton" style="width: 92px;">
                                            选择</button>
                                        <input class="w230" id="file_upload_1" type="file" name="file_upload" value=" " onchange="UploadImage(event)"
                                            class="uploadInputFile" style="position: absolute; left: 0; top: 0; width: 92px; filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0;" />
                                    </div>
                                </div>
                                <div class="uploadImgItem">
                                    <div class="uploadImgItemPreview">
                                        <div class="previewContainer">
                                            <img id="file_upload_img_2" src="../../Images/Default.png" alt="商品图片" onload="DrawImage(this,90,90)"
                                                style="display: block; margin: 0 auto" />
                                        </div>
                                        <div class="operateImg">
                                            <div sort="left">
                                                ←
                                            </div>
                                            <div sort="right">
                                                →
                                            </div>
                                            <div sort="delete">
                                                ×
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uploadImgBtn">
                                        <button class="uploadButton" style="width: 92px;">
                                            选择</button>
                                        <input class="w230" id="file_upload_2" type="file" name="file_upload" value=" " onchange="UploadImage(event)"
                                            class="uploadInputFile" style="position: absolute; left: 0; top: 0; width: 92px; filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0;" />
                                    </div>
                                </div>
                                <div class="uploadImgItem">
                                    <div class="uploadImgItemPreview">
                                        <div class="previewContainer">
                                            <img id="file_upload_img_3" src="../../Images/Default.png" alt="商品图片" onload="DrawImage(this,90,90)"
                                                style="display: block; margin: 0 auto" />
                                        </div>
                                        <div class="operateImg">
                                            <div sort="left">
                                                ←
                                            </div>
                                            <div sort="right">
                                                →
                                            </div>
                                            <div sort="delete">
                                                ×
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uploadImgBtn">
                                        <button class="uploadButton" style="width: 92px;">
                                            选择</button>
                                        <input class="w230" id="file_upload_3" type="file" name="file_upload" value=" " onchange="UploadImage(event)"
                                            class="uploadInputFile" style="position: absolute; left: 0; top: 0; width: 92px; filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0;" />
                                    </div>
                                </div>
                                <div class="uploadImgItem">
                                    <div class="uploadImgItemPreview">
                                        <div class="previewContainer">
                                            <img id="file_upload_img_4" src="../../Images/Default.png" alt="商品图片" onload="DrawImage(this,90,90)"
                                                style="display: block; margin: 0 auto" />
                                        </div>
                                        <div class="operateImg">
                                            <div sort="left">
                                                ←
                                            </div>
                                            <div sort="right">
                                                →
                                            </div>
                                            <div sort="delete">
                                                ×
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uploadImgBtn">
                                        <button class="uploadButton" style="width: 92px;">
                                            选择</button>
                                        <input class="w230" id="file_upload_4" type="file" name="file_upload" value=" " onchange="UploadImage(event)"
                                            class="uploadInputFile" style="position: absolute; left: 0; top: 0; width: 92px; filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0;" />
                                    </div>
                                </div>
                                <div class="uploadImgItem">
                                    <div class="uploadImgItemPreview">
                                        <div class="previewContainer">
                                            <img id="file_upload_img_5" src="../../Images/Default.png" alt="商品图片" onload="DrawImage(this,90,90)"
                                                style="display: block; margin: 0 auto" />
                                        </div>
                                        <div class="operateImg">
                                            <div sort="left">
                                                ←
                                            </div>
                                            <div sort="right">
                                                →
                                            </div>
                                            <div sort="delete">
                                                ×
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uploadImgBtn">
                                        <button class="uploadButton" style="width: 92px;">
                                            选择</button>
                                        <input class="w230" id="file_upload_5" type="file" name="file_upload" value=" " onchange="UploadImage(event)"
                                            class="uploadInputFile" style="position: absolute; left: 0; top: 0; width: 92px; filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="float-l t100">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            商品描述</label>
                    </div>
                    <div class="float-l">
                        <div id="discripContainer">
                            <textarea id="tareaProductDiscrip" name="discripArea" style="width: 900px; height: 200px;"></textarea>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="dvProductInCategory" style="display: none;">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            店铺类目</label>
                    </div>
                    <div class="float-l">
                        <div id="dvProductInCategoryContainer" style="float: left; width: 700px; height: 140px; border: 1px solid #cccccc; overflow-y: auto;">
                            <ul>
                            </ul>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            所在地</label>
                    </div>
                    <div class="float-l">
                        <select id="slProvince" class="width:100px" style="margin-top: 0px;">
                        </select>&nbsp;
                        <select id="slCity" class="width:100px" style="margin-top: 0px;">
                            <option>-请选择-</option>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="dvDelivery">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            运费</label>
                    </div>
                    <div class="float-l">
                        <input type="radio" checked="checked" id="fare01" name="radio02" />
                        <label class="r25 l5 c01-1" for="fare01">
                            卖家承担运费</label>
                        <input type="radio" id="fare02" name="radio02" />
                        <label for="fare02" class="l5 c01-1">
                            买家承担运费</label>
                    </div>
                    <div class="mod-box  clear l130">
                        <div id="dvDeliveryFee" class="con style0bg" style="margin-right: 20px;">
                            <input type="radio" checked="checked" name="yf" id="yf01" />
                            <label for="yf01" class="l5 c01-1">
                                使用运费模板</label>
                            <br />
                            <div class="l20 b10">
                                <select id="deliverySelect" class="v5-select">
                                    <option>请选择...</option>
                                </select><span class="prompt"></span>
                            </div>
                            <div id="deliveryFeeContainer">
                            </div>
                            <input type="radio" name="yf" id="yf02" style="display: none;" />
                            <label for="yf02" style="display: none;">
                                平邮：</label>
                            <input class="w230" id="txtPostFee" type="text" class="v5-input in80" value="5" style="display: none;" />
                            <label class="r15" style="display: none;">
                                元</label>
                            <label for="yf02" style="display: none;">
                                快递：</label>
                            <input class="w230" id="txtExpressFee" type="text" class="v5-input in80" value="5"
                                style="display: none;" />
                            <label class="r15" style="display: none;">
                                元</label>
                            <label for="yf02" style="display: none;">
                                EMS：</label>
                            <input class="w230" id="txtEmsFee" type="text" class="v5-input in80" value="5" style="display: none;" />
                            <label class="r15" style="display: none;">
                                元</label>
                        </div>
                    </div>
                </li>
                <li class="list-li" style="display: none;">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            售后</label>
                    </div>
                    <div class="float-l">
                        <input type="checkbox" id="cbxFapiao" />
                        <label for="checkbox01" class="r25">
                            发票</label>
                        <input type="checkbox" id="cbxBaoxiu" />
                        <label for="checkbox02" class="r25">
                            保修</label>
                        <input type="checkbox" id="cbxTuihuo" />
                        <label for="checkbox03" class="r25">
                            退换货承诺</label>
                        <input type="checkbox" id="cbxDazhe" />
                        <label for="checkbox04" class="r25">
                            参与会员打折</label>
                        <input type="checkbox" id="cbxTuijian" />
                        <label for="checkbox05" class="r25">
                            橱窗推荐</label>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" style="display: none;">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            开始时间</label>
                    </div>
                    <div class="float-l" id="dvStartSellTime">
                        <div style="height: 30px; line-height: 30px;">
                            <label>
                                <input id="startSellRightnow" type="radio" name="startSellTime" value="1" checked="checked" />立刻
                            </label>
                        </div>
                        <div style="height: 30px; line-height: 30px;">
                            <div style="float: left; clear: both;">
                                <label>
                                    <input id="settingStartSellTime" type="radio" name="startSellTime" value="2" />设定</label>
                            </div>
                            &nbsp;
                            <select id="settingDateDay" class="width:150px">
                            </select>&nbsp;<select id="settingDateHour" class="width:100px"></select>&nbsp;<select
                                id="settingDateMinite" class="width:100px"></select>
                        </div>
                        <div style="height: 30px; line-height: 30px; clear: both;">
                            <label>
                                <input id="noStartSellTime" type="radio" name="startSellTime" value="3" />放入仓库</label>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="rapidRelease">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            <input type="checkbox" id="rapid-check" style="display: none;" /><span class="c01-1 l5">快速发布</span></label>
                    </div>
                    <div class="float-l">
                        <dl id="rapid-form">
                            <dd id="ddImpowerChannel" class="rapidPublishShop"></dd>
                            <dd id="ddPriceInfo"></dd>
                        </dl>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!--extendInfo end-->
            <!--button begin-->
            <div class="l130 t20 b20">
                <button class="submit01" onclick="SubmitProductInfo()" id="btnSave">
                    保存</button>
                <button class="submit01" id="btnPublishToDestribution" style="display: none;">
                    发布到分销</button>
                <button class="submit01" id="btnPublishToTaobao" style="display: none;">
                    发布到淘宝</button>
            </div>
            <!--button end-->
        </div>
    </div>
    <!--类目选择的Div （用作弹层）-->
    <div>
        <div id="dvCategorySelect" class="content" style="display: none"></div>
    </div>
    <script src="../../Scripts/Js/createSelectCategory.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/GetProperty.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ProductView.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/toggle.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/SetProductPriceRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/SetOnSaleRequest.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ChannelItemView.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/deliveryTemplateView.js" type="text/javascript"></script>
    <!--发布到淘宝的运费模板js实体-->
    <script src="../../Scripts/Js/ShopCategory.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/addProductValidate.js" type="text/javascript"></script>
    <script src="../../Scripts/datepicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/CheckBrowser.js" type="text/javascript"></script>
    <script src="../../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
    <script type="text/javascript">
        //为了兼容高版本webkit内核浏览器，此处不能读取缓存，故采用加随机数方式引入脚本
        document.write("<s" + "cript type='text/javascript' src='../../Scripts/KindEditor/Editor/kindeditor-min.js?" + Math.random() + "'></s" + "cript>");
    </script>
    <script type="text/javascript">
        var browserVer = GetIEVersion(); //判断IE浏览器版本
        //加载授权店铺 不必等待页面加载完毕
        $.ajax({
            url: "../../Product/GetImpowerChannel",
            type: "get",
            async: false,
            success: function (res) {
                var jsonRes = JSON.parse(res);
                for (var i = 0; i < jsonRes.length; i++) {
                    if (jsonRes[i].Code != "C002" && jsonRes[i].Code != "C001") {
                        var impowerChannel = $("<li class='liTaobaoData' class='unable'><a title='" + jsonRes[i].Title + "'><i class='icon-taobao03 t11'></i>" + jsonRes[i].Title + "</a><input type='hidden' value='" + jsonRes[i].Code + "'/></li>");
                        $("#ulImpowerChannel").append(impowerChannel);
                        //break;
                    } else if (jsonRes[i].Code == "C001") {
                        var impowerChannel = $("<li class='liZhiyingData' class='unable'><a title='" + jsonRes[i].Title + "'><i class='icon-wechat03 t11'></i>" + jsonRes[i].Title + "</a><input type='hidden' value='" + jsonRes[i].Code + "'/></li>");
                        $("#ulImpowerChannel").append(impowerChannel);
                    }
                }
                //设置tab的宽度（自适应，不换行）
                var tabsCount = jsonRes.length + 1;
                $("#ulImpowerChannel li").css("width", 100 / tabsCount + "%");
            },
            error: function () {
            }
        });



        var url = window.location.href;
        var parameter = url.substring(url.indexOf('?') + 1);
        parameter = parameter.split('&');
        var appCode = parameter[0].replace("appCode=", "");

        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {
            $("#ulImpowerChannel li input[type=hidden]").each(function () {
                if ($(this).val() != appCode) {
                    $(this).parents("li").css("display", "none");
                }
            });
        }


        $(function () {
            $("#liFenxiaoData").click(function () {
                editTips();
            });
            $(".liZhiyingData").click(function () {
                editTips();
            });
            $(".liTaobaoData").click(function () {
                editTips();
            });

        });
        function editTips() {
            var productID = parameter[2].replace("productID=", "");
            if (productID == "0") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("平台商品尚未发布，不可以编辑渠道商品").change();
            }
        }

        $(function () {
            //价格格式设置
            $("#txtProductPriceA,#txtProductCostPrice,#txtJingxiaoA,#txtDaixiaoA,#txtLingshouA").blur(function () {
                var price = $(this).val();
                var formatPrice = SetPriceFormat(price);
                $(this).val(formatPrice);
            });

            //$("#dvDelivery").css("display", "block"); //运费部分显示
            $("#dvDelivery input[type=radio]").attr("disabled", false);
            if ($("#dvDelivery #yf01").attr("checked") == "checked") {
                $("#deliverySelect").attr("disabled", false);
            } else {
                $("#txtPostFee,#txtExpressFee,#txtEmsFee").attr("disabled", false);
            }
            $("#dvDelivery #yf01").click(function () {
                $("#deliverySelect").attr("disabled", false);
                $("#txtPostFee,#txtExpressFee,#txtEmsFee").attr("disabled", "disabled");
            });
            $("#dvDelivery #yf02").click(function () {
                $("#deliverySelect").attr("disabled", "disabled");
                $("#txtPostFee,#txtExpressFee,#txtEmsFee").attr("disabled", false);
            });
        });

        //页面全局变量(添加商品的时候传空，编辑商品的时候页面赋值，编辑提交时将绑定的值传回)
        var channelPrices = new Array();
        var channelItems = new Array();
        var channelProducts = new Array();
        var channelImages = new Array();
        var skuCodeList = new Array();


        var productViewObj = new productView();
        //页面组装productView的方法

        function PackageProductInfo() {
            //先将商品数量更新(如果用户减少了SKU,需要将该SKU的库存数在总数中减掉)
            if ($(".specContainer .specCombineTable").css("display") == "block") {
                SumProductCount("specContainer");
            }

            //初始化productView
            var productViewObjNew = new productView();
            if (productViewObj != productViewObjNew) {
                productViewObj = new productView();
            }
            var $productID = $("#hiddenProductID").val();
            var $productTBCID = $("#txtProductCategory").attr("text") == "" ? 0 : parseInt($("#txtProductCategory").attr("text"));
            //var $productCategory = $("#txtProductCategory").text() == "" ? 0 : $("#txtProductCategory").text(); 
            var $productCategory = $("#hiddenProductCategoryID").val() == "" ? 0 : $("#hiddenProductCategoryID").val(); //店铺类目ID,暂时就是存了淘宝的，原样返回。
            var $productCategoryName = $("#txtProductCategory").val(); //暂时放的是商品类目名称，应该是店铺类目名称
            var $productTBPID = $("#hiddenTBPID").val() == "" ? 0 : $("#hiddenTBPID").val(); //淘宝PID

            var $productSEOTitle = $("#hiddenSEOTitle").val() == "" ? "" : $("#hiddenSEOTitle").val();
            var $productKeyword = $("#hiddenKeyword").val() == "" ? "" : $("#hiddenKeyword").val();
            var $productSEOKeyword = $("#hiddenSEOKeyword").val() == "" ? "" : $("#hiddenSEOKeyword").val();
            var $productSEODescription = $("#hiddenSEODescription").val() == "" ? "" : $("#hiddenSEODescription").val();
            var $productTBNO = $("#hiddenTBNO").val() == "" ? "" : $("#hiddenTBNO").val();
            var $productTBView = $("#hiddenTBView").val() == "" ? 0 : parseInt($("#hiddenTBView").val());
            var $productLocalView = $("#hiddenLocalView").val() == "" ? 0 : parseInt($("#hiddenLocalView").val());
            var $productCode = $("#hiddenProductNo").val() == "" ? "" : $("#hiddenProductNo").val(); //商品的平台唯一标识

            var $productTitle = $("#txtProductTitle").val().replace(/^\s*/g, "").replace(/\s*$/g, "");  //商品标题
            var $productCostPrice = $("#txtProductCostPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductCostPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "");  //商品成本价
            var $productPrice = $("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");//$("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");   //商品零售价（一口价）
            var $productCount = $("#txtProductCount").val().replace(/^\s*/g, "").replace(/\s*$/g, "");   //商品数量
            var $productOuterCode = $("#txtProductCodeA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");  //商家编码

            var $productDiscription = editor.html(); //商品描述 editor是KindEditor返回的一个对象
            $productDiscription = $productDiscription.replace(/'/g, "&apos;"); //对描述中的单引号进行编码处理，否则json数据转换时候出问题


            var $productLocationProvice = $("#slProvince").find("option:selected").text(); //商品所在地（省份）
            var $productLocationCity = $("#slCity").find("option:selected").text(); //商品所在地（城市）
            var $productTransportFeeType = $("#fare01").attr("checked") == "checked" ? "seller" : "buyer";
            var $useDeliveryTemplateOrNot = $("#yf01").attr("checked") == "checked" ? "T" : "F";  //T:使用运费模板/F:使用固定运费
            var $deliveryTemplateID = $("#deliverySelect").val() == "请选择..." ? 0 : $("#deliverySelect").val(); //运费模板ID
            var $theEmsFee = $("#txtEmsFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            var $thePostFee = $("#txtPostFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            var $theExpressFee = $("#txtExpressFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            //var $listType = $("#startSellRightnow").attr("checked") == "checked" ? "R" : ($("#settingStartSellTime").attr("checked") == "checked" ? "T" : "S"); //上架类型 -- R：立刻上架/T：定时上架/S：放入仓库
            var $listTimeDay = $("#settingDateDay").val().replace(/-/g, "/");
            var $listTimeHour = $("#settingDateHour").val().replace("时", "");
            var $listTimeMinite = $("#settingDateMinite").val();
            if ($listTimeMinite == null || $listTimeMinite == "") {
                $listTimeMinite = 55;
            } else {
                $listTimeMinite = $("#settingDateMinite").val().replace("分", "");
            }
            var $listTimeStr = $listTimeDay + " " + $listTimeHour + ":" + $listTimeMinite;
            var $listTime = new Date($listTimeStr);
            //品牌
            var $brandID = $("#brandProperty20000").attr("brandid") == undefined ? 0 : $("#brandProperty20000").attr("brandid");
            var $brandName = $("#brandProperty20000").val() == "可直接输入或选择" ? "" : $("#brandProperty20000").val();



            //开始组装productView实体
            productViewObj.entity.Product.ID = $productID == "" ? 0 : $productID;
            productViewObj.entity.Product.CategoryName = $productCategoryName; //店铺类目的名称，暂时是自己选择的类目拼接，淘宝接口没有实现
            productViewObj.entity.Product.ProductCategoryID = $productCategory; //店铺类目ID
            productViewObj.entity.Product.TBCID = $productTBCID; //淘宝CID
            productViewObj.entity.Product.TBPID = $productTBPID; //淘宝PID
            productViewObj.entity.Product.BrandID = $brandID;
            productViewObj.entity.Product.BrandName = $brandName == null ? "" : $brandName;
            productViewObj.entity.Product.SEOTitle = $productSEOTitle;
            productViewObj.entity.Product.Keyword = $productKeyword;
            productViewObj.entity.Product.SEOKeyword = $productSEOKeyword;
            productViewObj.entity.Product.SEODescription = $productSEODescription;
            productViewObj.entity.Product.TBNO = $productTBNO;
            productViewObj.entity.Product.TBView = $productTBView;
            productViewObj.entity.Product.LocalView = $productLocalView;
            productViewObj.entity.Product.DetailMemo = $productDiscription;
            productViewObj.entity.Product.Name = $productTitle;
            productViewObj.entity.Product.Stock = $productCount;
            productViewObj.entity.Product.SalesPrice = $productPrice; //一口价
            productViewObj.entity.Product.OuterCode = $productOuterCode; //暂时先放一个空值，25号调整后修改,28号修改OK
            productViewObj.entity.Product.ProductNo = $productCode; //商品在平台上的唯一标识
            productViewObj.entity.Product.LocationState = $productLocationProvice;
            productViewObj.entity.Product.LocationCity = $productLocationCity;
            productViewObj.entity.Product.FreightPayer = $productTransportFeeType; //卖家还是买家承担运费
            productViewObj.entity.Product.FreightFeeType = $useDeliveryTemplateOrNot; //是否使用运费模板
            productViewObj.entity.Product.DeliveryTemplateID = $deliveryTemplateID; //选择的运费模板ID
            //if ($useDeliveryTemplateOrNot == "F") {
            productViewObj.entity.Product.EmsFee = $theEmsFee == "" ? 0 : $theEmsFee;
            productViewObj.entity.Product.PostFee = $thePostFee == "" ? 0 : $thePostFee;
            productViewObj.entity.Product.ExpressFee = $theExpressFee == "" ? 0 : $theExpressFee;
            //}
            productViewObj.entity.Product.HasInvoice = $("#cbxFapiao").attr("checked") == "checked" ? true : false;
            productViewObj.entity.Product.HasWarranty = $("#cbxBaoxiu").attr("checked") == "checked" ? true : false;
            productViewObj.entity.Product.SellPromise = $("#cbxTuihuo").attr("checked") == "checked" ? true : false;
            productViewObj.entity.Product.HasShowcase = $("#cbxTuijian").attr("checked") == "checked" ? true : false;
            productViewObj.entity.Product.HasDiscount = $("#cbxDazhe").attr("checked") == "checked" ? true : false;
            //productViewObj.entity.Product.ListType = $listType;
            productViewObj.entity.Product.ListTime = $listTime;
            productViewObj.entity.Product.ValidThru = 7; //暂时固定写7天
            productViewObj.entity.ChannelPrices = channelPrices;
            productViewObj.entity.ChannelItems = channelItems;
            productViewObj.entity.ChannelProducts = channelProducts;
            productViewObj.entity.ChannelImages = channelImages;
            productViewObj.entity.Product.DeliveryStere = TrimSpace($("#txtStere").val()) == "" ? 0 : TrimSpace($("#txtStere").val());
            productViewObj.entity.Product.DeliveryKilogram = TrimSpace($("#txtKilogram").val()) == "" ? 0 : TrimSpace($("#txtKilogram").val());
            //商品属性信息
            //选择值的属性
            $("#propertyContainer select").each(function () {
                if ($(this).val() != undefined) {
                    var productProperty = new ProductProperty();
                    var $propertyID = $(this).attr("id").replace(/\D/g, '');
                    var $propertyValueID = $(this).val() == "" ? 0 : $(this).val(); //没有填写的属性，属性值id统一写为0
                    var $propertyValue = ""; //选择框没有这个值
                    productProperty.entity.PropertyID = $propertyID;
                    productProperty.entity.PropertyValueID = $propertyValueID;
                    productProperty.entity.PropertyValue = $propertyValue;
                    productViewObj.entity.PropertyList.push(productProperty.entity);
                }
            })
            //填写值的属性
            $("#propertyContainer input[type=text]").each(function () {
                if ($(this).val() != undefined) {
                    var productProperty = new ProductProperty();
                    if ($(this).attr("id") != undefined) {
                        var $propertyID = $(this).attr("id").replace(/\D/g, '');
                        var $propertyValue = "";
                        var $propertyValueID = 0;
                        if ($propertyID == "20000") {
                            if ($(this).val() != "可直接输入或选择") {
                                if ($(this).attr("brandid") != undefined) {
                                    var $propertyValueID = $(this).attr("brandid"); //淘宝下载的商品有品牌属性值ID
                                } else {
                                    var $propertyValueID = 0; //自己添加商品的时候，品牌文本框没有这一值
                                }
                                $propertyValue = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, ""); //没有填写的属性，就是""
                                if ($("input[class=childProperty]", $(this).parent()).val() != undefined) { //有子品牌
                                    $("input[class=childProperty]", $(this).parent()).each(function () {
                                        //                                    var childPropetryName = $("span[class=childProperty]", $(this).parent()).text();
                                        //                                    var childPropertyValue = $("input[class=childProperty]", $(this).parent()).val();
                                        var childPropetryName = $(this).prev().text();
                                        var childPropertyValue = $(this).val();
                                        $propertyValue += ";" + childPropetryName + ";" + childPropertyValue;
                                    });

                                }
                                productProperty.entity.PropertyID = $propertyID;
                                productProperty.entity.PropertyValueID = $propertyValueID;
                                productProperty.entity.PropertyValue = $propertyValue.replace(/;$/g, "");
                            }
                        } else {
                            if ($(this).val() != undefined && $(this).val() != "可直接输入或选择") {
                                if ($(this).attr("brandid") != undefined) {
                                    var $propertyValueID = $(this).attr("brandid"); //淘宝下载的商品有属性值ID
                                } else {
                                    var $propertyValueID = 0; //自己添加商品的时候，文本框没有这一值
                                }
                                $propertyValue = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, ""); //没有填写的属性，就是""
                                productProperty.entity.PropertyID = $propertyID;
                                productProperty.entity.PropertyValueID = $propertyValueID;
                                productProperty.entity.PropertyValue = $propertyValue;
                            }
                        }

                        productViewObj.entity.PropertyList.push(productProperty.entity);
                    }
                }
            });

            //规格的一项也是属性
            $("#specContainer input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    var productProperty = new ProductProperty();
                    var $specID = $(this).parent().parent().attr("id").replace("spec", "");
                    var $specValueID = $(this).val();
                    productProperty.entity.PropertyID = $specID;
                    productProperty.entity.PropertyValueID = $specValueID;
                    productProperty.entity.PropertyValue = "";
                    productViewObj.entity.PropertyList.push(productProperty.entity);
                }
            });


            if ($(".specContainer .specCombineTable").css("display") == "none") {
                //没有规格的商品详细信息
                var productDetailListObj = new productDetailList();
                productDetailListObj.entity.ProductDetail.AddDate = new Date();
                //productDetailListObj.entity.ProductDetail.GoodsAllocation = $productLocation; //****************
                productDetailListObj.entity.ProductDetail.GoodsNo = $productCode + "0001"; //Sku平台唯一标识，没有规格的就使用商品goodsNo+0001
                productDetailListObj.entity.ProductDetail.ID = 0;
                productDetailListObj.entity.ProductDetail.CostPrice = $productCostPrice;
                productDetailListObj.entity.ProductDetail.SalesPrice = $productPrice;
                productDetailListObj.entity.ProductDetail.Stock = $productCount;
                productDetailListObj.entity.ProductDetail.OuterCode = $productOuterCode; //暂时先放一个空值，25号调整后修改,29号修改ok

                productViewObj.entity.DetailList.push(productDetailListObj.entity);
            } else {
                //有规格的商品详细信息
                productViewObj.entity.Product.IsSpecificationEnabled = true;
                $(".specContainer .specCombineTable tr:not(:first)").each(function () {
                    var productDetailListObj = new productDetailList();
                    productDetailListObj.entity.ProductDetail.AddDate = new Date();
                    //productDetailListObj.entity.ProductDetail.GoodsAllocation = $productLocation; //*************
                    productDetailListObj.entity.ProductDetail.GoodsNo = $(".thisSKUCode", $(this)).val() == "" ? "" : $(".thisSKUCode", $(this)).val(); //Sku平台唯一标识
                    productDetailListObj.entity.ProductDetail.ID = 0;
                    productDetailListObj.entity.ProductDetail.CostPrice = $productCostPrice;
                    productDetailListObj.entity.ProductDetail.SalesPrice = $("#txtPrice", $(this)).val(); //Sku价格
                    productDetailListObj.entity.ProductDetail.Stock = $("#txtCount", $(this)).val(); //Sku库存
                    productDetailListObj.entity.ProductDetail.OuterCode = $("#txtProductCode", $(this)).val(); //暂时先放一个空值，25号调整后修改，28号修改OK

                    //商品规格信息
                    $(".specMark", $(this)).each(function () {
                        var specificationListObj = new SpecificationList();

                        specificationListObj.entity.ProductSpecification.SpecID = $(this).attr("specID"); //sku里包含的规格ID
                        var currentSpecValueID = $(this).attr("id"); //sku里包含的规格 值 ID
                        specificationListObj.entity.ProductSpecification.SpecValID = currentSpecValueID;
                        var skuName = $(this).text(); //sku里包含的规格 值 别名
                        $("#specContainer input[type=checkbox]").each(function () {
                            if ($(this).val() == currentSpecValueID && $(this).attr("isallowalias") == "true") {
                                specificationListObj.entity.ProductSpecification.Alias = skuName;
                            }
                        })

                        specificationListObj.entity.Spec.TBCID = $(this).attr("specID"); //sku里包含的规格ID  --对应淘宝
                        specificationListObj.entity.SpecValue.TBCID = $(this).attr("id"); //sku里包含的规格 值 ID --对应淘宝

                        $("#specContainer input[type=checkbox]").each(function () {
                            if ($(this).val() == specificationListObj.entity.ProductSpecification.SpecValID) {
                                specificationListObj.entity.ProductSpecification.Name = $(this).siblings("span").text();
                            }
                        });

                        productDetailListObj.entity.SpecificationList.push(specificationListObj.entity);
                    });
                    productViewObj.entity.DetailList.push(productDetailListObj.entity);
                });
            }
            //商品图片地址组装
            //商品主图
            if ($("#uploadImgUpload img:first").attr("src") != "../../Images/Default.png") {
                var productMainImg = $("#uploadImgUpload img:first").attr("src").replace("../../", "");
            } else {
                var productMainImg = "";
            }
            productViewObj.entity.Product.DefaultImageData = productMainImg;

            //除第一张主图外的其它图片
            $("#uploadImgUpload img:not(:first)").each(function () {//
                if ($(this).attr("src") != "../../Images/Default.png") {
                    var productImage = new ProductImage();
                    productImage.entity.SourceImageData = $(this).attr("src").replace("../../", "");
                    productViewObj.entity.ImageList.push(productImage.entity);
                }
            });

            //发布到淘宝的运费模板信息
            productViewObj.entity.Product.FreightPayer = $("#fare01").attr("checked") == "checked" ? "seller" : "buyer";
            productViewObj.entity.Product.FreightFeeType = $("#yf01").attr("checked") == "checked" ? "T" : "F";  //T:使用运费模板/F:使用固定运费
            productViewObj.entity.Product.DeliveryTemplateID = $("#deliverySelect").val() == "请选择..." ? 0 : $("#deliverySelect").val(); //运费模板ID
            productViewObj.entity.Product.EmsFee = $("#txtEmsFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            productViewObj.entity.Product.PostFee = $("#txtPostFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            productViewObj.entity.Product.ExpressFee = $("#txtExpressFee").val().replace(/^\s*/g, "").replace(/\s*$/g, "");


            return productViewObj;
        }

        //食品安全信息组装
        function PackageFoodSecurityInfo() {
            var productFoodSecurityInfo = new ProductFoodSecurityInfo();

            productFoodSecurityInfo.entity.ID = $("#hiddenFoodSecurityID").val() == "" ? 0 : $("#hiddenFoodSecurityID").val(); //编辑的时候会取到值，第一次新增设为0,后台赋值。
            productFoodSecurityInfo.entity.ProductID = $("#hiddenProductID").val() == "" ? 0 : $("#hiddenProductID").val();
            if ($("#foodSecurityContainer").css("display") == "block") {//该模块显示,表示有食品安全信息需要提交
                productFoodSecurityInfo.entity.ProductionLicenseNo = TrimSpace($("#foodSecurityProductionLicenseNo").val());
                productFoodSecurityInfo.entity.ProductionNo = TrimSpace($("#foodSecurityProductionNo").val());
                productFoodSecurityInfo.entity.FactoryName = TrimSpace($("#foodSecurityFactoryName").val());
                productFoodSecurityInfo.entity.FactoryAddress = TrimSpace($("#foodSecurityFactoryAddress").val());
                productFoodSecurityInfo.entity.FactoryTel = TrimSpace($("#foodSecurityFactoryTel").val());
                productFoodSecurityInfo.entity.BurdenSheet = TrimSpace($("#foodSecurityBurdenSheet").val());
                productFoodSecurityInfo.entity.StorageMethod = TrimSpace($("#foodSecurityStorageMethod").val());
                productFoodSecurityInfo.entity.GuaranteePeriod = TrimSpace($("#foodSecurityGuaranteePeriod").val());
                productFoodSecurityInfo.entity.FoodAdditives = TrimSpace($("#foodSecurityFoodAdditives").val());
                productFoodSecurityInfo.entity.Supplier = TrimSpace($("#foodSecuritySupplier").val());
                productFoodSecurityInfo.entity.ProduceDateStart = TrimSpace($("#foodSecurityProduceDateStart").val());
                productFoodSecurityInfo.entity.ProduceDateEnd = TrimSpace($("#foodSecurityProduceDateEnd").val());
                productFoodSecurityInfo.entity.PurchaseDateStart = TrimSpace($("#foodSecurityPurchaseDateStart").val());
                productFoodSecurityInfo.entity.PurchaseDateEnd = TrimSpace($("#foodSecurityPurchaseDateEnd").val());

            }
            return productFoodSecurityInfo;
        }

        // 根据页面填写的值设置渠道价格
        function SetChannelPriceRequest(productID) {

            var setOnSaleRequestObj = new SetOnSaleRequestView();
            setOnSaleRequestObj.entity.MultiProductID.push(productID);
            $("#rapidRelease dl[class=channelPriceMark]").each(function () {

                var channelPriceRateObj = new ChannelPriceRateView();
                if ($("span", $(this)).attr("id").replace("dt", "") != "C002") {//不是分销
                    var $channelCode = $("input[type=checkbox]:first", $(this)).attr("id").replace("txt", "");
                    var $discount = null;
                    if ($("#txt" + $channelCode + "", $(this)).attr("checked") == "checked") {
                        $discount = $(".discountMark", $(this)).val() == "" ? null : $(".discountMark", $(this)).val();
                    }
                    channelPriceRateObj.entity.Code = $channelCode;
                    //channelPriceRateObj.entity.SalePriceRate = $discount;

                    if ($("#txtDirectDiscount" + $channelCode + "", $(this)).attr("checked") == "checked") {
                        channelPriceRateObj.entity.EnableDiscount = true;
                    }
                    if ($("#rdChange1").attr("checked") == "checked") {
                        channelPriceRateObj.entity.OpreaMark = TrimSpace($("#slOprator").val());
                        channelPriceRateObj.entity.OpreaSalePrice = $("#hiddenSalePrice").val();
                    }
                    else {
                        channelPriceRateObj.entity.OpreaMark = "";
                        channelPriceRateObj.entity.OpreaSalePrice = $("#txtAllPrice").val();
                    }
                    setOnSaleRequestObj.entity.ChannelPriceRates.push(channelPriceRateObj.entity);
                }
                else {//是分销
                    channelPriceRateObj.entity.Code = "C002";
                    var rateStr = $("#slProductLineForRapid").find("option:selected").attr("rate");
                    var rates = rateStr.split(',');
                    channelPriceRateObj.entity.WholeSalePriceRate = rates[0];
                    channelPriceRateObj.entity.DistributionPriceRate = rates[1];
                    channelPriceRateObj.entity.MarketPriceRate = rates[2];

                    if ($("#txtDirectDiscount" + $channelCode + "", $(this)).attr("checked") == "checked") {
                        channelPriceRateObj.entity.EnableDiscount = true;
                    }

                    //将产品线ID加进productViewObj里面
                    productViewObj.entity.Product.ProductLineID = $("#slProductLineForRapid").find("option:selected").val();
                    
                    setOnSaleRequestObj.entity.ChannelPriceRates.push(channelPriceRateObj.entity);
                }
            })
            return setOnSaleRequestObj;
        }


        //基础数据页面的提交按钮点击事件
        function SubmitProductInfo() {
            $(".c03").text("");
            //禁用按钮
            var validateResult = ValidateUserInput(); //验证用户输入
            if (validateResult == true) {
                $("#btnSave").removeClass("submit01").addClass("disabled").attr("disabled", "disabled");

                var productViewObj = PackageProductInfo();
                var productID = productViewObj.entity.Product.ID;
                //            var productPrice = $("#txtProductPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, ""); //商品一口价
                //            productPrice = parseFloat(productPrice);
                var productChannelCodeList = new Array();
                //var channelPriceRequest = new ProductPriceRequest();
                var setOnSaleRequestObj = new SetOnSaleRequestView();
                if ($("#rapid-check").attr("checked") == "checked") {
                    //商品发布渠道(编号集合)

                    $("#ddImpowerChannel input[type=checkbox]").each(function () {
                        if ($(this).attr("checked") == "checked") { //这个渠道选中了
                            productChannelCodeList.push($(this).attr("id"));

                        }
                    });
                    //channelPriceRequest = SetChannelPriceRequest(productID,productPrice);
                    setOnSaleRequestObj = SetChannelPriceRequest(productID);
                }

                var productViewStr = JSON.stringify(productViewObj.entity);
                var productChannelCodeListStr = JSON.stringify(productChannelCodeList);
                var setOnSaleRequestStr = JSON.stringify(setOnSaleRequestObj.entity);
                var foodSecurityInfo = PackageFoodSecurityInfo();
                var foodSecurityInfoStr = JSON.stringify(foodSecurityInfo.entity);

                if (productID == 0) {//点击了添加页面的“保存”
                    $.ajax({
                        url: "../../Product/SaveProduct",
                        type: "post",
                        data: { "productViewStr": productViewStr, "foodSecurityInfoStr": foodSecurityInfoStr },
                        success: function (res) {
                            var resInt = parseInt(res);
                            var reg = /^\d+$/g;
                            if (reg.test(resInt)) {
                                if ($("#rapid-check").attr("checked") == "checked") { //添加页面的快速发布
                                    setOnSaleRequestObj = SetChannelPriceRequest(resInt);
                                    setOnSaleRequestStr = JSON.stringify(setOnSaleRequestObj.entity);
                                    $.ajax({
                                        url: "../../Product/PublishProductForAdd",
                                        type: "post",
                                        data: { "setOnSaleRequestStr": setOnSaleRequestStr },
                                        success: function (res2) {
                                            var jsonRes = JSON.parse(res2);
                                            if (jsonRes.Code == null && jsonRes.Message == null) {
                                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                                $("#operateTip").html("保存并发布成功!").change();

                                                // RedirectTo("../../Product/index?appCode=PLATFORM&MenuCode=C110");
                                                GoToLinkUrl("", "../../Product/index");

                                            } else {
                                                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                                $("#operateTip").html("" + jsonRes.Message + "!").change();
                                                if (jsonRes.Code == "-2") {
                                                    RedirectTo("../../Product/AddProduct?appCode=PLATFORM&MenuCode=C105&productID=" + resInt + "");
                                                }
                                            }
                                        },
                                        error: function () {
                                            $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                        }
                                    });
                                } else {
                                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                    $("#operateTip").html("添加成功!").change();
                                    RedirectTo("../../Product/index?appCode=PLATFORM&MenuCode=C113");
                                }

                            } else {
                                $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                var jsonRes = JSON.parse(res);

                                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                $("#operateTip").html(jsonRes.Message).change();
                            }
                        },
                        error: function () {
                            $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);

                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("商品添加提交过程中出现未知错误").change();

                        }
                    });
                } else {//点击了编辑页面“保存”,并发布
                    if ($("#rapid-check").attr("checked") == "checked") {//点击了“快速发布”
                        $.ajax({
                            url: "../../Product/SaveProductAndPublish",
                            type: "post",
                            data: { "productViewStr": productViewStr, "setOnSaleRequestStr": setOnSaleRequestStr, "foodSecurityInfoStr": foodSecurityInfoStr },
                            success: function (res) {
                                var jsonRes = JSON.parse(res);
                                if (jsonRes.Code == null && jsonRes.Message == null) {
                                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                    $("#operateTip").html("保存并发布成功!").change();
                                    //RedirectTo("../../Product/index?appCode=PLATFORM&MenuCode=C110");
                                    GoToLinkUrl("", "../../Product/index");
                                } else {
                                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                    $("#operateTip").html("" + jsonRes.Message + "").change();
                                    $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                }
                            },
                            error: function () {
                                $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                $("#operateTip").html("编辑保存并发布过程中出现未知错误").change();

                            }
                        });
                    } else {//没有点击“快速发布”
                        $.ajax({
                            url: "../../Product/SaveProduct",
                            type: "post",
                            data: { "productViewStr": productViewStr, "foodSecurityInfoStr": foodSecurityInfoStr },
                            success: function (res) {
                                var resInt = parseInt(res);
                                var reg = /^\d+$/g;
                                if (reg.test(resInt)) {

                                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                    $("#operateTip").html("编辑保存成功! ").change();
                                    //RedirectTo("../../Product/index?appCode=PLATFORM&MenuCode=C113");
                                    GoToLinkUrl("", "../../Product/index");
                                } else {
                                    var jsonRes = JSON.parse(res);
                                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                    $("#operateTip").html(jsonRes.Message).change();

                                    $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                }
                            },
                            error: function () {
                                $("#btnSave").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                $("#operateTip").html("编辑保存过程中出现未知错误").change();

                            }
                        });
                    }
                }
            }
        }


        function UploadImage(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var file_upload = "";
            var file_upload_img = "";
            if ($(eventSrc).attr("id") == "file_upload_1") {
                file_upload = "file_upload_1";
                file_upload_img = "file_upload_img_1";
            } else if ($(eventSrc).attr("id") == "file_upload_2") {
                file_upload = "file_upload_2";
                file_upload_img = "file_upload_img_2";
            } else if ($(eventSrc).attr("id") == "file_upload_3") {
                file_upload = "file_upload_3";
                file_upload_img = "file_upload_img_3";
            } else if ($(eventSrc).attr("id") == "file_upload_4") {
                file_upload = "file_upload_4";
                file_upload_img = "file_upload_img_4";
            } else if ($(eventSrc).attr("id") == "file_upload_5") {
                file_upload = "file_upload_5";
                file_upload_img = "file_upload_img_5";
            }
            //            else if ($(eventSrc).attr("id") == "file_upload_6") {
            //                file_upload = "file_upload_6";
            //                file_upload_img = "file_upload_img_6";
            //            }
            $.ajaxFileUpload({
                url: '../../Product/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: file_upload, //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res) //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        $("#" + file_upload_img + "").attr("src", "../../UploadFile/Product/" + res);
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function () //服务器响应失败处理函数
                {
                }
            });

        }

        $(function () { //图片预览调整顺序，删除图片
            $(".uploadImgItemPreview").hover(function () {
                if (!$(".operateImg", $(this)).is(":animated")) {
                    $(".operateImg", $(this)).slideDown();
                }
            }, function () {
                $(".operateImg", $(this)).slideUp();
            });

            $(".operateImg div[sort=left]").click(function () {
                var imgSrc = $("img", $(this).parent().siblings("div")).attr("src");
                var imgSrc_id = $("img", $(this).parent().siblings("div")).attr("id");
                var currentID = imgSrc_id.substring(imgSrc_id.lastIndexOf('_') + 1);

                if (parseInt(currentID) - 1 > 0) {
                    var preImgSrc = $("#file_upload_img_" + (parseInt(currentID) - 1) + "").attr("src"); //前一张图片地址
                    $("#file_upload_img_" + (parseInt(currentID) - 1) + "").attr("src", imgSrc);
                    $("#file_upload_img_" + currentID + "").attr("src", preImgSrc);
                }
            });

            $(".operateImg div[sort=right]").click(function () {
                var imgSrc = $("img", $(this).parent().siblings("div")).attr("src");
                var imgSrc_id = $("img", $(this).parent().siblings("div")).attr("id");
                var currentID = imgSrc_id.substring(imgSrc_id.lastIndexOf('_') + 1);

                if (parseInt(currentID) + 1 <= 5) {
                    var nextImgSrc = $("#file_upload_img_" + (parseInt(currentID) + 1) + "").attr("src"); //后一张图片地址
                    $("#file_upload_img_" + (parseInt(currentID) + 1) + "").attr("src", imgSrc);
                    $("#file_upload_img_" + currentID + "").attr("src", nextImgSrc);
                }
            });

            $(".operateImg div[sort=delete]").click(function () {
                var currentImg = $("img", $(this).parent().siblings("div"));
                var imgSrc = currentImg.attr("src");
                var imgName = imgSrc.substring(imgSrc.lastIndexOf('/') + 1);

                $.ajax({
                    url: '../../Product/DeleteProductImg',
                    type: "post",
                    data: { "imgName": imgName },
                    success: function (res) {
                        if (parseInt(res) == 1) {
                            currentImg.attr("src", "../../Images/Default.png");
                        } else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("未能删除").change();
                        }
                    },
                    error: function () {
                    }
                });
            });
        });

        $(function () {
            //ChangeTabs();

            if ($("#brandProperty20000").val() == "可直接输入或选择") {
                $(this).css("color", "Gray");
            } else {
                $(this).css("color", "");
            }
        });

        $(function () {
            $("#spEdit").click(function () {
                CreateCoverDivForGrand();
            });
            $("#rapid-check").attr("checked", false); //页面加载的时候取消“快速发布”checkbox选中
        });


        //点击快速发布
        $(function () {
            GetImpowerChannel();
        });

        function GetImpowerChannel() {
            $.ajax({
                url: "../../Product/GetImpowerChannel",
                type: "get",
                success: function (res) {
                    var jsonRes = JSON.parse(res);
                    for (var i = 0; i < jsonRes.length; i++) {
                        var impowerChannel = $("<span class='rapidShop'><input id='" + jsonRes[i].Code + "' type='checkbox' onclick='SetThisChannelPrice(event)'/>&nbsp;&nbsp;<lable  class='r30' for='" + jsonRes[i].Code + "'>" + jsonRes[i].Title + "</lable></span>");
                        $("#ddImpowerChannel").append(impowerChannel);
                    }
                },
                error: function () {
                }
            });
        }

        //设置快速发布的选中渠道价格,并将快速发布的标记（id为"rapid-check"的checkbox选中，更改提交按钮的文本为保存/发布）
        function SetThisChannelPrice(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var channelCode = $(eventSrc).attr("id");
            var channelName = $(eventSrc).siblings().text();
            if ($(eventSrc).attr("checked") == "checked") {
                if (channelCode != "C002") {
                    //var impowerChannelPrice = $("<dl class='channelPriceMark'><dd><span id='dt" + channelCode + "' class='w100 channelPriceTitle'>" + channelName + "</span></dd><dd><ul><li class='t10'><input type='checkbox' id='txt" + channelCode + "' style='display:none;'/><lable class='r5' for='txt" + channelCode + "'>零售价 = 平台零售价 X </lable><input type='text' class='discountMark' onblur='CheckThis(event)'  value='100' style='color:#777777'/>%</li></ul></dd></dl>"); //<li class='t10'><input type='checkbox'id='txtDirectDiscount" + channelCode + "'>&nbsp;&nbsp;<lable class='r5' for='txtDirectDiscount" + channelCode + "'>参与该店铺会员折扣</lable></li>暂时不用
                    var appendHtml = "<input type='checkbox' id='txt" + channelCode + "' style='display:none;'/><li class='list-li'><div class='float-l w190'>" +
                                "<input id='rdChange1' type='radio' name='changePrice' value='' checked='checked'><label>将商品的价格修改为</label>" +
                                "</div><div class='float-l'><label>当前价格</label>" +
                                "<select id='slOprator' class='changePriceInput'>" +
                                " <option value='minus'>-</option>" +
                                "<option value='plus'>+</option>" +
                                "<option value='multiply'>*</option>" +
                                "<option value='devide'>/</option>" +
                                "</select>&nbsp;<input id='txtFloatPrice' type='text' name='name' value='' class='changePriceInput'>" +
                                "<label>元</label><span class='c03'></span></div></li>";
                    appendHtml += "<li class='list-li'><div class='float-l w190'><input id='rdChange2' type='radio' name='changePrice' value=''>" +
                        "<label>将商品的价格统一修改为</label></div><div class='float-l'>" +
                        "<input id='txtAllPrice' type='text' name='name' value='' class='changePriceInput'><label>元</label>" +
                        "<span class='c03'></span></div></li>";
                    var impowerChannelPrice = $("<dl class='channelPriceMark'><dd><span id='dt" + channelCode + "' class='w100 channelPriceTitle'>" + channelName + "</span></dd><dd><ul><li class='t10'>" + appendHtml + "</li></ul></dd></dl>"); //<li class='t10'><input type='checkbox'id='txtDirectDiscount" + channelCode + "'>&nbsp;&nbsp;<lable class='r5' for='txtDirectDiscount" + channelCode + "'>参与该店铺会员折扣</lable></li>暂时不用
                    $("#ddPriceInfo").append(impowerChannelPrice);
                } else {
                    var impowerChannelPrice = $("<dl class='channelPriceMark'><dd><span id='dt" + channelCode + "' class='w100 channelPriceTitle'>" + channelName + "</span></dd><dd><ul><li class='t10'>产品线 <select id='slProductLineForRapid'></select></li> <li class='t10'><input type='checkbox'id='txtDirectDiscount" + channelCode + "'>&nbsp;&nbsp;<lable class='r5' for='txtDirectDiscount" + channelCode + "'>参与该店铺会员折扣</lable></li></ul></dd></dl>");
                    $("#ddPriceInfo").append(impowerChannelPrice);

                    $.ajax({
                        url: "../../Product/GetProductLineInfo",
                        type: "get",
                        success: function (res) {
                            $("#slProductLineForRapid option:not(:first)").remove();
                            var jsonRes = JSON.parse(res);
                            for (var i = 0; i < jsonRes.length; i++) {
                                var $option = $("<option value='" + jsonRes[i].ID + "'rate='" + jsonRes[i].WholeSalePriceRate + "," + jsonRes[i].DistributionPriceRate + "," + jsonRes[i].SalesPriceRateMin + "~" + jsonRes[i].SalesPriceRateMax + "'>" + jsonRes[i].Name + "</option>");
                                $("#slProductLineForRapid").append($option);
                            }
                        },
                        error: function () {
                        }
                    });
                }
                //将快速发布的标记（id为"rapid-check"的checkbox)选中
                $("#rapid-check").attr("checked", "checked");
                $("#btnSave").text(" 发  布 ");
            } else {
                $("#rapid-form .channelPriceMark span").each(function () {
                    if ($(this).attr("id") != undefined) {
                        var thisID = $(this).attr("id").replace("dt", "");
                        if (thisID == channelCode) {
                            $(this).parent().parent().remove();
                        }
                    }
                });
                //取消选择的时候如果所有的渠道都取消选择了，将快速发布的标记取消选择，按钮的文本改为 保存
                var flag = 0;
                $("#ddImpowerChannel input[type=checkbox]").each(function () {
                    if ($(this).attr("checked") == "checked") {
                        flag = 1;
                    }
                });
                if (flag == 0) {
                    $("#rapid-check").attr("checked", false);
                    $("#btnSave").text(" 保  存 ");
                } else {
                    $("#rapid-check").attr("checked", "checked");
                    $("#btnSave").text(" 发  布 ");
                }
            }
        }
        function CheckThis(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            if ($(eventSrc).val().replace(/^\s*/g, "").replace(/\s*$/g, "") != "") {
                var reg = /^\d+(\.\d+)?$/g;
                var rate = $(eventSrc).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                var testRes = false;
                testRes = reg.test(rate);
                if (testRes == true) {
                    $(eventSrc).siblings("input").attr("checked", "checked");
                    $(eventSrc).css("color", "#333333");
                } else {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("比例应为数字").change();
                }
            }
        }

        //加载省市联动数据
        $(function () {
            GetAreaList("slProvince", 0);

            $("#slProvince").change(function () {
                var $ID = $("#slProvince").val();
                if ($ID == "default") {
                    $("#slCity").text("");
                    var $defaultOption = $("<option value='default'>-请选择-</option>");
                    $("#slCity").append($defaultOption);
                } else {
                    GetAreaList("slCity", $ID);
                }
            });
        });

        function GetAreaList(containerID, ID) {
            $.ajax({
                url: "../../Area/GetLocationList",
                type: "get",
                data: { "ID": ID },
                async: false,
                success: function (res) {
                    if (res != null) {
                        var jsonRes = JSON.parse(res);
                        $("#" + containerID + "").text("");
                        var $defaultOption = $("<option value='default'>-请选择-</option>");
                        $("#" + containerID + "").append($defaultOption);
                        for (var i = 0; i < jsonRes.length; i++) {
                            var $option = $("<option value='" + jsonRes[i].ID + "'>" + jsonRes[i].Name + "</option>");
                            $("#" + containerID + "").append($option);
                        }
                    }
                },
                error: function () {
                }
            });
        }

        //加载平台（非淘宝）运费模板
        $(function () {
            $.ajax({
                url: "../../Product/GetTaobaoAllDeliveryTemplate",
                type: "get",
                async: false,
                success: function (res) {
                    var jsonRes = JSON.parse(res);
                    for (var i = 0; i < jsonRes.length; i++) {
                        var options = $("<option value='" + jsonRes[i].ID + "'>" + jsonRes[i].Name + "</option>");
                        $("#deliverySelect").append(options);
                    }
                },
                error: function () {
                }
            })

            $("#deliverySelect").change(function () {
                var selectedID = $(this).val();
                if (selectedID != "请选择..." && selectedID != null) {
                    $.ajax({
                        url: "../../Product/GetDeliveryTemplate?id=" + selectedID + "",
                        type: "get",
                        success: function (res) {
                            var jsonRes = JSON.parse(res);
                            if (jsonRes.length > 0) {
                                $("#deliveryFeeContainer").text("");

                                for (var i = 0; i < jsonRes.length; i++) {
                                    if (jsonRes[i].Destination == "1") {
                                        var divItem = $("<div><strong>默认运费：</strong>一件内" + jsonRes[i].StartFee + "元,每增加" + jsonRes[i].AddStandard + "件,加" + jsonRes[i].AddFee + "元</div>"); //" + jsonRes[i].ServiceType + "
                                    } else {
                                        var divItem = $("<div><strong>指定区域运费：</strong>" + jsonRes[i].DestinationName + "一件内" + jsonRes[i].StartFee + "元,每增加" + jsonRes[i].AddStandard + "件,加" + jsonRes[i].AddFee + "元</div>"); //" + jsonRes[i].ServiceType + "
                                    }
                                    $("#deliveryFeeContainer").append(divItem);
                                }
                            }

                        },
                        error: function () {
                        }
                    });


                    //检查选择的运费模板的计价方式，如果是按体积，重量计价的话，必须输入商品的物流体积和物流重量
                    //运费计算方式 0:表示按宝贝件数计算运费 1:表示按宝贝重量计算运费 3:表示按宝贝体积计算运费
                    $.ajax({
                        url: "../../Product/GetDeliveryCalculate",
                        type: "get",
                        data: { "deliveryID": selectedID },
                        success: function (res) {
                            if (res === "1") {
                                $("#spKilogramMes").text("*");
                                $("#spStereMes").text("  ");
                                if (TrimSpace($("#txtKilogram").val()) == "") {
                                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                    $("#operateTip").html("您选择的运费模板是按重量计价的，请输入物流重量. <a href='javascript:void(0);' onclick='GoKilogram()'>去修改</a>").change();
                                }
                            } else if (res === "3") {
                                $("#spStereMes").text("*");
                                $("#spKilogramMes").text("  ");
                                if (TrimSpace($("#txtStere").val()) == "") {
                                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                    $("#operateTip").html("您选择的运费模板是按体积计价的，请输入物流体积. <a href='javascript:void(0);' onclick='GoStere()'>去修改</a>").change();
                                }
                            } else {
                                $("#spStereMes").text("  ");
                                $("#spKilogramMes").text("  ");
                            }
                        },
                        error: function () {

                        }
                    });

                } else {
                    $("#deliveryFeeContainer").text("");
                }

            });
        });

        function GoStere() {
            $("#txtStere").focus();
            NotVisible();
        }

        function GoKilogram() {
            $("#txtKilogram").focus();
            NotVisible();
        }

        //加载供选择的时间(页面开始时间部分)
        $(function () {
            var dateAndTime = new Date();
            var year = dateAndTime.getFullYear();
            var month = dateAndTime.getMonth() + 1;
            var day = dateAndTime.getDate();
            var baseDay;
            if (month < 10) {
                if (day < 10) {
                    baseDay = year + "-0" + month + "-0" + day;
                } else {
                    baseDay = year + "-0" + month + "-" + day;
                }
            } else {
                if (day < 10) {
                    baseDay = year + "-" + month + "-0" + day;
                } else {
                    baseDay = year + "-" + month + "-" + day;
                }
            }
            var addDays = 0;
            for (var i = 0; i < 15; i++) {
                var resDate = Addday(baseDay, addDays);
                addDays++;
                var $option = $("<option>" + resDate + "</option>");
                $("#settingDateDay").append($option);
            }
            var hour = dateAndTime.getHours();
            GetDateHour("settingDateHour", hour);
            var minite = dateAndTime.getMinutes();
            GetDateMinite("settingDateMinite", minite);
            //选择日期
            $("#settingDateDay").change(function () {
                dateAndTime = new Date();
                hour = dateAndTime.getHours();
                minite = dateAndTime.getMinutes();
                if ($("#settingDateDay").val() > baseDay) {
                    GetDateHour("settingDateHour", 0);
                    GetDateMinite("settingDateMinite", 0);
                } else {
                    GetDateHour("settingDateHour", hour);
                    GetDateMinite("settingDateMinite", minite);
                }
            });
            //选择小时
            $("#settingDateHour").change(function () {
                dateAndTime = new Date();
                hour = dateAndTime.getHours();
                minite = dateAndTime.getMinutes();
                if ($("#settingDateDay").val() > baseDay) {
                    GetDateDay("settingDateMinite", 0);
                } else {
                    if ($("#settingDateHour").val().replace('时', '') > hour) {
                        GetDateMinite("settingDateMinite", 0);
                    } else {
                        GetDateMinite("settingDateMinite", minite);
                    }
                }
            });
            //页面加载时，是否禁用销售时间设定
            if ($("#settingStartSellTime").attr("checked") == undefined || $("#settingStartSellTime").attr("checked") != "checked") {
                $("#settingDateDay").attr("disabled", "disabled");
                $("#settingDateHour").attr("disabled", "disabled");
                $("#settingDateMinite").attr("disabled", "disabled");
            }
            //选择立即销售单选框
            $("#startSellRightnow").click(function () {
                $(this).attr("checked", "checked");
                $("#settingStartSellTime").attr("checked", false);
                $("#noStartSellTime").attr("checked", false);
                $("#settingDateDay").attr("disabled", "disabled");
                $("#settingDateHour").attr("disabled", "disabled");
                $("#settingDateMinite").attr("disabled", "disabled");
            })
            //选择设定销售时间单选框
            $("#settingStartSellTime").click(function () {
                $(this).attr("checked", "checked");
                $("#startSellRightnow").attr("checked", false);
                $("#noStartSellTime").attr("checked", false);
                $("#settingDateDay").attr("disabled", false);
                $("#settingDateHour").attr("disabled", false);
                $("#settingDateMinite").attr("disabled", false);

            })
            //选择放入仓库单选框
            $("#noStartSellTime").click(function () {
                $(this).attr("checked", "checked");
                $("#settingStartSellTime").attr("checked", false);
                $("#startSellRightnow").attr("checked", false);
                $("#settingDateDay").attr("disabled", "disabled");
                $("#settingDateHour").attr("disabled", "disabled");
                $("#settingDateMinite").attr("disabled", "disabled");
            })
        })
        //获取小时数字
        function GetDateHour(containerID, nowHour) {
            $("#" + containerID + "").text("");
            for (var i = nowHour; i < 24; i++) {
                var $option = $("<option>" + i + "时</option>");
                $("#" + containerID + "").append($option);
            }
        }
        //获取分钟数字
        function GetDateMinite(containerID, nowMinite) {
            $("#" + containerID + "").text("");
            var miniteArray = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
            for (var i = 0; i < miniteArray.length; i++) {
                if (miniteArray[i] > nowMinite) {
                    var $option = $("<option>" + miniteArray[i] + "分</option>");
                    $("#" + containerID + "").append($option);
                }
            }
        }

        function Addday(baseDate, days) {
            var dt = baseDate;
            dt = dt.replace(/-/g, '/'); //js不认2011-11-10,只认2011/11/10
            var t1 = new Date(new Date(dt).valueOf() + days * 24 * 60 * 60 * 1000); // 日期加上指定的天数
            var month;
            var day;
            if ((t1.getMonth() + 1) < 10) {
                month = "0" + (t1.getMonth() + 1);
            }
            else {
                month = t1.getMonth() + 1;
            }
            if (t1.getDate() < 10) {
                day = "0" + t1.getDate();
            }
            else {
                day = t1.getDate();
            }
            var ttt = t1.getFullYear() + "-" + month + "-" + day;
            return ttt;
        }

        //分销的经销代销等价格的折扣比例的基数
        var productSalePrice;

        //富文本编辑器KindEditor的全局变量
        var editor;

        //编辑页面
        $(function () {
            //页面全局变量,编辑页面赋值，单独发送到某个渠道用到（现在只有淘宝） channelCode
            var channelCode = "";

            //在页面load完成富文本编辑器KindEditor load完成后继续下面的代码，

            KindEditor.ready(function (K) { //富文本编辑器的生成代码
                editor = K.create('#tareaProductDiscrip', {
                    resizeType: 1,
                    allowPreviewEmoticons: false,
                    allowImageUpload: true,
                    items: [
                            'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                            'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]

                });

                var productViewObj = "";

                productViewObj = '<%= ViewData["productViewObj"]%>';
                var oldProductViewObj = productViewObj.substring(productViewObj.indexOf('"DetailMemo":"') + 14, productViewObj.indexOf('","ServiceMemo":'));

                var newProductViewObj = oldProductViewObj.replace(/"/g, "\\\"").replace(/'/g, "\\\"").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t");
                productViewObj = productViewObj.replace(oldProductViewObj, newProductViewObj);

                if (productViewObj != "") { //得到了对应id的商品productView，C#传过来的json对象
                    productViewObj = JSON.parse(productViewObj);
                    //productViewObj = $.parseJSON(productViewObj);

                    //更改页面标记
                    $("#addProductFlag").text("编辑商品");
                    $("#liFenxiaoData i").attr("class", "icon-fenxiao t11");
                    $(".liTaobaoData i").attr("class", "icon-taobao t11");
                    $(".liZhiyingData i").attr("class", "icon-wechat t11");

                    //给最开始定义的四个全局变量赋值
                    channelPrices = productViewObj.ChannelPrices;
                    channelItems = productViewObj.ChannelItems;
                    channelProducts = productViewObj.ChannelProducts;
                    channelImages = productViewObj.ChannelImages;
                    for (var i = 0; i < productViewObj.DetailList.length; i++) {
                        skuCodeList.push(productViewObj.DetailList[i].ProductDetail.GoodsNo); //将SKU的平台唯一标识放入数组中
                    }

                    //根据商品的类目ID（即TBCID）找出商品的类目名称拼接

                    $.ajax({
                        url: "../../Category/GetCategoryByTBCID",
                        type: "get",
                        data: { "categoryID": productViewObj.Product.TBCID },
                        success: function (res) {
                            $("#txtProductCategory").val(res);
                        },
                        error: function () {
                        }
                    });

                    //绑定商品基本信息
                    $("#hiddenProductID").val(productViewObj.Product.ID);
                    $("#hiddenTBPID").val(productViewObj.Product.TBPID);
                    $("#hiddenProductCategoryID").val(productViewObj.Product.ProductCategoryID); //店铺类目ID
                    $("#hiddenSEOTitle").val(productViewObj.Product.SEOTitle);
                    $("#hiddenKeyword").val(productViewObj.Product.Keyword);
                    $("#hiddenSEOKeyword").val(productViewObj.Product.SEOKeyword);
                    $("#hiddenSEODescription").val(productViewObj.Product.SEODescription);
                    $("#hiddenTBNO").val(productViewObj.Product.TBNO);
                    $("#hiddenTBView").val(productViewObj.Product.TBView);
                    $("#hiddenLocalView").val(productViewObj.Product.LocalView);
                    $("#hiddenProductNo").val(productViewObj.Product.ProductNo); //商品的平台唯一标识
                    //$("#txtProductCategory").val(productViewObj.Product.CategoryName); //暂时放的是商品类目拼接值
                    //$("#txtProductCategory").text(productViewObj.Product.ProductCategoryID);
                    $("#txtProductCategory").attr("text", productViewObj.Product.TBCID);
                    //var productCategoryID = productViewObj.Product.ProductCategoryID;
                    GetProperty("propertyContainer", productViewObj.Product.TBCID); //加载基础数据规格
                    GetSpec("specContainer", productViewObj.Product.TBCID);
                    GetSpec("specContainerForDestribution", productViewObj.Product.TBCID); //加载分销数据规格
                    GetSpec("specContainerForTaobao", productViewObj.Product.TBCID); //加载淘宝数据规格
                    $("#txtProductTitle").val(productViewObj.Product.Name);
                    $("#txtProductCostPrice").val(productViewObj.DetailList[0].ProductDetail.CostPrice).blur();
                    $("#txtProductPriceA").val(productViewObj.Product.SalesPrice).blur();
                    productSalePrice = productViewObj.Product.SalesPrice; //全局变量，分销页面使用的价格基数
                    $("#txtProductCount").val(productViewObj.Product.Stock);
                    $("#txtProductCodeA").val(productViewObj.Product.OuterCode);
                    $("#txtJingxiaoMinCount").val(productViewObj.Product.MinWholeSaleQty);
                    var deliveryStere = productViewObj.Product.DeliveryStere == 0 ? "" : productViewObj.Product.DeliveryStere;
                    var deliveryKilogram = productViewObj.Product.DeliveryKilogram == 0 ? "" : productViewObj.Product.DeliveryKilogram;
                    $("#txtStere").val(deliveryStere);
                    $("#txtKilogram").val(deliveryKilogram);
                    editor.html(productViewObj.Product.DetailMemo);

                    if (productViewObj.Product.IsSpecificationEnabled == false) {
                        $("#txtJingxiaoA").val(productViewObj.DetailList[0].ProductDetail.WholeSalePrice).blur();
                        $("#txtDaixiaoA").val(productViewObj.DetailList[0].ProductDetail.DistributionPrice).blur();
                        $("#txtLingshouA").val(productViewObj.DetailList[0].ProductDetail.MarketPrice).blur();
                    }


                    //绑定属性
                    $("#propertyContainer select").each(function () {
                        var properyID = $(this).attr("id").replace("brandProperty", "");
                        for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                            if (productViewObj.PropertyList[i].PropertyID == properyID) {
                                $(this).val(productViewObj.PropertyList[i].PropertyValueID);
                            }
                        }
                        $(this).change();
                        var subProperyIDStr = $("span[class=subPropertyMarkForBrand]", $(this).parent()).attr("id");

                        if (subProperyIDStr != undefined) {
                            var subProperyID = subProperyIDStr.replace("brandProperty", "");
                            for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                                if (productViewObj.PropertyList[i].PropertyID == subProperyID) {
                                    $(".subPropertyMarkForBrand", $(this).parent()).val(productViewObj.PropertyList[i].PropertyValueID);
                                }
                            }
                        }
                    });

                    $("#propertyContainer input[type=text]").each(function () {
                        //if ($(this).attr("id") != "brandProperty20000") {
                        //    var properyID = $(this).attr("id").replace("brandProperty", "");
                        //    for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                        //        if (productViewObj.PropertyList[i].PropertyID == properyID) {
                        //            $(this).val(productViewObj.PropertyList[i].PropertyValue);
                        //            $(this).attr("taobaoPropertyValueID", productViewObj.PropertyList[i].PropertyValueID);
                        //        }
                        //    }
                        //} else {
                        var properyID = $(this).attr("id").replace("brandProperty", "");
                        for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                            $(this).attr("taobaoPropertyValueID", productViewObj.PropertyList[i].PropertyValueID);
                            //$("#brandProperty" + properyID).attr("brandid", productViewObj.PropertyList[i].PropertyID);
                            if (productViewObj.PropertyList[i].PropertyID == properyID) {
                                if (productViewObj.PropertyList[i].PropertyValueID == "0") { //品牌valueID为0，表示这是一个自定义的品牌，还要判断有没有子品牌属性
                                    var brandValue = productViewObj.PropertyList[i].PropertyValue;
                                   
                                    if (brandValue != "" && brandValue != null) {
                                        var brandValues = brandValue.split(';');
                                        //UserDefineBrand(event);
                                       
                                        $("#dvBrandPropertyValue" + properyID + " div").each(function () {
                                            if ($(this).text() == brandValues) {
                                                $("#brandProperty" + properyID).attr("brandid", $(this).attr("id"));
                                            }
                                        });
                                        if ($("#brandProperty" + properyID).attr("brandid") == undefined) {
                                            $("#brandProperty" + properyID).attr("brandid", "0");
                                        }
                                        $(this).val(brandValues[0]);
                                        //$(this).attr("brandid", productViewObj.PropertyList[i].PropertyValueID);
                                        $(this).change();
                                        var markInt = 0;
                                        $("input[class=childProperty]", $(this).parent()).each(function () {
                                            markInt += 2;
                                            $(this).val(brandValues[markInt]);
                                        });
                                    }
                                } else { //品牌valueID不等于为0，表示这是一个选择的品牌，还要判断有没有子品牌属性
                                    var brandValue = productViewObj.PropertyList[i].PropertyValue;
                                    if (brandValue == "" && (productViewObj.PropertyList[i].PropertyID != 0 || productViewObj.PropertyList[i].PropertyID != "")) {
                                        var propertyValues = GetPropertyValue(productViewObj.Product.TBCID);
                                        for (var r = 0; r < propertyValues.length; r++) {
                                            if (properyID == propertyValues[r].PropertyID && productViewObj.PropertyList[i].PropertyValueID == propertyValues[r].ID) {
                                                brandValue = propertyValues[r].Name;
                                                break;
                                            }
                                        }
                                    }
                                    var brandValues = brandValue.split(';');
                                    
                                    $("#dvBrandPropertyValue" + properyID + " div").each(function () {
                                        var opreaValue = false;
                                        var returnVal = $(this).text();
                                        for (var i = 0; i < brandValues.length; i++) {
                                            if (returnVal == brandValues[i]) {
                                                opreaValue = true;
                                                break;
                                            }
                                        }
                                        if (opreaValue) {

                                            $("#brandProperty" + properyID).attr("brandid", $(this).attr("id"));
                                        }
                                    });




                                    $(this).val(brandValues[0]);
                                    $(this).change();
                                    var markInt = 0;
                                    $("input[class=childProperty]", $(this).parent()).each(function () {
                                        markInt += 2;
                                        $(this).val(brandValues[markInt]);
                                    });

                                }
                            }
                        }
                        //}
                    })

                    //绑定品牌属性的二级属性，如果有的话（一部分有），这部分代码一定要在绑定属性后面
                    $("#propertyContainer input[class=subPropertyMarkForBrand]").each(function () {
                        var properyID = $(this).attr("id").replace("brandProperty", "");
                        for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                            if (productViewObj.PropertyList[i].PropertyID == properyID) {
                                $(this).val(productViewObj.PropertyList[i].PropertyValue);
                                //2014-9-10tyq Insert
                                SetBrandID(properyID, productViewObj.PropertyList[i].PropertyValue);
                                if ($("#brandProperty" + properyID).attr("brandid") == undefined) {
                                    $("#brandProperty" + properyID).attr("brandid", "0");
                                }
                                $(this).change();

                                //$(this).attr("taobaoPropertyValueID", productViewObj.PropertyList[i].PropertyValueID);
                            }
                        }

                    });

                    //绑定品牌属性的三级属性，如果有的话（一部分有），这部分代码一定要在绑定属性后面
                    $("#propertyContainer input[class=subPropertyMarkForBrand]").each(function () {
                        var properyID = $(this).attr("id").replace("brandProperty", "");
                        for (var i = 0; i < productViewObj.PropertyList.length; i++) {
                            if (productViewObj.PropertyList[i].PropertyID == properyID) {
                                $(this).val(productViewObj.PropertyList[i].PropertyValue);
                                //$(this).attr("taobaoPropertyValueID", productViewObj.PropertyList[i].PropertyValueID);
                            }
                        }
                    });
                    //绑定食品安全信息
                    var foodSecurityInfo = '<%=ViewData["foodSecurityInfo"]%>';
                    if (foodSecurityInfo != "") {
                        foodSecurityInfo = JSON.parse(foodSecurityInfo);
                        $("#hiddenFoodSecurityID").val(foodSecurityInfo.ID);
                        $("#hiddenProductID").val(foodSecurityInfo.ProductID);
                        $("#foodSecurityProductionLicenseNo").val(foodSecurityInfo.ProductionLicenseNo);
                        $("#foodSecurityProductionNo").val(foodSecurityInfo.ProductionNo);
                        $("#foodSecurityFactoryName").val(foodSecurityInfo.FactoryName);
                        $("#foodSecurityFactoryAddress").val(foodSecurityInfo.FactoryAddress);
                        $("#foodSecurityFactoryTel").val(foodSecurityInfo.FactoryTel);
                        $("#foodSecurityBurdenSheet").val(foodSecurityInfo.BurdenSheet);
                        $("#foodSecurityStorageMethod").val(foodSecurityInfo.StorageMethod);
                        $("#foodSecurityGuaranteePeriod").val(foodSecurityInfo.GuaranteePeriod);
                        $("#foodSecurityFoodAdditives").val(foodSecurityInfo.FoodAdditives);
                        $("#foodSecuritySupplier").val(foodSecurityInfo.Supplier);
                        $("#foodSecurityProduceDateStart").val(foodSecurityInfo.ProduceDateStart);
                        $("#foodSecurityProduceDateEnd").val(foodSecurityInfo.ProduceDateEnd);
                        $("#foodSecurityPurchaseDateStart").val(foodSecurityInfo.PurchaseDateStart);
                        $("#foodSecurityPurchaseDateEnd").val(foodSecurityInfo.PurchaseDateEnd);
                    }

                    //绑定规格
                    //DetailList中至少有一个ProductDetail
                    $("#specContainer input[type=checkbox]").each(function () {
                        var thisSpecValueID = $(this).val();
                        for (var i = 0; i < productViewObj.DetailList.length; i++) {
                            for (var j = 0; j < productViewObj.DetailList[i].SpecificationList.length; j++) {
                                if (productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.SpecValID == thisSpecValueID) {

                                    $(this).attr("checked", "checked");
                                    $("input[type=text]", $(this).parent()).val(productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.Alias);

                                }
                            }
                        }
                    });

                    $("#specContainer input:checked[type=checkbox]").each(function () {
                        if (browserVer == "IE8") {
                            $(this).removeAttr("checked"); //兼容性问题,如果是IE8(低版本IE),要先将checked属性取消掉
                        }
                        $(this).click().attr("checked", "checked");
                        $("input[type=text]", $(this).parent()).blur();
                    });

                    $(".specContainer .specCombineTable tr:not(:first)").each(function () {
                        var specValueMark = $("td[class=specConbineMark]", $(this)).attr("id");

                        for (var i = 0; i < productViewObj.DetailList.length; i++) {
                            //var specValueMark2 = "";
                            var regTest = false;
                            var flag = 0;
                            for (var j = 0; j < productViewObj.DetailList[i].SpecificationList.length; j++) {
                                //specValueMark2 = specValueMark2 + productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.SpecValID + "-";
                                var currrentSpecValueID = productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.SpecValID;
                                var reg = eval("/" + currrentSpecValueID + "/g");
                                regTest = reg.test(specValueMark);
                                if (regTest == false) {
                                    flag++;
                                }
                            }
                            //specValueMark2 = specValueMark2.replace(/-$/g, "");
                            if (flag == 0) {
                                var thisSpecPrice = productViewObj.DetailList[i].ProductDetail.SalesPrice;
                                var reg = /\./g;
                                if (!reg.test(thisSpecPrice)) {
                                    thisSpecPrice = thisSpecPrice + ".00";
                                }
                                $("#txtPrice", $(this)).val(thisSpecPrice);

                                $("#txtCount", $(this)).val(productViewObj.DetailList[i].ProductDetail.Stock);
                                $("#txtProductCode", $(this)).val(productViewObj.DetailList[i].ProductDetail.OuterCode);
                                $(".thisSKUCode", $(this)).val(productViewObj.DetailList[i].ProductDetail.GoodsNo);
                            }
                        }
                    });


                    //绑定图片
                    if (productViewObj.Product.DefaultImageData != "") {
                        $("#uploadImgUpload #file_upload_img_1").attr("src", "../../" + productViewObj.Product.DefaultImageData);
                    } else {
                        $("#uploadImgUpload #file_upload_img_1").attr("src", "../../Images/Default.png");
                    }
                    for (var i = 0; i < productViewObj.ImageList.length; i++) {
                        $("#uploadImgUpload #file_upload_img_" + (i + 2) + "").attr("src", "../../" + productViewObj.ImageList[i].SourceImageData);
                    }

                    //绑定所在地
                    var locationProvince = productViewObj.Product.LocationState;
                    var countPro = $("#slProvince option").length;
                    for (var i = 0; i < countPro; i++) {
                        if ($("#slProvince").get(0).options[i].text == locationProvince) {
                            $("#slProvince").get(0).options[i].selected = true;
                            break;
                        }
                    }
                    $("#slProvince").change();
                    var locationCity = productViewObj.Product.LocationCity;
                    var countCity = $("#slCity option").length;

                    for (var i = 0; i < countCity; i++) {
                        if ($("#slCity").get(0).options[i].text == locationCity) {
                            $("#slCity").get(0).options[i].selected = true;
                            break;
                        }
                    }

                    //绑定运费和运费模板
                    var freightPayer = productViewObj.Product.FreightPayer;
                    if (freightPayer == "seller") {
                        $("#fare01").attr("checked", "checked");
                    } else {
                        $("#fare02").attr("checked", "checked");
                    }

                    var freightFeeType = productViewObj.Product.FreightFeeType;
                    if (freightFeeType == "T") {
                        $("#yf01").attr("checked", "checked");
                    } else {
                        $("#yf02").attr("checked", "checked");
                    }

                    var deliveryTemplateID = productViewObj.Product.DeliveryTemplateID;
                    var deliveryCount = $("#deliverySelect option").length;
                    for (var i = 0; i < deliveryCount; i++) {
                        if ($("#deliverySelect").get(0).options[i].value == deliveryTemplateID) {
                            $("#deliverySelect").get(0).options[i].selected = true;
                            break;
                        }
                    }
                    $("#deliverySelect").change();

                    $("#txtPostFee").val(productViewObj.Product.PostFee);
                    $("#txtExpressFee").val(productViewObj.Product.ExpressFee);
                    $("#txtEmsFee").val(productViewObj.Product.EmsFee);

                    //绑定售后服务信息
                    if (productViewObj.Product.HasInvoice == true) {
                        $("#cbxFapiao").attr("checked", "checked");
                    }
                    if (productViewObj.Product.HasWarranty == true) {
                        $("#cbxBaoxiu").attr("checked", "checked");
                    }
                    if (productViewObj.Product.SellPromise == true) {
                        $("#cbxTuihuo").attr("checked", "checked");
                    }
                    if (productViewObj.Product.HasDiscount == true) {
                        $("#cbxDazhe").attr("checked", "checked");
                    }
                    if (productViewObj.Product.HasShowcase == true) {
                        $("#cbxTuijian").attr("checked", "checked");
                    }

                    //绑定开始销售时间
                    //if (productViewObj.Product.ListType == "R") {
                    //    $("#startSellRightnow").attr("checked", "checked");
                    //} else if (productViewObj.Product.ListType == "T") {
                    //    $("#settingStartSellTime").attr("checked", "checked");
                    //} else if (productViewObj.Product.ListType == "S") {
                    //    $("#noStartSellTime").attr("checked", "checked");
                    //}

                    //编辑的时候为“分销商城”标签页的“发布到分销”，“淘宝一店”的“发布到淘宝”按钮注册事件
                    $("#btnPublishToDestribution").click(function () {
                        //禁用按钮
                        $(this).removeClass("submit01").addClass("disabled").attr("disabled", "disabled");
                        //验证脚本
                        var validateRes = ValidateDestributionUserInput();
                        if (validateRes == true) { //验证通过
                            var channelItemViewObj = new ChannelItemViewObj();
                            channelItemViewObj.entity.ChannelItem.ID = 0;
                            channelItemViewObj.entity.ChannelItem.ChannelCode = "C002";
                            channelItemViewObj.entity.ChannelItem.ProductID = $("#hiddenProductID").val();
                            channelItemViewObj.entity.ChannelItem.ProductNo = $("#hiddenProductNo").val();
                            channelItemViewObj.entity.ChannelItem.OuterNo = "";
                            channelItemViewObj.entity.ChannelItem.CreatedBy = "";
                            channelItemViewObj.entity.ChannelItem.DateCreated = new Date();
                            channelItemViewObj.entity.ChannelItem.ModifiedBy = "";
                            channelItemViewObj.entity.ChannelItem.DateModified = new Date();
                            channelItemViewObj.entity.ChannelItem.SalesPrice = $("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                            channelItemViewObj.entity.ChannelItem.CostPrice = 0;
                            channelItemViewObj.entity.ChannelItem.EnableDiscount = false;
                            channelItemViewObj.entity.ChannelItem.Stock = productViewObj.Product.Stock;

                            var destributionPrice = new DestributionPrice();

                            destributionPrice.entity.GoodsNo = $("#hiddenProductNo").val() + "0001";
                            destributionPrice.entity.JingxiaoPrice = $("#txtJingxiaoA").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtJingxiaoA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                            destributionPrice.entity.DaixiaoPrice = $("#txtDaixiaoA").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtDaixiaoA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                            destributionPrice.entity.LingshouPrice = $("#txtLingshouA").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtLingshouA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                            destributionPrice.entity.MinWholeSaleQty = $("#txtJingxiaoMinCount").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 1 : $("#txtJingxiaoMinCount").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                            destributionPrice.entity.ProductLineID = $("#slProductLine").find("option:selected").val();

                            if ($(".specContainerForDestribution .specCombineTable").css("display") != "none") {
                                $(".specContainerForDestribution .specCombineTable tr:not(:first)").each(function () {
                                    //找出GoodsNo
                                    var skuMark = $(".specConbineMark", $(this)).attr("id");
                                    var thisGoodsNo = "";
                                    for (var i = 0; i < productViewObj.DetailList.length; i++) {
                                        var testRes = false;
                                        var flag = 0;
                                        for (var j = 0; j < productViewObj.DetailList[i].SpecificationList.length; j++) {
                                            var thisSpecValueID = productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.SpecValID;
                                            var reg = eval("/" + thisSpecValueID + "/g");
                                            testRes = reg.test(skuMark);
                                            if (testRes == false) {
                                                flag++;
                                            }
                                        }
                                        if (flag == 0) {
                                            thisGoodsNo = productViewObj.DetailList[i].ProductDetail.GoodsNo;
                                        }
                                    }

                                    var productInChannel = new ProductInChannel(); //js实体在ChannelItemView.js文件中
                                    productInChannel.entity.ID = 0;
                                    productInChannel.entity.ChannelCode = "C002";
                                    productInChannel.entity.GoodsNo = thisGoodsNo; //上面根据规格值ID在productView实体中匹配出来的GoodsNo
                                    productInChannel.entity.State = 0;
                                    productInChannel.entity.NoticePath = "";
                                    productInChannel.entity.OuterNo = "";
                                    productInChannel.entity.ProductID = $("#hiddenProductID").val();
                                    productInChannel.entity.ProductNo = $("#hiddenProductNo").val();
                                    productInChannel.entity.ProductDetailID = 0;
                                    //productInChannel.entity.SalesPrice = $("#txtLingshouPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtLingshouPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                                    productInChannel.entity.CostPrice = 0;
                                    productInChannel.entity.CreatedBy = "";
                                    productInChannel.entity.DateCreated = new Date();
                                    productInChannel.entity.ModifiedBy = "";
                                    productInChannel.entity.DateModified = new Date();
                                    productInChannel.entity.Stock = parseInt($("#txtCount", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtCount", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, ""));
                                    channelItemViewObj.entity.ChannelProducts.push(productInChannel.entity);

                                    var destributionPriceList = new DestributionPriceList();
                                    destributionPriceList.entity.GoodsNo = thisGoodsNo;
                                    destributionPriceList.entity.JingxiaoPrice = $("#txtJingxiaoPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtJingxiaoPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                                    destributionPriceList.entity.DaixiaoPrice = $("#txtDaixiaoPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtDaixiaoPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                                    destributionPriceList.entity.LingshouPrice = $("#txtLingshouPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtLingshouPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                                    destributionPrice.entity.DestributionPriceList.push(destributionPriceList.entity);
                                });
                            }

                            //收集用户选择的店铺类目信息
                            var productInCategoryCategoryIDs = new Array();
                            $("#dvProductInCategoryContainer input[type=checkbox]:checked").each(function () {
                                var itsID = $(this).attr("id").replace("shopCat", "");
                                productInCategoryCategoryIDs.push(itsID);
                            });

                            //修改完毕之后发布到分销
                            var channelItemViewObjStr = JSON.stringify(channelItemViewObj.entity);
                            var destributionPriceStr = JSON.stringify(destributionPrice.entity);
                            var productInCategoryCategoryIDsStr = JSON.stringify(productInCategoryCategoryIDs);
                            $.ajax({
                                url: "../../Product/PublishToSingleChannel",
                                type: "post",
                                data: { "channelItemViewObjStr": channelItemViewObjStr, "destributionPriceStr": destributionPriceStr, "productInCategoryCategoryIDsStr": productInCategoryCategoryIDsStr },
                                success: function (res) {

                                    var jsonRes = JSON.parse(res);
                                    if (jsonRes.Code == null && jsonRes.Message == null) {
                                        var appCode = GetUrlAppCode();
                                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                        $("#operateTip").html("发布成功!").change();
                                        RedirectTo("../../Product/index?appCode=PLATFORM&MenuCode=C100");
                                    } else {
                                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                        $("#operateTip").html("" + jsonRes.Message + "").change();
                                    }
                                },
                                error: function () {
                                    $("#btnPublishToDestribution").addClass("submit01").removeClass("disabled").attr("disabled", false); //恢复按钮
                                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                    $("#operateTip").html("发布到分销错误").change();
                                }
                            });
                        } else {
                            $("#btnPublishToDestribution").addClass("submit01").removeClass("disabled").attr("disabled", false); //恢复按钮,脚本验证不通过
                        }
                    });

                    $("#btnPublishToTaobao").click(function () {
                        //禁用按钮
                        $(this).removeClass("submit01").addClass("disabled").attr("disabled", "disabled");

                        var validateRes = ValidateTaobaoUserInput();
                        if (validateRes == true) {
                            var channelItemViewObj = new ChannelItemViewObj();
                            channelItemViewObj.entity.ChannelItem.ID = 0;
                            channelItemViewObj.entity.ChannelItem.ChannelCode = channelCode;
                            channelItemViewObj.entity.ChannelItem.ProductID = $("#hiddenProductID").val();
                            channelItemViewObj.entity.ChannelItem.ProductNo = $("#hiddenProductNo").val();
                            channelItemViewObj.entity.ChannelItem.OuterNo = "";
                            channelItemViewObj.entity.ChannelItem.CreatedBy = "";
                            channelItemViewObj.entity.ChannelItem.DateCreated = new Date();
                            channelItemViewObj.entity.ChannelItem.ModifiedBy = "";
                            channelItemViewObj.entity.ChannelItem.DateModified = new Date();
                            channelItemViewObj.entity.ChannelItem.SalesPrice = parseInt($("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, ""));
                            channelItemViewObj.entity.ChannelItem.CostPrice = 0;
                            channelItemViewObj.entity.ChannelItem.EnableDiscount = false;
                            channelItemViewObj.entity.ChannelItem.Stock = productViewObj.Product.Stock;

                            if ($(".specContainerForTaobao .specCombineTable").css("display") != "none") {
                                $(".specContainerForTaobao .specCombineTable tr:not(:first)").each(function () {
                                    //找出GoodsNo
                                    var skuMark = $(".specConbineMark", $(this)).attr("id");
                                    var thisGoodsNo = "";
                                    for (var i = 0; i < productViewObj.DetailList.length; i++) {
                                        var testRes = false;
                                        var flag = 0;
                                        for (var j = 0; j < productViewObj.DetailList[i].SpecificationList.length; j++) {
                                            var thisSpecValueID = productViewObj.DetailList[i].SpecificationList[j].ProductSpecification.SpecValID;
                                            var reg = eval("/" + thisSpecValueID + "/g");
                                            testRes = reg.test(skuMark);
                                            if (testRes == false) {
                                                flag++;
                                            }
                                        }
                                        if (flag == 0) {
                                            thisGoodsNo = productViewObj.DetailList[i].ProductDetail.GoodsNo;
                                        }
                                    }

                                    var productInChannel = new ProductInChannel();
                                    productInChannel.entity.ID = 0;
                                    productInChannel.entity.ChannelCode = channelCode;
                                    productInChannel.entity.GoodsNo = thisGoodsNo; //上面根据规格值ID在productView实体中匹配出来的GoodsNo
                                    productInChannel.entity.State = 0; //后台查询赋值
                                    productInChannel.entity.NoticePath = "";
                                    productInChannel.entity.OuterNo = "";
                                    productInChannel.entity.ProductID = $("#hiddenProductID").val();
                                    productInChannel.entity.ProductNo = $("#hiddenProductNo").val();
                                    productInChannel.entity.ProductDetailID = 0; //后台查询赋值
                                    productInChannel.entity.SalesPrice = parseInt($("#txtPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtPrice", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, ""));
                                    productInChannel.entity.CostPrice = 0;
                                    productInChannel.entity.CreatedBy = "";
                                    productInChannel.entity.DateCreated = new Date();
                                    productInChannel.entity.ModifiedBy = "";
                                    productInChannel.entity.DateModified = new Date();
                                    productInChannel.entity.Stock = parseInt($("#txtCount", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtCount", $(this)).val().replace(/^\s*/g, "").replace(/\s*$/g, ""));
                                    channelItemViewObj.entity.ChannelProducts.push(productInChannel.entity);
                                });
                            }


                            //收集用户选择的店铺类目信息
                            var productInCategoryCategoryIDs = new Array();
                            $("#dvProductInCategoryContainer input[type=checkbox]:checked").each(function () {
                                var itsID = $(this).attr("id").replace("shopCat", "");
                                productInCategoryCategoryIDs.push(itsID);
                            });


                            //var deliveryInfoForProductObjStr = JSON.stringify(deliveryInfoForProductObj.entity);
                            //修改完毕之后发布到淘宝
                            var channelItemViewObjStr = JSON.stringify(channelItemViewObj.entity);

                            var productInCategoryCategoryIDsStr = JSON.stringify(productInCategoryCategoryIDs);
                            //var destributionPriceStr = JSON.stringify(destributionPrice.entity);
                            $.ajax({
                                url: "../../Product/PublishToSingleChannel",
                                type: "post",
                                data: { "channelItemViewObjStr": channelItemViewObjStr, "destributionPriceStr": "", "productInCategoryCategoryIDsStr": productInCategoryCategoryIDsStr },
                                success: function (res) {
                                    var jsonRes = JSON.parse(res);
                                    if (jsonRes.Code == null && jsonRes.Message == null) {
                                        var appCode = GetUrlAppCode();
                                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                        $("#operateTip").html("发布成功!").change();
                                        RedirectTo("../../Product/index?appCode=C001&MenuCode=C113");
                                    } else {
                                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                        $("#operateTip").html("" + jsonRes.Message + "").change();
                                    }
                                    $("#btnPublishToTaobao").addClass("submit01").removeClass("disabled").attr("disabled", false); //恢复按钮
                                },
                                error: function () {
                                    $("#btnPublishToTaobao").addClass("submit01").removeClass("disabled").attr("disabled", false); //恢复按钮
                                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                                    $("#operateTip").html("发布到淘宝失败").change();
                                }
                            });
                        } else {
                            $("#btnPublishToTaobao").addClass("submit01").removeClass("disabled").attr("disabled", false); //恢复按钮，验证不通过
                        }
                    });

                    //编辑过来的时候 设置一些按钮图标的样式
                    $(".mod-tab ul li").removeClass("unable");
                    $(".mod-tab ul li").click(function () {
                        $(".mod-tab ul li").removeClass("current");
                        $(".mod-tab ul a").removeClass("c16");
                        $(this).addClass("current");
                        $("a", $(this)).addClass("c16");
                    });

                    $("#liBaseData").click(function () {

                        $("#txtProductTitle").val(productViewObj.Product.Name);
                        if ($(".specContainer .specCombineTable tr:first td").text() != "" && $(".specContainer .specCombineTable tr:first td").text() != undefined) { //切换到基础数据页面，如果已经存在规格组合表的表头了，就重复不添加了
                            clickTimes = 1;
                            createFlag = 1;
                        }
                        $("#baseInfoContainer input").attr("disabled", false);
                        $("#extendInfoContainer input,select").attr("disabled", false);
                        $("#spEdit").css("display", "block"); //隐藏类目选择按钮
                        $("#propertyContainer input,select").attr("disabled", false);
                        $("#specContainer input").attr("disabled", false);
                        $("#foodSecurityContainer input[type=text]").attr("disabled", false);
                        $(".uploadImgItemPreview").bind({
                            "mouseenter": function () {
                                if (!$(".operateImg", $(this)).is(":animated")) {
                                    $(".operateImg", $(this)).slideDown();
                                }
                            },
                            "mouseleave": function () {
                                $(".operateImg", $(this)).slideUp();
                            }
                        });

                        $("#dvProductDestribution").css("display", "block"); //富文本编辑
                        $("#dvProductInCategory").css("display", "none"); //店铺类目
                        //$("#dvDelivery").css("display", "none"); //运费部分隐藏
                        $("#btnSave").css("display", "block"); //提交基础数据按钮显示
                        $("#btnPublishToTaobao,#btnPublishToDestribution").css("display", "none");
                        $(".specContainer").css("display", "block");
                        $(".specContainerForDestribution").css("display", "none");
                        $(".specContainerForTaobao").css("display", "none");
                        $("#txtProductPriceA").parent().parent().css("display", "block"); //显示一口价
                        $("#txtJingxiaoA,#txtDaixiaoA,#txtLingshouA,#txtJingxiaoMinCount,#slProductLine").parent().parent().css("display", "none"); //隐藏经销，代销，建议零售价
                        $("#rapidRelease").css("display", "block");

                    });

                    $("#liFenxiaoData").click(function () {

                        var currentChannel = $("input[type=hidden]", $(this)).val();
                        GetItemInChannelProductName(productViewObj.Product.ID, currentChannel);
                        $("#baseInfoContainer input").attr("disabled", "disabled");
                        $("#extendInfoContainer input,select").attr("disabled", "disabled");
                        $("#spEdit").css("display", "none"); //隐藏类目选择按钮
                        $("#propertyContainer input,select").attr("disabled", "disabled");
                        $("#specContainer input:not(:checked)").attr("disabled", "disabled");
                        $("#foodSecurityContainer input[type=text]").attr("disabled", "disabled");
                        $(".uploadImgItemPreview").unbind("hover");
                        $("#dvProductDestribution").css("display", "none"); //禁用富文本编辑，暂未实现，先隐藏了
                        $("#dvProductInCategory").css("display", "block"); //店铺类目
                        GetProductInCategoryInfo("C002"); //获取店铺类目信息
                        GetShopCategoryForProduct(productViewObj.Product.ID, "C002"); //在GetProperty.js文件里
                        $("#dvProductInCategory input").attr("disabled", false);
                        //$("#dvDelivery").css("display", "none"); //运费部分隐藏
                        $("#btnPublishToDestribution").css("display", "block"); //提交分销商城按钮显示
                        $("#btnSave,#btnPublishToTaobao").css("display", "none");
                        $(".specContainer").css("display", "none");
                        $(".specContainerForDestribution").css("display", "block");
                        $(".specContainerForTaobao").css("display", "none");
                        $("#txtProductPriceA").parent().parent().css("display", "none"); //隐藏一口价
                        $("#txtJingxiaoA,#txtDaixiaoA,#txtLingshouA,#txtJingxiaoMinCount,#slProductLine").parent().parent().css("display", "block"); //显示经销，代销，建议零售价
                        $("#txtJingxiaoA,#txtDaixiaoA,#txtLingshouA,#txtJingxiaoMinCount,#slProductLine").attr("disabled", false);
                        $("#rapidRelease").css("display", "none");


                        InitSelectThisSpecForDestributon("specContainerForDestribution");
                        $.ajax({
                            url: "../../Product/GetDestributionSpec",
                            type: "get",
                            data: { "channelCode": "C002", "productID": productViewObj.Product.ID },
                            async: false,
                            success: function (res) {
                                var jsonRes = JSON.parse(res);
                                $(".specContainerForDestribution input[type=checkbox]").each(function () {
                                    var thisSpecValueID = $(this).val();
                                    for (var i = 0; i < jsonRes.length; i++) {
                                        for (var j = 0; j < jsonRes[i].SpecValueList.length; j++) {
                                            if (thisSpecValueID == jsonRes[i].SpecValueList[j].SpecValueID) {
                                                $(this).attr("checked", "checked");
                                            }
                                        }
                                    }
                                });

                                $(".specContainerForDestribution input[type=checkbox]:checked").each(function () {
                                    if (browserVer == "IE8") {
                                        $(this).removeAttr("checked"); //兼容性问题,如果是IE8(低版本IE),要先将checked属性取消掉
                                    }
                                    $(this).click().attr("checked", "checked");
                                    $("input[type=text]", $(this).parent()).blur();
                                });

                                $(".specContainerForDestribution .specCombineTable tr:not(:first)").each(function () {
                                    var specValueMark = $("td[class=specConbineMark]", $(this)).attr("id");
                                    for (var i = 0; i < jsonRes.length; i++) {
                                        var regTest = false;
                                        var flag = 0;
                                        for (var j = 0; j < jsonRes[i].SpecValueList.length; j++) {
                                            var currentSpecValue = jsonRes[i].SpecValueList[j].SpecValueID;
                                            var reg = eval("/" + currentSpecValue + "/g");
                                            regTest = reg.test(specValueMark);
                                            if (regTest == false) {
                                                flag++;
                                            }
                                        }
                                        if (flag == 0) {
                                            $("#txtDaixiaoPrice", $(this)).val(jsonRes[i].DaixiaoPrice).blur();
                                            $("#txtJingxiaoPrice", $(this)).val(jsonRes[i].JingxiaoPrice).blur();
                                            $("#txtLingshouPrice", $(this)).val(jsonRes[i].LingshouPrice).blur();
                                            $("#txtCount", $(this)).val(jsonRes[i].Stock);
                                            $("#txtProductCode", $(this)).val(jsonRes[i].OuterCode).attr("disabled", "disabled");
                                            $(".thisSKUCode", $(this)).val(jsonRes[i].SkuCode);
                                        }
                                    }
                                });
                            },
                            error: function () {
                            }

                        });

                        $.ajax({
                            url: "../../Product/GetProductLineInfo",
                            type: "get",
                            async: false,
                            success: function (res) {
                                $("#slProductLine option:not(:first)").remove();
                                var jsonRes = JSON.parse(res);
                                for (var i = 0; i < jsonRes.length; i++) {
                                    var $option = $("<option value='" + jsonRes[i].ID + "'rate='" + jsonRes[i].WholeSalePriceRate + "," + jsonRes[i].DistributionPriceRate + "," + jsonRes[i].SalesPriceRateMin + "~" + jsonRes[i].SalesPriceRateMax + "'>" + jsonRes[i].Name + "</option>");
                                    $("#slProductLine").append($option);
                                }
                                $("#slProductLine").val(productViewObj.Product.ProductLineID);
                            },
                            error: function () {
                            }
                        });

                        //将非平台的规格禁用
                        var baseSpec = new Array();
                        $("#specContainer input[type=checkbox]:checked").each(function () {
                            baseSpec.push($(this).val());
                        });
                        $("#specContainerForDestribution input[type=checkbox]").each(function () {
                            var flag = 0;
                            for (var i = 0; i < baseSpec.length; i++) {
                                if ($(this).val() == baseSpec[i]) {
                                    flag++;
                                    break;
                                }
                            }
                            if (flag == 0) {
                                $(this).attr("disabled", "disabled");
                            } else {
                                $(this).attr("disabled", false);
                            }
                        });
                    });

                    $(".liTaobaoData,.liZhiyingData").click(function () {
                        var currentChannel = $("input[type=hidden]", $(this)).val();
                        GetItemInChannelProductName(productViewObj.Product.ID, currentChannel);

                        channelCode = $("input[type=hidden]", $(this)).val(); //该授权渠道的编号
                        if (channelCode == "C001") {
                            $("#btnPublishToTaobao").text("发布到微商城");
                        } else {
                            $("#btnPublishToTaobao").text("发布到淘宝");
                        }

                        $("#baseInfoContainer input").attr("disabled", "disabled");
                        $("#extendInfoContainer input,select").attr("disabled", "disabled");
                        $("#spEdit").css("display", "none"); //隐藏类目选择按钮
                        $("#propertyContainer input,select").attr("disabled", "disabled");
                        $("#specContainer input:not(:checked)").attr("disabled", "disabled");
                        $("#foodSecurityContainer input[type=text]").attr("disabled", "disabled");
                        $(".uploadImgItemPreview").unbind("hover");
                        $("#dvProductDestribution").css("display", "none"); //禁用富文本编辑，暂未实现，先隐藏了
                        $("#dvProductInCategory").css("display", "block"); //店铺类目
                        GetProductInCategoryInfo(channelCode); //获取店铺类目信息
                        GetShopCategoryForProduct(productViewObj.Product.ID, channelCode); //在GetProperty.js文件里
                        $("#dvProductInCategory input").attr("disabled", false);

                        $("#btnPublishToTaobao").css("display", "block"); //提交淘宝按钮显示
                        $("#btnSave,#btnPublishToDestribution").css("display", "none");
                        $(".specContainer").css("display", "none");
                        $(".specContainerForDestribution").css("display", "none");
                        $(".specContainerForTaobao").css("display", "block");
                        $("#txtProductPriceA").parent().parent().css("display", "block"); //显示一口价
                        $("#txtJingxiaoA,#txtDaixiaoA,#txtLingshouA,#txtJingxiaoMinCount,#slProductLine").parent().parent().css("display", "none"); //隐藏经销，代销，建议零售价
                        $("#rapidRelease").css("display", "none");
                        InitSelectThisSpecForTaobao("specContainerForTaobao");


                        $.ajax({
                            url: "../../Product/GetDestributionSpec",
                            type: "get",
                            data: { "channelCode": channelCode, "productID": productViewObj.Product.ID },
                            success: function (res) {
                                if (res.length > 2) {
                                    var jsonRes = JSON.parse(res);
                                    $(".specContainerForTaobao input[type=checkbox]").each(function () {
                                        var thisSpecValueID = $(this).val();
                                        for (var i = 0; i < jsonRes.length; i++) {
                                            for (var j = 0; j < jsonRes[i].SpecValueList.length; j++) {
                                                if (thisSpecValueID == jsonRes[i].SpecValueList[j].SpecValueID) {
                                                    $(this).attr("checked", "checked");
                                                }
                                            }
                                        }
                                    });

                                    $(".specContainerForTaobao input[type=checkbox]:checked").each(function () {
                                        if (browserVer == "IE8") {
                                            $(this).removeAttr("checked"); //兼容性问题,如果是IE8(低版本IE),要先将checked属性取消掉
                                        }
                                        $(this).click().attr("checked", "checked");
                                        $("input[type=text]", $(this).parent()).blur();
                                    });

                                    $(".specContainerForTaobao .specCombineTable tr:not(:first)").each(function () {
                                        var specValueMark = $("td[class=specConbineMark]", $(this)).attr("id");
                                        for (var i = 0; i < jsonRes.length; i++) {
                                            var regTest = false;
                                            var flag = 0;
                                            for (var j = 0; j < jsonRes[i].SpecValueList.length; j++) {

                                                var currentSpecValue = jsonRes[i].SpecValueList[j].SpecValueID;
                                                var reg = eval("/" + currentSpecValue + "/g");
                                                regTest = reg.test(specValueMark);
                                                if (regTest == false) {
                                                    flag++;
                                                }
                                            }
                                            if (flag == 0) {
                                                $("#txtPrice", $(this)).val(jsonRes[i].SalesPrice).blur();
                                                $("#txtCount", $(this)).val(jsonRes[i].Stock);
                                                $("#txtProductCode", $(this)).val(jsonRes[i].OuterCode);
                                                $(".thisSKUCode", $(this)).val(jsonRes[i].SkuCode);
                                            }
                                        }
                                    })
                                } else { //如果没有取到数据的话，证明在该渠道没有发布过这件商品，将所有的sku选择值checkbox取消选中
                                    $(".specContainerForTaobao input[type=checkbox]").each(function () {
                                        $(this).attr("checked", false);
                                    })
                                }
                            },
                            error: function () {
                            }
                        });
                        //将非平台的规格禁用
                        var baseSpec = new Array();
                        $("#specContainer input[type=checkbox]:checked").each(function () {
                            baseSpec.push($(this).val());
                        });
                        $("#specContainerForTaobao input[type=checkbox]").each(function () {
                            var flag = 0;
                            for (var i = 0; i < baseSpec.length; i++) {
                                if ($(this).val() == baseSpec[i]) {
                                    flag++;
                                    break;
                                }
                            }
                            if (flag == 0) {
                                $(this).attr("disabled", "disabled");
                            } else {
                                $(this).attr("disabled", false);
                            }
                        });
                    });

                    // 数据绑定完成之后触发一下当前渠道的按钮，激活渠道编辑页面，这样可以禁用对于渠道来说是平台编辑的商品信息的表单
                    $("#ulImpowerChannel li input[type=hidden]").each(function () {
                        if ($(this).val() == appCode) {
                            $(this).parents("li").click();;
                        }
                    });
                } else {
                    $("#addProductFlag").text("快速发布商品");
                }


            });

        });

        function GetItemInChannelProductName(productID, channelCode) {
            $.ajax({
                url: "../../Product/GetItemInChannelProductName",
                type: "post",
                data: { "productID": productID, "channelCode": channelCode },
                success: function (res) {
                    $("#txtProductTitle").val(res);
                }
            });
        }

        //用户选择了某个产品线执行的方法，主要是根据产品线折扣计算分销商城商品的各个价格
        function SelectThisProductLine(event) {
            //全局变量productSalePrice，页面加载时已赋值;
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var rateStr = $(eventSrc).find("option:selected").attr("rate");
            var rates = rateStr.split(',');
            var jingxiaoRate = rates[0];
            var daixiaoRate = rates[1];
            var lingshouRates = rates[2].split('~');
            var lingshouRateMin = lingshouRates[0];
            var lingshouRateMax = lingshouRates[1];
            $("#txtJingxiaoA").val(productSalePrice * jingxiaoRate / 100).blur();
            $("#txtDaixiaoA").val(productSalePrice * daixiaoRate / 100).blur();
            $("#txtLingshouA").val((productSalePrice * lingshouRateMin / 100) + "~" + (productSalePrice * lingshouRateMax / 100)).blur();
        }
        //弹层,并在这一层上做类目选择操作
        function CreateCoverDivForGrand() {
            //清空之前产生的数据
            $("#dvCategorySelect").text("");

            //在弹层内创建类目选择
            var selectDiv = document.createElement('div');
            selectDiv.id = "selectDiv";
            $(selectDiv).addClass("selectCat");
            //selectDiv.style.cssText = 'background-color:white; width:1050px; height: 400px;margin-top:20px;';

            $("#dvCategorySelect").append($(selectDiv));


            //弹层
            popupOperate("dvCategorySelect", "类目选择", "productCategory");

            var $selectDiv = $("#selectDiv");


            //创建一个容器来放类型选择的一些列div
            var $categoryDivContainer = $("<div id='categoryDivContainer' class='categoryContainer'></div>");
            $selectDiv.append($categoryDivContainer);
            var $rootCategoryDiv = CreateSelectCatgoryDiv(240, 300, 1);
            $categoryDivContainer.append($rootCategoryDiv);
            //去获取根类目的数据加载在$rootCategoryDiv中
            $.ajax({
                url: "../../Category/Categories",
                method: "get",
                data: { "categoryID": 0 },
                success: function (res) {
                    var jsonRes = JSON.parse(res);
                    //var jsonRes = eval("(" + res + ")");
                    var $data = GetProductCategoryData(jsonRes);
                    $rootCategoryDiv.append($data);
                },
                error: function () {
                }
            });

            //已经选择的类目项显示条
            var $hasSelectedCategoryDiv = $("<div class='cate-path' class='categoryPath'><div class='hasSelectedCategoryDiv'><div class='hasSelectedCategoryDivText'>您当前选择的是：</div><div id='selectedCategoryName' style='float:left'></div></div></div>");
            $selectDiv.append($hasSelectedCategoryDiv);
            //确定按钮
            var $btnOk = $("<div class='btn'><div class='indiv'><button id='btnOk' class='submit01-alert r10' onclick='SelectOK()'>已选好类目，进入下一步</button><button id='btnWait' class='disabled-alert' style='display:inline;'>请继续选择</button></div></div>");

            $("#selectDiv").parent().append($btnOk);

        }

        //页面上弹出层选择类目的方法
        var $currentSelectCategoryDivIdNum;
        function ClickHasSubCategory(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var $eventSrc = $(eventSrc);
            if ($eventSrc.attr("class") == "hasSubCategory") {
                $eventSrc = $eventSrc.parent();
            }
            var $currentCategoryID = $eventSrc.attr("id");
            $currentSelectCategoryDivIdNum = RemoveDiv($eventSrc);
            //根据触发获取子类目事件的id请求parentID为该id的类目数据
            $.ajax({
                url: "../../Category/Categories",
                type: "get",
                data: { "categoryID": $currentCategoryID },
                success: function (res) {
                    if (res != null) {
                        var jsonRes = JSON.parse(res);
                        var $categoryDiv = CreateSelectCatgoryDiv(240, 300, (parseInt($currentSelectCategoryDivIdNum) + 1));
                        $("#categoryDivContainer").append($categoryDiv);
                        var $data = GetProductCategoryData(jsonRes);
                        $categoryDiv.append($data);

                        //点击某一个父类目之后，将其categoryName记录在类样式名为hasSelectedCategoryDiv的div中
                        var $selectedCategory = $("<span id=" + $currentSelectCategoryDivIdNum + ">" + $eventSrc.text() + "&gt&gt</span>");
                        $(".hasSelectedCategoryDiv #selectedCategoryName").append($selectedCategory);
                        //$(".cate-path").append($selectedCategory);
                        //点击有子类目的项之后将“已选好类目，进入下一步”按钮隐藏

                        $("#btnOk").css("display", "none");
                        $("#btnWait").css("display", "inline");
                    }
                },
                error: function () {
                }
            });
        }
        function ClickNoSubCategory(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var $eventSrc = $(eventSrc);

            $currentSelectCategoryDivIdNum = RemoveDiv($eventSrc);

            //点击某一个非父类目（终节点）类目项之后，将其categoryId和categoryName记录在类样式名为hasSelectedCategoryDiv的div中
            var $selectedCategory = $("<span id=" + $currentSelectCategoryDivIdNum + " cID=" + $eventSrc.attr("id") + ">" + $eventSrc.text() + "</span>");
            $(".hasSelectedCategoryDiv #selectedCategoryName").append($selectedCategory);
            //点击非父类目（终节点）的项之后将“已选好类目，进入下一步”按钮显示
            $("#btnOk").css("display", "inline");
            $("#btnWait").css("display", "none");
        }

        function SelectOK() {
            $("#btnOk").removeClass("submit01").addClass("disabled").attr("disabled", "disabled"); //禁用按钮
            var $categoryText = $("#selectedCategoryName").text();
            var $categoryID = $("#selectedCategoryName span:last").attr("cID");

            var $txtProductCategory = $("#txtProductCategory");
            $txtProductCategory.val($categoryText);
            //////////////$txtProductCategory.text($categoryID);
            $txtProductCategory.attr("text", $categoryID);
            //            $("#selectDiv").remove();
            //            $("#coverDiv").remove();
            //            $("#selectDiv").css("display", "none");
            //            $("#coverDiv").css("display", "none");
            popupClose('productCategory');

            //触发加载属性事件(参数：加载属性信息的容器ID，用户选择的类目的ID)

            GetProperty("propertyContainer", $categoryID);
            GetSpec("specContainer", $categoryID);
            $("#btnOk").removeClass("disabled").addClass("submit01").attr("disabled", false); //启用按钮

            if ($("#specContainer li").length > 0) {
                $("#specContainer").parent().css("display", "block");
            }
        }


        $(function () {
            //左侧菜单区域的高度等于文档的高度
            $(".MCM-L-menu").css("height", $(document).height());
        });

        //计算价格 2014-9-11 tanyq Insert
        function shopUpdatePrice() {
            var salePrice = $("#txtProductPriceA").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            var operaMark = "";
            var floatPrice = 0;
            if ($("#rdChange1").attr("checked") == "checked") {
                operaMark = TrimSpace($("#slOprator").val());
                floatPrice = TrimSpace($("#txtFloatPrice").val());
                if (floatPrice == "") {
                    //$(".c03", $("#txtFloatPrice").parents("li")).html("价格不能为空").change();
                    return "价格不能为空";
                }
                if (parseFloat(floatPrice) == 0)
                {
                    return "价格不能为0";
                }
                var r = /^\d+(\.\d+|\d*)$/g;
                if (r.test(floatPrice) == false) {
                    //$(".c03", $("#txtFloatPrice").parents("li")).html("价格只能为整数，小数").change();
                    return "价格只能为整数，小数";
                }
               
            } else {
                var val = $("#txtAllPrice").val();
                if (val == "") {
                    //$(".c03", $("#txtAllPrice").parents("li")).html("价格不能为空").change();
                    return "价格不能为空";
                }
                if (parseFloat(val) == 0) {
                    return "价格不能为0";
                }
                var r = /^\d+(\.\d+|\d*)$/g;
                if (r.test(val) == false) {
                    //$(".c03", $("#txtAllPrice").parents("li")).html("价格只能为整数，小数").change();
                    return "价格只能为整数，小数";
                }
                salePrice = TrimSpace($("#txtAllPrice").val());
            }

            //var updatePriceStr = JSON.stringify(updatePrice.entity);
            //var multiIDStr = JSON.stringify(multiID);
            //var resMark = 0;
            

            if (salePrice < 0)
            {
                return "商品修改以后的价格小于0";
            }
            $("#hiddenSalePrice").val(floatPrice);
            return "";
        }

        //获取属性Value
        function GetPropertyValue(categoryID)
        {
            var propertyEntity = new Object();
            $.ajax({
                url: "../../Category/GetPropertyByCatoryID",
                type: "get",
                data: { "catoryID": categoryID },
                async: false,
                success: function (res2) {
                    //alert(res2);
                    if (res2.length > 2) { //没有找到一个可以兼容取二级属性全部值的方法，这里先放了两个方法，第一个根据categoryID、parentVID去取，如果这个方法没有取到，就再发一次ajax请求，如下
                        propertyEntity= JSON.parse(res2);
                    } 
                },
                error: function () {
                    $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
                    $("#operateTip").html("加载属性值错误").change();
                }
            });
            return propertyEntity;
        }
    </script>
</asp:Content>
