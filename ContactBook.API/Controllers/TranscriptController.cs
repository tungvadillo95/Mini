using CB.BAL.Interface;
using CB.Domain.Request.Transcript;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class TranscriptController : ControllerBase
    {
        private readonly ITranscriptService transcriptService;

        public TranscriptController(ITranscriptService transcriptService)
        {
            this.transcriptService = transcriptService;
        }
        [HttpGet("api/transcript/getStudentsPoint/{courseId}/{subjectId}")]
        public async Task<OkObjectResult> GetStudentsPoint(int courseId, int subjectId)
        {
            var studentsPoint = await transcriptService.GetStudentsPoint(courseId, subjectId);
            return Ok(studentsPoint);
        }
        [HttpGet("api/transcript/getStudentPoint/{studentId}/{subjectId}")]
        public async Task<OkObjectResult> GetStudentPoint(string studentId, int subjectId)
        {
            var studentPoint = await transcriptService.GetStudentPoint(studentId, subjectId);
            return Ok(studentPoint);
        }
        [HttpGet("api/transcript/getDetalisStudentPoint/{studentId}")]
        public async Task<OkObjectResult> GetStudentPoint(string studentId)
        {
            var studentPoint = await transcriptService.GetDetailsStudentPoint(studentId);
            return Ok(studentPoint);
        }
        [HttpPost]
        [Route("/api/transcript/saveStudentPoint")]
        public async Task<OkObjectResult> SaveStudentPoint(SaveTranscriptReq request)
        {
            var result = await transcriptService.SaveStudentPoint(request);
            return Ok(result);
        }
    }
}
