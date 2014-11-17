document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');


var selectDialog = function () {
    art.dialog.open('SeleteMaterialManage', {
        lock: true,
        title: "选择图文消息",
        width: 830,
        height: 490,
        drag: false,
        resize:false,
        background: "#000000"
    }
            , true);

}




