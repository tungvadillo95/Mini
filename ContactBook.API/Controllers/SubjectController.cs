using CB.BAL.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    [Authorize]
    public class SubjectController : ControllerBase
    {
        private readonly ISubjectService subjectService;

        public SubjectController(ISubjectService subjectService)
        {
            this.subjectService = subjectService;
        }
        [Authorize(Roles = "GVCN")]
        [HttpGet("api/subject/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var subjects = await subjectService.Gets();
            return Ok(subjects);
        }
        [HttpGet("api/subject/getSubjectTeachingInCourse/{teacherId}/{courseId}")]
        public async Task<OkObjectResult> GetSubjectTeachingInCourse(string teacherId, int courseId)
        {
            var subjects = await subjectService.GetSubjectTeachingInCourse(teacherId, courseId);
            return Ok(subjects);
        }
    }
}
