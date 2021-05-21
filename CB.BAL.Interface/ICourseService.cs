using CB.Domain.Request.Course;
using CB.Domain.Response.Course;
using CB.Domain.Response.Student;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface ICourseService
    {
        Task<IEnumerable<CourseView>> Gets();
        Task<SaveTeacherCourseRes> UpdateCourseTeacherSubject(CourseTeacherReq request);
        Task<CourseTeacherRes> GetCourseTeacherSubject(int courseId);
        Task<IEnumerable<CourseView>> GetCoursesTeaching(string teacherId);
    }
}
