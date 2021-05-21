using CB.BAL.Interface;
using CB.Domain.Request.User;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentService studentService;

        public StudentController(IStudentService studentService)
        {
            this.studentService = studentService;
        }
        [HttpGet]
        [Route("/api/student/get/{accountId}")]
        public async Task<OkObjectResult> Get(string accountId)
        {
            var student = await studentService.Get(accountId);
            return Ok(student);
        }
        [HttpGet("/api/student/gets/{courseId}")]
        public async Task<OkObjectResult> Gets(int courseId)
        {
            var students = await studentService.Get(courseId);
            return Ok(students);
        }
        [HttpPost]
        [Route("/api/student/create")]
        public async Task<OkObjectResult> Create(SaveUserReq request)
        {
            var result = await studentService.Create(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/student/edit")]
        public async Task<OkObjectResult> Edit(SaveUserReq request)
        {
            var result = await studentService.Edit(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/student/changeStatusToActive/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToActive(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 1,
                ModifiedBy = modifiedBy
            };
            var result = await studentService.ChangeStatus(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/student/changeStatusToBlocked/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToBlocked(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 2,
                ModifiedBy = modifiedBy
            };
            var result = await studentService.ChangeStatus(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/student/changeStatusToDeleted/{accountId}/{modifiedBy}")]
        public async Task<OkObjectResult> ChangeStatusToDeleted(string accountId, string modifiedBy)
        {
            var request = new StatusUserReq()
            {
                AccountId = accountId,
                StatusId = 4,
                ModifiedBy = modifiedBy
            };
            var result = await studentService.ChangeStatus(request);
            return Ok(result);
        }
    }
}
