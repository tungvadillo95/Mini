using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Response.Subject;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class SubjectService : ISubjectService
    {
        private readonly ISubjectRepository subjectRepository;

        public SubjectService(ISubjectRepository subjectRepository)
        {
            this.subjectRepository = subjectRepository;
        }
        public async Task<IEnumerable<SubjectView>> Gets()
        {
            return await subjectRepository.Gets();
        }

        public async Task<IEnumerable<SubjectView>> GetSubjectTeachingInCourse(string teacherId, int courseId)
        {
            return await subjectRepository.GetSubjectTeachingInCourse(teacherId, courseId);
        }
    }
}
