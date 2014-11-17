
var tag = "";
$(function () {
    //初始化全部隐藏
    $("#divText").hide();
    $("#divOneImageText").hide();
    $("#divMoreImageText").hide();
    //初始化记录
    tag = $("#selType").val();
    if ($("#selType").val() == "1") {
        $("#divText").show();
        $("#divOneImageText").hide();
        $("#divMoreImageText").hide();
    }
    else if ($("#selType").val() == "2") {
        $("#divText").hide();
        $("#divOneImageText").show();
        $("#divMoreImageText").hide();
    }
    else if ($("#selType").val() == "3") {
        $("#divText").hide();
        $("#divOneImageText").hide();
        $("#divMoreImageText").show();
    }

    $("#selType").change(function () {

        if ($(this).val() == "1") {
            $("#divText").show();
            $("#divOneImageText").hide();
            $("#divMoreImageText").hide();
        }
        else if ($(this).val() == "2") {
            $("#divText").hide();
            $("#divOneImageText").show();
            $("#divMoreImageText").hide();
        }
        else if ($(this).val() == "3") {
            $("#divText").hide();
            $("#divOneImageText").hide();
            $("#divMoreImageText").show();
        }
        //选择时记录
        tag = $(this).val();
    });
});


$(function () {
    //在页面load完成富文本编辑器KindEditor load完成后继续下面的代码，
    KindEditor.ready(function (K) { //富文本编辑器的生成代码
        editor = K.create("#txtDescribe", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]
        });


    });








});
//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
}

function btnSave() {
    var description = editor.html();
    description = description.replace(/(\n)/g, "");
    description = description.replace(/(\t)/g, "");
    description = description.replace(/(\r)/g, "");
    //    description = description.replace(/<\/?[^>]*>/g, "");
    description = description.replace(/\s*/g, "");

    if (tag == "1") {
        //表单验证
        if ($("#ReplyText").val() == "") {
            $("#ReplyText").focus();
            $(".prompt").text("");
            $("#ReplyText").parent().next().children(".prompt").text("请输入文本内容");
            return false;
        }
    }
    else if (tag == "2") {

        if ($("#txtName").val() == "") {
            $("#txtName").focus();
            $(".prompt").text("");
            $("#txtName").parent().next().children(".prompt").text("请输入标题");
            return false;
        }
        else if ($("#hidCoverUrl").val() == "") {
            $("#file_upload").focus();
            $(".prompt").text("");
            $("#divfile").parent().next().children(".prompt").text("请上传图片");
            return false;

        }
        else if ($("#txtAbstract").val() == "") {
            $("#txtAbstract").focus();
            $(".prompt").text("");
            $("#txtAbstract").parent().next().children(".prompt").text("请输入摘要");
            return false;
        }
        else if (description == "") {
            $("#txtDescribe").focus();
            $(".prompt").text("");
            $("#txtDescribe").parent().next().children(".prompt").text("请输入正文");
            return false;

        }

        else if (description.length < 5 || description.length > 25000) {
            $("#txtDescribe").next().text("正文字符数应在5～25000之间");
            $("#txtDescribe").focus();
            return false;
        }
    }
    else if (tag == "3") { }


    //接收后台传过来的 materialManageModel
    var materialManage = $.parseJSON(materialManageModel);

    //调用克隆方法克隆后台传来的 materialManage
    var newmaterialManage = clone(materialManage);

    newmaterialManage.materialManageList = new Array();

    var newMaterialManageList = clone(materialManage.materialManageList[0]);

    switch (tag) {
        case "1":
            {

                //赋值
                newMaterialManageList.Text = $("#ReplyText").val();
                newMaterialManageList.MessageType = parseInt(tag);
                newMaterialManageList.SonId = 0;
                newmaterialManage.materialManageList.push(newMaterialManageList);
                //调用添加方法
                AddAjax(newmaterialManage, tag);


            } break;
        case "2":
            {

                $("#HidDescribe").val(editor.html());
                $("#HidImg").val($("#divOneImageText #divfile  img").attr("src").replace("../../", ""));
                //赋值
                newMaterialManageList.MessageType = parseInt(tag);
                newMaterialManageList.SonId = 0;
                newMaterialManageList.Title = $("#txtName").val();
                newMaterialManageList.Author = $("#txtAuthor").val();
                newMaterialManageList.CoverUrl = $("#HidImg").val();
                newMaterialManageList.Abstract = $("#txtAbstract").val();
                newMaterialManageList.Text = $("#HidDescribe").val();
                newMaterialManageList.TheOriginalLink = $("#txtTheOriginalLink").val();
                newmaterialManage.materialManageList.push(newMaterialManageList);
                //调用添加方法
                AddAjax(newmaterialManage, tag);
            } break;
        case "3":
            {

                var tableRow = document.getElementById("myPressPaperTable");
                var row_index = tableRow.rows.length;

                for (var i = 0; i < row_index; i++) {
                    newMaterialManageList = clone(materialManage.materialManageList[0]);

                    newMaterialManageList.MessageType = parseInt(tag);
                    newMaterialManageList.SonId = 0;
                    newMaterialManageList.Title = $("#hidTitle" + i + "").val();
                    newMaterialManageList.Author = $("#hidAuthor" + i + "").val();
                    newMaterialManageList.CoverUrl = $("#hidCoverUrl" + i + "").val();
                    // newmaterialManage.Abstract = $("#hidAuthor" + i + "").val();
                    newMaterialManageList.Text = $("#hidText" + i + "").val();
                    newMaterialManageList.TheOriginalLink = $("#hidTheOriginalLink" + i + "").val();
                    newmaterialManage.materialManageList.push(newMaterialManageList);

                }
                //调用添加方法
                AddAjax(newmaterialManage, tag);

            } break;

    }


}

//表单验证
function Verification(type) {
    if (type == "1") {


    }
    else if (type == "2") { }
    else if (type == "3") { }
}


function AddAjax(newmaterialManage, type) {
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/AddMaterialManage",
        data: { "materialManage": JSON.stringify(newmaterialManage), "type": type },
        success: function (jsonRes) {
            if (jsonRes == "OK") {
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("添加成功！").change();
                window.location.href = "../../WeiXinManage/MaterialManage";
            }

            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("添加失败").change();
        }
    });

}

//上传图片
function FileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#OneImage_none").hide();
                $("#file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res);
                $("#file_upload_img").css("display", "block");
                $("#HidImg").val($("#file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res));

                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
               // alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
        $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}
function MoreImageFileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "MoreImage_file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#MoreImage_none").hide();
                $("#MoreImage_file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res);
                $("#hidCoverUrl").val($("#MoreImage_file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res));
                $("#MoreImage_file_upload_img").css("display", "block");
                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
                //alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}

//记录点击是那一行
var tags = "";
//点击编辑时
function Editing(event) {
    createPopup();
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    tags = $(eventSrc).parent("td").parent("tr").attr("lang");

    $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
    //富文本编辑器的生成代码
    MoreImage_editor = KindEditor.create("#txtMoreText", {
        resizeType: 1,
        allowPreviewEmoticons: false,
        allowImageUpload: true,
        items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]
    });

    $("#txtMoreTitle").val($("#hidTitle" + tags + "").val());
    $("#txtMoreAuthor").val($("#hidAuthor" + tags + "").val());
    $("#MoreImage_file_upload_img").attr("src", $("#hidCoverUrl" + tags + "").val());
    MoreImage_editor.html($("#hidText" + tags + "").val());
    $("#txtMoreTheOriginalLink").val($("#hidTheOriginalLink" + tags + "").val());

}
//保存
function SaveImg() {


    if ($("#txtMoreTitle").val() == "") {

        $("#txtMoreTitle").focus();
        $(".spMessage").text("");
        $("#txtMoreTitle").parent().next().children("span").text("请输入标题");
        return false;
    }
    else if ($("#hidMoreImage_img").val() == "") {

        $("#hidMoreImage_img").focus();
        $(".spMessage").text("");
        $("#divMoreImagefile").parent().next().children("span").text("请上传图片");
        return false;
    }

    $("#hidTitle" + tags + "").val($("#txtMoreTitle").val());
    $("#hidAuthor" + tags + "").val($("#txtMoreAuthor").val());
    $("#hidCoverUrl" + tags + "").val($("#MoreImage_file_upload_img").attr("src"));
    $("#hidText" + tags + "").val(MoreImage_editor.html());
    $("#hidTheOriginalLink" + tags + "").val($("#txtMoreTheOriginalLink").val());
    $("#appmsgItem" + tags + " td:eq(0)").html($("#txtMoreTitle").val());
    $("#appmsgItem" + tags + " td:eq(1) img").attr("src", $("#MoreImage_file_upload_img").attr("src"));
    closePopup();
}
//添加行
function InsertRow() {
    var tableRow = document.getElementById("myPressPaperTable");
    var rowIndex = tableRow.rows.length;
    if (rowIndex <= 7) {
        var trRow = tableRow.insertRow(rowIndex);
        trRow.id = "appmsgItem" + rowIndex;
        trRow.lang = rowIndex;
        var cel1 = trRow.insertCell(0);
        cel1.innerHTML = "标题";
        var cel2 = trRow.insertCell(1);
        cel2.innerHTML = '<img src="../../Images/Default.png" width="50px" height="50px" />';
        var cel3 = trRow.insertCell(2);
        cel3.innerHTML = '<a onclick="Editing(event)" href="javascript:void(0)" class="c07">编辑</a>   <a href="javascript:void(0)" data-id=' + rowIndex + ' class="r10 c07"onclick=\"dlRow(event)\" >删除</a>';
        var cel4 = trRow.insertCell(3);
        //需要修改
        cel4.innerHTML = ' <input type="hidden" id="hidTitle' + rowIndex + '" /><input type="hidden" id="hidAuthor' + rowIndex + '" /><input type="hidden" id="hidCoverUrl' + rowIndex + '" /><input type="hidden" id="hidText' + rowIndex + '" /><input type="hidden" id="hidTheOriginalLink' + rowIndex + '" />';
    }
    else {
       $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
        $("#operateTip").html("最多只能有八条图文").change();

     }
}

//删除行
function dlRow(event) {

    var tables = document.getElementById("myPressPaperTable");

    if (tables.rows.length <= 2) {

        $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
        $("#operateTip").html("无法删除，多条图文至少需要2条消息").change();
        return;
    }
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var rowId = $(eventSrc).parent("td").parent("tr").attr("id");
    var deleteRow = document.getElementById(rowId).rowIndex;
    document.getElementById("myPressPaperTable").deleteRow(deleteRow);
    //重新设置ID
    var index = 0;
    $("#myPressPaperTable tr:gt(0)").each(function () {
        index++;
        $(this).attr("id", "appmsgItem" + index);
        $(this).attr("lang", index);
        $("td input[type='hidden']:eq(0)", $(this)).attr("id", "hidTitle" + index);
        $("td input[type='hidden']:eq(1)", $(this)).attr("id", "hidAuthor" + index);
        $("td input[type='hidden']:eq(2)", $(this)).attr("id", "hidCoverUrl" + index);
        $("td input[type='hidden']:eq(3)", $(this)).attr("id", "hidText" + index);


    });
}