using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.User;
using ContactBook.Web.Models;
using ContactBook.Web.Service;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class StudentController : Controller
    {
        private readonly IUserService userService;
        private readonly UserManager<ApplicationUser> userManager;

        public StudentController(IUserService userService,
                                UserManager<ApplicationUser> userManager)
        {
            this.userService = userService;
            this.userManager = userManager;
        }
        public IActionResult Index(int id)
        {
            return View(id);
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpGet]
        [Route("/student/gets/{courseId}")]
        public IActionResult Gets(int courseId)
        {
            var students = ApiHelper<CourseDetails>.HttpGetAsync($"student/gets/{courseId}");
            return Json(new { data = students });
        }
        [HttpGet]
        [Route("/student/get/{studentId}")]
        public IActionResult Get(string studentId)
        {
            var student = ApiHelper<UserView>.HttpGetAsync($"student/get/{studentId}");
            return Json(new { data = student });
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpPost]
        [Route("/student/create")]
        public IActionResult Create([FromForm] SaveUserReq request)
        {
            if (request.Avatar != null)
            {
                request.AvatarPath = userService.ProcessImgPath(request.Avatar);
            }
            var avatar = request.Avatar;
            request.Avatar = null;
            request.CreatedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpAsync($"student/create", "POST", request);
            if (result.Email != null && request.AvatarPath != "none_avatar.png")
            {
                userService.CreateImg(avatar, request.AvatarPath);
            }
            return Json(new { data = result });
        }

        [Authorize(Roles = "GVCN, System Admin")]
        [HttpPatch]
        [Route("/student/changeStatusToActive/{studentId}")]
        public IActionResult ChangeStatusToActive(string studentId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"student/changeStatusToActive/{studentId}/{modifiedBy}");
            return Json(new { data = result });
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpPatch]
        [Route("/student/changeStatusToBlocked/{studentId}")]
        public IActionResult ChangeStatusToBlocked(string studentId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"student/changeStatusToBlocked/{studentId}/{modifiedBy}");
            return Json(new { data = result });
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpPatch]
        [Route("/student/changeStatusToDeleted/{studentId}")]
        public IActionResult ChangeStatusToDeleted(string studentId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"student/changeStatusToDeleted/{studentId}/{modifiedBy}");
            return Json(new { data = result });
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpPatch]
        [Route("/student/edit")]
        public IActionResult Edit([FromForm] SaveUserReq request)
        {
            request.ModifiedBy = userManager.GetUserId(HttpContext.User);
            var avatarPathOld = request.AvatarPath;
            if (request.Avatar != null)
            {
                request.AvatarPath = userService.ProcessImgPath(request.Avatar);
            }
            var avatar = request.Avatar;
            request.Avatar = null;
            var result = ApiHelper<SaveUserRes>.HttpAsync($"student/edit", "PATCH", request);
            if (result.Email != null)
            {
                userService.EditImg(avatar, request.AvatarPath, avatarPathOld);
            }
            return Json(new { data = result });
        }
    }
}
