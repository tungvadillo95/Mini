using CB.BAL.Interface;
using CB.Domain.Request.Course;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ICourseService courseService;

        public CourseController(ICourseService courseService)
        {
            this.courseService = courseService;
        }
        [Authorize(Roles = "System Admin")]
        [HttpGet("api/course/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var courses = await courseService.Gets();
            return Ok(courses);
        }
        [HttpGet("api/course/getCourseTeachersSubject/{courseId}")]
        public async Task<OkObjectResult> GetCourseTeachersSubject(int courseId)
        {
            var data = await courseService.GetCourseTeacherSubject(courseId);
            return Ok(data);
        }
        [HttpPost("api/course/updateCourseTeacherSubject")]
        public async Task<OkObjectResult> UpdateCourseTeacherSubject(CourseTeacherReq request)
        {
            var result = await courseService.UpdateCourseTeacherSubject(request);
            return Ok(result);
        }

        [HttpGet("api/course/getCoursesTeaching/{teacherId}")]
        public async Task<OkObjectResult> GetCoursesTeaching(string teacherId)
        {
            var data = await courseService.GetCoursesTeaching(teacherId);
            return Ok(data);
        }
    }
}
