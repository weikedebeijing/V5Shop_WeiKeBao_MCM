<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=customer"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=product"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/WeiXinManage/jquery.grid-a-licious.min.js"></script>
    <script>
        $(function () {
            GetView();
           
            $('.view').click('show.bs.modal', function () {
                $('#myModal').modal('show');
                return false;
            })

            $("#btnAdd").click(function () {
                if ($("#AddFriend").attr("isEdit"))//是否处在修改状态
                {
                    //GetView();
                    $("#AddFriend").attr("isEdit", false);
                }
                $("#AddFriend").parent().css("display", "");
                $("#description").val("");
                $("#AddFriend img").css("display", "none");
                $(".mask-opera").css("display", "none");
                $("#AddFriend .text").css("display", "block");
                //Alignment();

            });

            //单选
            $(".thumbnail").live("click", function () {
                if ($("#AddFriend").attr("isEdit") == undefined || !$("#AddFriend").attr("isEdit")) {
                    var tbclass = $(this).parent().attr("class");
                    if (tbclass.indexOf("active") >= 0) {
                        $(this).parent().removeClass("active");
                        $("#allcheckbox").attr("checked", false);
                    }
                    else {
                        $(this).parent().addClass("active");
                    }


                    var list = $(".li-list").size();
                    var active = $(".active").size();
                    if (list == active) {
                        $("#allcheckbox").attr("checked", "true");
                    }
                }
            });

            $(".btn").live("click", function () {
                if ($(this).attr("id") == "btnSave") {
                    $(this).attr("disabled", true);
                    var ID = $(this).attr("datakey");
                    //判断是否上传图片
                    var url = "";
                    $(this).parent().parent().parent().find(".pic").each(function () {
                        if ($(this).css("background-image").indexOf("none") < 0) {
                            url = $(this).css("background-image").replace("url(", "");
                            url = url.substring(1, url.length - 2);
                            return true;
                        }

                    });
                    if (url == "") {
                        $("#addConfirm_" + ID).css("display", "");
                        $(this).attr("disabled", false);
                        return false;
                    }

                    var ImgUrl = "";
                    //获取已传图片的地址
                    $(this).parent().parent().parent().find(".pic").each(function () {
                        var fileImgUrl = $(this).css("background-image").replace("url(", "");
                        fileImgUrl = fileImgUrl.replace("\"", "");
                        fileImgUrl = fileImgUrl.indexOf("none") >= 0 ? "" : fileImgUrl.substring(0, fileImgUrl.length - 1).replace("\"", "")
                        if (fileImgUrl != "") {
                            fileImgUrl = fileImgUrl.substring(fileImgUrl.indexOf("UploadFile"));
                            ImgUrl += fileImgUrl + ";";
                        }
                    });

                    ImgUrl = ImgUrl.substring(0, ImgUrl.length - 1);
                    var desc = $(this).parent().parent().parent().find(".textarea").val();

                    ID = ID == undefined || ID == "" ? 0 : ID;
                    $.ajax({
                        type: "post",
                        url: "../../WeiXinManage/SaveSpread",
                        data: { "Desciption": desc, "ImgUrl": ImgUrl, "ID": ID },
                        success: function (res) {
                            if (res == "ok") {
                                Show("保存成功", "success");
                                //GetView();
                                window.location.href = "../../WeiXinManage/Spread";
                            }
                            $(this).attr("disabled", false);
                        },
                        error: function (res) {
                            Show("保存失败", "error");
                            $(this).attr("disabled", false);
                        }

                    });
                }
            });

            //修改
            $(".edit").live("click", function () {

                //点击编辑隐藏添加保存HTML
                //元素个数
                var list = $(".li-list").size();
                if (list < 3)
                {
                    $("#AddFriend").parent().css("display", "none");
                }
                else
                {
                    $("#AddFriend").css("display", "none");
                    $("#AddFriend").parent().css("display", "");
                }
                $("#AddFriend").css("display", "none");
                $("#AddFriend").attr("isEdit", true);//处在修改状态中

                var key = $(this).attr("datakey");
              
                $(this).parent().css("display", "none");
                //修改显示文本框，隐藏文字
                $(this).parent().parent().find(".thumbnail").find("p").find(".textarea").parent().css("display", "block");
                $(this).parent().parent().find(".thumbnail").find("p").find(".textarea").val($(this).parent().parent().find(".thumbnail").find(".text").text());
                $(this).parent().parent().find(".thumbnail").find(".text").css("display", "none");
                $(this).parent().parent().find(".thumbnail").find(".caption").css("display", "");
                //判断图片地址是否空，如果为空显示暂无图片文字，上传按钮，隐藏图片控件
                $(this).parent().parent().find(".uppic-group").css("display", "");

                $(this).parent().parent().find(".thumbnail").find(".pic").each(function () {
                    //var src = $(this).find("img").attr("src");
                    var src = $(this).css("background-image");
                    if (src != "none") {
                        src = src.replace("url(", "");
                        src = src.substring(1, src.length - 2);
                    }
                    if (src.indexOf("none") >= 0) {
                        //$(this)..css("display", "none");
                        $(this).parent().css("display", "block");
                        $(this).find(".nopic-text").css("display", "block");
                        $(this).find(".mask-opera").css("display", "none");

                    }
                    else {
                        $(this).find(".nopic-text").css("display", "none");
                        $(this).find(".mask-opera").css("display", "");
                    }
                });
            });

            //删除
            $(".del").live("click", function () {
                var key = $(this).attr("datakey");
                $.ajax({
                    url: "../../WeiXinManage/DeleteFriendsCircle",
                    data: { "ID": key },
                    success: function (res) {
                        if (res == "ok") {
                            Show("删除成功", "success");
                            window.location.href = "../../WeiXinManage/Spread";
                            //Alignment();
                        }
                    }
                });

            });

            //$(".thumbnails").gridalicious({
            //    gutter: 10,
            //    width: 150,
            //    animationOptions: {
            //        speed: 150,
            //        duration: 400,
            //        complete: null
            //    },
            //});
            Alignment();

            function onComplete(data) {

            }

            $(".mask-opera").live("click", function () {
                var parent = $(this).parent();
                $(this).css("display", "none");
                comfirm = parent.find(".nopic-text")
                comfirm.css("display", "block");
                parent.css("background-image", "");
            });

            //全选
            $("#allcheckbox").click(function () {
                if ($(this).attr("checked")) {
                    $(".li-list").each(function () {
                        var listclass = $(this).attr("class");
                        if (listclass.indexOf("active") < 0) {
                            $(this).addClass("active");
                        }
                    });
                }
                else {
                    $(".li-list").removeClass("active");
                }
            });

            //加载编辑、删除
            $(".li-list").live("mouseover", function () {
                if ($("#AddFriend").attr("isEdit") == undefined || $("#AddFriend").attr("isEdit") == "false") {
                    $(this).find(".list-opera").css("display", "");
                }
            });
            //隐藏编辑、删除
            $(".li-list").live("mouseout", function () {
                if ($("#AddFriend").attr("isEdit") == undefined || $("#AddFriend").attr("isEdit") == "false") {
                    $(this).find(".list-opera").css("display", "none");
                }
            });

            //查询
            $("#btnSearch").click(function () {
                window.location.href = "../../WeiXinManage/Spread?query=" + $("#txtWhere").val();
            });
        });

        function Alignment() {
            $("#device").gridalicious({
                gutter: 10,
                width: 310,
                animate: true,
                animationOptions: {
                    speed: 150,
                    duration: 500,
                    complete: null
                },
            });
            //隐藏添加控件
            //$("#AddFriend").parent().css("display", "none");
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--right begin-->
    <div class="RIGHT spread">
        <!--function bar begin-->
        <div class="row funbar">
            <div class="span6 funbar-l">
                <span class="allselect">
                    <input type="checkbox" id="allcheckbox" />
                    <label for="allcheckbox">全选</label>
                </span><a class="btn btn-small fun-a addstore" onclick="BatchDel(event);" href="javascript:void(0);"><i class="icon-del-gray"></i>删除</a><%-- <a class="btn btn-small fun-a" id="btnAdd"  href="javascript:void(0)"><i class="icon-add-gray"></i>添加</a>--%>
            </div>
            <div class="span3 funbar-r">
                <form class="form-search">
                    <div class="bs-docs-example">
                        <input type="text" id="txtWhere" class="input-large search-query" value="<%=ViewData["Where"] %>" placeholder="请输消息关键字" data-provide="typeahead" data-source="[&quot;AlabamaAlabamaAlab&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]">
                        <button type="button" id="btnSearch" class="btn-search"></button>
                    </div>
                </form>
            </div>
        </div>
        <!--function bar end-->
        <div class="main spread">
            <div class="row-fluid">
                <div class="thumbnails" id="device">
                    <div class="add-box item"  id="AddFriend" style="display:;">
                        <div class="thumbnail">
                            <textarea class="textarea" placeholder="请输入文字描述"></textarea>
                            <div class="row">
                                <!--pic01 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img1">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_1" id="upload_Img0_1" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic01 begin-->
                                <!--pic02 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img2">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_2" id="upload_Img0_2" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic02 begin-->
                                <!--pic03 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img3">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_3" id="upload_Img0_3" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic03 begin-->
                            </div>
                            <div class="row">
                                <!--pic01 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img4">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_4" id="upload_Img0_4" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic01 begin-->
                                <!--pic02 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img5">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_5" id="upload_Img0_5" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic02 begin-->
                                <!--pic03 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img6">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_6" id="upload_Img0_6" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic03 begin-->
                            </div>
                            <div class="row">
                                <!--pic01 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img7">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_7" id="upload_Img0_7" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic01 begin-->
                                <!--pic02 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img8">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_8" id="upload_Img0_8" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic02 begin-->
                                <!--pic03 begin-->
                                <div class="span4">
                                    <div class="pic" id="pic0_img9">
                                        <span class="nopic-text" style="display: ;">暂无图片</span>
                                        <span class="mask-opera" style="display: none"><i title="删除">X</i></span>
                                    </div>

                                    <p class="uppic-group">
                                        <input type="file" class="upfile" name="upload_Img0_9" id="upload_Img0_9" datakey="0" onchange="UploadImage(event);" />
                                        <span class="btnupfile">上传图片</span>
                                    </p>
                                </div>
                                <!--pic03 begin-->
                            </div>
                            <div class="caption">
                                <p><a href="javascript:void(0);" id="btnSave" datakey="0" class="btn">保存</a><span class="color-red ml15" id="addConfirm_0" style="display: none;">至少上传一张图片</span></p>
                            </div>
                        </div>
                    </div>

                 

                </div>
            </div>
        </div>
    </div>
    <!--right end-->
    <script>

        function UploadImage(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var file_upload = "";
            var file_upload_img = "";
            var datakey = $(eventSrc).attr("datakey");
            if ($(eventSrc).attr("id") == "file_upload_1") {
                file_upload = "file_upload_1";
                file_upload_img = "file_upload_img_1";
            } else if ($(eventSrc).attr("id") == "file_upload_2") {
                file_upload = "file_upload_2";
                file_upload_img = "file_upload_img_2";
            } else if ($(eventSrc).attr("id") == "file_upload_3") {
                file_upload = "file_upload_3";
                file_upload_img = "file_upload_img_3";
            } else if ($(eventSrc).attr("id") == "file_upload_4") {
                file_upload = "file_upload_4";
                file_upload_img = "file_upload_img_4";
            } else if ($(eventSrc).attr("id") == "file_upload_5") {
                file_upload = "file_upload_5";
                file_upload_img = "file_upload_img_5";
            }
            else if ($(eventSrc).attr("id") == "file_upload_6") {
                file_upload = "file_upload_6";
                file_upload_img = "file_upload_img_6";
            } else if ($(eventSrc).attr("id") == "file_upload_7") {
                file_upload = "file_upload_7";
                file_upload_img = "file_upload_img_7";
            } else if ($(eventSrc).attr("id") == "file_upload_8") {
                file_upload = "file_upload_8";
                file_upload_img = "file_upload_img_8";
            } else if ($(eventSrc).attr("id") == "file_upload_9") {
                file_upload = "file_upload_9";
                file_upload_img = "file_upload_img_9";
            }
            else {
                file_upload = $(eventSrc).attr("id");
            }
            $.ajaxFileUpload({
                url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: file_upload, //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                async: false,
                success: function (res) //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        //$("#" + uploadID + "").parent().parent().find("pic").find("img").attr("src", "../../UploadFile/WeiXin/" + res);
                        //if (file_upload_img != "") {
                        //    $("#" + file_upload_img).attr("src", "../../UploadFile/" + res);
                        //}
                        //else {
                        $("#" + file_upload + "").parent().parent().find(".pic").css("background-image", "url('../../UploadFile/WeiXin/" + res + "')");
                        //$("#" + file_upload + "").parent().parent().find("pic").find("img").css("display", "block");
                        var parent = $("#" + file_upload).parent().parent().find(".pic");
                        var imgDesc = parent.find(".nopic-text");//隐藏暂无图片
                        imgDesc.css("display", "none");
                        var imgDel = parent.find(".mask-opera");//显示删除图片按钮
                        imgDel.css("display", "");
                        //}

                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function (res) //服务器响应失败处理函数
                {
                    var obj = res;
                }
            });
        }

        function GetView() {
            //
            var where = $("#txtWhere").val();
            $.ajax({
                type: "post",
                url: "../../WeiXinManage/GetFriendView",
                data: { "desc": where },
                async: false,
                dataType:"json",
                success: function (res) {
                    $(".thumbnails div").each(function () {
                        if ($(this).attr("IsAppend") != undefined && $(this).attr("IsAppend")) {
                            $(this).remove();
                        }
                    });
                    if (res != null) {
                        var htmlStr = "";
                        for (var i = 0; i < res.length; i++) {
                            htmlStr += " <div class='li-list item' datakey='" + res[i].ID + "' IsAppend='true'>";
                            htmlStr += "<div class='list-opera  tooltip-demo' style='display:none;'>";
                            htmlStr += "<a href='javascript:void(0)' datakey='" + res[i].ID + "'  data-toggle='tooltip' data-placement='bottom' data-original-title='删除' class='del'>";
                            htmlStr += "<i class='icon-del-blue'></i></a>";
                            htmlStr += " <a href='javascript:void(0);'  datakey=" + res[i].ID + "  data-toggle='tooltip' data-placement='bottom' data-original-title='编辑' class='edit'>";
                            htmlStr += " <i class='icon-pen-blue' title='blue'></i></a>";
                            htmlStr += "</div>";

                            htmlStr += "<div class='thumbnail' >";
                            var myDate = new Date(res[i].ModifyDate);
                            var FinDate = myDate.getFullYear() + "-" + myDate.getMonth() + "-" + myDate.getDate();
                            htmlStr += "<p class='date'>" + FinDate + "</p>";
                            htmlStr += "<p style='display:none'><textarea datakey='" + res[i].ID + "' class='textarea' id='description' placeholder='请输入文字描述'></textarea></p>";
                            htmlStr += "<p class='text'>" + res[i].Description + "</p>";
                            htmlStr += ResolveImg(res[i].CircleImg, (i + 1));
                            htmlStr += "<div class='caption' style='display:none;'>";
                            htmlStr += "<p><a href='javascript:void(0);' class='btn' datakey='" + res[i].ID + "' id='btnSave'>保存</a>";
                            htmlStr += "<span class='color-red ml15' id='addConfirm_" + res[i].ID + "' style='display:none;'>至少上传一张图片</span></p>";
                            htmlStr += "</div>";
                            htmlStr += "</div>";
                            htmlStr += "</div>";
                        }

                        $(".thumbnails").append(htmlStr);
                        Alignment();
                    }
                    $("#AddFriend").attr("isEdit", false);//处在没有修改状态中
                }
            });
        }

        function ResolveImg(Img, index) {
            //将图片解析，循环遍历-->
            var imgHtmlStr = "";
            var imgs = Img.split(';');
            if (imgs.length > 0) {
                var newRow = 0;

                for (var i = 0; i < 9; i++) {
                    if (newRow * 3 == i) {
                        imgHtmlStr += "<div class='row'>";
                    }
                    var imgUrl = i > imgs.length - 1 ? "-1" : "../../" + imgs[i];
                    var style = imgUrl == "-1" ? "style='display:none;'" : "";
                    imgHtmlStr += "<div class='span4' " + style + ">";
                    var imgStyle = imgUrl == "-1" ? "" : "style='background-image:url(" + imgUrl + ")'";
                    imgHtmlStr += "<div class='pic' " + imgStyle + ">";
                    imgHtmlStr += "<span class='nopic-text'  style='display: none;'>暂无图片</span>";//
                    //imgHtmlStr += "<img  src='" + imgUrl + "'  style='display:none ;'>";
                    imgHtmlStr += "<span class='mask-opera' style='display: none;'><i title='删除'>X</i></span>";
                    imgHtmlStr += "</div>";
                    imgHtmlStr += "<p class='uppic-group' style='display:none'>";
                    imgHtmlStr += "<input type='file' id='img_" + index + "file_upload_" + (i + 1) + "' name='img_" + index + "file_upload_" + (i + 1) + "' onchange='UploadImage(event)' class='upfile'/>";
                    imgHtmlStr += "<span class='btnupfile'>上传图片</span>";
                    imgHtmlStr += "</p>";
                    imgHtmlStr += "</div>";
                    if (i == ((newRow + 1) * 3 - 1) || i == 9 - 1) {
                        newRow++;
                        imgHtmlStr += "</div>";
                    }
                }
            }
            return imgHtmlStr;
        }

        function BatchDel(event) {
            $(this).attr("disabled", true);
            var DelKeys = new Array();
            $(".active").each(function () {
                var key = $(this).attr("datakey");
                if (key != "" && key != undefined) {
                    DelKeys.push(key);
                }
            });
            if (DelKeys.length == 0) {
                Show("请选择要删除的推广", "prompt");
                return false;
            }
            //  if (confirmThis(event, "您确认删除这些数据?")) {
            $.ajax({
                url: "../../WeiXinManage/BatchDelRow",
                data: { "IDs": JSON.stringify(DelKeys) },

                success: function (res) {
                    if (res == "ok") {
                        Show("删除成功", "success");
                        //GetView();
                    }
                    else {
                        Show("删除失败", "prompt");
                        //GetView();
                    }
                    $(this).attr("disabled", false);
                    window.location.href = "../../WeiXinManage/Spread";
                }
            });
            //   }
        }


    </script>
</asp:Content>

