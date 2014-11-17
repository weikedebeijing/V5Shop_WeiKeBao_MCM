<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<!--列表 Start-->
<div class="mod-table">
    <div class="mod-table-head">
        <div class="style0list" style="width: 100%">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 25%;">
                    <col style="width: 30%;">
                    <col style="width: auto;">
                </colgroup>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)">
                        </label>
                    </th>
                    <th class="x-tab">
                        分类名称
                    </th>
                    <th class="x-tab">
                        分类描述
                    </th>
                    <th class="x-tab">
                        分类图片外链接地址
                    </th>
                    <th class="x-tab">
                        外链网址或活动
                    </th>
                    <th>
                    </th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 25%;">
                    <col style="width: 30%;">
                    <col style="width: auto;">
                </colgroup>
                <%foreach (V5.MetaData.WeiXin.ImageText imageText in Model.DataSource)
                  {%>
                <tr class="tr-Current">
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=imageText.ID %>" name="sub" onclick="CheckThis()">
                            </label>
                            <!--<span class="flag-gray"></span>-->
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=imageText.Name%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=imageText.Describe%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <img src="../../<%=imageText.ImgesUrl %>" />
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=imageText.ChainedUrl %>
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>
    </div>
</div>
<!--列表 End-->
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 0;
    //显示多少显示数字条
    var CurrentPageSize = 20;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    function ClassifyView(pageclicknumber) {

        //点击事件
        CurrentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../weixin/GetPictureClassify?groups=' + ClassifyQuery.Groups,
            data: { "PictureClassifyPageIndex": CurrentPageIndex},
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 
                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".footer-p-div2").pager({ pagenumber: pageclicknumber, pagecount: CurrentPageNumber, buttonClickCallback: ClassifyView });
            }
        });
    };

</script>
