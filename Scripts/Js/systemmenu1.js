/// <reference path="jquery-1.7.2.min.js" />
//平台左侧菜单
var menuItems = new Array();
var menuItemsSource = null;
var aI = -1;
function getChildren(pMenus) {
    for (var pm in pMenus) {
        var tmpMenus = new Array();
        for (var m in menuItemsSource) {
            if (menuItemsSource[m].ParentID == pMenus[pm].ID)
                tmpMenus.push(menuItemsSource[m]);
        }
        pMenus[pm].children = tmpMenus;
        getChildren(pMenus[pm].children);

    }
}

//function GetCookie(offset) {
//    var endstr = document.cookie.indexOf(";", offset);
//    if (endstr == -1)
//        endstr = document.cookie.length;
//    return decodeURIComponent(document.cookie.substring(offset, endstr));
//}

//function DelCookie(name) {
//    var exp = new Date();
//    exp.setTime(exp.getTime() - 100000);
//    var cval = GetCookie(name);
//    //document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
//    document.cookie = cval + "; expires=" + exp.toGMTString();
//}

//读取cookies
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) return unescape(arr[2]);
    else return null;
}
//删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function fillMenus() {
    $("#allnav UL").children().remove();
    $(menuItems).each(function (n) {
        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem(" + n + ")\">" + this.Name + "</a></li>");
//        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem(" + n + ");document.cookie='functionName=changeMenuItem(" + n + ");channel_currentName=" + $("#channel-current span").text() + ";channel_currentIcon=" + $("#channel-current i:first").attr("class") + ";path=/'\">" + this.Name + "</a></li>");
        //        var menu = $("<li ><a href='javascript:void(0);' onclick=\"changeMenuItem(" + n + ");GoToPage('" + this.Url + "');document.cookie='functionName=changeMenuItem(" + n + ");path=/'\">" + this.Name + "</a></li>");

        menu.mouseenter(function () {
            return;
            var _html = "";
            if (menuItems[n].children != null)
                for (var m in menuItems[n].children) {
                    _html += "<dl class=\"dl-box\"><dt>" + menuItems[n].children[m].Name + "</dt>";
                    if (menuItems[n].children[m].children != null) {
                        for (var mm in menuItems[n].children[m].children) {
                            var menuItem = getmenudata(menuItems[n].children[m].children[mm]);
                            _html += "<dd><a onclick=\"changeMenuItem(" + n + "," + m + "," + mm + ")\" " + (menuItem.outerUrl != "" ? " href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") : " href=\"javascript:void(0);\"") + "\">" + menuItem.Name + "</a></dd>";
                        }
                    }

                    _html += "</dl>";
                }

            $("#dropMenu").css("display", _html == "" ? "none" : "").css("left", menu.position().left + 0).html(_html);


        }).mouseleave(function () {
            $("#dropMenu").css("display", "none");
        });
        $("#allnav UL").append(menu);

    });
}

function hideLeft() {
    //    $(".MCM-L").css("display", "none");
    //    $(".MCM-toggle").addClass("MCM-toggle-Close");
    //    $(".MCM-R").addClass("MCM-Close");
}

function showLeft() {
    //    $(".MCM-L").css("display", "");
    //    $(".MCM-toggle").removeClass("MCM-toggle-Close");
    //    $(".MCM-R").removeClass("MCM-Close");
}

function hideDropDown() {
    //    $("#dropMenu").hide();
}

//function GoToPage(url) {
//    //    setTimeout(
//    // "Goto('" + url + "')",
//    //    1000);
//    window.location.href = url;
//}

//function Goto(url) {
//    window.location.href = url;
//}

function changeMenuItem() {
    aI = -1;
    var _html = "";
    if (arguments.length == 0) {
        hideLeft();
        $("#allnav UL").children().each(function (n) {
            $(this).removeClass("current");
        });
    } else {
        var topIndex = arguments[0];
        $("#allnav UL").children().each(function (n) {

            if (n == topIndex) {
                $(this).addClass("current");
                //document.cookie = null;
                //                                DelCookie("functionName");
                //                                DelCookie("channel_currentName");
                //                                DelCookie("channel_currentIcon");
                //DelCookie(document.cookie);
                //                $.cookie("functionName", '', { expires: -1 });
                //                $.cookie("channel_currentName", '', { expires: -1 });
                //                $.cookie("channel_currentIcon", '', { expires: -1 });
                //                $.cookie("functionName", "changeMenuItem(" + topIndex + ")");
                //                $.cookie("channel_currentName", "" + $("#channel-current span").text() + "");
                //                $.cookie("channel_currentIcon", "" + $("#channel-current i:first").attr("class") + "");
                document.cookie = "functionName=changeMenuItem(" + topIndex + ");path=/";
                document.cookie = "channel_currentName=" + $("#channel-current span").text() + ";path=/";
                document.cookie = "channel_currentIcon=" + $("#channel-current i:first").attr("class") + ";path=/";
                //                delCookie("functionName");
                //                delCookie("functionName");
                //                document.cookie = "functionName=changeMenuItem(" + topIndex + ");channel_currentName=" + $("#channel-current span").text() + ";channel_currentIcon=" + $("#channel-current i:first").attr("class") + "";
            } else {
                $(this).removeClass("current");
            }
        });
        if (menuItems.length > 2) {
            switch (arguments.length) {
                case 1:
                    if (menuItems[arguments[0]].children != null && menuItems[arguments[0]].children.length > 0) {
                        for (var m in menuItems[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";
                                for (var n in menuItems[arguments[0]].children[m].children) {
                                    if (menuItems[arguments[0]].children[m].children[n].children != null && menuItems[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        var _current = (n == 0 ? " class=\"show\" " : " class=\"show\" ");

                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><i></i><span>" + menuItems[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems[arguments[0]].children[m].children[n].children) {

                                            var menuItem = getmenudata(menuItems[arguments[0]].children[m].children[n].children[x]);

                                            _current = (x == 0 ? " class=\"show\" " : " class=\"show\" ");
                                            _html += "<li " + _current + "><a  id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";
                                        }
                                        _html += "</ul></li>";
                                    } else {

                                        var menuItem = getmenudata(menuItems[arguments[0]].children[m].children[n]);
                                        _html += "<li><h4><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></h4></li>";
                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);

                        if ($(".left_menu").find("a").eq(0).text() == "店铺预览") {
                            $(".left_menu").find("a").eq(1).bind("click", function (o) {
                                o.target.click();
                                menuclick(o.target);
                            }).click();
                        } else {
                            $(".left_menu").children().eq(0).removeClass("show").addClass("show");
                            //$(".left_menu").find("a").eq(0).parents("ul li").eq(0).addClass("current");
                            // $("iframe").attr("src", $(".left_menu").find("a").eq(0).attr("href"));
                        }


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;

                case 3:
                    if (menuItems[arguments[0]].children != null && menuItems[arguments[0]].children.length > 0) {
                        for (var m in menuItems[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li  name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";

                                for (var n in menuItems[arguments[0]].children[m].children) {
                                    var _current = "";
                                    if (m == arguments[1] && n == arguments[2]) {
                                        _current = " class=\"current\" ";
                                    }
                                    else {
                                        _current = " class=\"show\"";
                                    }
                                    if (menuItems[arguments[0]].children[m].children[n].children != null && menuItems[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        if (m == arguments[1] && n == arguments[2]) {
                                            _current = " class=\"show\" ";
                                            _licss = "show";
                                        }
                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><span>" + menuItems[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems[arguments[0]].children[m].children[n].children) {

                                            var __current = "";
                                            if (m == arguments[1] && x == arguments[2]) {
                                                __current = " class=\"current\" ";
                                                _licss = "show";
                                            }
                                            else {
                                                __current = " class=\"show\"";
                                                _current = " class=\"show\"";
                                            }

                                            var menuItem = getmenudata(menuItems[arguments[0]].children[m].children[n].children[x]);

                                            __current = "";
                                            _html += "<li " + __current + "><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";

                                        }

                                        if (m == arguments[1] && n == arguments[2]) {

                                            var menuItem = getmenudata(menuItems[arguments[0]].children[m].children[n].children[0]);
                                            aI = menuItem.ID;
                                            //$("iframe").attr("src", menuItem.Url);
                                        }

                                        _html += "</ul></li>";
                                    } else {
                                        var menuItem = getmenudata(menuItems[arguments[0]].children[m].children[n]);



                                        _html += "<li " + _current + "><h4><a id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItems[arguments[0]].children[m].children[n].IsNew ? "_self" : "_self") + "\">" + menuItems[arguments[0]].children[m].children[n].Name + "</a></h4></li>";

                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;
            }
        }
        if (aI != -1) {
            $("#a" + aI).parents("li").addClass("current");
        }

//        $(".left_menu").find("a").click(function () {
//            $(".left_menu").find("a").parents("li").removeClass("current")
//            $(this).parents("ul li").eq(0).addClass("current");
//        });

        $("h3").click(function () {
            var _this = this;
            var spans = $("h3");
            $(spans).each(function () {
                if (this == _this) {
                    if ($(this).parents("ul > li[name=dropmenu]").hasClass("show")) {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    }

                } else {
                    $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                }
            });
        });


        $("h2").click(function () {
            var _this = this;
            var spans = $("h2");

            $(spans).each(function (n) {

                if (this == _this) {
                    if ($(this).parents("ul > li").hasClass("show")) {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    }
                } else {
                    $(this).parents("ul > li").removeClass("show").addClass("show");
                }
            });
        });

    }
}

//function menuclick(m) {
//    $(".left_menu").find("a").parents("li").removeClass("current")
//    $(m).parents("ul li").eq(0).addClass("current");
//    $(m).parents("ul li[name=dropmenu]").eq(0).find("h3").parent().removeClass("show").addClass("show").parents("ul li[name=level1]").removeClass("show").addClass("show");

//}
$(document).ready(function () {
    $("#dropMenu").mouseleave(function () {
        $(this).hide();
    });
    $("#allnav").mouseleave(function () {
        $("#dropMenu").hide();
    });
});

function getmenudata() {
    var menuItem = arguments[0];
    var url = menuItem.Url;
    //    if (url != "")
    //        if (url.indexOf('?') == -1) {
    //            url = url + "?MT=" + menuItem.MT + "&code=" + menuItem.Code;
    //        } else {
    //            url = url + "&MT=" + menuItem.MT + "&code=" + menuItem.Code
    //        }
    menuItem.outerUrl = url;
    return menuItem;
}

//分销左侧菜单
var menuItems_distribution = new Array();
var menuItemsSource_distribution = null;
var aI = -1;
function getChildren_distribution(pMenus) {
    for (var pm in pMenus) {
        var tmpMenus = new Array();
        for (var m in menuItemsSource_distribution) {
            if (menuItemsSource_distribution[m].ParentID == pMenus[pm].ID)
                tmpMenus.push(menuItemsSource_distribution[m]);
        }
        pMenus[pm].children = tmpMenus;
        getChildren_distribution(pMenus[pm].children);

    }
}

function fillMenus_distribution() {
    $("#allnav_distribution UL").children().remove();
    $(menuItems_distribution).each(function (n) {
        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem_distribution(" + n + ")\">" + this.Name + "</a></li>");
//        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem_distribution(" + n + ");document.cookie='functionName=changeMenuItem_distribution(" + n + ");channel_currentName=" + $("#channel-current span").text() + ";channel_currentIcon=" + $("#channel-current i:first").attr("class") + ";path=/'\">" + this.Name + "</a></li>");
        menu.mouseenter(function () {
            return;
            var _html = "";
            if (menuItems_distribution[n].children != null)
                for (var m in menuItems_distribution[n].children) {
                    _html += "<dl class=\"dl-box\"><dt>" + menuItems_distribution[n].children[m].Name + "</dt>";
                    if (menuItems_distribution[n].children[m].children != null) {
                        for (var mm in menuItems_distribution[n].children[m].children) {
                            var menuItem = getmenudata(menuItems_distribution[n].children[m].children[mm]);
                            _html += "<dd><a onclick=\"changeMenuItem_distribution(" + n + "," + m + "," + mm + ")\" " + (menuItem.outerUrl != "" ? " href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") : " href=\"javascript:void(0);\"") + "\">" + menuItem.Name + "</a></dd>";
                        }
                    }

                    _html += "</dl>";
                }

            $("#dropMenu").css("display", _html == "" ? "none" : "").css("left", menu.position().left + 0).html(_html);


        }).mouseleave(function () {
            $("#dropMenu").css("display", "none");
        });
        $("#allnav_distribution UL").append(menu);

    });
}

function hideLeft() {
    //    $(".MCM-L").css("display", "none");
    //    $(".MCM-toggle").addClass("MCM-toggle-Close");
    //    $(".MCM-R").addClass("MCM-Close");
}

function showLeft() {
    //    $(".MCM-L").css("display", "");
    //    $(".MCM-toggle").removeClass("MCM-toggle-Close");
    //    $(".MCM-R").removeClass("MCM-Close");
}

function hideDropDown() {
    //    $("#dropMenu").hide();
}

function changeMenuItem_distribution() {
    aI = -1;
    var _html = "";
    if (arguments.length == 0) {
        hideLeft();
        $("#allnav_distribution UL").children().each(function (n) {
            $(this).removeClass("current");
        });
    } else {
        var topIndex = arguments[0];
        $("#allnav_distribution UL").children().each(function (n) {

            if (n == topIndex) {
                $(this).addClass("current");
                //document.cookie = null;
                //                DelCookie("functionName");
                //                DelCookie("channel_currentName");
                //                DelCookie("channel_currentIcon");
                document.cookie = "functionName=changeMenuItem_distribution(" + topIndex + ");path=/";
                document.cookie = "channel_currentName=" + $("#channel-current span").text() + ";path=/";
                document.cookie = "channel_currentIcon=" + $("#channel-current i:first").attr("class") + ";path=/";
                //                document.cookie = "functionName=changeMenuItem_distribution(" + topIndex + ");channel_currentName=" + $("#channel-current span").text() + ";channel_currentIcon=" + $("#channel-current i:first").attr("class") + "";
            } else {
                $(this).removeClass("current");
            }
        });
        if (menuItems_distribution.length > 2) {
            switch (arguments.length) {


                case 1:
                    if (menuItems_distribution[arguments[0]].children != null && menuItems_distribution[arguments[0]].children.length > 0) {
                        for (var m in menuItems_distribution[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_distribution[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_distribution[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";
                                for (var n in menuItems_distribution[arguments[0]].children[m].children) {
                                    if (menuItems_distribution[arguments[0]].children[m].children[n].children != null && menuItems_distribution[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        var _current = (n == 0 ? " class=\"show\" " : " class=\"show\" ");

                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><i></i><span>" + menuItems_distribution[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_distribution[arguments[0]].children[m].children[n].children) {

                                            var menuItem = getmenudata(menuItems_distribution[arguments[0]].children[m].children[n].children[x]);

                                            _current = (x == 0 ? " class=\"show\" " : " class=\"show\" ");
                                            _html += "<li " + _current + "><a  id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";
                                        }
                                        _html += "</ul></li>";
                                    } else {

                                        var menuItem = getmenudata(menuItems_distribution[arguments[0]].children[m].children[n]);
                                        _html += "<li><h4><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></h4></li>";
                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);

                        if ($(".left_menu").find("a").eq(0).text() == "店铺预览") {
                            $(".left_menu").find("a").eq(1).bind("click", function (o) {
                                o.target.click();
                                menuclick(o.target);
                            }).click();
                        } else {
                            $(".left_menu").children().eq(0).removeClass("show").addClass("show");
                            //$(".left_menu").find("a").eq(0).parents("ul li").eq(0).addClass("current");
                            //$("iframe").attr("src", $(".left_menu").find("a").eq(0).attr("href"));
                        }


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;

                case 3:
                    if (menuItems_distribution[arguments[0]].children != null && menuItems_distribution[arguments[0]].children.length > 0) {
                        for (var m in menuItems_distribution[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li  name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_distribution[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_distribution[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";

                                for (var n in menuItems_distribution[arguments[0]].children[m].children) {
                                    var _current = "";
                                    if (m == arguments[1] && n == arguments[2]) {
                                        _current = " class=\"current\" ";
                                    }
                                    else {
                                        _current = " class=\"show\"";
                                    }
                                    if (menuItems_distribution[arguments[0]].children[m].children[n].children != null && menuItems_distribution[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        if (m == arguments[1] && n == arguments[2]) {
                                            _current = " class=\"show\" ";
                                            _licss = "show";
                                        }
                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><span>" + menuItems_distribution[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_distribution[arguments[0]].children[m].children[n].children) {

                                            var __current = "";
                                            if (m == arguments[1] && x == arguments[2]) {
                                                __current = " class=\"current\" ";
                                                _licss = "show";
                                            }
                                            else {
                                                __current = " class=\"show\"";
                                                _current = " class=\"show\"";
                                            }

                                            var menuItem = getmenudata(menuItems_distribution[arguments[0]].children[m].children[n].children[x]);

                                            __current = "";
                                            _html += "<li " + __current + "><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";

                                        }

                                        if (m == arguments[1] && n == arguments[2]) {

                                            var menuItem = getmenudata(menuItems_distribution[arguments[0]].children[m].children[n].children[0]);
                                            aI = menuItem.ID;
                                            //$("iframe").attr("src", menuItem.Url);
                                        }

                                        _html += "</ul></li>";
                                    } else {
                                        var menuItem = getmenudata(menuItems_distribution[arguments[0]].children[m].children[n]);



                                        _html += "<li " + _current + "><h4><a id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItems_distribution[arguments[0]].children[m].children[n].IsNew ? "_self" : "_self") + "\">" + menuItems_distribution[arguments[0]].children[m].children[n].Name + "</a></h4></li>";

                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;
            }
        }
        if (aI != -1) {
            $("#a" + aI).parents("li").addClass("current");
        }

//        $(".left_menu").find("a").click(function () {
//            $(".left_menu").find("a").parents("li").removeClass("current");
//            $(this).parents("ul li").eq(0).addClass("current");
//        });

        $("h3").click(function () {
            var _this = this;
            var spans = $("h3");
            $(spans).each(function () {
                if (this == _this) {
                    if ($(this).parents("ul > li[name=dropmenu]").hasClass("show")) {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    }

                } else {
                    $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                }
            });
        });


        $("h2").click(function () {
            var _this = this;
            var spans = $("h2")

            $(spans).each(function (n) {

                if (this == _this) {
                    if ($(this).parents("ul > li").hasClass("show")) {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    }
                } else {
                    $(this).parents("ul > li").removeClass("show").addClass("show");
                }
            });
        });

    }
}

//function menuclick(m) {
//    $(".left_menu").find("a").parents("li").removeClass("current");
//    $(m).parents("ul li").eq(0).addClass("current");
//    $(m).parents("ul li[name=dropmenu]").eq(0).find("h3").parent().removeClass("show").addClass("show").parents("ul li[name=level1]").removeClass("show").addClass("show");

//}
$(document).ready(function () {
    $("#dropMenu").mouseleave(function () {
        $(this).hide();
    });
    $("#allnav_distribution").mouseleave(function () {
        $("#dropMenu").hide();
    });
});

function getmenudata() {
    var menuItem = arguments[0];
    var url = menuItem.Url;
    //    if (url != "")
    //        if (url.indexOf('?') == -1) {
    //            url = url + "?MT=" + menuItem.MT + "&code=" + menuItem.Code;
    //        } else {
    //            url = url + "&MT=" + menuItem.MT + "&code=" + menuItem.Code
    //        }
    menuItem.outerUrl = url;
    return menuItem;
}

//直营左侧菜单
var menuItems_direct = new Array();
var menuItemsSource_direct = null;
var aI = -1;
function getChildren_direct(pMenus) {
    for (var pm in pMenus) {
        var tmpMenus = new Array();
        for (var m in menuItemsSource_direct) {
            if (menuItemsSource_direct[m].ParentID == pMenus[pm].ID)
                tmpMenus.push(menuItemsSource_direct[m]);
        }
        pMenus[pm].children = tmpMenus;
        getChildren_direct(pMenus[pm].children);

    }
}

function fillMenus_direct() {
    $("#allnav_direct UL").children().remove();
    $(menuItems_direct).each(function (n) {
        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem_direct(" + n + ")\">" + this.Name + "</a></li>");
        menu.mouseenter(function () {
            return;
            var _html = "";
            if (menuItems_direct[n].children != null)
                for (var m in menuItems_direct[n].children) {
                    _html += "<dl class=\"dl-box\"><dt>" + menuItems_direct[n].children[m].Name + "</dt>";
                    if (menuItems_direct[n].children[m].children != null) {
                        for (var mm in menuItems_direct[n].children[m].children) {
                            var menuItem = getmenudata(menuItems_direct[n].children[m].children[mm]);
                            _html += "<dd><a onclick=\"changeMenuItem_direct(" + n + "," + m + "," + mm + ")\" " + (menuItem.outerUrl != "" ? " href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") : " href=\"javascript:void(0);\"") + "\">" + menuItem.Name + "</a></dd>";
                        }
                    }

                    _html += "</dl>";
                }

            $("#dropMenu").css("display", _html == "" ? "none" : "").css("left", menu.position().left + 0).html(_html);


        }).mouseleave(function () {
            $("#dropMenu").css("display", "none");
        });
        $("#allnav_direct UL").append(menu);

    });
}

function hideLeft() {
    //    $(".MCM-L").css("display", "none");
    //    $(".MCM-toggle").addClass("MCM-toggle-Close");
    //    $(".MCM-R").addClass("MCM-Close");
}

function showLeft() {
    //    $(".MCM-L").css("display", "");
    //    $(".MCM-toggle").removeClass("MCM-toggle-Close");
    //    $(".MCM-R").removeClass("MCM-Close");
}

function hideDropDown() {
    //    $("#dropMenu").hide();
}

function changeMenuItem_direct() {
    aI = -1;
    var _html = "";
    if (arguments.length == 0) {
        hideLeft();
        $("#allnav_direct UL").children().each(function (n) {
            $(this).removeClass("current");
        });
    } else {
        var topIndex = arguments[0];
        $("#allnav_direct UL").children().each(function (n) {

            if (n == topIndex) {
                $(this).addClass("current");
            } else {
                $(this).removeClass("current");
            }
        });
        if (menuItems_direct.length > 2) {
            switch (arguments.length) {


                case 1:
                    if (menuItems_direct[arguments[0]].children != null && menuItems_direct[arguments[0]].children.length > 0) {
                        for (var m in menuItems_direct[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_direct[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_direct[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";
                                for (var n in menuItems_direct[arguments[0]].children[m].children) {
                                    if (menuItems_direct[arguments[0]].children[m].children[n].children != null && menuItems_direct[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        var _current = (n == 0 ? " class=\"show\" " : " class=\"show\" ");

                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><i></i><span>" + menuItems_direct[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_direct[arguments[0]].children[m].children[n].children) {

                                            var menuItem = getmenudata(menuItems_direct[arguments[0]].children[m].children[n].children[x]);

                                            _current = (x == 0 ? " class=\"show\" " : " class=\"show\" ");
                                            _html += "<li " + _current + "><a  id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";
                                        }
                                        _html += "</ul></li>";
                                    } else {

                                        var menuItem = getmenudata(menuItems_direct[arguments[0]].children[m].children[n]);
                                        _html += "<li><h4><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></h4></li>";
                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);

                        if ($(".left_menu").find("a").eq(0).text() == "店铺预览") {
                            $(".left_menu").find("a").eq(1).bind("click", function (o) {
                                o.target.click();
                                menuclick(o.target);
                            }).click();
                        } else {
                            $(".left_menu").children().eq(0).removeClass("show").addClass("show");
                            //$(".left_menu").find("a").eq(0).parents("ul li").eq(0).addClass("current");
                            // $("iframe").attr("src", $(".left_menu").find("a").eq(0).attr("href"));
                        }


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;

                case 3:
                    if (menuItems_direct[arguments[0]].children != null && menuItems_direct[arguments[0]].children.length > 0) {
                        for (var m in menuItems_direct[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li  name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_direct[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_direct[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";

                                for (var n in menuItems_direct[arguments[0]].children[m].children) {
                                    var _current = "";
                                    if (m == arguments[1] && n == arguments[2]) {
                                        _current = " class=\"current\" ";
                                    }
                                    else {
                                        _current = " class=\"show\"";
                                    }
                                    if (menuItems_direct[arguments[0]].children[m].children[n].children != null && menuItems_direct[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        if (m == arguments[1] && n == arguments[2]) {
                                            _current = " class=\"show\" ";
                                            _licss = "show";
                                        }
                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><span>" + menuItems_direct[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_direct[arguments[0]].children[m].children[n].children) {

                                            var __current = "";
                                            if (m == arguments[1] && x == arguments[2]) {
                                                __current = " class=\"current\" ";
                                                _licss = "show";
                                            }
                                            else {
                                                __current = " class=\"show\"";
                                                _current = " class=\"show\"";
                                            }

                                            var menuItem = getmenudata(menuItems_direct[arguments[0]].children[m].children[n].children[x]);

                                            __current = "";
                                            _html += "<li " + __current + "><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";

                                        }

                                        if (m == arguments[1] && n == arguments[2]) {

                                            var menuItem = getmenudata(menuItems_direct[arguments[0]].children[m].children[n].children[0]);
                                            aI = menuItem.ID;
                                            //$("iframe").attr("src", menuItem.Url);
                                        }

                                        _html += "</ul></li>";
                                    } else {
                                        var menuItem = getmenudata(menuItems_direct[arguments[0]].children[m].children[n]);



                                        _html += "<li " + _current + "><h4><a id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItems_direct[arguments[0]].children[m].children[n].IsNew ? "_self" : "_self") + "\">" + menuItems_direct[arguments[0]].children[m].children[n].Name + "</a></h4></li>";

                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;
            }
        }
        if (aI != -1) {
            $("#a" + aI).parents("li").addClass("current");
        }

//        $(".left_menu").find("a").click(function () {
//            $(".left_menu").find("a").parents("li").removeClass("current");
//            $(this).parents("ul li").eq(0).addClass("current");
//        });

        $("h3").click(function () {
            var _this = this;
            var spans = $("h3");
            $(spans).each(function () {
                if (this == _this) {
                    if ($(this).parents("ul > li[name=dropmenu]").hasClass("show")) {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    }

                } else {
                    $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                }
            });
        });


        $("h2").click(function () {
            var _this = this;
            var spans = $("h2")

            $(spans).each(function (n) {

                if (this == _this) {
                    if ($(this).parents("ul > li").hasClass("show")) {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    }
                } else {
                    $(this).parents("ul > li").removeClass("show").addClass("show");
                }
            });
        });

    }
}

//function menuclick(m) {
//    $(".left_menu").find("a").parents("li").removeClass("current");
//    $(m).parents("ul li").eq(0).addClass("current");
//    $(m).parents("ul li[name=dropmenu]").eq(0).find("h3").parent().removeClass("show").addClass("show").parents("ul li[name=level1]").removeClass("show").addClass("show");

//}
$(document).ready(function () {
    $("#dropMenu").mouseleave(function () {
        $(this).hide();
    });
    $("#allnav_direct").mouseleave(function () {
        $("#dropMenu").hide();
    });
});

function getmenudata() {
    var menuItem = arguments[0];
    var url = menuItem.Url;
    //    if (url != "")
    //        if (url.indexOf('?') == -1) {
    //            url = url + "?MT=" + menuItem.MT + "&code=" + menuItem.Code;
    //        } else {
    //            url = url + "&MT=" + menuItem.MT + "&code=" + menuItem.Code
    //        }
    menuItem.outerUrl = url;
    return menuItem;
}

//淘宝左侧菜单
var menuItems_taobao = new Array();
var menuItemsSource_taobao = null;
var aI = -1;
function getChildren_taobao(pMenus) {
    for (var pm in pMenus) {
        var tmpMenus = new Array();
        for (var m in menuItemsSource_taobao) {
            if (menuItemsSource_taobao[m].ParentID == pMenus[pm].ID)
                tmpMenus.push(menuItemsSource_taobao[m]);
        }
        pMenus[pm].children = tmpMenus;
        getChildren_taobao(pMenus[pm].children);

    }
}

function fillMenus_taobao() {
    $("#allnav_taobao UL").children().remove();
    $(menuItems_taobao).each(function (n) {
        var menu = $("<li ><a " + ((this.Url != "" && this.Url != null) ? (" href=\"" + this.Url) : "href=\"javascript:void(0);\"") + "\"  target=\"" + (this.IsNew ? "_self" : "_self") + "\" onclick=\"changeMenuItem_taobao(" + n + ")\">" + this.Name + "</a></li>");
        menu.mouseenter(function () {
            return;
            var _html = "";
            if (menuItems_taobao[n].children != null)
                for (var m in menuItems_taobao[n].children) {
                    _html += "<dl class=\"dl-box\"><dt>" + menuItems_taobao[n].children[m].Name + "</dt>";
                    if (menuItems_taobao[n].children[m].children != null) {
                        for (var mm in menuItems_taobao[n].children[m].children) {
                            var menuItem = getmenudata(menuItems_taobao[n].children[m].children[mm]);
                            _html += "<dd><a onclick=\"changeMenuItem_taobao(" + n + "," + m + "," + mm + ")\" " + (menuItem.outerUrl != "" ? " href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") : " href=\"javascript:void(0);\"") + "\">" + menuItem.Name + "</a></dd>";
                        }
                    }

                    _html += "</dl>";
                }

            $("#dropMenu").css("display", _html == "" ? "none" : "").css("left", menu.position().left + 0).html(_html);


        }).mouseleave(function () {
            $("#dropMenu").css("display", "none");
        });
        $("#allnav_taobao UL").append(menu);

    });
}

function hideLeft() {
    //    $(".MCM-L").css("display", "none");
    //    $(".MCM-toggle").addClass("MCM-toggle-Close");
    //    $(".MCM-R").addClass("MCM-Close");
}

function showLeft() {
    //    $(".MCM-L").css("display", "");
    //    $(".MCM-toggle").removeClass("MCM-toggle-Close");
    //    $(".MCM-R").removeClass("MCM-Close");
}

function hideDropDown() {
    //    $("#dropMenu").hide();
}

function changeMenuItem_taobao() {
    aI = -1;
    var _html = "";
    if (arguments.length == 0) {
        hideLeft();
        $("#allnav_taobao UL").children().each(function (n) {
            $(this).removeClass("current");
        });
    } else {
        var topIndex = arguments[0];
        $("#allnav_taobao UL").children().each(function (n) {

            if (n == topIndex) {
                $(this).addClass("current");
            } else {
                $(this).removeClass("current");
            }
        });
        if (menuItems_taobao.length > 2) {
            switch (arguments.length) {


                case 1:
                    if (menuItems_taobao[arguments[0]].children != null && menuItems_taobao[arguments[0]].children.length > 0) {
                        for (var m in menuItems_taobao[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_taobao[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_taobao[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";
                                for (var n in menuItems_taobao[arguments[0]].children[m].children) {
                                    if (menuItems_taobao[arguments[0]].children[m].children[n].children != null && menuItems_taobao[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        var _current = (n == 0 ? " class=\"show\" " : " class=\"show\" ");

                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><i></i><span>" + menuItems_taobao[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_taobao[arguments[0]].children[m].children[n].children) {

                                            var menuItem = getmenudata(menuItems_taobao[arguments[0]].children[m].children[n].children[x]);

                                            _current = (x == 0 ? " class=\"show\" " : " class=\"show\" ");
                                            _html += "<li " + _current + "><a  id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";
                                        }
                                        _html += "</ul></li>";
                                    } else {

                                        var menuItem = getmenudata(menuItems_taobao[arguments[0]].children[m].children[n]);
                                        _html += "<li><h4><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></h4></li>";
                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);

                        if ($(".left_menu").find("a").eq(0).text() == "店铺预览") {
                            $(".left_menu").find("a").eq(1).bind("click", function (o) {
                                o.target.click();
                                menuclick(o.target);
                            }).click();
                        } else {
                            $(".left_menu").children().eq(0).removeClass("show").addClass("show");
                            //$(".left_menu").find("a").eq(0).parents("ul li").eq(0).addClass("current");
                            //$("iframe").attr("src", $(".left_menu").find("a").eq(0).attr("href"));
                        }


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;

                case 3:
                    if (menuItems_taobao[arguments[0]].children != null && menuItems_taobao[arguments[0]].children.length > 0) {
                        for (var m in menuItems_taobao[arguments[0]].children) {
                            var _licss = "show";
                            _html += "<li  name=\"level1\" class=\"$LICSS$\">";
                            _html += "<h2><span>" + menuItems_taobao[arguments[0]].children[m].Name + "</span></h2>";
                            if (menuItems_taobao[arguments[0]].children[m].children != null) {
                                _html += "<ul class=\"$MENUCLASS$\">";
                                var _css = "left_menu-small";

                                for (var n in menuItems_taobao[arguments[0]].children[m].children) {
                                    var _current = "";
                                    if (m == arguments[1] && n == arguments[2]) {
                                        _current = " class=\"current\" ";
                                    }
                                    else {
                                        _current = " class=\"show\"";
                                    }
                                    if (menuItems_taobao[arguments[0]].children[m].children[n].children != null && menuItems_taobao[arguments[0]].children[m].children[n].children.length > 0) {
                                        _css = "left_menu-mid";
                                        if (m == arguments[1] && n == arguments[2]) {
                                            _current = " class=\"show\" ";
                                            _licss = "show";
                                        }
                                        _html += "<li name=\"dropmenu\" " + _current + "><h3><span>" + menuItems_taobao[arguments[0]].children[m].children[n].Name + "</span></h3><ul class=\"left_menu-small\">";
                                        for (var x in menuItems_taobao[arguments[0]].children[m].children[n].children) {

                                            var __current = "";
                                            if (m == arguments[1] && x == arguments[2]) {
                                                __current = " class=\"current\" ";
                                                _licss = "show";
                                            }
                                            else {
                                                __current = " class=\"show\"";
                                                _current = " class=\"show\"";
                                            }

                                            var menuItem = getmenudata(menuItems_taobao[arguments[0]].children[m].children[n].children[x]);

                                            __current = "";
                                            _html += "<li " + __current + "><a id=\"a" + menuItem.ID + "\"  href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItem.IsNew ? "_self" : "_self") + "\">" + menuItem.Name + "</a></li>";

                                        }

                                        if (m == arguments[1] && n == arguments[2]) {

                                            var menuItem = getmenudata(menuItems_taobao[arguments[0]].children[m].children[n].children[0]);
                                            aI = menuItem.ID;
                                            //$("iframe").attr("src", menuItem.Url);
                                        }

                                        _html += "</ul></li>";
                                    } else {
                                        var menuItem = getmenudata(menuItems_taobao[arguments[0]].children[m].children[n]);



                                        _html += "<li " + _current + "><h4><a id=\"a" + menuItem.ID + "\" href=\"" + menuItem.outerUrl + "\" target=\"" + (menuItems_taobao[arguments[0]].children[m].children[n].IsNew ? "_self" : "_self") + "\">" + menuItems_taobao[arguments[0]].children[m].children[n].Name + "</a></h4></li>";

                                    }
                                }
                                _html = _html.replace("$MENUCLASS$", _css);
                                _html += "</ul>";
                            }

                            _html += "</li>";
                            _html = _html.replace("$LICSS$", _licss);
                        }
                        showLeft();
                        $(".left_menu").html(_html);


                    } else {
                        hideLeft();
                    }
                    hideDropDown();
                    break;
            }
        }
        if (aI != -1) {
            $("#a" + aI).parents("li").addClass("current");
        }

//        $(".left_menu").find("a").click(function () {
//            $(".left_menu").find("a").parents("li").removeClass("current");
//            $(this).parents("ul li").eq(0).addClass("current");
//        });

        $("h3").click(function () {
            var _this = this;
            var spans = $("h3");
            $(spans).each(function () {
                if (this == _this) {
                    if ($(this).parents("ul > li[name=dropmenu]").hasClass("show")) {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                    }

                } else {
                    $(this).parents("ul > li[name=dropmenu]").removeClass("show").addClass("show");
                }
            });
        });


        $("h2").click(function () {
            var _this = this;
            var spans = $("h2")

            $(spans).each(function (n) {

                if (this == _this) {
                    if ($(this).parents("ul > li").hasClass("show")) {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    } else {
                        $(this).parents("ul > li").removeClass("show").addClass("show");
                    }
                } else {
                    $(this).parents("ul > li").removeClass("show").addClass("show");
                }
            });
        });

    }
}

//function menuclick(m) {
//    $(".left_menu").find("a").parents("li").removeClass("current");
//    $(m).parents("ul li").eq(0).addClass("current");
//    $(m).parents("ul li[name=dropmenu]").eq(0).find("h3").parent().removeClass("show").addClass("show").parents("ul li[name=level1]").removeClass("show").addClass("show");

//}
$(document).ready(function () {
    $("#dropMenu").mouseleave(function () {
        $(this).hide();
    });
    $("#allnav_taobao").mouseleave(function () {
        $("#dropMenu").hide();
    });
});

function getmenudata() {
    var menuItem = arguments[0];
    var url = menuItem.Url;
    //    if (url != "")
    //        if (url.indexOf('?') == -1) {
    //            url = url + "?MT=" + menuItem.MT + "&code=" + menuItem.Code;
    //        } else {
    //            url = url + "&MT=" + menuItem.MT + "&code=" + menuItem.Code
    //        }
    menuItem.outerUrl = url;
    return menuItem;
}