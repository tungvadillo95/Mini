using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.Teacher;
using CB.Domain.Response.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface ITeacherService
    {
        Task<UserView> Get(string teacherId);
        Task<IEnumerable<UserView>> Gets();
        Task<SaveUserRes> Create(SaveUserReq request);
        Task<SaveUserRes> Edit(SaveUserReq request);
        Task<SaveUserRes> ChangeStatus(StatusUserReq request);
        Task<IEnumerable<TeacherCourse>> GetTeachersSubject(int subjectId);
        Task<CourseView> GetCourseIdByTeacherMasterId(string teacherId);
    }
}
