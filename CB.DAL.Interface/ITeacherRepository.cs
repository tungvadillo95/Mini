using CB.Domain.Response.Course;
using CB.Domain.Response.Teacher;
using CB.Domain.Response.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface ITeacherRepository
    {
        Task<UserView> GetTeacherMaster(int courseId);
        Task<UserView> Get(string teacherId);
        Task<IEnumerable<UserView>> Gets();
        Task<IEnumerable<TeacherCourse>> GetCourseTeacherSubject(int courseId);
        Task<IEnumerable<TeacherCourse>> GetTeachersSubject(int subjectId);
        Task<CourseView> GetCourseIdByTeacherMasterId(string teacherId);
    }
}
