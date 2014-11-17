
document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');

var resultJosn;
//初始化
$(function () {

    resultJosn = $.parseJSON(materialManageList.replace(new RegExp("\n", "gm"), "\\n").replace(new RegExp("\t", "gm"), "\\t"));

    Initialize(resultJosn);


    $("#close").click(function () {
        art.dialog.close();

    });
});


function Initialize(resultJosn) {


    for (var i = 0; i < resultJosn.materialManageList.length; i++) {

        if (resultJosn.materialManageList[i].MessageType == 1) {
            radiosChecked = "1";
            $("#ModifyImageText").attr('disabled', false);
            $("#ModifyMoreImageTexts").attr('disabled', true);
            $("#ModifyOneImageTexts").attr('disabled', true);
            $('#ModifyImageText').attr("checked", "checked");
            $("#ttText").val(resultJosn.materialManageList[i].Text);

        } else if (resultJosn.materialManageList[i].MessageType == 2) {
            radiosChecked = "2";
            //创建编译器
            GetEditor(resultJosn.materialManageList[i].MessageType);
            //隐藏多图文按钮
            $("#ModifyImageText").attr('disabled', true);
            $("#ModifyMoreImageTexts").attr('disabled', true);
            $("#ModifyOneImageTexts").attr('disabled', false);
            //选择单图文
            $('#ModifyOneImageTexts').attr("checked", "checked");
            $("#ModifysimpleText").show();
            $("#ModifymoreText").hide();
            $("#text").hide();
            //赋值
            $("#ModifytxtName").val(resultJosn.materialManageList[i].Title);
            $("#ModifycoverTitle").text(resultJosn.materialManageList[i].Title);
            $("#ModifytxtAuthor").val(resultJosn.materialManageList[i].Author);
            //清除原有的
            $("#ModifyspanImg").text("");
            var img = $('<img   class="nopic" style="line-height: 150px;">').attr("src", "../../" + resultJosn.materialManageList[i].CoverUrl).attr("id", "file_upload_img");
            $("#ModifyspanImg").append(img);

            //封面图片显示在正文
            if (resultJosn.materialManageList[i].IsImg == "1") {

                $("#Modifytxtshowmain").attr("checked", "checked");
            }


            //封面图片
            $("#ModifycoverImg").text("");
            var coverImg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../" + resultJosn.materialManageList[i].CoverUrl).attr("id", "coverimgs");
            $("#ModifycoverImg").append(coverImg);
            $("#ModifyhidCoverUrl").val($("#file_upload_img").attr("src").replace("../../", ""));
            $("#ModifytxtAbstract").text(resultJosn.materialManageList[i].Abstract);
            $("#ModifycoverAuthor").text(resultJosn.materialManageList[i].Abstract);

            Modifyeditor.html(resultJosn.materialManageList[i].Text);
            $("#ModifytxtTheOriginalLink").val(resultJosn.materialManageList[i].TheOriginalLink);

            if (resultJosn.materialManageList[i].Jump == "1") {
                $("#divModifyjump").show();
                $("#ModifyJump").val(resultJosn.materialManageList[i].JumpUrl);
                $("#Radio4").attr("checked", "checked");
            } else if (resultJosn.materialManageList[i].Jump == "0") {

                $("#divModifyjump").hide();
                $("#Radio3").attr("checked", "checked");
            }


        } else if (resultJosn.materialManageList[i].MessageType == 3) {

            //创建编译器

            if (i <= 0) {
                radiosChecked = "3";
                GetEditor(3);
                $("#ModifyOneImageTexts").attr('disabled', true);
                $("#ModifyImageText").attr('disabled', true);
                $("#ModifyMoreImageTexts").attr('disabled', false);
                $('#ModifyMoreImageTexts').attr("checked", "checked");
                $("#ModifymoreText").show();
                $("#ModifysimpleText").hide();
                $("#text").hide();

                //赋值
                $("#ModifyhidTitle0").val(resultJosn.materialManageList[i].Title);
                $("#ModifyhidAuthor0").val(resultJosn.materialManageList[i].Author);
                $("#ModifyhidCoverUrl0").val(resultJosn.materialManageList[i].CoverUrl);
                $("#ModifyhidText0").text(resultJosn.materialManageList[i].Text);
                $("#ModifyhidTheOriginalLink0").val(resultJosn.materialManageList[i].TheOriginalLink);
                $("#ModifyhidIsImg0").val(resultJosn.materialManageList[i].IsImg);

                $("#ModifytxtMoreTitle").val(resultJosn.materialManageList[i].Title);
                $("#ModifyMoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text(resultJosn.materialManageList[i].Title);
                $("#ModifytxtMoreAuthor").val(resultJosn.materialManageList[i].Author);
                //清除原有的
                $("#ModifyMorespanImg").text("");
                var img = $('<img  class="nopic" style="line-height: 150px;">').attr("src", "../../" + resultJosn.materialManageList[i].CoverUrl).attr("id", "Modifyfile_upload_img");
                $("#ModifyMorespanImg").append(img);
                //封面图片
                $("#ModifyMoreCoverImg").text("");
                var coverImg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../" + resultJosn.materialManageList[i].CoverUrl).attr("id", "ModifyMoreCoverImg");
                $("#ModifyMoreCoverImg").append(coverImg);

                ModifymoreText.html(resultJosn.materialManageList[i].Text);
                $("#ModifytxtMoreTheOriginalLink").val(resultJosn.materialManageList[i].TheOriginalLink);


                if (tag == undefined || tag == "0") {
                    //标题
                    document.getElementById('ModifytxtMoreTitle').onkeyup = function () {
                        $("#ModifyMoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text($("#ModifytxtMoreTitle").val());
                        $("#ModifyhidTitle0").val($("#ModifytxtMoreTitle").val());
                    };
                    //作者
                    document.getElementById('ModifytxtMoreAuthor').onkeyup = function () {
                        $("#ModifyhidAuthor0").val($("#ModifytxtMoreAuthor").val());
                    };
                    //原链接
                    document.getElementById('ModifytxtMoreTheOriginalLink').onkeyup = function () {
                        $("#ModifyhidTheOriginalLink0").val($("#ModifytxtMoreTheOriginalLink").val());
                    };

                    if ($("#ModifyhidIsImg0").val() == "true") {
                        $("#Modifyshowmaintext").attr("checked", "checked");
                    } else {
                        $("#Modifyshowmaintext").attr("checked", false);
                    }
                }
            } else {

                var str = "";
                str = '<div class="moretext-emulation02" dir=' + i + '>';
                str += '<i style="display: none;" class="arrow"></i>';
                str += '<div class="moretext-emulation02-mask">';
                str += '<a data-id="' + i + '" class="moretext-emulation02-operate-edit" onclick="ModifyEditing(event)" href="javascript:void(0)">编辑</a>';
                str += '<a class="moretext-emulation02-operate-del l10" onclick="ModifyDelectImageText(event)" href="javascript:void(0)">删除</a></div>';
                str += '<div class="moretext-emulation02-box">';
                str += '<div class="moretext-emulation02-img" id="Modifythumbnail' + i + '"><img style="width:78px;height:78px;" id="ModifyMoreCoverImg' + i + '" src="../../' + resultJosn.materialManageList[i].CoverUrl + '"></div>';
                str += '<div class="moretext-emulation02-text">' + resultJosn.materialManageList[i].Title + '</div>  </div>';
                str += '<input type="hidden" value="' + resultJosn.materialManageList[i].Title + '" id="ModifyhidTitle' + i + '"><input type="hidden" value="' + resultJosn.materialManageList[i].Author + '" id="ModifyhidAuthor' + i + '"><input type="hidden" value="' + resultJosn.materialManageList[i].CoverUrl + '" id="ModifyhidCoverUrl' + i + '"><div id="DivText' + i + '" style="display:none"><textarea  id="ModifyhidText' + i + '">' + resultJosn.materialManageList[i].Text + '</textarea></div> <input type="hidden" value="' + resultJosn.materialManageList[i].TheOriginalLink + '" id="ModifyhidTheOriginalLink' + i + '"><input type="hidden" value="' + resultJosn.materialManageList[i].IsImg + '" id="ModifyhidIsImg' + i + '" /></div>';
                $("#ModifyMoreVessel").append(str);
            }
        }
    }



}


//显示隐藏多图文
function GetSuperset(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var id = $(eventSrc).attr("dir");

    if ($(eventSrc).attr("class") == "icon-hide") {
        $(eventSrc).attr("class", "icon-show");
        $("[name = 'trPart" + id + "']").show();



    }
    else {
        $(eventSrc).attr("class", "icon-hide");
        $("[name = 'trPart" + id + "']").hide();
    }

    //alert($(eventSrc).parent().attr("href"));
}











var radiosChecked = "";
$(function () {
    //初始化赋值
    var radios = document.getElementsByName("ImageText");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            radiosChecked = radios[i].value;

            //            if (radiosChecked == "Text") {
            //                $("#divText").show();
            //                $("#divOneImageText").hide();
            //                $("#divImageText").hide();
            //            } else 
            if (radiosChecked == "2") {
                $("#simpleText").show();
                $("#moreText").hide();

            } else if (radiosChecked == "3") {
                $("#moreText").show();
                $("#simpleText").hide();


            }
        }
    }

});




var Modifyeditor;
var ModifymoreText;
function GetEditor(imageTexts) {
    if (imageTexts == 2) {


        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
        //富文本编辑器的生成代码
        Modifyeditor = KindEditor.create("#ModifytxtDescribe", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'
                    ]
        });





    }

    else if (imageTexts == 3) {
        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
        //$(".ke-container-default").remove();

        //富文本编辑器的生成代码
        ModifymoreText = KindEditor.create("#ModifytxtMoreText", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            afterBlur: function () {
                //鼠标离开事件赋值

                if (tag == undefined || tag == "0") {
                    $("#ModifyhidText0").text(ModifymoreText.html());

                }
                else {
                    $("#ModifyhidText" + tag + "").text(ModifymoreText.html());

                }

            },
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'
                    ]
        });


    }

}



$(function () {
    document.getElementById('ModifytxtName').onkeyup = function () {

        $("#ModifycoverTitle").text($("#ModifytxtName").val());

    };

    document.getElementById('ModifytxtAbstract').onkeyup = function () {

        $("#ModifycoverAuthor").text($("#ModifytxtAbstract").val());

    };

});








function ModifyFileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "Modifyfile_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#img").hide();
                //清除原有的
                $("#ModifyspanImg").text("");
                var img = $('<img  class="nopic" style="line-height: 150px;">').attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "Modifyfile_upload_img");
                $("#ModifyspanImg").append(img);


                $("#ModifyhidCoverUrl").val($("#Modifyfile_upload_img").attr("src").replace("../../", ""));
                //显示封面图片
                $("#ModifycoverImg").text("");
                var coverimg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "Modifycoverimgs");
                $("#ModifycoverImg").append(coverimg);

                //  $("#hidCoverUrl").val($("#file_upload_img").attr("src"));

                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
                alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
            alert("提交过程中出现未知错误");
        }
    });

}



function ModifyMoreImageFileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "ModifyMoreImage_file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {

                //清除原有的
                $("#ModifyMorespanImg").text("");
                var img = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "ModifyMoreImage_file_upload_img");
                $("#ModifyMorespanImg").append(img);




                if (tag == undefined || tag == "0") {
                    $("#ModifyhidCoverUrl0").val($("#ModifyMoreImage_file_upload_img").attr("src").replace("../../", ""));
                    //显示封面图片
                    $("#ModifyMoreCoverImg").text("");
                    var coverimg = $("<img class='simpletext-emulation-img-text'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "Modifycoverimgs");
                    $("#ModifyMoreCoverImg").append(coverimg);
                }
                else {

                    $("#ModifyhidCoverUrl" + tag + "").val($("#ModifyMoreImage_file_upload_img").attr("src").replace("../../", ""));
                    $("#Modifythumbnail" + tag + "").text("");
                    var thumbnail = $('<img style="width:78px;height:78px;">').attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "Modifythumbnailimgs");

                    $("#Modifythumbnail" + tag + "").append(thumbnail);
                }


            } else {
                alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
            alert("提交过程中出现未知错误");
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
$(function () {

    $("#btnModify").click(function () {
      
        var moreDescription;
        var description;
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

            description = Modifyeditor.html();
            description = description.replace(/(\n)/g, "");
            description = description.replace(/(\t)/g, "");
            description = description.replace(/(\r)/g, "");
            description = description.replace(/\s*/g, "");

            if ($("#ModifytxtName").val() == "") {
                $(".prompt").text("");

                $(".prompt", $("#ModifytxtName").parent().next()).text("请输入标题");
                $("#ModifytxtName").focus();

                return false;
            }
            else if ($("#ModifyhidCoverUrl").val() == "") {
                $(".prompt").text("");

                $("[name='Modifyfiles']").focus();

                $(".prompt", $("[name='Modifyfiles']").parent().parent().parent().next()).text("请上传图片");



                return false;

            }
            else if ($("#ModifytxtAbstract").val() == "") {
                $(".prompt").text("");
                $("#ModifytxtAbstract").focus();

                $(".prompt", $("#ModifytxtAbstract").parent().next()).text("请输入摘要");


                return false;
            }
            else if (description == "") {
                $(".prompt").text("");
                $("#ModifytxtDescribe").focus();
                $(".prompt", $("#ModifytxtDescribe").parent().next()).text("请输入正文");

                return false;

            }
            else if ($("#txtTheOriginalLink").val() != "" && !re.test($("#ModifytxtTheOriginalLink").val())) {
                $(".prompt").text("");
                $("#txtTheOriginalLink").focus();

                $(".prompt", $("#txtTheOriginalLink").parent().next()).text("请输入正确的链接地址");

                return false;

            }

        }
        else if (radiosChecked == "3") {
            moreDescription = ModifymoreText.html();



            moreDescription = moreDescription.replace(/(\n)/g, "");
            moreDescription = moreDescription.replace(/(\t)/g, "");
            moreDescription = moreDescription.replace(/(\r)/g, "");
            moreDescription = moreDescription.replace(/\s*/g, "");
            var Materiallength = $("#ModifyMoreVessel").children().length;

            for (var j = 0; j < Materiallength; j++) {
                if ($("#ModifyhidTitle" + j).val() == "") {
                    $(".prompt").text("");
                    $("#ModifytxtMoreTitle").focus();
                    $(".prompt", $("#ModifytxtMoreTitle").parent().next()).text("请输入标题");
                    return false;
                }

                else if ($("#ModifyhidCoverUrl" + j).val() == "") {
                    $(".prompt").text("");
                    $("[name='ModifyMorefiles']").focus();
                    $(".prompt", $("[name='ModifyMorefiles']").parent().parent().parent().next()).text("请上传图片");
                    return false;

                }
                else if ($("#ModifyhidText" + j).text() == "") {
                    $(".prompt").text("");
                    $("#ModifytxtMoreText").focus();
                    $(".prompt", $("#ModifytxtMoreText").parent().next()).text("请输入正文");
                    return false;
                }

                else if ($("#ModifyhidTheOriginalLink" + j).val() != "" && !re.test($("#hidTheOriginalLink" + dir).val())) {
                    $(".prompt").text("");
                    $("#ModifytxtMoreTheOriginalLink").focus();
                    $(".prompt", $("#ModifytxtMoreTheOriginalLink").parent().next()).text("链接地址有误");
                    return false;
                }

            }


        }

        switch (radiosChecked) {

            case "1":
                {

                    resultJosn.materialManageList[0].MessageType = parseInt(radiosChecked);
                    resultJosn.materialManageList[0].Text = $("#ttText").val();
                    ModifyAddAjax(resultJosn.materialManageList[0], radiosChecked);


                    break;
                }


            case "2":
                {
                    if ($("#ModifytxtAbstract").val() == "" && description != "") {
                        var text = description.length / 18;
                        var txtAbstract = Modifyeditor.html().substring(0, text < 1 ? 1 : text);
                    }
                    //是否显示封面
                    var txtshowmain;

                    if ($("#Modifytxtshowmain").attr("checked") == 'checked') {

                        var txtshowmain = true;
                    }
                    else { txtshowmain = false; }
                    //赋值
                    resultJosn.materialManageList[0].MessageType = parseInt(radiosChecked);
                    resultJosn.materialManageList[0].SonId = 0;
                    resultJosn.materialManageList[0].Title = $("#ModifytxtName").val();
                    resultJosn.materialManageList[0].Author = $("#ModifytxtAuthor").val();
                    resultJosn.materialManageList[0].CoverUrl = $("#ModifyhidCoverUrl").val();
                    resultJosn.materialManageList[0].Abstract = $("#ModifytxtAbstract").val() == "" ? txtAbstract : $("#ModifytxtAbstract").val();
                    resultJosn.materialManageList[0].Text = Modifyeditor.html();
                    resultJosn.materialManageList[0].TheOriginalLink = $("#ModifytxtTheOriginalLink").val();
                    resultJosn.materialManageList[0].IsImg = txtshowmain;
                    resultJosn.materialManageList[0].Jump = 0;
                    resultJosn.materialManageList[0].JumpUrl = "";
                    //调用添加方法
                    ModifyAddAjax(resultJosn.materialManageList[0], radiosChecked);


                } break;
            case "3":
                {

                    var newmaterialManageView = new materialManageView();
                    var i = 0;
                    $("#ModifyMoreVessel").children().each(function () {

                        //赋值
                        var newMaterialManaeModel = new MaterialManaeModel();
                        if (resultJosn.materialManageList[i] != undefined) {

                            newMaterialManaeModel.entity.Id = resultJosn.materialManageList[i].Id;
                            newMaterialManaeModel.entity.SonId = resultJosn.materialManageList[i].SonId;
                        }
                        else {
                            newMaterialManaeModel.entity.Id = 0;
                            newMaterialManaeModel.entity.SonId = 999;
                        }

                        newMaterialManaeModel.entity.Title = $("#ModifyhidTitle" + $(this).attr("dir") + "").val();
                        newMaterialManaeModel.entity.MessageType = parseInt(radiosChecked);


                        newMaterialManaeModel.entity.Author = $("#ModifyhidAuthor" + $(this).attr("dir") + "").val();
                        newMaterialManaeModel.entity.CoverUrl = $("#ModifyhidCoverUrl" + $(this).attr("dir") + "").val();
                        //resultJosn.materialManageList[i].Abstract = $("#ModifytxtAbstract").val() == "" ? txtAbstract : $("#ModifytxtAbstract").val();
                        newMaterialManaeModel.entity.Text = $("#ModifyhidText" + $(this).attr("dir") + "").text();
            
                        newMaterialManaeModel.entity.TheOriginalLink = $("#ModifyhidTheOriginalLink" + i + "").val();
                        newMaterialManaeModel.entity.IsImg = $("#ModifyhidIsImg" + $(this).attr("dir") + "").val() == "null" ? false : $("#ModifyhidIsImg" + $(this).attr("dir") + "").val();
                        newMaterialManaeModel.entity.Jump = 0;
                        newMaterialManaeModel.entity.JumpUrl = "";
                        newmaterialManageView.materialManage.materialManageList.push(newMaterialManaeModel.entity);
                        i++;

                    });


                    //                    //获取图片的数量
                    //                    var index = $("#ModifyMoreVessel").children().length - 1;
                    //                    for (var i = 0; i <= index; i++) {


                    //                        //赋值
                    //                        var newMaterialManaeModel = new MaterialManaeModel();
                    //                        if (resultJosn.materialManageList[i] != undefined) {

                    //                            newMaterialManaeModel.entity.Id = resultJosn.materialManageList[i].Id;
                    //                            newMaterialManaeModel.entity.SonId = resultJosn.materialManageList[i].SonId;
                    //                        }
                    //                        else {
                    //                            newMaterialManaeModel.entity.Id = 0;
                    //                            newMaterialManaeModel.entity.SonId = 999;
                    //                        }
                    //                        newMaterialManaeModel.entity.Title = $("#ModifyhidTitle" + i + "").val();
                    //                        newMaterialManaeModel.entity.MessageType = parseInt(radiosChecked);


                    //                        newMaterialManaeModel.entity.Author = $("#ModifyhidAuthor" + i + "").val();
                    //                        newMaterialManaeModel.entity.CoverUrl = $("#ModifyhidCoverUrl" + i + "").val();
                    //                        //resultJosn.materialManageList[i].Abstract = $("#ModifytxtAbstract").val() == "" ? txtAbstract : $("#ModifytxtAbstract").val();
                    //                        newMaterialManaeModel.entity.Text = $("#ModifyhidText" + i + "").val();
                    //                        newMaterialManaeModel.entity.TheOriginalLink = $("#ModifyhidTheOriginalLink" + i + "").val();
                    //                        newMaterialManaeModel.entity.IsImg = $("#ModifyhidIsImg" + i + "").val() == "null" ? false : $("#ModifyhidIsImg" + i + "").val();
                    //                        newMaterialManaeModel.entity.Jump = 0;
                    //                        newMaterialManaeModel.entity.JumpUrl = "";
                    //                        newmaterialManageView.materialManage.materialManageList.push(newMaterialManaeModel.entity);
                    //                    }
                    //调用添加方法  
                    ModifyAddAjax(newmaterialManageView.materialManage, radiosChecked);
                } break;

        }


    });
});
function ModifyAddAjax(newmaterialManage, type) {
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/EditMaterialManage",
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
                // 关闭
                var win = art.dialog.open.origin;
                art.dialog.close();
                if (refresh == "refresh") {
                    //刷新主页面
                    win.location.reload();
                }
            } else if (jsonRes == "ON") {

                alert("修改失败");
            }
        }
    });

}

var tag;
function ModifyEditing(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    if (radiosChecked == "3") {
        var strRegex = "^((https|http|ftp|rtsp|mms)://)?[a-z0-9A-Z]{3}\.[a-z0-9A-Z][a-z0-9A-Z]{0,61}?[a-z0-9A-Z]\.com|net|cn|cc (:s[0-9]{1-4})?/$";
        var re = new RegExp(strRegex);
        var dir;
        var istrue = false;
        $("#ModifyMoreVessel div").each(function () {
            if ($(this).attr("isedit") == "true") {

                dir = $(this).attr("dir");

                if ($("#ModifyhidTitle" + dir).val() == "") {
                    $(".prompt").text("");
                    $("#ModifytxtMoreTitle").focus();
                    $(".prompt", $("#ModifytxtMoreTitle").parent().next()).text("请输入标题");
                    istrue = false;
                }

                else if ($("#ModifyhidCoverUrl" + dir).val() == "") {
                    $(".prompt").text("");
                    $("[name='ModifyMorefiles']").focus();
                    $(".prompt", $("[name='ModifyMorefiles']").parent().parent().parent().next()).text("请上传图片");
                    istrue = false;

                }
                else if ($("#ModifyhidText" + dir).val() == "") {
                    $(".prompt").text("");
                    $("#ModifytxtMoreText").focus();
                    $(".prompt", $("#ModifytxtMoreText").parent().next()).text("请输入正文");
                    istrue = false;
                }

                else if ($("#ModifyhidTheOriginalLink" + dir).val() != "" && !re.test($("#hidTheOriginalLink" + dir).val())) {
                    $(".prompt").text("");
                    $("#ModifytxtMoreTheOriginalLink").focus();
                    $(".prompt", $("#ModifytxtMoreTheOriginalLink").parent().next()).text("链接地址有误");
                    istrue = false;
                }
                else { istrue = true; }
            }

        });
        if (istrue) {

            $("#ModifyMoreVessel div").each(function () {

                if ($(this).attr("dir") == dir) {
                    $(this).attr("isedit", " ");
                }
            });

            $(eventSrc).parent().parent().attr("isedit", "true");
        }
        else { return false; }
    }










    tag = $(eventSrc).parent().parent().attr("dir");

    //编辑第一个赋值
    if ($(eventSrc).parent().parent().attr("dir") == "0") {
        tag = $(eventSrc).parent().parent().parent().attr("dir");

        //标题
        document.getElementById('ModifytxtMoreTitle').onkeyup = function () {

            $(eventSrc).parent().next().next(".moretext-emulation01-title-text").text($("#ModifytxtMoreTitle").val());
            $("#ModifyhidTitle" + tag + "").val($("#ModifytxtMoreTitle").val());
        };
        //作者
        document.getElementById('ModifytxtMoreAuthor').onkeyup = function () {

            $("#ModifyhidAuthor" + tag + "").val($("#ModifytxtMoreAuthor").val());

        };
        document.getElementById('ModifytxtMoreTheOriginalLink').onkeyup = function () {
            $("#ModifyhidTheOriginalLink" + tag + "").val($("#ModifytxtMoreTheOriginalLink").val());
        };

        $("#ModifytxtMoreTitle").val($("#ModifyhidTitle0").val());
        $("#ModifytxtMoreAuthor").val($("#ModifyhidAuthor0").val());

        if ($("#ModifyhidIsImg" + tag + "").val() == "true") {
            $("#Modifyshowmaintext").attr("checked", "checked");
        } else {
            $("#Modifyshowmaintext").attr("checked", false);
        }
        if ($("Modify#hidCoverUrl0").val() != "") {
            var img = $('<img  class="nopic" style="line-height: 150px;">').attr("src", "../../" + $("#ModifyhidCoverUrl0").val()).attr("id", "MoreImage_file_upload_img");
            $("#ModifyMorespanImg").text("");
            $("#ModifyMorespanImg").append(img);
        }
        else {
            var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
            $("#ModifyMorespanImg").text("");
            $("#ModifyMorespanImg").append(srt);
        }
        ModifymoreText.html($("#ModifyhidText0").val());
        $("#ModifytxtMoreTheOriginalLink").val($("#ModifyhidTheOriginalLink0").val());





    }


    //编辑第一个以后的
    else if ($(eventSrc).parent().parent().attr("dir") != undefined && $(eventSrc).parent().parent().attr("dir") != "") {

        tag = $(eventSrc).parent().parent().attr("dir");


        //标题
        document.getElementById('ModifytxtMoreTitle').onkeyup = function () {
            $(eventSrc).parent().next().children(".moretext-emulation02-text").text($("#ModifytxtMoreTitle").val());
            $("#ModifyhidTitle" + tag + "").val($("#ModifytxtMoreTitle").val());
        };
        //作者
        document.getElementById('ModifytxtMoreAuthor').onkeyup = function () {

            $("#ModifyhidAuthor" + tag + "").val($("#ModifytxtMoreAuthor").val());
        };



        document.getElementById('ModifytxtMoreTheOriginalLink').onkeyup = function () {
            $("#ModifyhidTheOriginalLink" + tag + "").val($("#ModifytxtMoreTheOriginalLink").val());
        };
        var index = $(eventSrc).parent().parent().attr("dir");

        $("#ModifytxtMoreTitle").val($("#ModifyhidTitle" + index + "").val());
        $("#ModifytxtMoreAuthor").val($("#ModifyhidAuthor" + index + "").val());

        if ($("#ModifyhidCoverUrl" + index + "").val() != "") {
            $("#ModifyMorespanImg").text("");

            var MorespanImg = $('<img  class="nopic" style="line-height: 150px;">').attr("src", "../../" + $("#ModifyhidCoverUrl" + index + "").val()).attr("id", "ModifyMoreImage_file_upload_img");
            $("#ModifyMorespanImg").append(MorespanImg);

        }
        else {
            var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
            $("#ModifyMorespanImg").text("");
            $("#ModifyMorespanImg").append(srt);
        }
        ModifymoreText.html($("#ModifyhidText" + index + "").val());
        $("#ModifytxtMoreTheOriginalLink").val($("#hidTheOriginalLink" + index + "").val());

        if ($("#ModifyhidIsImg" + tag + "").val() == "true") {
            $("#Modifyshowmaintext").attr("checked", "checked");

        } else {
            $("#Modifyshowmaintext").attr("checked", false);
        }

        //alert($(eventSrc).parent().parent().parent().index($(eventSrc).parent().parent()) + 1);

    }

    eventEditor(eventSrc);

}



function eventEditor(oneself) {

    //编辑显示箭头
    $("#ModifyMoreVessel i").css("display", "none");
    $("#ModifyMoreVessel>div a:contains('编辑')").each(function () {

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



$(function () {

    //点击 封面图片显示在正文
    $("#Modifyshowmaintext").click(function () {
        if (tag == undefined || tag == "0") {

            if ($(this).attr("checked") == "checked") {
                $("#ModifyhidIsImg0").val("true");
            } else {
                $("#ModifyhidIsImg0").val("false");
            }
        } else {
            if ($(this).attr("checked") == "checked") {
                $("#ModifyhidIsImg" + tag).val("true");
            } else {
                $("#ModifyhidIsImg" + tag).val("false");
            }

        }

    });


    //创建图文
    $("#ModifyAddCover").unbind('click');
    $("#ModifyAddCover").bind("click", function () {

        var index = $("#ModifyMoreVessel .moretext-emulation02:lastChild").attr("dir");
        if ($("#ModifyMoreVessel").children().length + 1 > 8) {

            $(".Loading").removeClass("style03 style01").addClass("style02");
            $("#operateTip").html("你最多只可以加入8条图文消息").change();
            return;
        }
        index++;
        var str = "";
        str = '<div class="moretext-emulation02" dir=' + index + '>';
        str += '<i style="display: none;" class="arrow"></i>';
        str += '<div class="moretext-emulation02-mask">';
        str += '<a data-id="' + index + '" class="moretext-emulation02-operate-edit" onclick="ModifyEditing(event)" href="javascript:void(0)">编辑</a>';
        str += '<a class="moretext-emulation02-operate-del l10" onclick="ModifyDelectImageText(event)" href="javascript:void(0)">删除</a></div>';
        str += '<div class="moretext-emulation02-box">';
        str += '<div class="moretext-emulation02-img" id="Modifythumbnail' + index + '">缩略图</div>';
        str += '<div class="moretext-emulation02-text">标题</div>  </div>';
        str += '<input type="hidden" id="ModifyhidTitle' + index + '"><input type="hidden" id="ModifyhidAuthor' + index + '"><input type="hidden" id="ModifyhidCoverUrl' + index + '"><div id="DivText' + index + '" style="display:none"><textarea  id="ModifyhidText' + index + '"></textarea></div> <input type="hidden" id="ModifyhidTheOriginalLink' + index + '"><input type="hidden" id="ModifyhidImg' + index + '" /></div>';
        $("#ModifyMoreVessel .moretext-emulation02:last-child").after(str);
    });

});





function ModifyDelectImageText(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    $("#ModifyMoreVessel  .moretext-emulation01").attr("isedit", "true");
    if ($("#ModifyMoreVessel").children().length <= 2) {
        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("无法删除，多条图文至少需要2条消息。").change();
        return;
    }
    $(eventSrc).parent().parent().remove();



    //回复远点
    $(".moretext-form").css("top", "0");
    $(".moretext-emulation01 i").css("display", "block");
    //封面图片显示在正文
    if ($("#ModifyhidIsImg0").val() == "true") {
        $("#Modifyshowmaintext").attr("checked", true);
    } else {
        $("#Modifyshowmaintext").attr("checked", false);
    }
    $("#ModifytxtMoreTitle").val($("#ModifyhidTitle0").val());
    $("#ModifytxtMoreAuthor").val($("#ModifyhidAuthor0").val());

    if ($("#ModifyhidCoverUrl0").val() != "") {
        var img = $('<img  class="nopic" style="line-height: 150px">').attr("src", "../../" + $("#ModifyhidCoverUrl0").val()).attr("id", "MoreImage_file_upload_img");
        $("#ModifyMorespanImg").text("");
        $("#ModifyMorespanImg").append(img);
    }
    else {
        var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
        $("#ModifyMorespanImg").text("");
        $("#ModifyMorespanImg").append(srt);
    }
    ModifymoreText.html($("#ModifyhidText0").val());
    $("#ModifytxtMoreTheOriginalLink").val($("#ModifyhidTheOriginalLink0").val());

    tag = "0";

    //标题
    document.getElementById('ModifytxtMoreTitle').onkeyup = function () {

        $("#ModifyMoreVessel .moretext-emulation01:eq(0) .moretext-emulation01-title-text").text($("#ModifytxtMoreTitle").val());

    };


}


var rdUrl = "";

$(function () {

    //初始化赋值
    var radios = $("[name='ModifyrdUrl']");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            rdUrl = radios[i].value;

            if (radiosChecked == "1") {
                $("#divModifyjump").show();

            } else if (radiosChecked == "0") {
                $("#divModifyjump").hide();
            }
        }
    }
    $("[name='ModifyrdUrl']").unbind('change');
    $("[name='ModifyrdUrl']").change(function () {

        rdUrl = $(this).val();
        if ($(this).val() == "1") {
            $("#divModifyjump").show();

        }
        else { $("#divModifyjump").hide(); }
    });

});



