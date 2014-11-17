function NumberPaging(currentPageIndex, pageCount, pageIndexContainer) {
    if (currentPageIndex - 4 > 1 && currentPageIndex + 5 < (pageCount + 1)) {
        $("#"+pageIndexContainer+"").append("...");
        for (var i = currentPageIndex - 4; i < currentPageIndex + 5; i++) {
            var pageIndex = $("<a onclick='NavigageForA(event)'>" + i + "</a>");
            $("#" + pageIndexContainer + "").append(pageIndex);
        }
        $("#" + pageIndexContainer + "").append("...");
    } else if (currentPageIndex - 4 <= 1 && currentPageIndex + 5 < (pageCount + 1)) {
        for (var i = 1; i < currentPageIndex + 5; i++) {
            var pageIndex = $("<a onclick='NavigageForA(event)'>" + i + "</a>");
            $("#" + pageIndexContainer + "").append(pageIndex);
        }
        $("#" + pageIndexContainer + "").append("...");
    } else if (currentPageIndex - 4 > 1 && currentPageIndex + 5 >= (pageCount + 1)) {
        $("#" + pageIndexContainer + "").append("...");
        for (var i = currentPageIndex - 4; i < (pageCount + 1); i++) {
            var pageIndex = $("<a onclick='NavigageForA(event)'>" + i + "</a>");
            $("#" + pageIndexContainer + "").append(pageIndex);
        }
    } else {
        for (var i = 1; i < (pageCount + 1); i++) {
            var pageIndex = $("<a onclick='NavigageForA(event)'>" + i + "</a>");
            $("#" + pageIndexContainer + "").append(pageIndex);
        }
    }


    $("#" + pageIndexContainer + " a").removeClass("current");
    $("#" + pageIndexContainer + " a").each(function () {
        if ($(this).text() == currentPageIndex) {
            $(this).addClass("current");
        }
    })
}

function NavigageForA(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var clickPage = $(eventSrc).text();
    var clickPageStr = "page=" + clickPage + "";
    var url = window.location.href;
    url = url.replace(/page=\d+/g, clickPageStr);
    window.location.href = url;
}

function GoToFirstPage() {
    var current = window.location.href;
    current = current.replace(/page=\d+/g, "page=1");
    window.location.href = current;
}

function GoToLastPage() {
    var lastPageIndex = $("#hiddenPageCount").val();
    var current = window.location.href;
    current = current.replace(/page=\d+/g, "page=" + lastPageIndex + "");
    window.location.href = current;
}