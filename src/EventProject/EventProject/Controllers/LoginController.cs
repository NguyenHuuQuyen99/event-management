﻿
using EventProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace EventManagement.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        EventContext db = new EventContext();
        [HttpGet]
        public ActionResult Index()
        {
            if (Session["UserID"] != null) Session["UserID"] = null;
            return View();
        }
        [HttpPost]
        public ActionResult Index(string Username, string Password, string LogType)
        {
            if (!string.IsNullOrEmpty(Username) && !string.IsNullOrEmpty(Password))
            {
                string pwd = getMD5(Password);
                var userList = (from x in db.Users
                                where x.id == Username && x.password == pwd && x.role == LogType
                                select x).FirstOrDefault();

                if (userList != null)
                {
                    Session["UserID"] = Username;
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
        [NonAction]
        public string getMD5(string password)
        {
            if (password != null)
            {
                string outMD5 = string.Empty;
                using (MD5 md5 = MD5.Create())
                {
                    byte[] md5_in = Encoding.UTF8.GetBytes(password);
                    byte[] md5_out = md5.ComputeHash(md5_in);
                    outMD5 = BitConverter.ToString(md5_out);
                    outMD5 = outMD5.Replace("-", "");
                }
                return outMD5;
            }
            return null;
        }
    }
}