<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoad.js?Item=bootstrap-switch"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
    <script src="http://html.v5portal.com/mcm/bootstrap/js/bootstrapSwitch.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>

    <script>
        $(function () {
            $('.view').click('show.bs.modal', function () {
                $('#myModal').modal('show');
                return false;
            })

            $("#btnSave").click(function () {
                var recruit = new Object();
                recruit.ID = 0;
                recruit.ImgUrl = $("#file_imgs").attr("src").replace("../../","");
                recruit.IsEnable = $("#notification1").attr("checked") == "checked" ? 1 : 0;
                
                    $.ajax({
                        url: "../../WeiXinManage/SaveRecruit",
                        data: { "strRecruit": JSON.stringify(recruit) },
                        success: function (res) {
                            if (res == "ok") {
                                Show("保存成功", "success");
                            }
                            else {
                                Show(res, "prompt");
                            }
                        },
                        error: function (res)
                        {
                            Show("保存失败", "error");
                        }
                    })
              
                });
         
        });        function FileUpload() {

            //图片上传
            $.ajaxFileUpload({
                url: '../../WeiXinManage/UploadImageNone', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: "upimg", //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'text', //返回值类型 一般设置为json
                success: function (res) //服务器成功响应处理函数
                {
                    var reg = /\.[a-z]{3,4}/g;
                    if (reg.test(res)) {
                        var img = $("#file_imgs").attr("src", "../../UploadFile/WeiXin/" + res + "");
                        $("#recruiImg").css("background-image", "url(../../UploadFile/WeiXin/" + res + ")");
                    } 
                }
            });

        }</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--right begin-->
  <div class="RIGHT recruit"> 
    <!--big title begin-->
    <div class="bigTitle">
      <div class="bigTitle-name"><span class="text">分销招募书</span></div>
    </div>
    <!--big title end-->
    <div class="main">
         <form class="form-horizontal">
         <!--onoff begin-->
             <% V5.MetaData.WeiXin.Model.Recruit Recruit = ViewData["recruit"] as V5.MetaData.WeiXin.Model.Recruit; %>
         <div class="control-group">
              <label class="control-label" for="notification1">是否启用</label>
              <div class="controls">
                  <div class="switch" tabindex="0">
                      <% if(Recruit.IsEnable == 1){ %>
                      <input id="notification1" type="checkbox" checked="checked" />
                      <%}else{ %>
                     
                      <input id="notification1" type="checkbox" />
                       <%} %>
                  </div>
              </div>
          </div>
         <!--onoff end-->
         </form>
         <div class="outdiv">
         <form role="form">
             <!--view begin-->
             <% var imgUrl = "../../" + (Recruit.ImgUrl == "" || Recruit.ImgUrl==null ? "UpLoadFile/WeiXin/dis-explore.gif" : Recruit.ImgUrl); %>
             <figure class="figure-view" id="recruiImg" style="background-image:url(<%=imgUrl%>)">
                 <i class="arrow-left-out"></i>
                 <i class="arrow-left-in"></i>
                 <button class="be-button">立即开微店</button>
             </figure> 
             <!--view end--> 
             <!--edit form begin-->          
             <div class="cont-form">  
                 <div class="form-group">
                   <label for="upimg">图片<small class="muted">（大图片建议尺寸：960像素 * 1510像素）</small></label>
                   <input type="file" name="upimg" id="upimg" onchange="FileUpload();"/><br/>
                   <span class="span-upimg"><img id="file_imgs" src=""><a href="javascript:void(0)">删除</a></span>
                 </div>
                                   
             </div>
             <!--edit form end-->
             <p class="button mt20 clear">
                <br/><hr>
                <button class="btn btn-large btn-primary" id="btnSave" type="button">保存</button>
                 <input type="hidden" id="hiddenID" value="<%=Recruit.ID %>" />
             </p>
           </form>
         </div>
      
    </div>
  </div>
</asp:Content>


