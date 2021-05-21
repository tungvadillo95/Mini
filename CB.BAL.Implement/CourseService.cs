using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.Course;
using CB.Domain.Response.Course;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class CourseService : ICourseService
    {
        private readonly ICourseRepository courseRepository;
        private readonly ITeacherRepository teacherRepository;

        public CourseService(ICourseRepository courseRepository,
                               ITeacherRepository teacherRepository)
        {
            this.courseRepository = courseRepository;
            this.teacherRepository = teacherRepository;
        }

        public async Task<IEnumerable<CourseView>> GetCoursesTeaching(string teacherId)
        {
            return await courseRepository.GetCoursesTeaching(teacherId);
        }

        public async Task<CourseTeacherRes> GetCourseTeacherSubject(int courseId)
        {
            var result = new CourseTeacherRes() { };
            result.Teachers = await teacherRepository.GetCourseTeacherSubject(courseId);
            result.Course = await courseRepository.Get(courseId);
            return result;
        }

        public async Task<IEnumerable<CourseView>> Gets()
        {
            return await courseRepository.Gets();
        }

        public async Task<SaveTeacherCourseRes> UpdateCourseTeacherSubject(CourseTeacherReq request)
        {
            return await courseRepository.UpdateCourseTeacherSubject(request);
        }
    }
}
