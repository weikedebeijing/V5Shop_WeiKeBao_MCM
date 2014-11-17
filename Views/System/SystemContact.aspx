<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <% V5.MetaData.Security.Model.Contact contact = (V5.MetaData.Security.Model.Contact)ViewData["Contact"];%>
        <div class="MCM-C-M ">
            <div class="mod-title" style="margin-bottom: 0; margin-top: 18px;">
            </div>
            <!--title begin-->
            <div class="mod-title">
                <%--  <a title="返回" href="/DrpSetting/PaymentList">
                    <button type="button" class="returnBtn">
                        返回</button></a>--%><span class="spanTitle">联系人设置</span>
            </div>
            <!--title begin-->
            <div>
                <% Html.EnableClientValidation(); %>
                <%using (Ajax.BeginForm("EditContact", "System", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
                  { %>
                <div class="mod-form">
                    <div class="con style01">
                        <dl>
                            <dt class="w80">联系人</dt>
                            <dd class="l80">
                                <input type="text" id="Contacts" name="Contacts" class="v5-input in200" value="<%=contact.Contacts %>" /><span
                                    class="spMessage"></span>
                            </dd>
                            <dt class="w80">所在区域</dt>
                            <dd class="l80">
                                <select name="ProvinceName" id="ProvinceID" class="v5-select">
                                    <option value="-1">请选择</option>
                                </select>
                                <select name="CityName" id="CityID" class="v5-select" style="display: none">
                                    <option value="-1">请选择</option>
                                </select>
                                <select name="DistrictName" id="DistrictID" class="v5-select" style="display: none">
                                    <option value="-1">请选择</option>
                                </select>
                                <input type="text" id="Address" name="Address" class="v5-input in200" value="<%=contact.Address %>" /><span
                                    class="spMessage"></span>
                            </dd>
                            <dt class="w80">联系电话</dt>
                            <dd class="l80">
                                <input type="text" id="Tel" name="Tel" class="v5-input in200" value="<%=contact.Tel %>" /><span
                                    class="spMessage"></span>
                            </dd>
                            <dt class="w80">手机</dt>
                            <dd class="l80">
                                <input type="text" id="Mobile" name="Mobile" class="v5-input in200" value="<%=contact.Mobile %>" /><span
                                    class="spMessage"></span>
                            </dd>
                            <dt class="w80">公司名称</dt>
                            <dd class="l80">
                                <input type="text" id="CompanyName" name="CompanyName" class="v5-input in200" value="<%=contact.CompanyName %>" /><span
                                    class="spMessage"></span>
                            </dd>
                            <dt class="w80"></dt>
                            <dd class="l80">
                                <button class="submit01 t10" type="submit">
                                    保存</button>
                            </dd>
                        </dl>
                    </div>
                </div>
               <span id="UpdateTargetHiddenID" style="display: none"></span>
                <%} %>
            </div>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // 默认把操作结果隐藏
            selectProvince(1);
             if(<%=contact.ProvinceID %>>0){
                 $("#ProvinceID").val(<%=contact.ProvinceID %>);
                 $("#ProvinceID").change();
            }
             if(<%=contact.CityID %>>0){
                 $("#CityID").val(<%=contact.CityID %>);
                 $("#CityID").change();
            }
              if(<%=contact.DistrictID %>>0){
                 $("#DistrictID").val(<%=contact.DistrictID %>);
            }
        });

     


        //二级区域选择
        function selectProvince(objvalue) {
            var strs = "";
            if (objvalue != "") {
                //$("#seleAreaNext").css("display", "");
                $.ajax({
                    url: "../../DrpSetting/GetAreaByPID",
                    type: "post",
                    async:false,
                    data: { "PID": objvalue },
                    success: function (provinceList) {
                        var objs = eval(provinceList);
                        for (var i = 0; i < objs.length; i++) {
                            strs += "<option value='" + objs[i].id + "'>" + objs[i].name + "</option>";
                        }
                        $("#ProvinceID").empty();
                        $("#ProvinceID").append("<option value=''>请选择</option>");
                        $("#ProvinceID").append(strs);
                        $("#ProvinceID").change(function () {
                            selectCity(this.value);
                        });
                    }
                });
            }else{  
            }
        }
        //三级区域选择
        function selectCity(objvalue) {
            var strs = "";
            objvalue= $("#ProvinceID").val();
            if (objvalue != "") {
                $("#CityID").css("display", "");
                $("#DistrictID").css("display", "none");
                $.ajax({
                    url: "../../DrpSetting/GetAreaByPID",
                    type: "post",
                     async:false,
                    data: { "PID": objvalue },
                    success: function (provinceList) {
                        var objs = eval(provinceList);
                        for (var i = 0; i < objs.length; i++) {
                            strs += "<option value='" + objs[i].id + "'>" + objs[i].name + "</option>";
                        }
                        $("#CityID").empty();
                        $("#CityID").append("<option value=''>请选择</option>");
                        $("#CityID").append(strs);
                        $("#CityID").change(function () {
                            selectDistrict(this.value);

                                             });
                    }
                });
            }else{
             $("#DistrictID").empty();
                 $("#DistrictID").append("<option value=''>请选择</option>");
                $("#CityID").empty();
                 $("#CityID").append("<option value=''>请选择</option>");
               
            }
        }

        //三级区域选择
        function selectDistrict(objvalue) {
        objvalue= $("#CityID").val();
            var strs = "";
            if (objvalue != "") {
                $("#DistrictID").show();
                $.ajax({
                    url: "../../DrpSetting/GetAreaByPID",
                    type: "post",
                     async:false,
                    data: { "PID": objvalue },
                    success: function (provinceList) {
                        var objs = eval(provinceList);
                        for (var i = 0; i < objs.length; i++) {
                            strs += "<option value='" + objs[i].id + "'>" + objs[i].name + "</option>";
                        }
                        $("#DistrictID").empty();
                        $("#DistrictID").append("<option value=''>请选择</option>");
                        $("#DistrictID").append(strs);
                    }
                });
            }else{
                  $("#DistrictID").empty();
                 $("#DistrictID").append("<option value=''>请选择</option>");
            }
        }
   
     // ajax.BeginForm 的提交前验证
        function AjaxFormValidata() {
            $("#Mobile").siblings(".spMessage").text("");
            $("#Tel").siblings(".spMessage").text("");
            $("#Contacts").siblings(".spMessage").text("");
            $("#Address").siblings(".spMessage").text("");
            $("#CompanyName").siblings(".spMessage").text("");
            $("#Address").siblings(".spMessage").text("");

            if ($("#Contacts").val() == "") {
                $("#Contacts").focus();
                $(".spMessage").text("");
                $("#Contacts").siblings(".spMessage").text("联系人不能为空");
                return false;
            }
            if ($("#DistrictID").val() == "") {
                $("#Address").siblings(".spMessage").text("请选择所在区域");
                return false;
            }
            if ($("#Address").val() == "") {
                $("#Address").siblings(".spMessage").text("请填写详细地址");
                return false;
            }
            if ($("#Address").val() == "") {
                $("#Address").focus();
                $(".spMessage").text("");
                $("#Address").siblings(".spMessage").text("所在区域不能为空");
                return false;
            }
            if (!IsTelePhone($("#Tel"))) {
                $("#Tel").siblings(".spMessage").text("电话号码格式不正确");
                return false;
            }
            if (!IsCellphone($("#Mobile"))) {
                $("#Mobile").siblings(".spMessage").text("手机号码格式不正确");
                return false;
            }
            if ($("#CompanyName").val() == "") {
                $("#CompanyName").focus();
                $(".spMessage").text("");
                $("#CompanyName").siblings(".spMessage").text("公司名称不能为空");
                return false;
            } else {
                return true;
            }
        }

        function afterOnSuccess() {
            if ($("#UpdateTargetHiddenID").html() == "ok") {
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("设置成功").change();
            }
        }

// 添加会员等级失败
        function afterOnFailure() {
            // 把添加失败放到<span>中
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("设置失败").change();
//              $("#ResultTip").css("display", "block").text("分销店铺设置失败");
        }
    </script>
</asp:Content>
