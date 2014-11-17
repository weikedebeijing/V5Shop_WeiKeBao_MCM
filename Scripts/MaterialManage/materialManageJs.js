
var editor;
var moreText;
$(function () {

    $("#AddMaterial").click(function () {
        createPopup("gray-active-cover-add");

        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
        //富文本编辑器的生成代码
        editor = KindEditor.create("#txtDescribe", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]
        });




        //富文本编辑器的生成代码
        moreText = KindEditor.create("#txtMoreText", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            afterBlur: function () {
                //鼠标离开事件赋值

                if (tag == "" || tag == "0") {
                    $("#hidText0").val(moreText.html());

                }
                else {
                    $("#hidText" + tag + "").val(moreText.html());

                }

            },
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]
        });


    });
    $("#btnclose").click(function () {
        closePopup();
    });



});



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
    //选中时赋值和显示
    $("input[name=ImageText]").change(function () {

        radiosChecked = $(this).val();
        if (radiosChecked == "2") {
            $("#simpleText").show();
            $("#moreText").hide();

        } else if (radiosChecked == "3") {
            $("#moreText").show();
            $("#simpleText").hide();

            if (tag == "") {
                //标题
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

});


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
                var img = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "MoreImage_file_upload_img");
                $("#MorespanImg").append(img);




                if (tag == "" || tag == "0") {
                    $("#hidCoverUrl0").val($("#MoreImage_file_upload_img").attr("src").replace("../../", ""));
                    //显示封面图片
                    $("#MoreCoverImg").text("");
                    var coverimg = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
                    $("#MoreCoverImg").append(coverimg);
                }
                else {
                    $("#hidCoverUrl" + tag + "").val($("#MoreImage_file_upload_img").attr("src").replace("../../", ""));
                    $("#thumbnail" + tag + "").text("");
                    var thumbnail = $("<img style='width:78px;height:78px;'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "thumbnailimgs");

                    $("#thumbnail" + tag + "").append(thumbnail);
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

    //添加图文
    $("#btnInset").click(function () {

        var description = editor.html();
        description = description.replace(/(\n)/g, "");
        description = description.replace(/(\t)/g, "");
        description = description.replace(/(\r)/g, "");
        //    description = description.replace(/<\/?[^>]*>/g, "");
        description = description.replace(/\s*/g, "");
        if (radiosChecked == "1") {
            //表单验证
            if ($("#ReplyText").val() == "") {
                $("#ReplyText").focus();
                //                $(".prompt").text("");
                //                $("#ReplyText").parent().next().children(".prompt").text("请输入文本内容");
                $(".Loading").removeClass("style03 style01").addClass("style02");
                $("#operateTip").html("请输入文本内容").change();
                return false;
            }
        }
        else if (radiosChecked == "2") {

            if ($("#txtName").val() == "") {
                $("#txtName").focus();
                //                $(".prompt").text("");
                //                $("#txtName").parent().next().children(".prompt").text("请输入标题");
                $(".Loading").removeClass("style03 style01").addClass("style02");
                $("#operateTip").html("请输入标题").change();
                return false;
            }
            else if ($("#hidCoverUrl").val() == "") {
                $("#file_upload").focus();


                $(".Loading").removeClass("style03 style01").addClass("style02");
                $("#operateTip").html("请上传图片").change();
                return false;

            }

            else if (description == "" || description.length > 2000) {
                $("#txtDescribe").focus();
                //                $(".prompt").text("");
                //                $("#txtDescribe").parent().next().children(".prompt").text("请输入正文");
                $(".Loading").removeClass("style03 style01").addClass("style02");
                $("#operateTip").html("请输入正文或者文字不能大于2000").change();
                return false;

            }


        }
        else if (radiosChecked == "3") { }




        //接收后台传过来的 materialManageModel
        var materialManage = $.parseJSON(materialManageModel);

        //调用克隆方法克隆后台传来的 materialManage
        var newmaterialManage = clone(materialManage);

        newmaterialManage.materialManageList = new Array();

        var newMaterialManageList = clone(materialManage.materialManageList[0]);
        switch (radiosChecked) {
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

                    if (rdUrl == "1") {
                        newMaterialManageList.JumpUrl = $("#SimpleJump").val();
                        newMaterialManageList.Jump = rdUrl;
                    }
                    else { newMaterialManageList.Jump = rdUrl; }

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
            case "3":

                //获取图片的数量
                var index = $("#MoreVessel").children().length - 1;
                for (var i = 0; i <= index; i++) {
                    newMaterialManageList = clone(materialManage.materialManageList[0]);

                    newMaterialManageList.MessageType = parseInt(radiosChecked);
                    newMaterialManageList.SonId = 0;
                    newMaterialManageList.Title = $("#hidTitle" + i + "").val();
                    newMaterialManageList.Author = "";
                    newMaterialManageList.CoverUrl = $("#hidCoverUrl" + i + "").val();
                    // newmaterialManage.Abstract = $("#hidAuthor" + i + "").val();
                    newMaterialManageList.Text = $("#hidText" + i + "").val();
                    newMaterialManageList.TheOriginalLink = $("#hidTheOriginalLink" + i + "").val();
                    newmaterialManage.materialManageList.push(newMaterialManageList);
                }
                AddAjax(newmaterialManage, radiosChecked);

                break;



        }
    });
});

function AddAjax(newmaterialManage, type) {
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/AddMaterialManage",
        data: { "materialManage": JSON.stringify(newmaterialManage), "type": type },
        success: function (jsonRes) {

            if (jsonRes == "OK") {
                closePopup();
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("添加成功！").change();
                window.location.href = "../../WeiXinManage/MaterialManage";
            }
            else { alert("添加失败"); }
        }
    });

}

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
                var img = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "file_upload_img");
                $("#spanImg").append(img);


                $("#hidCoverUrl").val($("#file_upload_img").attr("src").replace("../../", ""));
                //显示封面图片
                $("#coverImg").text("");
                var coverimg = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
                $("#coverImg").append(coverimg);

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


$(function () {


    if (radiosChecked == "2") {
        document.getElementById('txtName').onkeyup = function () {

            $("#coverTitle a").text($("#txtName").val());

        };

        document.getElementById('txtAbstract').onkeyup = function () {

            $("#coverAuthor a").text($("#txtAbstract").val());

        };
    }



});



//记录点击的是哪一个编辑
var tag = "";
function Editing(event) {


    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    //编辑第一个赋值
    if ($(eventSrc).parent().parent().parent().attr("dir") == "0") {
        tag = $(eventSrc).parent().parent().parent().attr("dir");

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

        $("#txtMoreTitle").val($("#hidTitle0").val());
        $("#txtMoreAuthor").val($("#hidAuthor0").val());

        if ($("#hidCoverUrl0").val() != "") {
            var img = $("<img>").attr("src", "../../" + $("#hidCoverUrl0").val()).attr("id", "MoreImage_file_upload_img");
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

        if ($("#hidImg0") == "true") {
            $("#txtshowmain").attr("checked", "checked");

        }
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

            var MorespanImg = $("<img>").attr("src", "../../" + $("#hidCoverUrl" + index + "").val()).attr("id", "MoreImage_file_upload_img");
            $("#MorespanImg").append(MorespanImg);

        }
        else {
            var srt = '<p class="nopic" style="line-height: 150px;"> 暂无图片</p>';
            $("#MorespanImg").text("");
            $("#MorespanImg").append(srt);
        }
        moreText.html($("#hidText" + index + "").val());
        $("#txtMoreTheOriginalLink").val($("#hidTheOriginalLink" + index + "").val());

        if ($("#hidImg" + tag + "") == "true") {
            $("#txtshowmain").attr("checked", "checked");

        }



    }
    //编辑显示箭头
    $("#MoreVessel i").css("display", "none");
    if ($(eventSrc).attr("data-id") == "0") {
        $(eventSrc).parent().parent().siblings("i").css("display", "block");

    }
    else { $(eventSrc).parent().siblings("i").css("display", "block"); }


}

var rdUrl = "";


$(function () {

    //初始化赋值
    var radios = $("#simpleText  [name='rdUrl']");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            rdUrl = radios[i].value;

            if (radiosChecked == "1") {
                $("#divSimpleJump").show();

            } else if (radiosChecked == "0") {
                $("#divSimpleJump").hide();
            }
        }
    }



    //创建图文
    $("#AddCover").click(function () {
        var index = $("#MoreVessel .moretext-emulation02:lastChild").attr("dir");
        if ($("#MoreVessel").children().length + 1 > 8) {

            $(".Loading").removeClass("style03 style01").addClass("style02");
            $("#operateTip").html("你最多只可以加入8条图文消息").change();
            return;
        }
        index++
        var str = '<div class="moretext-emulation02" dir=' + index + '>';
        str += '<i style="display: none;" class="arrow"></i>';
        str += '<div class="moretext-emulation02-mask">';
        str += '<a data-id="1" class="moretext-emulation02-operate-edit" onclick="Editing(event)" href="javascript:void(0)">编辑</a>';
        str += '<a class="moretext-emulation02-operate-del l10" onclick="DelectImageText(event)" href="javascript:void(0)">删除</a></div>';
        str += '<div class="moretext-emulation02-box">';
        str += '<div class="moretext-emulation02-img" id="thumbnail' + index + '">缩略图</div>';
        str += '<div class="moretext-emulation02-text">标题</div>  </div>';
        str += '<input type="hidden" id="hidTitle' + index + '"><input type="hidden" id="hidAuthor' + index + '"><input type="hidden" id="hidCoverUrl' + index + '"><input type="hidden" id="hidText' + index + '"> <input type="hidden" id="hidTheOriginalLink' + index + '"><input type="hidden" id="hidImg' + index + '" /></div>';
        $("#MoreVessel .moretext-emulation02:last-child").after(str);
    });



    $("#simpleText  [name='rdUrl']").change(function () {
        rdUrl = $(this).val();
        if ($(this).val() == "1") {
            $("#divSimpleJump").show();

        }
        else { $("#divSimpleJump").hide(); }
    });



});
//删除图文
function DelectImageText(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    if ($("#MoreVessel").children().length <= 2) {
        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("无法删除，多条图文至少需要2条消息。").change();
        return;
    }
    $(eventSrc).parent().parent().remove();


}







