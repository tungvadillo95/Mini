using CB.Domain.Request.Course;
using CB.Domain.Response.Course;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class CourseController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = "GVCN, System Admin")]
        [HttpGet]
        [Route("/course/gets")]
        public IActionResult Gets()
        {
            var courses = ApiHelper<List<CourseView>>.HttpGetAsync($"course/gets");
            return Json(new { data = courses });
        }

        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/course/getCourseTeachersSubject/{courseId}")]
        public IActionResult GetCourseTeachersSubject(int courseId)
        {
            var courses = ApiHelper<CourseTeacherRes>.HttpGetAsync($"course/getCourseTeachersSubject/{courseId}");
            return Json(new { data = courses });
        }

        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/course/getCoursesTeaching/{teacherId}")]
        public IActionResult GetCoursesTeaching(string teacherId)
        {
            var courses = ApiHelper<List<CourseView>>.HttpGetAsync($"course/getCoursesTeaching/{teacherId}");
            return Json(new { data = courses });
        }
        [Authorize(Roles = "System Admin")]
        [HttpPost]
        [Route("/course/updateCourseTeacherSubject")]
        public IActionResult UpdateCourseTeacherSubject([FromBody] CourseTeacherReq request)
        {
            var result = ApiHelper<SaveTeacherCourseRes>.HttpAsync($"course/updateCourseTeacherSubject","POST", request);
            return Json(new { data = result });
        }
    }
}
