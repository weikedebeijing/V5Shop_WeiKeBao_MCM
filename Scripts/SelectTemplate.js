$("#template-ul li").on("click", function (event) {
    $("#template-ul li").removeClass("current");
    $(this).addClass("current");
    this.children[1].children[0].checked = true;
    var id = this.children[1].children[0].id;
    if (id != undefined || id != "") {
        var url = $("#ajaxUrl").val() + "/weblogin/GateWay.aspx?action=actTemplate&TemplateId=" + id;
        $.getScript(url, function (data) {

        });
    }
})
