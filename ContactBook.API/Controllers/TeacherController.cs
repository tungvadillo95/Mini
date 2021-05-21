using CB.BAL.Interface;
using CB.Domain.Request.User;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class TeacherController : ControllerBase
    {
        private readonly ITeacherService teacherService;

        public TeacherController(ITeacherService teacherService)
        {
            this.teacherService = teacherService;
        }
        [HttpGet]
        [Route("/api/teacher/getCourseIdByTeacherMasterId/{teacherId}")]
        public async Task<OkObjectResult> GetCourseIdByTeacherMasterId(string teacherId)
        {
            var courseId = await teacherService.GetCourseIdByTeacherMasterId(teacherId);
            return Ok(courseId);
        }
        [HttpGet]
        [Route("/api/teacher/get/{accountId}")]
        public async Task<OkObjectResult> Get(string accountId)
        {
            var teacher = await teacherService.Get(accountId);
            return Ok(teacher);
        }
        [HttpGet("/api/teacher/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var teachers = await teacherService.Gets();
            return Ok(teachers);
        }
        [HttpGet("/api/teacher/getTeacherSubject/{subjectId}")]
        public async Task<OkObjectResult> GetTeachersSubject(int subjectId)
        {
            var teachers = await teacherService.GetTeachersSubject(subjectId);
            return Ok(teachers);
        }
        [HttpPost]
        [Route("/api/teacher/create")]
        public async Task<OkObjectResult> Create(SaveUserReq request)
        {
            var result = await teacherService.Create(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/teacher/edit")]
        public async Task<OkObjectResult> Edit(SaveUserReq request)
        {
            var result = await teacherService.Edit(request);
            return Ok(result);
        }

        [HttpPatch]
        [Route("/api/teacher/changeStatusToActive/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToActive(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 1,
                ModifiedBy = modifiedBy
            };
            var result = await teacherService.ChangeStatus(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/teacher/changeStatusToBlocked/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToBlocked(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 2,
                ModifiedBy = modifiedBy
            };
            var result = await teacherService.ChangeStatus(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/teacher/changeStatusToDeleted/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToDeleted(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 4,
                ModifiedBy = modifiedBy
            };
            var result = await teacherService.ChangeStatus(request);
            return Ok(result);
        }
    }
}
