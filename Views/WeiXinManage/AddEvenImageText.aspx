<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftMvcAjax.debug.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script type="text/javascript">


    </script>
    <style type="text/css">
        #tbl-except td
        {
            border-color: #BBBBBB;
            border-style: solid;
            border-width: 0 1px 1px 0;
            text-align: center;
        }

        .input-text
        {
            text-align: right;
            width: 4em;
        }
        .area-group
        {
            text-align: left;
        }
        
        table
        {
            border-color: #BBBBBB;
            border-style: solid;
            border-width: 1px 0 0 1px;
        }
        table th
        {
            background-color: #F5F5F5;
            font-weight: 400;
            height: 32px;
        }
        
        
        
        td
        {
            text-align: center;
            border-bottom: 1px solid;
            border-right: 1px solid;
        }
     
        .title
        {
            font-weight: bold;
            background-color: #cccccc;
        }
        
        .text
        {
            width: 50px;
        }
        
   h2{margin:0px;padding:0px;font-size:12px;font-weight:bold;}
.bton{border:1px solid #CCC;background:#DDD;}
.cont{padding:10px;}
#main{width:400px;margin:0px auto;}
#selectItem{background:#FFF;position:absolute;top:0px;left:center;border:1px solid #000;overflow:hidden;margin-top:10px;width:600px;z-index:2; overflow :visible;}
#preview{margin:1px;border:1px solid #CCC;}
#result{border:1px solid #CCC;margin-top:10px;}
.tit{line-height:20px;height:20px;margin:1px;padding-left:10px;}
.bgc_ccc{background:#CCC;}
.bgc_eee{background:#eee;}
.c_999{color:#999}
.pointer{cursor:pointer;}
.left{float:left;}
.right{float:right;}
.cls{clear:both;font-size:0px;height:0px;overflow:hidden;}

#bg{background:#FFFFFF;filter:alpha(opacity=70);opacity:0.7;width:100%;;position:absolute;left:0px;top:0px;display:none;z-index:1;}
.hidden{display:none;}
.move{cursor:move;}

.clearfix:after {
    clear: both;
    content: "";
    display: block;
    height: 0;
}

.dcity {
    display: block;
    vertical-align: middle;
    z-index: 1;
}

.gcity, .province-list {
    display: inline-block;
}
.ecity {
    float: left;
    height: 30px;
    margin-right: 1px;
    padding-right: 8px;
    position: relative;
  <%--  width: 80px;--%>
}


.dialog-areas li span.group-label {
    display: inline-block;
    font-weight: 700;
    margin-right: 5px;
    padding: 5px 0 5px 10px;
    width: 70px;
}

.trigger {
    cursor: pointer;
    height: 8px;
    padding: 2px;
    width: 8px;
}
.dialog-areas li span.group-label {
    font-weight: 700;
}

.dialog-areas .even {
    background-color:  #ECF4FF;
}

.dialog-areas .even span.gareas {
    background-color: #ECF4FF;
    border-color: #ECF4FF;
}

.citys {
    background-color: #FFFEC6;
    border: 1px solid #F7E4A5;
    display: none;
    float: right;
    left: 0;
    position: absolute;
    top: 23px;
    width: 214px;
    z-index: 20000;
}


province-list {
    width: 450px;
}
.gcity, .province-list {
    display: inline-block;
}

.gcity, .province-list {
    display: inline-block;
}


.dialog-areas .even .showCityPop .gareas {
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
}
.dialog-areas .even span.gareas {
    background-color: #ECF4FF;
    border-color: #ECF4FF;
}
.dialog-areas .showCityPop .gareas {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    z-index: 56000;
}
.dialog-areas span.gareas {
    border: 1px solid #FFFFFF;
    display: inline-block;
    height: 17px;
    margin-right: 3px;
    padding: 4px 4px 1px;
    position: relative;
    white-space: nowrap;
}



.dialog-areas .showCityPop .gareas {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFEC6;
    border-color: #F7E4A5 #F7E4A5 #FFFEC6;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    z-index: 56000;
   
    
}
.dialog-areas li span.areas {
    display: inline-block;
    margin-right: 3px;
    padding: 4px 0 1px 4px;
    
}


.showCityPop .citys {
    display: block;
    z-index: 55900;  
}

 .area-group {
    display: block;
    padding-right: 3em;
    font-size:12px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mod-title">
        <div class="con style03">
            <a href="../../WeiXinManage/PictureClassify" title="返回">
                <button type="button" class="returnBtn">
                    返回</button>
            </a><span class="spanTitle">添加多文图文</span>
        </div>
    </div>
    <div>
        <div class="Loading" style="display: none;">
            <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <%using (Ajax.BeginForm("AddEvenImageTexts", "WeiXinManage", new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxForm", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "HidUpdateTargetId" }))
      { 
          
    %>
    <input type="hidden" id="HidImg" name="HidImg" />
    <input type="hidden" id="HidResult" name="HidResult" />
    <input type="hidden" id="HidUpdateTargetId" name="HidUpdateTargetId" />
    <div id="tbl-except" style="display: block">
        <table border="0" cellpadding="0" cellspacing="0" id="myPressPaperTable" width="100%">
            <tr class="title">
                <td>
                    上传图片
                </td>
                <td>
                    标题
                </td>
                <td>
                    描述
                </td>
                <td>
                    网址链接地址
                </td>
                <td>
                    操作
                </td>
            </tr>
            <tr id="appmsgItem1" dir="1">
                <td style="height: 180px">
                    <dd class="l150" style="padding-left: 20px">
                        <div id="uploadImgUpload">
                            <div class="uploadImgItem">
                                <div class="uploadImgItemPreview">
                                    <div class="previewContainer">
                                        <img id="file_upload_img_1" src="../../Images/Default.png" alt="图片" style="display: block;
                                            margin: 0 auto" width="90" height="90">
                                        <input type="hidden" id="Hid_Upload_1" name="Hid_Upload_1" />
                                    </div>
                                    <div style="display: none;" class="operateImg">
                                        <div sort="delete">
                                            ×</div>
                                    </div>
                                </div>
                                <div class="uploadImgBtn">
                                    <button class="uploadButton">
                                        选择</button><span class="spMessage"></span>
                                    <input id="file_upload_1" name="file_upload" value=" " onchange="FileUpload(event)"
                                        class="uploadInputFile" style="width: 60px;" type="file">
                                </div>
                            </div>
                        </div>
                    </dd>
                </td>
                <td>
                    <input type="text" name="txtName1" id="txtName1" class="v5-input w150" />
                    <span class="spMessage"></span>
                </td>
                <td>
                    <textarea name="txtDescribe1" id="txtDescribe1" style="width: 200px; height: 100px;"></textarea>
                    <span class="spMessage"></span>
                </td>
                <td>
                    <input class="v5-input w150" type="text" name="txtChainedUrl1" id="txtChainedUrl1"
                        style="width: 500px">
                    <span class="spMessage"></span>
                </td>
                <td>
                </td>
            </tr>
            <tr id="appmsgItem2" dir="2">
                <td style="height: 180px">
                    <dd class="l150" style="padding-left: 20px">
                        <div id="Div1">
                            <div class="uploadImgItem">
                                <div class="uploadImgItemPreview">
                                    <div class="previewContainer">
                                        <img id="file_upload_img_2" src="../../Images/Default.png" alt="图片" style="display: block;
                                            margin: 0 auto" width="90" height="90">
                                        <input type="hidden" id="Hid_Upload_2" name="Hid_Upload_2" />
                                    </div>
                                </div>
                                <div class="uploadImgBtn">
                                    <button class="uploadButton">
                                        选择</button><span class="spMessage"></span>
                                    <input id="file_upload_2" name="file_upload_1" value=" " onchange="FileUpload(event)"
                                        class="uploadInputFile" style="width: 60px;" type="file">
                                </div>
                            </div>
                        </div>
                    </dd>
                </td>
                <td>
                    <input type="text" name="txtName2" id="txtName2" class="v5-input w150" />
                    <span class="spMessage"></span>
                </td>
                <td>
                    <textarea name="txtDescribe2" id="txtDescribe2" style="width: 200px; height: 100px;"></textarea>
                    <span class="spMessage"></span>
                </td>
                <td>
                    <input class="v5-input w150" type="text" name="txtChainedUrl2" id="txtChainedUrl2"
                        style="width: 500px">
                    <span class="spMessage"></span>
                </td>
                <td>
                </td>
            </tr>
        </table>
        <a id="J_AddRule" href="javascript:void(0)" onclick="InsertRow()">添加多文图</a>
    </div>
    <button type="button" onclick="javascript:btnSub();" class="saveBtn t10">
        保存</button>
    <button type="submit" id="realSub" style="display: none;">
        保存</button>
    <button type="button" class="cancelBtn l10 t10" onclick="javascript:btnSub();">
        取消</button>
    <% } %>
    <script type="text/javascript">

        function afterOnSuccess() {
            if ($("#HidUpdateTargetId").html() == "ok") {
                $(".spMessage").text("");
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");

                $("#operateTip").html("添加成功！").change();
                btnCancel();
                $("input").val('')

            }
        }
        function afterOnFailure() {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
            $("#operateTip").html("添加失败！").change();

        };
        function btnSub() {

            $("#myPressPaperTable tr:not(:eq(0))").each(function () {
                var trId = $(this).attr("id");
                $("#" + trId + " input[type='hidden']").val($("#" + trId + " img").attr("src").replace("../../", ""));

            });
            var tr = $("#myPressPaperTable tr:last").attr("dir");
            if (tr != undefined) {

                $("#HidResult").val(tr);
            }
            else { $("#HidResult").val(0); }

            $("#realSub").submit();
        }

        function InsertRow() {
            var str = "";
            var tableRow = document.getElementById("myPressPaperTable");
            var row_index = tableRow.rows.length;
            if (row_index <= 8) {
                var trRow = tableRow.insertRow(row_index);
                trRow.id = "appmsgItem" + row_index;
                trRow.dir = row_index;
                var cel1 = trRow.insertCell(0);
                str += '<td  style ="height:180px">';
                str += '<dd class="l150" style="padding-left: 20px">';
                str += '<div id="uploadImgUpload">';
                str += '<div class="uploadImgItem">';
                str += '<div class="uploadImgItemPreview">';
                str += '<div class="previewContainer">';
                str += '<img name="file_upload_img_' + row_index + '" id="file_upload_img_' + row_index + '" src="../../Images/Default.png" alt="图片"  style="display: block; margin: 0 auto" width="90" height="90">';
                str += '<input type="hidden" id="Hid_Upload_' + row_index + '" name="Hid_Upload_' + row_index + '" />';
                str += '</div>';
                str += '</div>';
                str += ' <div class="uploadImgBtn">';
                str += '<button class="uploadButton">选择</button><span class="spMessage"></span>';
                str += '<input id="file_upload_' + row_index + '" name="file_upload_' + row_index + '"  onchange="FileUpload(event)" class="uploadInputFile" style="width: 60px;" type="file">';
                str += '</div>';
                str += '</div>';
                str += '</div>';
                str += '</dd>';
                str += '</td>';
                cel1.innerHTML = str;
                var cel2 = trRow.insertCell(1);
                cel2.innerHTML = '<input type="text" name="txtName' + row_index + '" id="txtName' + row_index + '" class="v5-input w150" />';
                var cel3 = trRow.insertCell(2);
                cel3.innerHTML = '<textarea name="txtDescribe' + row_index + '" id="txtDescribe' + row_index + '" style="width: 200px; height: 100px;"></textarea>';
                var cel4 = trRow.insertCell(3);
                cel4.innerHTML = '<input class="v5-input w150" type="text" name="txtChainedUrl' + row_index + '" id="txtChainedUrl' + row_index + '" style="width: 500px">';
                var cel5 = trRow.insertCell(4);
                cel5.innerHTML = "<input  name='de_" + row_index + "' type='button' value='删除' onclick=\"dlRow(event)\"/>";
            }
            else {
            
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("最多只能有八条图文").change();
             }
        }

        //删除行
        function dlRow(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var RowId = $(eventSrc).parent("td").parent("tr").attr("id");

            var deleteRow = document.getElementById(RowId).rowIndex;

            document.getElementById("myPressPaperTable").deleteRow(deleteRow);

            //重新设置ID
            var index = 2;
            $("#myPressPaperTable tr:gt(2)").each(function () {

                index++;

                $(this).attr("id", "appmsgItem" + index);
                $(this).attr("dir", index);

                $("td img", $(this)).attr("id", "file_upload_img_" + index);
                $("td  input[type='hidden']", $(this)).attr("id", "Hid_Upload_" + index);
                $("td  input[type='hidden']", $(this)).attr("name", "Hid_Upload_" + index);
                $("td .uploadImgBtn input", $(this)).attr("id", "file_upload_" + index);

                $("td:eq(1) input", $(this)).attr("name", "txtName" + index);
                $("td:eq(2) textarea ", $(this)).attr("name", "txtDescribe" + index);
                $("td:eq(3) input", $(this)).attr("name", "txtChainedUrl" + index);
                $("td:eq(1) input", $(this)).attr("id", "txtName" + index);
                $("td:eq(2) textarea ", $(this)).attr("id", "txtDescribe" + index);
                $("td:eq(3) input", $(this)).attr("id", "txtChainedUrl" + index);

            })
        }

        function FileUpload(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var file_upload = "";
            var file_upload_img = "";
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
            } else if ($(eventSrc).attr("id") == "file_upload_6") {
                file_upload = "file_upload_6";
                file_upload_img = "file_upload_img_6";
            }
            else if ($(eventSrc).attr("id") == "file_upload_7") {
                file_upload = "file_upload_7";
                file_upload_img = "file_upload_img_7";
            }

            else if ($(eventSrc).attr("id") == "file_upload_8") {
                file_upload = "file_upload_8";
                file_upload_img = "file_upload_img_8";
            }
            //图片上传
            $.ajaxFileUpload({
                url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: file_upload, //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res)  //服务器成功响应处理函数
                {

                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        $("#" + file_upload_img + "").attr("src", "../../UploadFile/WeiXin/" + res);

                        //var dd = $(eventSrc).parent().parent().attr("class")
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function ()//服务器响应失败处理函数
                {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("提交过程中出现未知错误").change();
                }
            })

        }

        function AjaxForm() {

        }

    

    </script>
</asp:Content>
