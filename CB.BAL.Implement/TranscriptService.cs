using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.Transcript;
using CB.Domain.Response.Course;
using CB.Domain.Response.Student;
using CB.Domain.Response.Transcript;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class TranscriptService : ITranscriptService
    {
        private readonly ITranscriptRepository transcriptRepository;
        private readonly ICourseRepository courseRepository;

        public TranscriptService(ITranscriptRepository transcriptRepository,
                                ICourseRepository courseRepository)
        {
            this.transcriptRepository = transcriptRepository;
            this.courseRepository = courseRepository;
        }
        public async Task<CourseStudentsPoint> GetStudentsPoint(int courseId, int subjectId)
        {
            var result = new CourseStudentsPoint()
            {
                StudentPoints = await transcriptRepository.GetStudentsPoint(courseId, subjectId),
                Course = await courseRepository.Get(courseId)
            };
            return result;
        }

        public async Task<StudentPoint> GetStudentPoint(string studentId, int subjectId)
        {
            return await transcriptRepository.GetStudentPoint(studentId, subjectId);
        }
        public async Task<SaveTranscriptRes> SaveStudentPoint(SaveTranscriptReq request)
        {
            return await transcriptRepository.SaveStudentPoint(request);
        }

        public async Task<IEnumerable<DetailsStudentPoint>> GetDetailsStudentPoint(string studentId)
        {
            return await transcriptRepository.GetDetailsStudentPoint(studentId);
        }
    }
}
