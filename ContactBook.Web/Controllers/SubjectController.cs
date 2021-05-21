using CB.Domain.Response.Subject;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class SubjectController : Controller
    {
        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/subject/gets")]
        public IActionResult Gets()
        {
            var subjects = ApiHelper<List<SubjectView>>.HttpGetAsync($"subject/gets");
            return Json(new { data = subjects });
        }
        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/subject/getSubjectTeachingInCourse/{teacherId}/{courseId}")]
        public IActionResult GetDetalisStudentPoint(string teacherId, int courseId)
        {
            var teacherSubject = ApiHelper<List<SubjectView>>.HttpGetAsync($"subject/getSubjectTeachingInCourse/{teacherId}/{courseId}");
            return Json(new { data = teacherSubject });
        }
    }
}
