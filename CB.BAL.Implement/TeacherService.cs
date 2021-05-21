using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.Teacher;
using CB.Domain.Response.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class TeacherService : ITeacherService
    {
        private readonly ITeacherRepository teacherRepository;
        private readonly IRoleRepository roleRepository;
        private readonly IUserRepository userRepository;

        public TeacherService(ITeacherRepository teacherRepository,
                                IRoleRepository roleRepository,
                                IUserRepository userRepository)
        {
            this.teacherRepository = teacherRepository;
            this.roleRepository = roleRepository;
            this.userRepository = userRepository;
        }
        public async Task<UserView> Get(string teacherId)
        {
            return await teacherRepository.Get(teacherId);
        }

        public async Task<IEnumerable<UserView>> Gets()
        {
            return await teacherRepository.Gets();
        }
        public async Task<SaveUserRes> Create(SaveUserReq request)
        {
            var role = await roleRepository.Get(request.RoleName);
            request.RoleId = role.RoleId;
            return await userRepository.Create(request);
        }

        public async Task<SaveUserRes> Edit(SaveUserReq request)
        {
            return await userRepository.Edit(request);
        }
        public async Task<SaveUserRes> ChangeStatus(StatusUserReq request)
        {
            return await userRepository.ChangeStatus(request);
        }

        public async Task<IEnumerable<TeacherCourse>> GetTeachersSubject(int subjectId)
        {
            return await teacherRepository.GetTeachersSubject(subjectId);
        }

        public async Task<CourseView> GetCourseIdByTeacherMasterId(string teacherId)
        {
            return await teacherRepository.GetCourseIdByTeacherMasterId(teacherId);
        }
    }
}
