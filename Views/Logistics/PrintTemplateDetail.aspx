<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #detail
        {
            font-size: 20px;
        }
    </style>
    <div class="mod-title">
        <div class="con style0h1">
            <a href="/Logistics/PrintTemplateList" title="返回" class="a-btn float-l"><i class="icon-back t6">
            </i></a>
            <h1 class="spanTitle">
            </h1>
        </div>
    </div>
    <div id="content">
        <div id="tempeletePic" style="position: relative; border: 1px solid black;">
            <img id="TemplatePic" src="" alt="" style="" />
            <div id="tips">
                <div class="field" id="tip1" style="position: absolute;">
                </div>
                <div class="field" id="tip2" style="position: absolute;">
                </div>
                <div class="field" id="tip3" style="position: absolute;">
                </div>
                <div class="field" id="tip4" style="position: absolute;">
                </div>
                <div class="field" id="tip5" style="position: absolute;">
                </div>
                <div class="field" id="tip6" style="position: absolute;">
                </div>
                <div class="field" id="tip7" style="position: absolute;">
                </div>
                <div class="field" id="tip8" style="position: absolute;">
                </div>
                <div class="field" id="tip9" style="position: absolute;">
                </div>
                <div class="field" id="tip10" style="position: absolute;">
                </div>
                <div class="field" id="tip11" style="position: absolute;">
                </div>
                <div class="field" id="tip12" style="position: absolute;">
                </div>
                <div class="field" id="tip13" style="position: absolute; top: 360px; left: 0px;">
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="templateID" value="<%:ViewData["templateID"] %>" />
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var templateID = $("#templateID").val();
            $.getJSON("/Logistics/GetTemPalteElement", "templateID=" + templateID + "", function (returnData) {
                var ImageUrl = returnData.ImageUrl;
                var Length = returnData.Length;
                var Width = returnData.Width;
                // tips 坐标的集合
                var templateElements = returnData.templateElements;
                // 循环把每一个tip的坐标放上去
                var elementID = 0;
                for (var i = 0; i < templateElements.length; i++) {
                    // 取到 elementID
                    elementID = templateElements[i].ElementID;
                    // 取到tip
                    var tip = "#tip" + elementID;
                    $(tip).css('top', templateElements[i].OffSetY + "px");
                    $(tip).css('left', templateElements[i].OffSetX + "px");

                };

                // 存储tip Name的
                var elements = returnData.elements;
                for (var i = 0; i < elements.length; i++) {

                    var id = elements[i].ID;
                    var name = elements[i].ElementName;
                    var tip = "#tip" + id;
                    $(tip).text(name);
                }

                // 把数据组装到页面上
                $("#TemplatePic").attr("src", ImageUrl);
                $("#TemplatePic").css("height", Width);
                $("#TemplatePic").css("width", Length);

                $("#content").css("height", Width + 2);
                $("#content").css("width", Length + 2);
            });
        });

 
    </script>
</asp:Content>
