/*
 
* jQuery pager plugin
 
* Version 1.0 (12/22/2008)
 
* @requires jQuery v1.2.6 or later
 
*
 
* Example at: http://jonpauldavies.github.com/JQuery/Pager/PagerDemo.html
 
*
 
* Copyright (c) 2008-2009 Jon Paul Davies
 
* Dual licensed under the MIT and GPL licenses:
 
* http://www.opensource.org/licenses/mit-license.php
 
* http://www.gnu.org/licenses/gpl.html
 
* 
 
* Read the related blog post and contact the author at http://www.j-dee.com/2008/12/22/jquery-pager-plugin/
 
*
 
* This version is far from perfect and doesn't manage it's own state, therefore contributions are more than welcome!
 
*
 
* Usage: .pager({ pagenumber: 1, pagecount: 15, buttonClickCallback: PagerClickTest });
 
*
 
* Where pagenumber is the visible page number
 
*       pagecount is the total number of pages to display
 
*       buttonClickCallback is the method to fire when a pager button is clicked.
 
*
 
* buttonClickCallback signiture is PagerClickTest = function(pageclickednumber) 
 
* Where pageclickednumber is the number of the page clicked in the control.
 
*
 
* The included Pager.CSS file is a dependancy but can obviously tweaked to your wishes
 
* Tested in IE6 IE7 Firefox & Safari. Any browser strangeness, please report.
 
*/

(function ($) {



    $.fn.pager = function (options) {



        var opts = $.extend({}, $.fn.pager.defaults, options);



        return this.each(function () {



            // empty out the destination element and then render out the pager with the supplied options

            $(this).empty().append(renderpager(parseInt(options.pagenumber), parseInt(options.pagecount), options.buttonClickCallback));



            // specify correct cursor activity(指定正确的光标活动)

            // $('.turn-ul li').mouseover(function () { document.body.style.cursor = "pointer"; }).mouseout(function () { document.body.style.cursor = "auto"; });

        });

    };



    // render and return the pager with the supplied options

    function renderpager(pagenumber, pagecount, buttonClickCallback) {



        // setup $pager to hold render

        var $pager = $('<ul class="turn-ul"></ul>');



        // add in the previous and next buttons

        $pager.append(renderButton('》', pagenumber, pagecount, buttonClickCallback));
        //renderButton('first', pagenumber, pagecount, buttonClickCallback)).append(


        // pager currently only handles 10 viewable pages ( could be easily parameterized, maybe in next version ) so handle edge cases

        var startPoint = 1;

        var endPoint = 9;



        if (pagenumber > 4) {

            startPoint = pagenumber - 4;

            endPoint = pagenumber + 4;

        }



        if (endPoint > pagecount) {

            startPoint = pagecount - 8;

            endPoint = pagecount;

        }



        if (startPoint < 1) {

            startPoint = 1;

        }



        // loop thru visible pages and render buttons

        for (var page = startPoint; page <= endPoint; page++) {



            //var currentButton = $('<li class="page-number">' + (page) + '</li>');

            var currentButton = $('<li class="prev">' + (page) + '</li>');



            //page == pagenumber ? currentButton.addClass('pgCurrent') : currentButton.click(function() { buttonClickCallback(this.firstChild.data); });

            page == pagenumber ? currentButton.addClass('current-blue') : currentButton.click(function () { buttonClickCallback(this.firstChild.data); });

            /*hsw 2013-12-20 10:16:37*/
            //currentButton.appendTo($pager);

        }



        // render in the next and last buttons before returning the whole rendered control back.

        $pager.append(renderButton('《', pagenumber, pagecount, buttonClickCallback));
        //).append(renderButton('last', pagenumber, pagecount, buttonClickCallback)


        return $pager;

    }



    // renders and returns a 'specialized' button, ie 'next', 'previous' etc. rather than a page number button

    function renderButton(buttonLabel, pagenumber, pagecount, buttonClickCallback) {



        var $ButtonA = $('<li class="prev"></li>');
        var $ButtonB = $('<li class="next"></li>');

        // var $Button = $('<li><span class="ui-icon "></span></li>');
        var destPage = 1;

        // work out destination page for required button type

        switch (buttonLabel) {

            case "first":

                destPage = 1;

                //    $Button.find("span").addClass("first");

                break;

            case "《":

                destPage = pagenumber - 1;

                $ButtonA.find("span").addClass("prev");

                break;

            case "》":

                destPage = pagenumber + 1;

                $ButtonB.find("span").addClass("next");

                break;

            case "last":

                destPage = pagecount;

                //  $Button.find("span").addClass("last");

                break;

        }
        // disable and 'grey' out buttons if not needed.
        //buttonLabel == "first" ||
        if (buttonLabel == "《") {
            pagenumber <= 1 ? $ButtonA.removeClass("prev").addClass('first') : $ButtonA.click(function () { buttonClickCallback(destPage); });
            return $ButtonA;
        }

        else {

            pagenumber >= pagecount ? $ButtonB.removeClass("next").addClass('last') : $ButtonB.click(function () { buttonClickCallback(destPage); });
            return $ButtonB;
        }

      





    }



    // pager defaults. hardly worth bothering with in this case but used as placeholder for expansion in the next version

    $.fn.pager.defaults = {

        pagenumber: 1,

        pagecount: 1

    };



})(jQuery);
 
