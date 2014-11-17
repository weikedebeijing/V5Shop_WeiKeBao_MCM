$(document).ready(function () {
    $(".mod-tab li").click(function () {
        if ($(this).index() == 0) {
            window.location = "../../OrderSet/DownloadSetting";
        }
        //        else if ($(this).index() == 1) {
        //            window.location = "../../OrderSet/OrderTag";
        //        } 

        //        else if ($(this).index() == 2) {
        //            window.location = "../../OrderSet/OrderGroup";
        //        } 
        else {
            window.location = "../../OrderSet/QuestionOrder";
        }
    });
});