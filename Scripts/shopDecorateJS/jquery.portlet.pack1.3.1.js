(function (c, l) {
    c.widget("ui.portlet", {
        options: {
            columns: [],
            sortable: !0,
            singleView: !0,
            removeItem: null,
            filterRepeat: !1,
            columnWidth: 300,
            events: {
                drag: {
                    start: null,
                    stop: null,
                    over: null
                }
            }
        },
        _create: function () {
            this.element.addClass("ui-portlet");
            var d = this,
				a = d.element,
				b = d.options;
            (!b.columns || 0 == b.columns.length) && c("<div/>", {
                width: b.columnWidth
            }).addClass("ui-portlet-column").appendTo(a);
            c.each(b.columns, function (b, e) {
                var g = c("<div/>", {
                    width: e.width
                }).addClass("ui-portlet-column").appendTo(a);
                c.each(e.portlets, function (c, b) {
                    d._createSinglePortlet(d, a, g, "last", b)
                })
            });
            d._initEvents();
            !0 === b.singleView && d._regSingleView();
            d._sortable(b.sortable)
        },
        _createSinglePortlet: function (d, a, b, f, e) {
            var g = d.options;
            if (!0 === g.filterRepeat && e.attrs.id && 0 < c("#" + e.attrs.id).length) if (c.isFunction(g.handleRepeat)) {
                if (g = g.handleRepeat.call(a, b, e), !1 === g) return
            } else return;
            if (!c.isFunction(e.beforeCreate) || !(g = e.beforeCreate.call(a, f), !g)) {
                var i = c("<div/>").addClass("ui-portlet-item ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").data("option", e);
                "last" === f ? i.appendTo(b) : "last" === f.x ? i.insertAfter(c(b).find(".ui-portlet-item:last")) : i.insertBefore(c(b).find(".ui-portlet-item").eq(f.x));
                e.attrs && i.attr(e.attrs);
                b = c("<div/>", {
                    "class": "ui-portlet-header ui-widget-header ui-corner-all",
                    html: function () {
                        return c.isFunction(e.title) ? e.title : e.icon ? "<span class='" + e.icon + "'></span>" + e.title : e.title
                    }
                }).appendTo(i);
                e.icon && b.prepend("<span class='ui-portlet-header-icon ui-icon " + e.icon + "'></span>");
                // hsw 添加一个编辑
                b.prepend("<a onclick='javascript:protletEidt(event);' href='javascript:void(0);' class='ui-corner-all ui-portlet-event'><span class='ui-icon ui-icon-pencil ui-portlet-pencil'></span></a>");
                //b.prepend("<a href='#' class='ui-corner-all ui-portlet-event'><span class='ui-icon ui-icon-refresh ui-portlet-refresh'></span></a>");
                b.prepend("<a href='#' class='ui-corner-all ui-portlet-event'><span class='ui-icon ui-icon-minusthick ui-portlet-toggle'></span></a>");
                b.prepend("<a href='#' class='ui-corner-all ui-portlet-event'><span class='ui-icon ui-icon-closethick ui-portlet-close'></span></a>");
                var h = c("<div/>", {
                    "class": "ui-portlet-content"
                }).appendTo(i);
                e.content.style && c(h).css(e.content.style);
                e.content.attrs && c.each(e.content.attrs, function (c, a) {
                    var b = h.attr(c);
                    b && ("style" == c && ";" != a.substr(a.length - 1) && (b += ";"), "class" == c && (b += " "), b += a);
                    h.attr(c, b)
                });
                d._content.call(a, i, e, function () {
                    d._loadScripts(e.scripts, function () {
                        c.isFunction(e.afterLoadContent) && e.afterLoadContent.call(i, i.find(".ui-portlet-content"))
                    })
                });
                c.isFunction(e.afterCreated) && e.afterCreated.call(a);
                return i
            }
        },
        _setOption: function (d, a) {
            var b = this.element,
				f = this.options;
            this.options[d] && (this.options[d] = a);
            switch (d) {
                case "sortable":
                    this._sortable(a);
                    break;
                case "add":
                    this._addSingle(a);
                    break;
                case "remove":
                    c(a, b).find(".ui-portlet-close").trigger("click");
                    break;
                case "filterRepeat":
                    if (null == a || a == l) return f.filterRepeat;
                    f.filterRepeat = a
            }
        },
        index: function () {
            var d = {};
            c(".ui-portlet-column").each(function (a) {
                c(".ui-portlet-item", this).each(function (b) {
                    var f = c(this).attr("id");
                    d[f] = {
                        x: a,
                        y: b
                    }
                })
            });
            return d
        },
        _regSingleView: function () {
            var d = this.element;
            c(d).find(".ui-portlet-header").dblclick(function () {
                var a = c(this).parents(".ui-portlet-item"),
					b = a.data("option");
                if (a.hasClass("ui-portlet-single-view")) c(d).find(".ui-portlet-item").show(), a.removeClass("ui-portlet-single-view").animate({
                    width: a.data("width"),
                    height: "auto"
                }).css({
                    position: "static"
                }).removeData("width").removeData("height"), b.singleView && c.isFunction(b.singleView.recovery) && b.singleView.recovery.call(a, b);
                else {
                    c(d).find(".ui-portlet-item").hide();
                    a.show().addClass("ui-portlet-single-view").data({
                        width: a.width(),
                        height: a.height()
                    }).css({
                        position: "absolute",
                        left: 0,
                        top: 0
                    });
                    var f, e;
                    b.singleView ? (b.singleView.width && (f = c.isFunction(b.singleView.width) ? b.singleView.width.call(a, b) : b.singleView.width), b.singleView.height && (e = c.isFunction(b.singleView.height) ? b.singleView.height.call(a, b) : b.singleView.height)) : f = c(d).width() + 14;
                    a.animate({
                        width: f,
                        height: e
                    });
                    b.singleView && c.isFunction(b.singleView.enable) && b.singleView.enable.call(a, b)
                }
            })
        },
        _loadScripts: function (d, a) {
            d && c.each(d, function () {
                var a = c("head").remove("#loadScript");
                c("<script><\/script>").attr({
                    src: this,
                    type: "text/javascript",
                    id: "loadScript"
                }).appendTo(a)
            });
            c.isFunction(a) && a()
        },
        _sortable: function (d) {
            var a = this.options,
				b = c(".ui-portlet-column", this.element).sortable({
				    connectWith: ".ui-portlet-column",
				    start: function (b, d) {
				        c.isFunction(a.events.drag.start) && a.events.drag.start.call(d.item[0], b, d)
				    },
				    stop: function (b, d) {
				        c.isFunction(a.events.drag.stop) && a.events.drag.stop.call(d.item[0], b, d)
				    },
				    over: function (b, d) {
				        c.isFunction(a.events.drag.over) && a.events.drag.over.call(d.item[0], b, d)
				    }
				});
            !0 === d ? (c(this.element).find(".ui-portlet-header").css("cursor", "move"), b.sortable("enable"), c(".ui-portlet-content", this.element).draggable({
                start: function () {
                    return !1
                }
            })) : (c(this.element).find(".ui-portlet-header").css("cursor", "default"), b.sortable("disable"))
        },
        _addSingle: function (d) {
            var a = this.element,
				b = this.options,
				f;
            f = 0 < c(".ui-portlet-column", a).eq(d.position.y).length ? c(".ui-portlet-column", a).eq(d.position.y) : c(".ui-portlet-column", a).eq(0);
            console.log(f);
            d = this._createSinglePortlet(this, a, f, d.position, d.portlet);
            this._initEvents(d);
            !0 === b.singleView && this._regSingleView();
            this._sortable(b.sortable)
        },
        _initEvents: function (d) {
            var a = this,
				d = d || this.element,
				b = c(".ui-portlet-toggle", d).click(function (b, a) {
				    var d = c(this).parents(".ui-portlet-item:first").find(".ui-portlet-content"),
						a = a || "toggle";
				    "toggle" == a ? (d.slideToggle(), c(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick")) : "hide" == a ? (d.slideUp(), c(this).removeClass("ui-icon-minusthick").addClass("ui-icon-plusthick")) : "show" == a && (d.slideDown(), c(this).removeClass("ui-icon-plusthick").addClass("ui-icon-minusthick"))
				}).dblclick(function (a) {
				    a.stopPropagation()
				}),
				f = c(".ui-portlet-pencil", d).click(function (b) { // hsw 2013-11-07 11:30:00 改为编辑
				    a.refresh.call(a, b)
				}).dblclick(function (a) {
				    a.stopPropagation()
				});
            c(".ui-portlet-close", d).click(function (b) {
                a._destoryItem.call(a, b)
            }).dblclick(function (a) {
                a.stopPropagation()
            });
            this._hoverable(b.parent());
            this._hoverable(f.parent())
        },
        _hoverable: function (d) {
            c(d).hover(function () {
                c(this).addClass("ui-state-hover")
            }, function () {
                c(this).removeClass("ui-state-hover")
            })
        },
        _destoryItem: function (d) {
            var a = this.options,
				d = c(d.target).parents(".ui-portlet-item"),
				b = d.data("option");
            if (!c.isFunction(b.beforeRemove) || b.beforeRemove()) d.remove(), c.isFunction(a.removeItem) && a.removeItem()
        },
        refresh: function (d) {
            var a = c(d.target).parents(".ui-portlet"),
				d = c(d.target).parents(".ui-portlet-item"),
				b = d.data("option");
            d.find(".ui-portlet-content");
            var f = d.parents(".ui-portlet");
            c.isFunction(b.beforeRefresh) && b.beforeRefresh.call(f, b);
            this._content.call(a, d, b, function (a) {
                c.isFunction(b.afterRefresh) && b.afterRefresh.call(f, a, b)
            });
            this._loadScripts(b.scripts)
        },
        _content: function (d, a, b) {
            function f(b) {
                c.isFunction(a.content.afterShow) && a.content.afterShow.call(g, b)
            }
            var e = this.options,
				g = this,
				i = a.content.type,
				h = null,
				j = d.find(".ui-portlet-content");
            c.isFunction(a.content.beforeShow) && a.content.beforeShow.call(this, a.content.text);
            if ("text" == i) h = a.content.text, c.isFunction(h) && (h = h(g, d, a)), c.isFunction(b) && b.call(g, h), j.html(h), f(a.content.text);
            else if ("ajax" == i) {
                var k = a.content.dataType || "html";
                c.ajax({
                    url: a.content.url,
                    dataType: k,
                    beforeSend: function () {
                        c(j).html("Loading...")
                    },
                    success: function (d) {
                        "html" == k ? (h = d, c(j).html(d)) : "json" == k && c.isFunction(a.content.formatter) && (h = a.content.formatter(e, a, d), c(j).html(h));
                        f(h);
                        c.isFunction(b) && b.call(g, d)
                    },
                    error: function (b, d, e) {
                        c(j).html("<span style='padding:0.2em' class='ui-state-error ui-corner-all'>Load Error...</span>");
                        c.isFunction(a.content.error) && a.content.error.call(j, b, d, e)
                    }
                })
            }
        },
        toggle: function (d, a) {
            c("#" + d + " .ui-portlet-toggle", this.element).trigger("click", [a || "toggle"])
        },
        toggleAll: function (d) {
            c(".ui-portlet-toggle", this.element).trigger("click", [d || "toggle"])
        },
        destroy: function () {
            this.element.removeClass("ui-portlet").text("");
            c.Widget.prototype.destroy.call(this);
            return this
        }
    })
})(jQuery);