using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.Teacher;
using CB.Domain.Response.User;
using ContactBook.Web.Models;
using ContactBook.Web.Service;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class TeacherController : Controller
    {
        private readonly IUserService userService;
        private readonly UserManager<ApplicationUser> userManager;

        public TeacherController(IUserService userService,
                                UserManager<ApplicationUser> userManager)
        {
            this.userService = userService;
            this.userManager = userManager;
        }
        [Authorize(Roles = "System Admin")]
        public IActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = "System Admin")]
        [HttpGet]
        [Route("/teacher/gets")]
        public IActionResult Gets()
        {
            var teachers = ApiHelper<List<UserView>>.HttpGetAsync($"teacher/gets");
            return Json(new { data = teachers });
        }
        [Authorize(Roles = "System Admin")]
        [HttpGet]
        [Route("/teacher/getTeacherSubject/{subjectId}")]
        public IActionResult GetTeachersSubject(int subjectId)
        {
            var teachersubject = ApiHelper<List<TeacherCourse>>.HttpGetAsync($"teacher/getTeacherSubject/{subjectId}");
            return Json(new { data = teachersubject });
        }
        [Authorize(Roles = "Giáo viên, GVCN, System Admin")]
        [HttpGet]
        [Route("/teacher/get/{teacherId}")]
        public IActionResult Get(string teacherId)
        {
            var teacher = ApiHelper<UserView>.HttpGetAsync($"teacher/get/{teacherId}");
            return Json(new { data = teacher });
        }
        [Authorize(Roles = "System Admin")]
        [HttpPost]
        [Route("/teacher/create")]
        public IActionResult Create([FromForm] SaveUserReq request)
        {
            if (request.Avatar != null)
            {
                request.AvatarPath = userService.ProcessImgPath(request.Avatar);
            }
            var avatar = request.Avatar;
            request.CreatedBy = userManager.GetUserId(HttpContext.User);
            request.Avatar = null;
            var result = ApiHelper<SaveUserRes>.HttpAsync($"teacher/create", "POST", request);
            if (result.Email != null && request.AvatarPath != "none_avatar.png")
            {
                userService.CreateImg(avatar, request.AvatarPath);
            }
            return Json(new { data = result });
        }
        [Authorize(Roles = "System Admin")]
        [HttpPatch]
        [Route("/teacher/edit")]
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
            var result = ApiHelper<SaveUserRes>.HttpAsync($"teacher/edit", "PATCH", request);
            if (result.Email != null)
            {
                userService.EditImg(avatar, request.AvatarPath, avatarPathOld);
            }
            return Json(new { data = result });
        }
        [Authorize(Roles = "System Admin")]
        [HttpGet]
        [Route("/teacher/teachercourse/{courseId}")]
        public IActionResult TeacherCourse(int courseId)
        {
            return View(courseId);
        }

        [Authorize(Roles = "Giáo viên, GVCN, System Admin")]
        [HttpGet]
        [Route("/teacher/getCourseIdByTeacherMasterId/{teacherId}")]
        public IActionResult GetCourseIdByTeacherMasterId(string teacherId)
        {
            var course = ApiHelper<CourseView>.HttpGetAsync($"subject/getCourseIdByTeacherMasterId/{teacherId}");
            return Json(new { data = course });
        }

        [Authorize(Roles = "System Admin")]
        [HttpPatch]
        [Route("/teacher/changeStatusToActive/{teacherId}")]
        public IActionResult ChangeStatusToActive(string teacherId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"teacher/changeStatusToActive/{teacherId}/{modifiedBy}");
            return Json(new { data = result });
        }

        [Authorize(Roles = "System Admin")]
        [HttpPatch]
        [Route("/teacher/changeStatusToBlocked/{teacherId}")]
        public IActionResult ChangeStatusToBlocked(string teacherId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"teacher/changeStatusToBlocked/{teacherId}/{modifiedBy}");
            return Json(new { data = result });
        }

        [Authorize(Roles = "System Admin")]
        [HttpPatch]
        [Route("/teacher/changeStatusToDeleted/{teacherId}")]
        public IActionResult ChangeStatusToDeleted(string teacherId)
        {
            string modifiedBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveUserRes>.HttpPatchAsync($"teacher/changeStatusToDeleted/{teacherId}/{modifiedBy}");
            return Json(new { data = result });
        }
    }
}
