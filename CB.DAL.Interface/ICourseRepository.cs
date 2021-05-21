using CB.Domain.Request.Course;
using CB.Domain.Response.Course;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface ICourseRepository
    {
        Task<IEnumerable<CourseView>> Gets();
        Task<CourseView> Get(int courseId);
        Task<SaveTeacherCourseRes> UpdateCourseTeacherSubject(CourseTeacherReq request);
        Task<IEnumerable<CourseView>> GetCoursesTeaching(string teacherId);
    }
}
