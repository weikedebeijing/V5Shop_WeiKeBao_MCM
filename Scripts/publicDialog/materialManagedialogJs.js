
document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');

var dialog = function (type, id, refresh) {
    if (type == "Add") {

        art.dialog.open('addMaterialManages?refresh=' + refresh, {
            lock: true,
            title: "添加图文消息",
            width: 850,
            height: 500,
            drag: false,
            resize: false,
            background: "#000000"
        }
            , true);

    }

    if (type == "Update") {
        art.dialog.open('UpdateMaterialManages?id=' + id + '&&refresh=' + refresh, {
            lock: true,
            title: "修改图文消息",
            width: 850,
            height: 500,
            drag: false,
            resize: false,
            background: "#000000"
        }
            , true);
    }


//    if (type = "a") {
//        art.dialog.open('demode', {
//            lock: true,
//            title: "修改图文消息",
//            width: 600,
//            height: 500,
//            drag: false,
//            resize: false,
//            background: "#000000"
//        }
//            , true);
//    
//     }

}






