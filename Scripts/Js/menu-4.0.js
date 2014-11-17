// JavaScript Document
$(document).ready(function(){
	
//平台左侧菜单
menuItemsSource = [
/*1.订单*/
{"ID": 1, "Name": "订单", "ParentID": 0, "Status": 1, "Url": "../../OrderForm/OrderList" },
  {"ID":11,"Name":"订单管理","ParentID":1,"Status":1,"Url":""},
    { "ID": 110, "Name": "订单列表", "ParentID": 11, "Status": 1, "Url": "../../OrderForm/OrderList" },
//    { "ID": 110, "Name": "人工订单", "ParentID": 11, "Status": 1, "Url": "../../Product/text" },
//    { "ID": 110, "Name": "导入订单", "ParentID": 11, "Status": 1, "Url": "../../Product/text" },
//  {"ID":12,"Name":"单据管理","ParentID":1,"Status":1,"Url":""},
//    { "ID": 120, "Name": "发货单", "ParentID": 12, "Status": 1, "Url": "../../Product/text" },
//	{ "ID": 120, "Name": "快递单", "ParentID": 12, "Status": 1, "Url": "../../Product/text" },
//	{ "ID": 120, "Name": "拣货单", "ParentID": 12, "Status": 1, "Url": "../../Product/text" },
  {"ID": 13, "Name": "订单设置", "ParentID": 1, "Status": 1, "Url": "../../Product/text" },
    { "ID": 130, "Name": "常规", "ParentID": 13, "Status": 1, "Url": "../../OrderSet/DownloadSetting" },
//    { "ID": 132, "Name": "标签", "ParentID": 13, "Status": 1, "Url": "../../OrderSet/OrderTag" },
//    { "ID": 134, "Name": "分组", "ParentID": 13, "Status": 1, "Url": "../../OrderSet/OrderGroup" },
    { "ID": 136, "Name": "问题订单", "ParentID": 13, "Status": 1, "Url": "../../OrderSet/QuestionOrder" },
 //{ "ID": 138, "Name": "订单设置", "ParentID": 13, "Status": 1, "Url": "../../OrderSet/Routine" },
//    { "ID": 12, "Name": "退货", "ParentID": 1, "Status": 1, "Url": "" },
//    { "ID": 120, "Name": "退货签收", "ParentID": 12, "Status": 1, "Url": "../../Product/text" },
//    { "ID": 120, "Name": "退货列表", "ParentID": 12, "Status": 1, "Url": "../../Product/text" },
  
/*2.商品*/
{"ID": 2, "Name": "商品", "ParentID": 0, "Status": 1, "Url": "../../Product/index/page=1&noStock=0&condition=" },
  {"ID":21,"Name":"商品管理","ParentID":2,"Status":1,"Url":""},
	{ "ID": 210, "Name": "商品列表", "ParentID": 21, "Status": 1, "Url": "../../Product/index/page=1&noStock=0&condition=" },
	{ "ID": 210, "Name": "添加商品", "ParentID": 21, "Status": 1, "IsNew": "_blank", "Url": "../../Product/AddProduct/0" },
	{ "ID": 210, "Name": "商品导入", "ParentID": 21, "Status": 1, "Url": "../../ImportGoods/Index" },
	{"ID":22,"Name":"商品设置","ParentID":2,"Status":1,"Url":""},
	  { "ID": 220, "Name": "常规", "ParentID": 22, "Status": 1, "Url": "../../Commodity/CommodityConvention" },
      { "ID": 222, "Name": "分类", "ParentID": 22, "Status": 1, "Url": "../../Commodity/CommodityClassify" },
//      { "ID": 224, "Name": "标签", "ParentID": 22, "Status": 1, "Url": "../../Commodity/CommodityLabel" },
      { "ID": 226, "Name": "产品线", "ParentID": 22, "Status": 1, "Url": "../../Commodity/CommodityProduction" },                                                    
//      { "ID": 228, "Name": "商品设置", "ParentID": 22, "Status": 1, "Url": "../../Commodity/CommodityConvention" },

  
/*3.客户*/
{"ID": 3, "Name": "会员", "ParentID": 0, "Status": 1, "Url": "../../CustomerManage/CustomerList" },
 {"ID":31,"Name":"会员管理","ParentID":3,"Status":1,"Url":""},
	{ "ID": 311, "Name": "会员列表", "ParentID": 31, "Status": 1, "Url": "../../CustomerManage/CustomerList" },
//	{"ID":311,"Name":"会员充值","ParentID":31,"Status":1,"Url":"customer/会员管理-会员充值.html"},
  {"ID":32,"Name":"会员设置","ParentID":3,"Status":1,"Url":""},
	{ "ID": 321, "Name": "会员等级", "ParentID": 32, "Status": 1, "Url": "../../customer/gradelist" },	
{"ID":33,"Name":"会员营销","ParentID":3,"Status":1,"Url":""},
	{ "ID": 331, "Name": "营销活动", "ParentID": 33, "Status": 1, "Url": "../../Promotion/PromotionList" },
	{ "ID": 332, "Name": "优惠券", "ParentID": 33, "Status": 1, "Url": "../../Promotion/CouponList" },
//{"ID":34,"Name":"消息管理","ParentID":3,"Status":1,"Url":""},
//	{"ID":341,"Name":"审核设置","ParentID":34,"Status":1,"Url":"customer/消息管理-审核设置.html"},
//	{"ID":342,"Name":"咨询列表","ParentID":34,"Status":1,"Url":"customer/消息管理-咨询列表.html"},
//	{"ID":343,"Name":"评价列表","ParentID":34,"Status":1,"Url":"customer/消息管理-评价列表.html"},
//	{"ID":344,"Name":"留言列表","ParentID":34,"Status":1,"Url":"customer/消息管理-留言列表.html"},
//	{"ID":345,"Name":"站内消息","ParentID":34,"Status":1,"Url":"customer/消息管理-站内消息.html"},

//物流
{"ID": 9, "Name": "物流", "ParentID": 0, "Status": 1, "Url": "../../Dispatching/LogisticsCompanyList" },
{ "ID": 91, "Name": "配送设置", "ParentID": 9, "Status": 1, "Url": "" },
//{ "ID": 910, "Name": "物流公司", "ParentID": 91, "Status": 1, "Url": "../../Dispatching/LogisticsCompanyList" },
//{ "ID": 911, "Name": "收货地址", "ParentID": 91, "Status": 1, "Url": "../../Dispatching/LogisticsMailAddress" },
{ "ID": 912, "Name": "运费模板", "ParentID": 91, "Status": 1, "Url": "../../Dispatching/Transportation" },
{ "ID": 915, "Name": "快递单模板", "ParentID": 91, "Status": 1, "Url": "../../Logistics/PrintTemplateList" },

/*4.报表*/
//{"ID": 4, "Name": "报表", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":41,"Name":"销售统计","ParentID":4,"Status":1,"Url":"reports/销售统计.html"},
//	{"ID":410,"Name":"订单统计","ParentID":41,"Status":1,"Url":"reports/订单统计.html"},
//  {"ID":42,"Name":"客户统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":420,"Name":"会员统计","ParentID":42,"Status":1,"Url":"reports/会员统计.html"},
//	{"ID":420,"Name":"销售统计","ParentID":42,"Status":1,"Url":"reports/销售统计.html"},
//  {"ID":43,"Name":"商品统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":430,"Name":"销售排行榜","ParentID":43,"Status":1,"Url":"reports/商品销售排行统计.html"},
//	{"ID":430,"Name":"购买次数统计","ParentID":43,"Status":1,"Url":"reports/商品访问购买次数统计.html"},
//	{"ID":430,"Name":"销售次数统计","ParentID":43,"Status":1,"Url":"reports/销售统计报表.html"},  

/*5.分销*/ 
//{"ID":5,"Name":"分销","ParentID":0,"Status":1,"Url":""}, 
//  {"ID":51,"Name":"官方分销平台","ParentID":5,"Status":1,"Url":""},
//    {"ID":511,"Name":"系统设置","ParentID":51,"Status":1,"Url":"distribution/系统设置/"},
//	  {"ID":5111,"Name":"基础设置","ParentID":511,"Status":1,"Url":"distribution/系统设置-基础设置.html"},
//	  {"ID":5112,"Name":"安全设置","ParentID":511,"Status":1,"Url":"distribution/系统设置-安全设置.html"},
//	  {"ID":5113,"Name":"购物流程","ParentID":511,"Status":1,"Url":"distribution/系统设置-购物流程.html"},
//	  {"ID":5114,"Name":"水印设置","ParentID":511,"Status":1,"Url":"distribution/系统设置-水印设置.html"},
//	  {"ID":5115,"Name":"配送设置","ParentID":511,"Status":1,"Url":"distribution/系统设置-配送设置.html"},
//	  {"ID":5116,"Name":"支付设置","ParentID":511,"Status":1,"Url":"distribution/系统设置-支付设置.html"},
//	  {"ID":5117,"Name":"短信接口","ParentID":511,"Status":1,"Url":"distribution/系统设置-短信接口.html"},
//	  {"ID":5118,"Name":"邮件接口","ParentID":511,"Status":1,"Url":"distribution/系统设置-邮件接口.html"},
//	  {"ID":5119,"Name":"在线客服","ParentID":511,"Status":1,"Url":"distribution/系统设置-在线客服.html"},
//	  {"ID":5110,"Name":"搜索关键字","ParentID":511,"Status":1,"Url":"distribution/系统设置-搜索关键字.html"},
//    {"ID":512,"Name":"内容管理","ParentID":51,"Status":1,"Url":"distribution/内容管理/"},
//	  {"ID":5121,"Name":"文章类别","ParentID":512,"Status":1,"Url":"distribution/内容管理-文章类别.html"},
//	  {"ID":5122,"Name":"文章列表","ParentID":512,"Status":1,"Url":"distribution/内容管理-文章列表.html"},
//    {"ID":513,"Name":"店铺装修","ParentID":51,"Status":1,"Url":"distribution/店铺装修/"},
//	  {"ID":5131,"Name":"当前模板","ParentID":513,"Status":1,"Url":"distribution/店铺装修-当前模板.html"},
//	  {"ID":5133,"Name":"我的模板库","ParentID":513,"Status":1,"Url":"distribution/店铺装修-我的模板库.html"},
//	  {"ID":5134,"Name":"可视化编辑","ParentID":513,"Status":1,"Url":"distribution/店铺装修-可视化编辑.html"},
//	  {"ID":5135,"Name":"模版大世界","ParentID":513,"Status":1,"Url":"distribution/店铺装修-模版大世界.html"},
//	  {"ID":5136,"Name":"定制申请","ParentID":512,"Status":1,"Url":"distribution/店铺装修-定制申请.html"},
//	{"ID":514,"Name":"运维统计","ParentID":51,"Status":1,"Url":"distribution/运维统计/"},
//	  {"ID":5141,"Name":"CNZZ","ParentID":514,"Status":1,"Url":"distribution/运维统计-CNZZ.html"},
//	  {"ID":5142,"Name":"佰分点BAE","ParentID":514,"Status":1,"Url":"distribution/运维统计-佰分点BAE.html"},
//	  {"ID":5143,"Name":"佰分点BRE","ParentID":514,"Status":1,"Url":"distribution/运维统计-佰分点BRE.html"},
//	{"ID":515,"Name":"财务管理","ParentID":51,"Status":1,"Url":"distribution/财务管理.html"},
//	  {"ID":5151,"Name":"财务管","ParentID":515,"Status":1,"Url":"distribution/财务管理.html"},
	

/*6.推广*/  
//{"ID":6,"Name":"推广","ParentID":0,"Status":1,"Url":"javascript:void(0);"},

/*7.ERP*/
//{"ID": 7, "Name": "ERP+", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },

/*8.系统*/
{"ID": 8, "Name": "系统", "ParentID": 0, "Status": 1, "Url": "../../User/UserList" },
  {"ID":81,"Name":"系统管理","ParentID":8,"Status":1,"Url":""},
	{"ID":810,"Name":"店铺管理","ParentID":81,"Status":1,"Url":"../../Shop/Index"},
	{"ID": 811, "Name": "权限设置", "ParentID": 81, "Status": 1, "Url": "../../Role/RoleList" },
	{ "ID": 812, "Name": "管理员列表", "ParentID": 81, "Status": 1, "Url": "../../User/UserList" },
    
];


   for(var m in menuItemsSource){
      if(menuItemsSource[m].ParentID==0){
   	    menuItems.push(menuItemsSource[m]); 
      }
   }
   getChildren(menuItems);
   fillMenus();
   changeMenuItem();

   
//分销左侧菜单
menuItemsSource_distribution = [
/*1.订单*/
{"ID": 1, "Name": "订单", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":11,"Name":"订单管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":110,"Name":"订单列表","ParentID":11,"Status":1,"Url":"order_distribution/订单管理-订单列表.html"},
//    {"ID":110,"Name":"人工订单","ParentID":11,"Status":1,"Url":"order_distribution/订单管理-人工订单.html"},
//    {"ID":110,"Name":"导入订单","ParentID":11,"Status":1,"Url":"order_distribution/订单管理-导入订单.html"},
//  {"ID":12,"Name":"单据管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":120,"Name":"发货单","ParentID":12,"Status":1,"Url":"order_distribution/单据管理-发货单.html"},
//	{"ID":120,"Name":"快递单","ParentID":12,"Status":1,"Url":"order_distribution/单据管理-快递单.html"},
//	{"ID":120,"Name":"拣货单","ParentID":12,"Status":1,"Url":"order_distribution/单据管理-拣货单.html"},
//  {"ID":13,"Name":"设置","ParentID":1,"Status":1,"Url":""},
//    {"ID":130,"Name":"快递单设置","ParentID":13,"Status":1,"Url":"order_distribution/快递单设置.html"},
//    {"ID":130,"Name":"发货单设置","ParentID":13,"Status":1,"Url":"order_distribution/发货单设置.html"},
//	{"ID":130,"Name":"标签管理","ParentID":13,"Status":1,"Url":"order_distribution/标签管理.html"},
//  
/*2.商品*/
{"ID": 2, "Name": "商品", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":21,"Name":"商品管理","ParentID":2,"Status":1,"Url":""},	
//	{"ID":210,"Name":"商品列表","ParentID":21,"Status":1,"Url":"product_distribution/商品管理-商品列表.html"},	
//	{"ID":22,"Name":"商品设置","ParentID":2,"Status":1,"Url":""},
//	  {"ID":220,"Name":"分类管理","ParentID":22,"Status":1,"Url":"product_distribution/商品设置-商品分类.html"},
/*3.客户*/
{"ID": 3, "Name": "客户", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":31,"Name":"直营客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":311,"Name":"客户列表","ParentID":31,"Status":1,"Url":"customer_distribution/会员管理-会员列表.html"},
//	{"ID":312,"Name":"咨询评论","ParentID":31,"Status":1,"Url":""},
//	  {"ID":3120,"Name":"咨询列表","ParentID":312,"Status":1,"Url":"customer_distribution/咨询列表.html"},
//	  {"ID":3120,"Name":"评论列表","ParentID":312,"Status":1,"Url":"customer_distribution/评论列表.html"},
//	  {"ID":3120,"Name":"留言列表","ParentID":312,"Status":1,"Url":"customer_distribution/留言列表.html"},
//	  {"ID":3120,"Name":"站内消息","ParentID":312,"Status":1,"Url":"customer_distribution/站内消息.html"},
//	  {"ID":3120,"Name":"反馈设置","ParentID":312,"Status":1,"Url":""},
//	{"ID":31,"Name":"系统设置","ParentID":3,"Status":1,"Url":""},
//	  {"ID":32,"Name":"客户等级","ParentID":31,"Status":1,"Url":"customer_distribution/会员角色等级-直营.html"},
//	  {"ID":33,"Name":"编号设置","ParentID":31,"Status":1,"Url":"customer_distribution/编号设置.html"},
//  {"ID":32,"Name":"分销客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":310,"Name":"客户列表","ParentID":32,"Status":1,"Url":"customer_distribution/分销客户列表.html"},
//	{"ID":320,"Name":"咨询评论","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3200,"Name":"商品咨询","ParentID":320,"Status":1,"Url":"customer_distribution/咨询列表.html"},
//	  {"ID":3200,"Name":"商品评论","ParentID":320,"Status":1,"Url":"customer_distribution/评论列表.html"},
//	  {"ID":3200,"Name":"客户留言","ParentID":320,"Status":1,"Url":"customer_distribution/留言列表.html"},
//	  {"ID":3200,"Name":"站内短信","ParentID":320,"Status":1,"Url":"customer_distribution/站内消息.html"},
//	{"ID":330,"Name":"系统设置","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3300,"Name":"客户等级","ParentID":330,"Status":1,"Url":"customer_distribution/会员角色等级-分销.html"},
//	  {"ID":3300,"Name":"编号设置","ParentID":330,"Status":1,"Url":"customer_distribution/编号设置.html"}, 

/*4.报表*/
//{"ID": 4, "Name": "报表", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":41,"Name":"销售统计","ParentID":4,"Status":1,"Url":"reports_distribution/销售统计.html"},
//	{"ID":410,"Name":"订单统计","ParentID":41,"Status":1,"Url":"reports_distribution/订单统计.html"},
//  {"ID":42,"Name":"客户统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":420,"Name":"会员统计","ParentID":42,"Status":1,"Url":"reports_distribution/会员统计.html"},
//	{"ID":420,"Name":"销售统计","ParentID":42,"Status":1,"Url":"reports_distribution/销售统计.html"},
//  {"ID":43,"Name":"商品统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":430,"Name":"销售排行榜","ParentID":43,"Status":1,"Url":"reports_distribution/商品销售排行统计.html"},
//	{"ID":430,"Name":"购买次数统计","ParentID":43,"Status":1,"Url":"reports_distribution/商品访问购买次数统计.html"},
//	{"ID":430,"Name":"销售次数统计","ParentID":43,"Status":1,"Url":"reports_distribution/销售统计报表.html"},  

/*5.分销*/
//{"ID": 5, "Name": "分销", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }, 
//  {"ID":51,"Name":"官方分销平台","ParentID":5,"Status":1,"Url":""},
//    {"ID":511,"Name":"系统设置","ParentID":51,"Status":1,"Url":"distribution_distribution/系统设置/"},
//	  {"ID":5111,"Name":"基础设置","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-基础设置.html"},
//	  {"ID":5112,"Name":"安全设置","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-安全设置.html"},
//	  {"ID":5113,"Name":"购物流程","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-购物流程.html"},
//	  {"ID":5114,"Name":"水印设置","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-水印设置.html"},
//	  {"ID":5115,"Name":"配送设置","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-配送设置.html"},
//	  {"ID":5116,"Name":"支付设置","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-支付设置.html"},
//	  {"ID":5117,"Name":"短信接口","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-短信接口.html"},
//	  {"ID":5118,"Name":"邮件接口","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-邮件接口.html"},
//	  {"ID":5119,"Name":"在线客服","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-在线客服.html"},
//	  {"ID":5110,"Name":"搜索关键字","ParentID":511,"Status":1,"Url":"distribution_distribution/系统设置-搜索关键字.html"},
//    {"ID":512,"Name":"内容管理","ParentID":51,"Status":1,"Url":"distribution_distribution/内容管理/"},
//	  {"ID":5121,"Name":"文章类别","ParentID":512,"Status":1,"Url":"distribution_distribution/内容管理-文章类别.html"},
//	  {"ID":5122,"Name":"文章列表","ParentID":512,"Status":1,"Url":"distribution_distribution/内容管理-文章列表.html"},
//    {"ID":513,"Name":"店铺装修","ParentID":51,"Status":1,"Url":"distribution/店铺装修/"},
//	  {"ID":5131,"Name":"当前模板","ParentID":513,"Status":1,"Url":"distribution_distribution/店铺装修-当前模板.html"},
//	  {"ID":5133,"Name":"我的模板库","ParentID":513,"Status":1,"Url":"distribution_distribution/店铺装修-我的模板库.html"},
//	  {"ID":5134,"Name":"可视化编辑","ParentID":513,"Status":1,"Url":"distribution_distribution/店铺装修-可视化编辑.html"},
//	  {"ID":5135,"Name":"模版大世界","ParentID":513,"Status":1,"Url":"distribution_distribution/店铺装修-模版大世界.html"},
//	  {"ID":5136,"Name":"定制申请","ParentID":512,"Status":1,"Url":"distribution_distribution/店铺装修-定制申请.html"},
//	{"ID":514,"Name":"运维统计","ParentID":51,"Status":1,"Url":"distribution_distribution/运维统计/"},
//	  {"ID":5141,"Name":"CNZZ","ParentID":514,"Status":1,"Url":"distribution_distribution/运维统计-CNZZ.html"},
//	  {"ID":5142,"Name":"佰分点BAE","ParentID":514,"Status":1,"Url":"distribution_distribution/运维统计-佰分点BAE.html"},
//	  {"ID":5143,"Name":"佰分点BRE","ParentID":514,"Status":1,"Url":"distribution_distribution/运维统计-佰分点BRE.html"},
//	{"ID":515,"Name":"财务管理","ParentID":51,"Status":1,"Url":"distribution_distribution/财务管理.html"},
//	  {"ID":5151,"Name":"财务管","ParentID":515,"Status":1,"Url":"distribution_distribution/财务管理.html"},
	

/*6.推广*/
//{"ID": 6, "Name": "推广", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },

/*7.ERP*/
//{"ID": 7, "Name": "ERP+", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }
];
   

   for(var m in menuItemsSource_distribution){
      if(menuItemsSource_distribution[m].ParentID==0){
   	    menuItems_distribution.push(menuItemsSource_distribution[m]); 
      }
   }
   getChildren_distribution(menuItems_distribution);
   fillMenus_distribution();
   changeMenuItem_distribution();
 
   
//直营左侧菜单
menuItemsSource_direct = [
/*1.订单*/
{"ID": 1, "Name": "订单", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":11,"Name":"订单管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":110,"Name":"订单列表","ParentID":11,"Status":1,"Url":"order_direct/订单管理-订单列表.html"},
//    {"ID":110,"Name":"人工订单","ParentID":11,"Status":1,"Url":"order_direct/订单管理-人工订单.html"},
//    {"ID":110,"Name":"导入订单","ParentID":11,"Status":1,"Url":"order_direct/订单管理-导入订单.html"},
//  {"ID":12,"Name":"单据管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":120,"Name":"发货单","ParentID":12,"Status":1,"Url":"order_direct/单据管理-发货单.html"},
//	{"ID":120,"Name":"快递单","ParentID":12,"Status":1,"Url":"order_direct/单据管理-快递单.html"},
//	{"ID":120,"Name":"拣货单","ParentID":12,"Status":1,"Url":"order_direct/单据管理-拣货单.html"},
//  {"ID":13,"Name":"设置","ParentID":1,"Status":1,"Url":""},
//    {"ID":130,"Name":"快递单设置","ParentID":13,"Status":1,"Url":"order_direct/快递单设置.html"},
//    {"ID":130,"Name":"发货单设置","ParentID":13,"Status":1,"Url":"order_direct/发货单设置.html"},
//	{"ID":130,"Name":"标签管理","ParentID":13,"Status":1,"Url":"order_direct/标签管理.html"},
  
/*2.商品*/
{"ID": 2, "Name": "商品", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":21,"Name":"商品管理","ParentID":2,"Status":1,"Url":""},	
//	{"ID":210,"Name":"商品列表","ParentID":21,"Status":1,"Url":"product_direct/商品管理-商品列表.html"},
//	{"ID":22,"Name":"商品设置","ParentID":2,"Status":1,"Url":""},
//	  {"ID":220,"Name":"分类管理","ParentID":22,"Status":1,"Url":"product_direct/商品设置-商品分类.html"},
  
/*3.客户*/
{"ID": 3, "Name": "客户", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":31,"Name":"直营客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":311,"Name":"客户列表","ParentID":31,"Status":1,"Url":"customer_direct/会员管理-会员列表.html"},
//	{"ID":312,"Name":"咨询评论","ParentID":31,"Status":1,"Url":""},
//	  {"ID":3120,"Name":"咨询列表","ParentID":312,"Status":1,"Url":"customer_direct/咨询列表.html"},
//	  {"ID":3120,"Name":"评论列表","ParentID":312,"Status":1,"Url":"customer_direct/评论列表.html"},
//	  {"ID":3120,"Name":"留言列表","ParentID":312,"Status":1,"Url":"customer_direct/留言列表.html"},
//	  {"ID":3120,"Name":"站内消息","ParentID":312,"Status":1,"Url":"customer_direct/站内消息.html"},
//	  {"ID":3120,"Name":"反馈设置","ParentID":312,"Status":1,"Url":""},
//	{"ID":31,"Name":"系统设置","ParentID":3,"Status":1,"Url":""},
//	  {"ID":32,"Name":"客户等级","ParentID":31,"Status":1,"Url":"customer_direct/会员角色等级-直营.html"},
//	  {"ID":33,"Name":"编号设置","ParentID":31,"Status":1,"Url":"customer_direct/编号设置.html"},
//  {"ID":32,"Name":"分销客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":310,"Name":"客户列表","ParentID":32,"Status":1,"Url":"customer_direct/分销客户列表.html"},
//	{"ID":320,"Name":"咨询评论","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3200,"Name":"商品咨询","ParentID":320,"Status":1,"Url":"customer_direct/咨询列表.html"},
//	  {"ID":3200,"Name":"商品评论","ParentID":320,"Status":1,"Url":"customer_direct/评论列表.html"},
//	  {"ID":3200,"Name":"客户留言","ParentID":320,"Status":1,"Url":"customer_direct/留言列表.html"},
//	  {"ID":3200,"Name":"站内短信","ParentID":320,"Status":1,"Url":"customer_direct/站内消息.html"},
//	{"ID":330,"Name":"系统设置","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3300,"Name":"客户等级","ParentID":330,"Status":1,"Url":"customer/会员角色等级-分销.html"},
//	  {"ID":3300,"Name":"编号设置","ParentID":330,"Status":1,"Url":"customer/编号设置.html"}, 

/*4.报表*/
//{"ID": 4, "Name": "报表", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":41,"Name":"销售统计","ParentID":4,"Status":1,"Url":"reports_direct/销售统计.html"},
//	{"ID":410,"Name":"订单统计","ParentID":41,"Status":1,"Url":"reports_direct/订单统计.html"},
//  {"ID":42,"Name":"客户统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":420,"Name":"会员统计","ParentID":42,"Status":1,"Url":"reports_direct/会员统计.html"},
//	{"ID":420,"Name":"销售统计","ParentID":42,"Status":1,"Url":"reports_direct/销售统计.html"},
//  {"ID":43,"Name":"商品统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":430,"Name":"销售排行榜","ParentID":43,"Status":1,"Url":"reports_direct/商品销售排行统计.html"},
//	{"ID":430,"Name":"购买次数统计","ParentID":43,"Status":1,"Url":"reports_direct/商品访问购买次数统计.html"},
//	{"ID":430,"Name":"销售次数统计","ParentID":43,"Status":1,"Url":"reports_direct/销售统计报表.html"},  

/*5.分销*/
//{"ID": 5, "Name": "分销", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }, 
//  {"ID":51,"Name":"官方分销平台","ParentID":5,"Status":1,"Url":""},
//    {"ID":511,"Name":"系统设置","ParentID":51,"Status":1,"Url":"distribution_direct/系统设置/"},
//	  {"ID":5111,"Name":"基础设置","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-基础设置.html"},
//	  {"ID":5112,"Name":"安全设置","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-安全设置.html"},
//	  {"ID":5113,"Name":"购物流程","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-购物流程.html"},
//	  {"ID":5114,"Name":"水印设置","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-水印设置.html"},
//	  {"ID":5115,"Name":"配送设置","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-配送设置.html"},
//	  {"ID":5116,"Name":"支付设置","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-支付设置.html"},
//	  {"ID":5117,"Name":"短信接口","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-短信接口.html"},
//	  {"ID":5118,"Name":"邮件接口","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-邮件接口.html"},
//	  {"ID":5119,"Name":"在线客服","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-在线客服.html"},
//	  {"ID":5110,"Name":"搜索关键字","ParentID":511,"Status":1,"Url":"distribution_direct/系统设置-搜索关键字.html"},
//    {"ID":512,"Name":"内容管理","ParentID":51,"Status":1,"Url":"distribution_direct/内容管理/"},
//	  {"ID":5121,"Name":"文章类别","ParentID":512,"Status":1,"Url":"distribution_direct/内容管理-文章类别.html"},
//	  {"ID":5122,"Name":"文章列表","ParentID":512,"Status":1,"Url":"distribution_direct/内容管理-文章列表.html"},
//    {"ID":513,"Name":"店铺装修","ParentID":51,"Status":1,"Url":"distribution_direct/店铺装修/"},
//	  {"ID":5131,"Name":"当前模板","ParentID":513,"Status":1,"Url":"distribution_direct/店铺装修-当前模板.html"},
//	  {"ID":5133,"Name":"我的模板库","ParentID":513,"Status":1,"Url":"distribution_direct/店铺装修-我的模板库.html"},
//	  {"ID":5134,"Name":"可视化编辑","ParentID":513,"Status":1,"Url":"distribution_direct/店铺装修-可视化编辑.html"},
//	  {"ID":5135,"Name":"模版大世界","ParentID":513,"Status":1,"Url":"distribution_direct/店铺装修-模版大世界.html"},
//	  {"ID":5136,"Name":"定制申请","ParentID":512,"Status":1,"Url":"distribution_direct/店铺装修-定制申请.html"},
//	{"ID":514,"Name":"运维统计","ParentID":51,"Status":1,"Url":"distribution_direct/运维统计/"},
//	  {"ID":5141,"Name":"CNZZ","ParentID":514,"Status":1,"Url":"distribution_direct/运维统计-CNZZ.html"},
//	  {"ID":5142,"Name":"佰分点BAE","ParentID":514,"Status":1,"Url":"distribution_direct/运维统计-佰分点BAE.html"},
//	  {"ID":5143,"Name":"佰分点BRE","ParentID":514,"Status":1,"Url":"distribution_direct/运维统计-佰分点BRE.html"},
//	{"ID":515,"Name":"财务管理","ParentID":51,"Status":1,"Url":"distribution_direct/财务管理.html"},
//	  {"ID":5151,"Name":"财务管","ParentID":515,"Status":1,"Url":"distribution_direct/财务管理.html"},
	

/*6.推广*/
//{"ID": 6, "Name": "推广", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },

/*7.ERP*/
//{"ID": 7, "Name": "ERP+", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }
];


   for(var m in menuItemsSource_direct){
      if(menuItemsSource_direct[m].ParentID==0){
   	    menuItems_direct.push(menuItemsSource_direct[m]); 
      }
   }
   getChildren_direct(menuItems_direct);
   fillMenus_direct();
   changeMenuItem_direct();

   
//淘宝左侧菜单
menuItemsSource_taobao = [
/*1.订单*/
{"ID": 1, "Name": "订单", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":11,"Name":"订单管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":110,"Name":"订单列表","ParentID":11,"Status":1,"Url":"order_taobao/订单管理-订单列表.html"},
//    {"ID":110,"Name":"人工订单","ParentID":11,"Status":1,"Url":"order_taobao/订单管理-人工订单.html"},
//    {"ID":110,"Name":"导入订单","ParentID":11,"Status":1,"Url":"order_taobao/订单管理-导入订单.html"},
//  {"ID":12,"Name":"单据管理","ParentID":1,"Status":1,"Url":""},
//    {"ID":120,"Name":"发货单","ParentID":12,"Status":1,"Url":"order_taobao/单据管理-发货单.html"},
//	{"ID":120,"Name":"快递单","ParentID":12,"Status":1,"Url":"order_taobao/单据管理-快递单.html"},
//	{"ID":120,"Name":"拣货单","ParentID":12,"Status":1,"Url":"order_taobao/单据管理-拣货单.html"},
//  {"ID":13,"Name":"设置","ParentID":1,"Status":1,"Url":""},
//    {"ID":130,"Name":"快递单设置","ParentID":13,"Status":1,"Url":"order_taobao/快递单设置.html"},
//    {"ID":130,"Name":"发货单设置","ParentID":13,"Status":1,"Url":"order_taobao/发货单设置.html"},
//	{"ID":130,"Name":"标签管理","ParentID":13,"Status":1,"Url":"order_taobao/标签管理.html"},
  
/*2.商品*/
{"ID": 2, "Name": "商品", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":21,"Name":"商品管理","ParentID":2,"Status":1,"Url":""},	
//	{"ID":210,"Name":"商品列表","ParentID":21,"Status":1,"Url":"product_taobao/商品管理-商品列表.html"},
//	{"ID":22,"Name":"商品设置","ParentID":2,"Status":1,"Url":""},
//	  {"ID":220,"Name":"分类管理","ParentID":22,"Status":1,"Url":"product_taobao/商品设置-商品分类.html"},
  
/*3.客户*/
{"ID": 3, "Name": "客户", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":31,"Name":"直营客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":311,"Name":"客户列表","ParentID":31,"Status":1,"Url":"customer_taobao/会员管理-会员列表.html"},
//	{"ID":312,"Name":"咨询评论","ParentID":31,"Status":1,"Url":""},
//	  {"ID":3120,"Name":"咨询列表","ParentID":312,"Status":1,"Url":"customer_taobao/咨询列表.html"},
//	  {"ID":3120,"Name":"评论列表","ParentID":312,"Status":1,"Url":"customer_taobao/评论列表.html"},
//	  {"ID":3120,"Name":"留言列表","ParentID":312,"Status":1,"Url":"customer_taobao/留言列表.html"},
//	  {"ID":3120,"Name":"站内消息","ParentID":312,"Status":1,"Url":"customer_taobao/站内消息.html"},
//	  {"ID":3120,"Name":"反馈设置","ParentID":312,"Status":1,"Url":""},
//	{"ID":31,"Name":"系统设置","ParentID":3,"Status":1,"Url":""},
//	  {"ID":32,"Name":"客户等级","ParentID":31,"Status":1,"Url":"customer_taobao/会员角色等级-直营.html"},
//	  {"ID":33,"Name":"编号设置","ParentID":31,"Status":1,"Url":"customer_taobao/编号设置.html"},
//  {"ID":32,"Name":"分销客户","ParentID":3,"Status":1,"Url":""},
//	{"ID":310,"Name":"客户列表","ParentID":32,"Status":1,"Url":"customer_taobao/分销客户列表.html"},
//	{"ID":320,"Name":"咨询评论","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3200,"Name":"商品咨询","ParentID":320,"Status":1,"Url":"customer_taobao/咨询列表.html"},
//	  {"ID":3200,"Name":"商品评论","ParentID":320,"Status":1,"Url":"customer_taobao/评论列表.html"},
//	  {"ID":3200,"Name":"客户留言","ParentID":320,"Status":1,"Url":"customer_taobao/留言列表.html"},
//	  {"ID":3200,"Name":"站内短信","ParentID":320,"Status":1,"Url":"customer_taobao/站内消息.html"},
//	{"ID":330,"Name":"系统设置","ParentID":32,"Status":1,"Url":""},
//	  {"ID":3300,"Name":"客户等级","ParentID":330,"Status":1,"Url":"customer_taobao/会员角色等级-分销.html"},
//	  {"ID":3300,"Name":"编号设置","ParentID":330,"Status":1,"Url":"customer_taobao/编号设置.html"}, 

/*4.报表*/
//{"ID": 4, "Name": "报表", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },
//  {"ID":41,"Name":"销售统计","ParentID":4,"Status":1,"Url":"reports_taobao/销售统计.html"},
//	{"ID":410,"Name":"订单统计","ParentID":41,"Status":1,"Url":"reports_taobao/订单统计.html"},
//  {"ID":42,"Name":"客户统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":420,"Name":"会员统计","ParentID":42,"Status":1,"Url":"reports_taobao/会员统计.html"},
//	{"ID":420,"Name":"销售统计","ParentID":42,"Status":1,"Url":"reports_taobao/销售统计.html"},
//  {"ID":43,"Name":"商品统计","ParentID":4,"Status":1,"Url":""},
//	{"ID":430,"Name":"销售排行榜","ParentID":43,"Status":1,"Url":"reports_taobao/商品销售排行统计.html"},
//	{"ID":430,"Name":"购买次数统计","ParentID":43,"Status":1,"Url":"reports_taobao/商品访问购买次数统计.html"},
//	{"ID":430,"Name":"销售次数统计","ParentID":43,"Status":1,"Url":"reports_taobao/销售统计报表.html"},  

/*5.分销*/
//{"ID": 5, "Name": "分销", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }, 
//  {"ID":51,"Name":"官方分销平台","ParentID":5,"Status":1,"Url":""},
//    {"ID":511,"Name":"系统设置","ParentID":51,"Status":1,"Url":"distribution_taobao/系统设置/"},
//	  {"ID":5111,"Name":"基础设置","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-基础设置.html"},
//	  {"ID":5112,"Name":"安全设置","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-安全设置.html"},
//	  {"ID":5113,"Name":"购物流程","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-购物流程.html"},
//	  {"ID":5114,"Name":"水印设置","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-水印设置.html"},
//	  {"ID":5115,"Name":"配送设置","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-配送设置.html"},
//	  {"ID":5116,"Name":"支付设置","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-支付设置.html"},
//	  {"ID":5117,"Name":"短信接口","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-短信接口.html"},
//	  {"ID":5118,"Name":"邮件接口","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-邮件接口.html"},
//	  {"ID":5119,"Name":"在线客服","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-在线客服.html"},
//	  {"ID":5110,"Name":"搜索关键字","ParentID":511,"Status":1,"Url":"distribution_taobao/系统设置-搜索关键字.html"},
//    {"ID":512,"Name":"内容管理","ParentID":51,"Status":1,"Url":"distribution_taobao/内容管理/"},
//	  {"ID":5121,"Name":"文章类别","ParentID":512,"Status":1,"Url":"distribution_taobao/内容管理-文章类别.html"},
//	  {"ID":5122,"Name":"文章列表","ParentID":512,"Status":1,"Url":"distribution_taobao/内容管理-文章列表.html"},
//    {"ID":513,"Name":"店铺装修","ParentID":51,"Status":1,"Url":"distribution_taobao/店铺装修/"},
//	  {"ID":5131,"Name":"当前模板","ParentID":513,"Status":1,"Url":"distribution_taobao/店铺装修-当前模板.html"},
//	  {"ID":5133,"Name":"我的模板库","ParentID":513,"Status":1,"Url":"distribution_taobao/店铺装修-我的模板库.html"},
//	  {"ID":5134,"Name":"可视化编辑","ParentID":513,"Status":1,"Url":"distribution_taobao/店铺装修-可视化编辑.html"},
//	  {"ID":5135,"Name":"模版大世界","ParentID":513,"Status":1,"Url":"distribution_taobao/店铺装修-模版大世界.html"},
//	  {"ID":5136,"Name":"定制申请","ParentID":512,"Status":1,"Url":"distribution_taobao/店铺装修-定制申请.html"},
//	{"ID":514,"Name":"运维统计","ParentID":51,"Status":1,"Url":"distribution_taobao/运维统计/"},
//	  {"ID":5141,"Name":"CNZZ","ParentID":514,"Status":1,"Url":"distribution_taobao/运维统计-CNZZ.html"},
//	  {"ID":5142,"Name":"佰分点BAE","ParentID":514,"Status":1,"Url":"distribution_taobao/运维统计-佰分点BAE.html"},
//	  {"ID":5143,"Name":"佰分点BRE","ParentID":514,"Status":1,"Url":"distribution_taobao/运维统计-佰分点BRE.html"},
//	{"ID":515,"Name":"财务管理","ParentID":51,"Status":1,"Url":"distribution_taobao/财务管理.html"},
//	  {"ID":5151,"Name":"财务管","ParentID":515,"Status":1,"Url":"distribution_taobao/财务管理.html"},


/*6.推广*/
//{"ID": 6, "Name": "推广", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" },

/*7.ERP*/
//{"ID": 7, "Name": "ERP+", "ParentID": 0, "Status": 1, "Url": "javascript:void(0);" }
];

   for(var m in menuItemsSource_taobao){
      if(menuItemsSource_taobao[m].ParentID==0){
   	    menuItems_taobao.push(menuItemsSource_taobao[m]); 
      }
   }
   getChildren_taobao(menuItems_taobao);
   fillMenus_taobao();
   changeMenuItem_taobao();

});