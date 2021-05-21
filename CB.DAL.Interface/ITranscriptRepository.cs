using CB.Domain.Request.Transcript;
using CB.Domain.Response.Student;
using CB.Domain.Response.Transcript;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface ITranscriptRepository
    {
        Task<IEnumerable<StudentPoint>> GetStudentsPoint(int courseId, int subjectId);
        Task<StudentPoint> GetStudentPoint(string studentId, int subjectId);
        Task<SaveTranscriptRes> SaveStudentPoint(SaveTranscriptReq request);
        Task<IEnumerable<DetailsStudentPoint>> GetDetailsStudentPoint(string studentId);
    }
}
