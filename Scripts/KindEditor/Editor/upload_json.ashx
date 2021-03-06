﻿<%@ WebHandler Language="C#" Class="Upload" %>

/**
 * KindEditor ASP.NET
 *
 * 本ASP.NET程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;

public class Upload : IHttpHandler
{


    public void ProcessRequest(HttpContext context)
    {
        String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);

        string fliename = HttpContext.Current.Server.MapPath("~/UploadFile/Product/");
        if (!Directory.Exists(fliename))
        {
            Directory.CreateDirectory(fliename);
        }//得到不同得名字 ;//获取其相对地址 

        //文件保存目录路径
        // String savePath = "../UploadFile/Picture/ProDetails/";

        //文件保存目录URL
        // String saveUrl = aspxUrl + "../UploadFile/Picture/ProDetails/";

        //定义允许上传的文件扩展名
        //Hashtable extTable = new Hashtable();
        //extTable.Add("image", "gif,jpg,jpeg,png,bmp");
        //extTable.Add("flash", "swf,flv");
        //extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        //extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        //最大文件大小
        int maxSize = 1000 * 1024;
        //this.context = context;

        HttpPostedFile imgFile = context.Request.Files["imgFile"];
        if (imgFile == null)
        {
            showError("请选择文件。", context);
        }

        //String dirPath = context.Server.MapPath(savePath);
        //if (!Directory.Exists(dirPath))
        //{
        //    showError("上传目录不存在。");
        //}

        //String dirName = context.Request.QueryString["dir"];
        //if (String.IsNullOrEmpty(dirName)) {
        //    dirName = "image";
        //}
        //if (!extTable.ContainsKey(dirName)) {
        //    showError("目录名不正确。");
        //}

        String fileName = imgFile.FileName;
        String fileExt = Path.GetExtension(fileName).ToLower();

        if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
        {
            showError("上传文件大小超过限制", context);
        }
        if (!(fileExt == ".png" || fileExt == ".gif" || fileExt == ".jpg" || fileExt == ".jpeg"))
        {
            showError("图片类型只能为gif,png,jpg,jpeg", context);
        }


        //if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
        //{
        //    showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
        //}

        //创建文件夹
        //dirPath += dirName + "/";
        //saveUrl += dirName + "/";
        //if (!Directory.Exists(dirPath))
        //{
        //    Directory.CreateDirectory(dirPath);
        //}
        //String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
        //dirPath += ymd + "/";
        //saveUrl += ymd + "/";
        //if (!Directory.Exists(dirPath))
        //{
        //    Directory.CreateDirectory(dirPath);
        //}

        //String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
        //String filePath = dirPath + newFileName;
        Random r = new Random();
        string uploadFileName = DateTime.Now.ToString("yyyyMMddhhmmss") + r.Next(100000, 999999) + fileExt;
        imgFile.SaveAs(HttpContext.Current.Server.MapPath("~/UploadFile/Product/") + uploadFileName);

        String fileUrl = "../../UploadFile/Product/" + uploadFileName;

        Hashtable hash = new Hashtable();
        hash["error"] = 0;
        hash["url"] = fileUrl;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    private void showError(string message, HttpContext context)
    {
        Hashtable hash = new Hashtable();
        hash["error"] = 1;
        hash["message"] = message;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
