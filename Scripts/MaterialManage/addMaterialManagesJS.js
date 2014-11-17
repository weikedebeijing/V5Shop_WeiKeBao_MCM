
document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');



var editor;
var moreText;
var radiosChecked = "";
$(function () {
    //输入时
    SetOnkeup();
    //富文本生成器
    Geteditor();
    //初始化选中
    InitRadios();
    //选中时赋值和显示
    $("input[name=ImageText]").click(function () {
        radiosChecked = $(this).val();
        if (radiosChecked == "1") {
            $("#text").show();
            $("#moreText").hide();
            $("#simpleText").hide();
        }

        if (radiosChecked == "2") {
            $("#simpleText").show();
            $("#moreText").hide();
            $("#text").hide();
            document.getElementById('txtName').onkeyup = function () {

                $("#coverTitle a").text($("#txtName").val());

            };

            document.getElementById('txtAbstract').onkeyup = function () {

                $("#coverAuthor a").text($("#txtAbstract").val());

            };

        } else if (radiosChecked == "3") {
            $("#moreText").show();
            $("#simpleText").hide();
            $("#text").hide();
            if (tag == undefined) {

                document.getElementById('txtMoreTitle').onkeyup = function () {

                    $("#MoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text($("#txtMoreTitle").val());
                    $("#hidTitle0").val($("#txtMoreTitle").val());
                };
                //作者
                document.getElementById('txtMoreAuthor').onkeyup = function () {
                    $("#hidAuthor0").val($("#txtMoreAuthor").val());
                };
                //原链接
                document.getElementById('txtMoreTheOriginalLink').onkeyup = function () {
                    $("#hidTheOriginalLink0").val($("#txtMoreTheOriginalLink").val());
                };
            }

        }
    });
    $("#btnMaterialSave").click(function () {

        MaterialManageAdd();
    });
});

//用于加输入时
function SetOnkeup() {

    //    //标题
    //    document.getElementById('txtMoreTitle').onkeyup = function () {
    //        $("#MoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text($("#txtMoreTitle").val());
    //        $("#hidTitle0").val($("#txtMoreTitle").val());
    //    };
    //    //作者
    //    document.getElementById('txtMoreAuthor').onkeyup = function () {
    //        $("#hidAuthor0").val($("#txtMoreAuthor").val());
    //    };
    //    //原链接
    //    document.getElementById('txtMoreTheOriginalLink').onkeyup = function () {
    //        $("#hidTheOriginalLink0").val($("#txtMoreTheOriginalLink").val());
    //    };

}

//富文本编辑器的生成代码
function Geteditor() {


    $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
    //富文本编辑器的生成代码
    editor = KindEditor.create("#txtDescribe", {
        resizeType: 1,
        allowPreviewEmoticons: false,
        allowImageUpload: true,
        focus: true,
        blur: false,
        items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'
                    ]
    });

    //富文本编辑器的生成代码
    moreText = KindEditor.create("#txtMoreText", {
        resizeType: 1,
        allowPreviewEmoticons: false,
        allowImageUpload: true,
        focus: true,
        blur: false,
        afterBlur: function () {
            //鼠标离开事件赋值

            if (tag == undefined || tag == "0") {
                $("#hidText0").val(moreText.html());

            }
            else {
                $("#hidText" + tag + "").val(moreText.html());

            }

        },
        items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'
                    ]
    });
}
//初始化
function InitRadios() {

    //初始化赋值
    var radios = document.getElementsByName("ImageText");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {

            radiosChecked = radios[i].value;

            if (radiosChecked == "1") {
                $("#text").show();
                $("#simpleText").hide();
                $("#moreText").hide();
            }
            else if (radiosChecked == "2") {
                $("#simpleText").show();
                $("#text").hide();
                $("#moreText").hide();

            } else if (radiosChecked == "3") {
                $("#moreText").show();
                $("#text").hide();
                $("#simpleText").hide();



            }
        }
    }
}




//添加
var MaterialManageAdd = function () {

    var moreDescription = moreText.html();
    var description = editor.html();
    description = description.replace(/(\n)/g, "");
    description = description.replace(/(\t)/g, "");
    description = description.replace(/(\r)/g, "");
    description = description.replace(/\s*/g, "");

    moreDescription = moreDescription.replace(/(\n)/g, "");
    moreDescription = moreDescription.replace(/(\t)/g, "");
    moreDescription = moreDescription.replace(/(\r)/g, "");
    moreDescription = moreDescription.replace(/\s*/g, "");

    var strRegex = "^((https|http|ftp|rtsp|mms)://)?[a-z0-9A-Z]{3}\.[a-z0-9A-Z][a-z0-9A-Z]{0,61}?[a-z0-9A-Z]\.com|net|cn|cc (:s[0-9]{1-4})?/$";
    var re = new RegExp(strRegex);
    if (radiosChecked == "1") {

        if ($("#ttText").val() == "") {

            $("#prompt").text("请输入文本");
            $("#ttText").focus();
            return false;
        }
    }


    else if (radiosChecked == "2") {


        if ($("#txtName").val() == "") {
            $(".prompt").text("");

            $(".prompt", $("#txtName").parent().next()).text("请输入标题");
            $("#txtName").focus();

            return false;
        }
        else if ($("#hidCoverUrl").val() == "") {
            $(".prompt").text("");
            $("#txtAbstract").focus();
            $("[name='files']").focus();

            $(".prompt", $("[name='files']").parent().parent().parent().next()).text("请上传图片");



            return false;

        }
        else if ($("#txtAbstract").val() == "") {
            $(".prompt").text("");
            $("#txtAbstract").focus();

            $(".prompt", $("#txtAbstract").parent().next()).text("请输入摘要");


            return false;
        }
        else if (description == "") {
            $(".prompt").text("");
            $("#txtTheOriginalLink").focus();
            editor.focus();
            $(".prompt", $("#txtDescribe").parent().next()).text("请输入正文");

            return false;

        }
        else if ($("#txtTheOriginalLink").val() != "" && !re.test($("#txtTheOriginalLink").val())) {
            $(".prompt").text("");
            $("#txtTheOriginalLink").focus();

            $(".prompt", $("#txtTheOriginalLink").parent().next()).text("请输入正确的链接地址");

            return false;

        }


    }
    else if (radiosChecked == "3") {

        var strRegex = "^((https|http|ftp|rtsp|mms)://)?[a-z0-9A-Z]{3}\.[a-z0-9A-Z][a-z0-9A-Z]{0,61}?[a-z0-9A-Z]\.com|net|cn|cc (:s[0-9]{1-4})?/$";
        var re = new RegExp(strRegex);


        var Materiallength = $("#MoreVessel").children().length;

        for (var j = 0; j < Materiallength; j++) {
            if ($("#hidTitle" + j).val() == "") {
                $(".prompt").text("");

                $(".Loading").removeClass("style03 style02").addClass("style03");
                $("#operateTip").html("多图文至少要有2张或者您的信息不完整").change();

                //                $("#txtMoreTitle").focus();
                //                $("#txtMoreTitle").parent().next().children(".prompt").text("请输入标题");
                return false;
            }

            else if ($("#hidCoverUrl" + j).val() == "") {
                $(".prompt").text("");
                $(".Loading").removeClass("style03 style02").addClass("style03");
                $("#operateTip").html("多图文至少要有2张或者您的信息不完整").change();
                //                $("[name='Morefiles']").focus();
                //                $("#MoreImage_file_upload").parent().parent().parent().next().children(".prompt").text("请上传图片");
                return false;

            }

            else if ($("#hidText" + j).val() == "") {
                $(".prompt").text("");

                $(".Loading").removeClass("style03 style02").addClass("style03");
                $("#operateTip").html("多图文至少要有2张或者您的信息不完整").change();

                //                $("#txtMoreText").focus();
                //                $("#txtMoreText").parent().next().children(".prompt").text("请输入正文");

                return false;
            }


            else if ($("#hidTheOriginalLink" + j).val() != "" && !re.test($("#hidTheOriginalLink" + j).val())) {
                $(".prompt").text("");

                $(".Loading").removeClass("style03 style02").addClass("style03");
                $("#operateTip").html("多图文至少要有2张或者您的信息不完整").change();

                return false;

            }



        }
    }



    //接收后台传过来的 materialManageModel
    var materialManage = $.parseJSON(materialManageModel);

    //调用克隆方法克隆后台传来的 materialManage
    var newmaterialManage = clone(materialManage);

    newmaterialManage.materialManageList = new Array();

    var newMaterialManageList = clone(materialManage.materialManageList[0]);



    switch (radiosChecked) {
        //添加文本                                                                                                                        

        case "1":
            {
                newMaterialManageList.Text = $("#ttText").val();
                newMaterialManageList.MessageType = parseInt(radiosChecked);
                newmaterialManage.materialManageList.push(newMaterialManageList);
                AddAjax(newmaterialManage, radiosChecked);
            } break;

        //添加单图文                                                                                                                       
        case "2":
            {
                if ($("#txtAbstract").val() == "" && description != "") {
                    var text = description.length / 18;
                    var txtAbstract = editor.html().substring(0, text < 1 ? 1 : text);
                }
                //是否显示封面
                var txtshowmain;

                if ($("#txtshowmain").attr("checked") == 'checked') {

                    var txtshowmain = true;
                }
                else { txtshowmain = false; }


                //赋值
                newMaterialManageList.MessageType = parseInt(radiosChecked);
                newMaterialManageList.SonId = 0;
                newMaterialManageList.Title = $("#txtName").val();
                newMaterialManageList.Author = "";
                newMaterialManageList.CoverUrl = $("#hidCoverUrl").val();
                newMaterialManageList.Abstract = $("#txtAbstract").val() == "" ? txtAbstract : $("#txtAbstract").val();
                newMaterialManageList.Text = editor.html();
                newMaterialManageList.TheOriginalLink = $("#txtTheOriginalLink").val();
                newMaterialManageList.IsImg = txtshowmain;
                newmaterialManage.materialManageList.push(newMaterialManageList);
                //调用添加方法
                AddAjax(newmaterialManage, radiosChecked);
            } break;
        //添加多图文                                                                                                                       
        case "3":

            //获取图片的数量


            $("#MoreVessel").children().each(function () {
                newMaterialManageList = clone(materialManage.materialManageList[0]);

                newMaterialManageList.MessageType = parseInt(radiosChecked);
                newMaterialManageList.SonId = 0;
                newMaterialManageList.Title = $("#hidTitle" + $(this).attr("dir") + "").val();
                newMaterialManageList.Author = "";
                newMaterialManageList.CoverUrl = $("#hidCoverUrl" + $(this).attr("dir") + "").val();
                // newmaterialManage.Abstract = $("#hidAuthor" + i + "").val();
                newMaterialManageList.Text = $("#hidText" + $(this).attr("dir") + "").val();
                newMaterialManageList.TheOriginalLink = $("#hidTheOriginalLink" + $(this).attr("dir") + "").val();
                newmaterialManage.materialManageList.push(newMaterialManageList);
            })
            AddAjax(newmaterialManage, radiosChecked);

            break;



    }
}


function AddAjax(newmaterialManage, type) {
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/AddMaterialManage",
        data: { "materialManage": JSON.stringify(newmaterialManage), "type": type },
        success: function (jsonRes) {

            if (jsonRes != "ON") {

                var win = art.dialog.open.origin; //来源页面
                var origin = artDialog.open.origin;
                //传值给父页面
                var aValue = jsonRes;
                var input = origin.document.getElementById('hidTagId');
                input.value = aValue;
                input.select();
                $(input).change();
                // 关闭
                var win = art.dialog.open.origin;
                art.dialog.close();
                if (refresh == "refresh") {
                    //刷新主页面
                    win.location.reload();
                }
            }
            else if (jsonRes == "ON") {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                $("#operateTip").html("添加失败").change();
            }
        }
    });

}

//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
}
//单图文上传
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
                $("#img").hide();
                //清除原有的
                $("#spanImg").text("");
                var img = $("<img class='nopic' style='line-height: 150px;'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "file_upload_img");
                $("#spanImg").append(img);


                $("#hidCoverUrl").val($("#file_upload_img").attr("src").replace("../../", ""));
                //显示封面图片
                $("#coverImg").text("");
                var coverimg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
                $("#coverImg").append(coverimg);

                //  $("#hidCoverUrl").val($("#file_upload_img").attr("src"));

                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
                //  alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}

//多图文上传
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

                //清除原有的
                $("#MorespanImg").text("");
                var img = $("<img class='nopic' style='line-height: 150px;'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "MoreImage_file_upload_img");
                $("#MorespanImg").append(img);


                if (tag == undefined || tag == "0") {
                    $("#hidCoverUrl0").val($("#MoreImage_file_upload_img").attr("src").replace("../../", ""));
                    //显示封面图片
                    $("#MoreCoverImg").text("");
                    var coverimg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
                    $("#MoreCoverImg").append(coverimg);
                }
                else {
                    $("#hidCoverUrl" + tag + "").val($("#MoreImage_file_upload_img").attr("src").replace("../../", ""));
                    $("#thumbnail" + tag + "").text("");
                    var thumbnail = $("<img style='width:78px;height:78px;'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "thumbnailimgs");

                    $("#thumbnail" + tag + "").append(thumbnail);
                }


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

$(function () {


    //点击 封面图片显示在正文
    $("#showmaintext").click(function () {
        if (tag == undefined || tag == "0") {
            if ($(this).attr("checked") == "checked") {
                $("#hidIsImg0").val("true");
            } else {
                $("#hidIsImg0").val("false");
            }
        } else {
            if ($(this).attr("checked") == "checked") {
                $("#hidIsImg" + tag).val("true");
            } else {
                $("#hidIsImg" + tag).val("false");
            }
        }
    });


    $("#close").click(function () {
        art.dialog.close();


    });


    //创建图文
    $("#AddCover").click(function () {
        var index = $("#MoreVessel .moretext-emulation02:lastChild").attr("dir");
        if ($("#MoreVessel").children().length + 1 > 8) {

            $(".Loading").removeClass("style03 style01").addClass("style02");
            $("#operateTip").html("你最多只可以加入8条图文消息").change();
            return;
        }
        index++;
        var str = '<div class="moretext-emulation02" dir=' + index + '>';
        str += '<i style="display: none;" class="arrow"></i>';
        str += '<div class="moretext-emulation02-mask">';
        str += '<a data-id="' + index + '" class="moretext-emulation02-operate-edit" onclick="Editing(event)" href="javascript:void(0)">编辑</a>';
        str += '<a class="moretext-emulation02-operate-del l10" onclick="DelectImageText(event)" href="javascript:void(0)">删除</a></div>';
        str += '<div class="moretext-emulation02-box">';
        str += '<div class="moretext-emulation02-img" id="thumbnail' + index + '">缩略图</div>';
        str += '<div class="moretext-emulation02-text">标题</div>  </div>';
        str += '<input type="hidden" id="hidTitle' + index + '"><input type="hidden" id="hidAuthor' + index + '"><input type="hidden" id="hidCoverUrl' + index + '"><input type="hidden" id="hidText' + index + '"> <input type="hidden" id="hidTheOriginalLink' + index + '"><input type="hidden" id="hidIsImg' + index + '" /></div>';
        $("#MoreVessel .moretext-emulation02:last-child").after(str);
    });





    $("#simpleText  [name='rdUrl']").change(function () {
        rdUrl = $(this).val();
        if ($(this).val() == "1") {
            $("#divSimpleJump").show();

        } else {
            $("#divSimpleJump").hide();
        }
    });

});

//记录点击的是哪一个编辑
var tag;
function Editing(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;


    if (radiosChecked == "3") {

        var strRegex = "^((https|http|ftp|rtsp|mms)://)?[a-z0-9A-Z]{3}\.[a-z0-9A-Z][a-z0-9A-Z]{0,61}?[a-z0-9A-Z]\.com|net|cn|cc (:s[0-9]{1-4})?/$";
        var re = new RegExp(strRegex);
        var dir;
        var istrue = false;
        $("#MoreVessel div").each(function () {
            if ($(this).attr("isedit") == "true") {
                dir = $(this).attr("dir");

                if ($("#hidTitle" + dir).val() == "") {
                    $(".prompt").text("");
                    $("#txtMoreTitle").focus();
                    $(".prompt", $("#txtMoreTitle").parent().next()).text("请输入标题");
                    istrue = false;
                }

                else if ($("#hidCoverUrl" + dir).val() == "") {
                    $(".prompt").text("");
                    $("#txtMoreTheOriginalLink").focus();

                    $("[name='Morefiles']").focus();
                    $(".prompt", $("[name='Morefiles']").parent().parent().parent().next()).text("请上传图片");

                    istrue = false;

                }
                else if ($("#hidText" + dir).val() == "") {
                    $(".prompt").text("");
                    $("#txtMoreTheOriginalLink").focus();
                    moreText.focus();

                    $(".prompt", $("#txtMoreText").parent().next()).text("请输入正文");
                    istrue = false;
                }

                else if ($("#hidTheOriginalLink" + dir).val() != "" && !re.test($("#hidTheOriginalLink" + dir).val())) {
                    $(".prompt").text("");
                    $("#txtMoreTheOriginalLink").focus();
                    $(".prompt", $("#txtMoreTheOriginalLink").parent().next()).text("链接地址有误");
                    istrue = false;
                }
                else { istrue = true; }
            }

        });
        if (istrue) {
            $("#MoreVessel div").each(function () {

                if ($(this).attr("dir") == dir) {
                    $(this).attr("isedit", " ");
                }
            });

            $(eventSrc).parent().parent().attr("isedit", "true");
        }
        else { return false; }
    }


    //编辑第一个赋值
    if ($(eventSrc).parent().parent().attr("dir") == "0") {
        tag = $(eventSrc).parent().parent().attr("dir");

        //标题
        document.getElementById('txtMoreTitle').onkeyup = function () {

            $(eventSrc).parent().next().next(".moretext-emulation01-title-text").text($("#txtMoreTitle").val());
            $("#hidTitle" + tag + "").val($("#txtMoreTitle").val());
        };
        //作者
        document.getElementById('txtMoreAuthor').onkeyup = function () {

            $("#hidAuthor" + tag + "").val($("#txtMoreAuthor").val());

        };
        document.getElementById('txtMoreTheOriginalLink').onkeyup = function () {
            $("#hidTheOriginalLink" + tag + "").val($("#txtMoreTheOriginalLink").val());
        };

        //封面图片显示在正文

        if ($("#hidIsImg0").val() == "true") {
            $("#showmaintext").attr("checked", true);
        } else {
            $("#showmaintext").attr("checked", false);
        }
        //        if ($("#showmaintext").attr("checked") == "checked") {

        //            $("#hidIsImg" + tag).val("true");
        //        }
        //        else { $("#hidIsImg" + tag).val("false"); }


        $("#txtMoreTitle").val($("#hidTitle0").val());
        $("#txtMoreAuthor").val($("#hidAuthor0").val());

        if ($("#hidCoverUrl0").val() != "") {
            var img = $('<img  class="nopic" style="line-height: 150px">').attr("src", "../../" + $("#hidCoverUrl0").val()).attr("id", "MoreImage_file_upload_img");
            $("#MorespanImg").text("");
            $("#MorespanImg").append(img);

        }
        else {
            var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
            $("#MorespanImg").text("");
            $("#MorespanImg").append(srt);
        }
        moreText.html($("#hidText0").val());
        $("#txtMoreTheOriginalLink").val($("#hidTheOriginalLink0").val());


    }


    //编辑第一个以后的
    else if ($(eventSrc).parent().parent().attr("dir") != undefined && $(eventSrc).parent().parent().attr("dir") != "") {
        tag = $(eventSrc).parent().parent().attr("dir");


        //标题
        document.getElementById('txtMoreTitle').onkeyup = function () {
            $(eventSrc).parent().next().children(".moretext-emulation02-text").text($("#txtMoreTitle").val());
            $("#hidTitle" + tag + "").val($("#txtMoreTitle").val());
        };
        //作者
        document.getElementById('txtMoreAuthor').onkeyup = function () {

            $("#hidAuthor" + tag + "").val($("#txtMoreAuthor").val());
        };



        document.getElementById('txtMoreTheOriginalLink').onkeyup = function () {
            $("#hidTheOriginalLink" + tag + "").val($("#txtMoreTheOriginalLink").val());
        };
        var index = $(eventSrc).parent().parent().attr("dir");

        $("#txtMoreTitle").val($("#hidTitle" + index + "").val());
        $("#txtMoreAuthor").val($("#hidAuthor" + index + "").val());

        if ($("#hidCoverUrl" + index + "").val() != "") {
            $("#MorespanImg").text("");

            var MorespanImg = $('<img nopic" style="line-height: 150px">').attr("src", "../../" + $("#hidCoverUrl" + index + "").val()).attr("id", "MoreImage_file_upload_img");
            $("#MorespanImg").append(MorespanImg);

        }
        else {
            var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
            $("#MorespanImg").text("");
            $("#MorespanImg").append(srt);
        }
        moreText.html($("#hidText" + index + "").val());
        $("#txtMoreTheOriginalLink").val($("#hidTheOriginalLink" + index + "").val());
        if ($("#hidIsImg" + tag + "").val() == "true") {

            $("#showmaintext").attr("checked", true);
        } else {
            $("#showmaintext").attr("checked", false);
        }
    }
    eventEditor(eventSrc);


}


function eventEditor(oneself) {
    //编辑显示箭头
    $("#MoreVessel i").css("display", "none");
    $("#MoreVessel>div a:contains('编辑')").each(function () {
        if ($(this).attr("data-id") == $(oneself).attr("data-id")) {
            if ($(this).parent().parent().index() == 0) {
                $(".moretext-form").css("top", "0");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 1) {
                $(".moretext-form").css("top", "184px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 2) {
                $(".moretext-form").css("top", "287px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 3) {
                $(".moretext-form").css("top", "390px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 4) {
                $(".moretext-form").css("top", "16px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 5) {
                $(".moretext-form").css("top", "119px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 6) {
                $(".moretext-form").css("top", "222px");
                $(oneself).parent().siblings("i").css("display", "block");
            }
            else if ($(this).parent().parent().index() == 7) {
                $(".moretext-form").css("top", "325px");
                $(oneself).parent().siblings("i").css("display", "block");
            }


        }
    });


}

//删除图文
function DelectImageText(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    $("#MoreVessel  .moretext-emulation01").attr("isedit", "true");
    if ($("#MoreVessel").children().length <= 2) {
        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("无法删除，多条图文至少需要2条消息。").change();
        return;
    }
    $(eventSrc).parent().parent().remove();

    //回复远点
    $(".moretext-form").css("top", "0");
    $(".moretext-emulation01 i").css("display", "block");
    //封面图片显示在正文
    if ($("#hidIsImg0").val() == "true") {
        $("#showmaintext").attr("checked", true);
    } else {
        $("#showmaintext").attr("checked", false);
    }
    $("#txtMoreTitle").val($("#hidTitle0").val());
    $("#txtMoreAuthor").val($("#hidAuthor0").val());

    if ($("#hidCoverUrl0").val() != "") {
        var img = $('<img  class="nopic" style="line-height: 150px">').attr("src", "../../" + $("#hidCoverUrl0").val()).attr("id", "MoreImage_file_upload_img");
        $("#MorespanImg").text("");
        $("#MorespanImg").append(img);
    }
    else {
        var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
        $("#MorespanImg").text("");
        $("#MorespanImg").append(srt);
    }
    moreText.html($("#hidText0").val());
    $("#txtMoreTheOriginalLink").val($("#hidTheOriginalLink0").val());

    tag = "0";

    //标题
    document.getElementById('txtMoreTitle').onkeyup = function () {

        $("#MoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text($("#txtMoreTitle").val());

    };
}
