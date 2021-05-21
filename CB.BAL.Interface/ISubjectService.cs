using CB.Domain.Response.Subject;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface ISubjectService
    {
        Task<IEnumerable<SubjectView>> Gets();
        Task<IEnumerable<SubjectView>> GetSubjectTeachingInCourse(string teacherId, int courseId);
    }
}
