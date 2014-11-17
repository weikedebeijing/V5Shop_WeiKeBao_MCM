//这是存放类目选择弹出层等相关的js


//创建选择类目的div,参数为div的宽和高,num是编号，用来判断是否已经存在了该div，以免重复创建
function CreateSelectCatgoryDiv(w, h, num) {
    var $selectCategoryDiv = $("<div id='selectCategoryDiv" + num + "' class='selectCategoryDiv'></div>");
    $selectCategoryDiv.css("width", w + "px");
    $selectCategoryDiv.css("height", h + "px");
    return $selectCategoryDiv;
}

//获取商品根类目数据，在此方法内展示出来，一条数据一个Div
function GetProductCategoryData(categoryData) {
    //定义一个容器，来装生成的根类目数据
    var $categorySet = $("<div id='categorySet'></div>");
    //暂且认为parentID为0的数据项是根数据项
    for (var i = 0; i < categoryData.length; i++) {
        if (categoryData[i].IsParent == true) {//  给有子目录的项加一个小三角标记
            var $rootCategory = $("<div id='" + categoryData[i].ID + "' class='categoryItem' onclick='ClickHasSubCategory(event)'>&nbsp;&nbsp;" + categoryData[i].Name + "<div class='hasSubCategory'></div></div>");
        } else {
            var $rootCategory = $("<div id='" + categoryData[i].ID + "' class='categoryItem' onclick='ClickNoSubCategory(event)'>&nbsp;&nbsp;" + categoryData[i].Name + "</div>");
        }
        $categorySet.append($rootCategory);
    }
    return $categorySet;
}

//根据事件源，删除其后面的selectCategoryDiv,同步删除已选择div（样式名为.hasSelectedCategoryDiv）中的对应元素
function RemoveDiv($eventSrc) {

    //给事件源所在的div加上高亮效果，并移除其它兄弟项的高亮效果
    $eventSrc.siblings().removeClass("categoryItemClick");
    $eventSrc.addClass("categoryItemClick");
    //找到要删除的对象
    var $currentSelectCategoryDiv = $eventSrc.parent().parent();
    var $currentSelectCategoryDivId = $currentSelectCategoryDiv.attr("id");
    var $currentSelectCategoryDivIdNum = $currentSelectCategoryDivId.substring($currentSelectCategoryDivId.lastIndexOf('v') + 1); //截取出数字num
    var $allSelectCategoryDiv = $("div[id^=selectCategoryDiv]");
    for (var i = 0; i < $allSelectCategoryDiv.length; i++) {
        var $thisSelectCategoryDivId = $allSelectCategoryDiv[i].id;
        var $thisSelectCategoryDivIdNum = $thisSelectCategoryDivId.substring($thisSelectCategoryDivId.lastIndexOf('v') + 1);
        if ($thisSelectCategoryDivIdNum > $currentSelectCategoryDivIdNum) {
            $("#selectCategoryDiv" + $thisSelectCategoryDivIdNum + "").remove();
        }
    }
    //找到已经记录的类目，将其后面的，包括自己删除
    var $allSelectedCategory = $(".hasSelectedCategoryDiv span");
    if ($allSelectedCategory.length > 0) {
        for (var i = 0; i < $allSelectedCategory.length; i++) {

            if ($allSelectedCategory[i].id >= $currentSelectCategoryDivIdNum) {
                $(".hasSelectedCategoryDiv span[id=" + $allSelectedCategory[i].id + "]").remove();
            }
        }
    }
    return $currentSelectCategoryDivIdNum; //返回当前div的ID的num，用于定位当前div，方便删除后面的div
}