document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');

var dialog = function (id) {

    art.dialog.open('../../Product/ProductView?productID=' + id, {
        lock: true,
        title: "商品详细",
        width: 690,
        height: 440,
        drag: false,
        resize: false,
        background: "#000000"
    }
            , true);




}
