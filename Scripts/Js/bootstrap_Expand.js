//页面tab导航的切换效果
function ChangeTabs() {
    $(".tabbable ul li").each(function () {
        $(this).click(function () {
            $(".tabbable ul li").removeClass("active");
            $(this).addClass("active");
            var $activeLi = $(this);
            $(".tab-content .tab-pane").each(function () {
                var $idNum = $(this).attr("id").substring($(this).attr("id").lastIndexOf('b') + 1);
                if ($idNum == $("a", $activeLi).attr("id")) {
                    $(".tab-content .tab-pane").removeClass("active");
                    $(this).addClass("active");
                }
            })
        })
    })
}