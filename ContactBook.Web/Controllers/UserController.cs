using CB.Domain.Request.User;
using CB.Domain.Response.User;
using ContactBook.Web.Models;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private readonly IWebHostEnvironment webHostEnvironment;
        private readonly UserManager<ApplicationUser> userManager;

        public UserController(IWebHostEnvironment webHostEnvironment,
                                UserManager<ApplicationUser> userManager)
        {
            this.webHostEnvironment = webHostEnvironment;
            this.userManager = userManager;
        }
        [HttpGet]
        [Route("/user/index")]
        public IActionResult Index()
        {
            var userId = userManager.GetUserId(HttpContext.User);
            var user = new UserView();
            if(userId != null)
            {
                user = ApiHelper<UserView>.HttpGetAsync($"user/get/{userId}");
            }
            return View(user);
        }
        [Authorize(Roles = "System Admin")]
        [HttpPost]
        [Route("/user/create")]
        public IActionResult Create([FromForm] SaveUserReq request)
        {
            if (request.Avatar != null)
            {
                request.AvatarPath = ProcessAvatarPath(request.Avatar);
            }
            var avatar = request.Avatar;
            request.Avatar = null;
            request.CreatedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpAsync($"user/create", "POST", request);
            if (result.Email != null && request.AvatarPath != "none_avatar.png")
            {
                CreateAvatar(avatar, request.AvatarPath);
            }
            return Json(new { data = result });
        }
        [Authorize(Roles = "System Admin")]
        [HttpPatch]
        [Route("/user/edit")]
        public IActionResult Edit([FromForm] SaveUserReq request)
        {
            request.ModifiedBy = userManager.GetUserId(HttpContext.User);
            var avatarPathOld = request.AvatarPath;
            if (request.Avatar != null)
            {
                request.AvatarPath = ProcessAvatarPath(request.Avatar);
            }
            var avatar = request.Avatar;
            request.Avatar = null;
            var result = ApiHelper<SaveUserRes>.HttpAsync($"user/edit", "PATCH", request);
            if (result.Email != null)
            {
                EditAvatar(avatar, request.AvatarPath, avatarPathOld);
            }
            return Json(new { data = result });
        }

        public string ProcessAvatarPath(IFormFile file)
        {
            string fileName = null;
            if (file != null)
            {
                fileName = $"{Guid.NewGuid()}_{file.FileName}";
            }
            return fileName;
        }
        public void CreateAvatar(IFormFile file, string fileName)
        {
            string uploadFolder = Path.Combine(webHostEnvironment.WebRootPath, "img");
            var filePath = Path.Combine(uploadFolder, fileName);
            using (var fs = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fs);
            }
        }
        public void EditAvatar(IFormFile file, string fileName, string fileNameOld)
        {
            if (file != null)
            {
                string uploadFolder = Path.Combine(webHostEnvironment.WebRootPath, "img");
                var filePath = Path.Combine(uploadFolder, fileName);
                using (var fs = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(fs);
                }
                if (!string.IsNullOrEmpty(fileNameOld) && (fileNameOld != "none_avatar.png"))
                {
                    string delFile = Path.Combine(webHostEnvironment.WebRootPath
                                        , "img", fileNameOld);
                    System.IO.File.Delete(delFile);
                }
            }
        }
    }
}
