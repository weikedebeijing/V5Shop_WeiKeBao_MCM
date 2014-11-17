<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>
<html>
<head runat="server">
    <title>登录微客宝</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoad.js?Item=bootstrap|bootstrap-responsive"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=login"></script>
    <!--[if IE]>
     <script src="../../Scripts/Js/html5.js"></script>
    <![endif]-->
    <!--[if IE]>
      <style>
      .login-name .del-icon{display:none;}
      .login input{line-height:37px;}
      </style>
    <![endif]-->
</head>
<body>
    <div id="chromealert" class="alert browserTip" style="display:none;"><button type="button" class="close" data-dismiss="alert">×</button>您正在使用<a id="explorer"></a>系列浏览网页，微客宝只支持 Chrome 浏览器，请点击下列下载链接。<br>
  <a href="http://www.google.com/chrome/" class="downChrome"><i class="iconChrome"></i>官方下载Chrome</a><a href="http://pan.baidu.com/s/1c0viZNa" target="_blank" class="downChrome"><i class="iconChrome"></i>网盘下载Chrome</a>
  </div>
    <header class="header">
    <div class="header-logo"></div>
    <nav class="nav">
      <a class="nav-shortcuts" href="javascript:shortcut();">生成快捷方式</a>
      <a class="nav-collect" href="#">加入收藏</a>      
    </nav>
  </header>
    <section class="main">
    <div class="main-inner">
      <div class="pic">
        <i class="icon-product"></i>
        <i class="icon-member"></i>
        <i class="icon-order"></i>
        <i class="icon-server"></i>
        <i class="icon-cart"></i>
        <i class="icon-gift"></i>
      </div>
      <div class="login">        
        <div class="login-form">
          <div style="display: none;" id="hint" class="login-tip"><span>请输入用户名</span><i class="icon-arrow"></i></div>
          <h2 class="login-title">登录微客宝</h2>
          <div class="login-name">   <input name="txtName" id="txtName" placeholder="请输入账号"  onchange="javascript:checkUserName();"
                                type="text"  /><i class="people-icon"></i><i style="display: none;" id="namedel" class="del-icon"></i></div>
          <div class="login-password"> <input name="hidpwd" id="hidpwd" placeholder="请输入密码"  type="text"  />
                            <input name="txtPWD" id="txtPWD" style="display: none;" placeholder="请输入密码" type="password"  /><i class="clock-icon"></i><i style="display:none;" id="pwddel" class="del-icon"></i></div>
                   

                   <div class="login-code" id="validateCode" style="display: none;"><input  id="txtValidate"  name="txtValidate" type="type" placeholder="请输入验证码"><i style="display:none;" class="del-icon"></i><span class="codenumber"> <img style="cursor: pointer;" src="../../Login/GetValidateCode?id=1" 
                                id="VerifyImg" alt="验证码" /></span></div>


<%--
                                          <div class="login-form" id="validateCode" style="display: none;">
    

                            <img style="cursor: pointer;" src="../../Login/GetValidateCode?id=1" class="Vcodeimg"
                                id="VerifyImg" alt="验证码" />
                            <span class="refresh">
                               <label class="refresh">  验证码：</label>
                              
        <input name="txtValidate" id="txtValidate" type="text" class="v5-input in-2" />
                            
                            
                            <a href="javascript:void(0);" onclick="changeCheckCode();return false;">
                                看不清？</a></span> </div>--%>

            <button class="login-btn" id="btnLogin" onclick="javascript:btnlogin();">
                                    登录</button>
        </div>
        <div class="Btn">
            <figure class="qrcode">
              <span class="qrcode-img"></span>
              <figcaption class="qrcode-text">手机上的二维码扫描软件拍摄左侧二维码，可直接访问微客宝。</figcaption>
            </figure>
        </div>
      </div>
    </div>
  </section>
    <%--  </div>
    <div class="mainbar">
        <div class="m">
            <div class="m-l">
                <div class="mt40">
                    <img src="../../images/login/loginBackground.jpg" alt="电商行业新突破，5大设计，云处理，8大引流，6大推荐，电商们需要思考的事"></div>
            </div>
            <div class="m-r">
                <div class="login-form">
                    <h2>
                        用户登录</h2>
                    <ul>
                        <li>
                            <%--<label class="name">
                                用户名：</label>--%>
    <%--          </li>
                        <li>
                            <%--   <label class="name">
                                密　码：</label>--%>
    <%--    </li>
                        <li id="validateCode" style="display: none;">--%>
    <%--style="display:none;"--%>
    <%-- <label class="name">
                                验证码：</label>--%>
    <%--          <input name="txtValidate" id="txtValidate" type="text" class="v5-input in-2" />
                            <img style="cursor: pointer;" src="../../Login/GetValidateCode?id=1" class="Vcodeimg"
                                id="VerifyImg" alt="验证码" />
                            <span class="refresh"><a href="javascript:void(0);" onclick="changeCheckCode();return false;">
                                看不清？</a></span> </li>
                        <li>
                            <div class="Btn">--%>
    <%--<input type="button" class="btn-submit" value="登录" id="btnLogin" onclick="javascript:btnlogin();" />--%>
    <%-- <input type="button" class="btn-submit" value="登录" id="btnLogin" onclick="javascript:btnlogin();" />--%>
    <%-- <input type="button" id="btnSave" class="submit01" onclick="javascript:btnlogin();" value="保存"/>     --%>
    <%--                    </div>
                        </li>
                    </ul>
                    <div class="tips" id="tips1">
                        您输入的帐号或者密码有误
                    </div>
                    <div class="tips" id="tips2">
                        验证码错误，请重新输入
                    </div>
                    <div class="tips" id="tips3">
                        帐号被冻结，请联系管理员
                    </div>
                </div>
            </div>
            <div style="color: #666666; clear: both; float: right;">
                电商操盘手-多渠道管理版权所有 2011-2013 沪ICP备08105575号</div>
        </div>
    </div>--%>
    <footer class="footer">
    <nav class="footer-nav">
      <a target="_blank" href="http://service.v5shop.com/">在线技术支持</a>
      <a target="_blank" href="http://service.v5shop.com/list.aspx?shopname=V5%B5%E7%C9%CC%B2%D9%C5%CC%CA%D6">帮助中心</a>
    </nav>
    <div class="browser">
      <span>浏览器版本支持</span>
      <span class="icon"></span>
    </div>
  </footer>
</body>
</html>
<script type="text/javascript">

    $(function () {
        // 显示隐藏 请输入密码、请输入帐号 

        innitEvent();

        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/(msie |trident\/)([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

        if (Sys.chrome) {
            //$("#chromealert").hide();
            $("#chromealert").css("display", "none");
        }
        else {
            //$("#chromealert").show();
            $("#chromealert").css("display", "block");
        }

        if (Sys.ie) {
            $("#explorer").text("Internet Explorer");
        }
        else if (Sys.firefox) {
            $("#explorer").text("Firefox");
        }
        else if (Sys.opera) {
            $("#explorer").text("Opera");
        }
        else if (Sys.safari) {
            $("#explorer").text("Safari");
        }
        else {
            $("#explorer").text("其他");
        }
    });

    // 显示隐藏 请输入密码、请输入帐号 
    function innitEvent() {
        $("#btnLogin").removeAttr("disabled");
        var $hidpwd = $("#hidpwd");
        var $pwd = $("#txtPWD");

        var $txtName = $("#txtName");
        var $hidpwd = $("#hidpwd");


        $txtName.focusin(function () {
            $("#namedel").css("display", "block");
            $("#pwddel").css("display", "none");

        })
        $hidpwd.focusin(function () {
            $("#namedel").css("display", "none");
            $("#pwddel").css("display", "block");


        })

        $pwd.focusin(function () {
            $("#pwddel").css("display", "block");
            $("#namedel").css("display", "none");

        })
        $("#namedel").click(function () {
            $(this).siblings("input").val("");

        });
        $("#pwddel").click(function () {
            $(this).siblings("input").val("");

        });


        $("#hidpwd").focus(function () {
            $("#hidpwd").css("display", "none");
            $("#txtPWD").css("display", "block");
            $("#txtPWD").focus();

        })

        //        $hidpwd.focusin(function () {
        //            $("#hidpwd").css("display", "none");
        //            $pwd.css("display", "block");
        //       
        //        });

        $pwd.focusout(function () {
            if ($(this).val().length < 1) {
                $(this).css("display", "none");
                $hidpwd.css("display", "block");
            }
        });

    };

    // 检测用户名
    function checkUserName() {
        var userName = $("#txtName").val();

        $.ajax({
            url: "/Login/CheckUserForShowValidateCode",
            type: "post",
            data: { "userName": userName },
            success: function (data) {
                if (data == "show validateCode") {
                    //   $("#validateCode").css("display", "block");显示验证码
                } else if (data == "ok") {
                    //   $("#validateCode").css("display", "none");隐藏验证码
                    //                    $("#tips1").css("display", "none"); 
                    //                    $("#tips2").css("display", "none");
                    //                    $("#tips3").css("display", "none");
                }
            }
        });
    };

    // enter 键登录
    document.onkeypress = function () {
        var iKeyCode = -1;
        if (arguments[0]) {
            iKeyCode = arguments[0].which;
        }
        else {
            iKeyCode = event.keyCode;
        }

        if (iKeyCode == 13) {
            // 登录
            $("#btnLogin").click();
        }
    }

    // 点击图片更改验证码
    $("#VerifyImg").click(function () {
        changeCheckCode();
    });

    // 让验证码改变
    function changeCheckCode() {
        var oldUrl = $('#VerifyImg').attr("src");

        $('#VerifyImg').attr("src", oldUrl + '1');
    };

    // 登陆 登录时 登录按钮"变暗"
    function btnlogin() {
        ClearCookie(); //登录时清除之前的cookie



        if ($("#txtName").val() == "请输入账号" || $("#txtName").val() == "") {

            $("#hint").css("display", "block");
            $("#hint span").text("请输入账号");
            $("#txtName").focus();
            return false;
        }
        else if ($("#txtPWD").val() == "") {
            $("#hint").css("display", "block");
            $("#hint span").text("请输入密码");
            $("#hidpwd").focus();
            return false;
        }

        var isChargeValicode = false;
        var userName = $('#txtName').val();
        // 防止暴力登录
        $.ajax({
            url: "/Login/CheckUserForShowValidateCode",
            type: "post",
            data: { "userName": userName },
            async: false, // 同步执行
            success: function (data) {
                if (data == "show validateCode") {
                    $("#validateCode").css("display", "block");
                    isChargeValicode = true;
                }
            }
        });
        var params = {
            UserName: $('#txtName').val(),
            UserPwd: $("#txtPWD").val(),
            ValidateCode: $("#txtValidate").val(), // 获取验证码
            isChargeValicode: isChargeValicode
        };
        // 后台验证
        $.post("/Login/ProcessUserLogin", params, function (data) {
            if (data == "ok") {

                $("#hint").css("display", "none");
                $("#btnLogin").attr("disabled", "disabled");
                $("#btnLogin").attr("class", "disable");

                changeCheckCode();

                locationHref();

                //setTimeout(locationHref, 900);

            } else if (data == "pwd or Name Error") {
                $("#txtPWD").val("");
                changeCheckCode();
                $("#txtValidate").val("");

                $("#hint").css("display", "block");
                $("#hint span").text("您输入的帐号或者密码有误"); //  用户名密码提示

                //$("#btnLogin").addClass("btn-submit");
            } else if (data == "loginError and 3") { // 错误次数达到 3次
                $("#txtPWD").val("");
                changeCheckCode();
                $("#txtValidate").val("");
                $("#hint").css("display", "block");
                $("#hint span").text("您输入的帐号或者密码有误"); //  用户名密码提示

                //$("#btnLogin").addClass("btn-submit");
                $("#validateCode").css("display", "block");
            }
            else if (data == "Validate error") {

                changeCheckCode();
                $("#txtValidate").val("");
                // 验证码错误提示

                $("#hint").css("display", "block");
                $("#hint span").text("验证码错误，请重新输入");
                $("#txtValidate").focus();
                //$("#btnLogin").addClass("btn-submit");
            } else if (data == "Account Freezed") {
                $("#txtPWD").val("");
                changeCheckCode();
                $("#txtValidate").val("");
                $("#hint").css("display", "block");
                $("#hint span").text("帐号被冻结，请联系管理员");
                //$("#btnLogin").addClass("btn-submit");
            }
        });
    };

    // 设置时间 登录的按钮变色
    function locationHref() {
        //$("#btnLogin").addClass("btn-submit");

        var href = "";
        $.ajax({
            url: "/Login/JumpFirstMenu",
            type: "post",
            data: {},
            async: false,
            success: function (succData) {
                if (succData != null) {
                    href = succData;
                }
            }
        });

        window.location.href = href;

        // 目前不要跳进欢迎页
        //window.location.href = "/Login/WelComePage";
    }

    function ClearCookie() {
        var expires = new Date();
        expires.setTime(expires.getTime() - 1000);
        document.cookie = "appCode='';path=/;expires=" + expires.toGMTString() + "";
        document.cookie = "roleID='';path=/;expires=" + expires.toGMTString() + "";
        document.cookie = "parentMenuID='';path=/;expires=" + expires.toGMTString() + "";
        document.cookie = "currentMenuName='';path=/;expires=" + expires.toGMTString() + "";
    }

    //生成快捷方式
    function shortcut() {

        $.ajax({
            url: "/Login/Shortcut",
            type: "post",
            success: function (data) {

                //                if (data == "OK") {
                //                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                //                    $("#operateTip").html("生成成功").change();
                //                }
                //                else { alert("生成失败！"); }
            }
        });
    }
 
</script>
