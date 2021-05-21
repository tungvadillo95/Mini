using CB.Domain.Request.Transcript;
using CB.Domain.Response.Course;
using CB.Domain.Response.Student;
using CB.Domain.Response.Transcript;
using ContactBook.Web.Models;
using ContactBook.Web.Ultilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace ContactBook.Web.Controllers
{
    [Authorize]
    public class TranscriptController : Controller
    {
        private readonly UserManager<ApplicationUser> userManager;

        public TranscriptController(UserManager<ApplicationUser> userManager)
        {
            this.userManager = userManager;
        }
        [Authorize(Roles = "Giáo viên, System Admin")]
        [Route("/transcript/index")]
        public IActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = "Học sinh")]
        [HttpGet]
        [Route("/transcript/details")]
        public IActionResult Details()
        {
            return View();
        }

        [HttpGet]
        [Route("/transcript/getDetalisStudentPoint/{studentId}")]
        public IActionResult GetDetalisStudentPoint(string studentId)
        {
            var detailsPoint = ApiHelper<List<DetailsStudentPoint>>.HttpGetAsync($"transcript/getDetalisStudentPoint/{studentId}");
            return Json(new { data = detailsPoint });
        }

        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/transcript/getStudentsPoint/{courseId}/{subjectId}")]
        public IActionResult GetStudentsPoint(int courseId, int subjectId)
        {
            var studentsPoint = ApiHelper<CourseStudentsPoint>.HttpGetAsync($"transcript/getStudentsPoint/{courseId}/{subjectId}");
            return Json(new { data = studentsPoint });
        }
        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpGet]
        [Route("/transcript/getStudentPoint/{studentId}/{subjectId}")]
        public IActionResult GetStudentPoint(string studentId, int subjectId)
        {
            var studentPoint = ApiHelper<StudentPoint>.HttpGetAsync($"transcript/getStudentPoint/{studentId}/{subjectId}");
            return Json(new { data = studentPoint });
        }
        [Authorize(Roles = "Giáo viên, System Admin")]
        [HttpPost]
        [Route("/transcript/saveStudentPoint")]
        public IActionResult SaveStudentPoint([FromBody] SaveTranscriptReq request)
        {
            request.GeneratebBy = userManager.GetUserId(HttpContext.User);
            var result = ApiHelper<SaveTranscriptRes>.HttpAsync($"transcript/saveStudentPoint", "POST", request);
            return Json(new { data = result });
        }
    }
}
