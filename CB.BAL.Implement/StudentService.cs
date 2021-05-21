using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.User;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class StudentService : IStudentService
    {
        private readonly IStudentRepository studentRepository;
        private readonly ITeacherRepository teacherRepository;
        private readonly IRoleRepository roleRepository;
        private readonly IUserRepository userRepository;

        public StudentService(IStudentRepository studentRepository,
                              ITeacherRepository teacherRepository,
                              IRoleRepository roleRepository,
                              IUserRepository userRepository)
        {
            this.studentRepository = studentRepository;
            this.teacherRepository = teacherRepository;
            this.roleRepository = roleRepository;
            this.userRepository = userRepository;
        }

        public async Task<SaveUserRes> ChangeStatus(StatusUserReq request)
        {
            return await userRepository.ChangeStatus(request);
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

        public async Task<CourseDetails> Get(int courseId)
        {
            var result = new CourseDetails();
            result.Students = await studentRepository.Gets(courseId);
            result.TeacherMaster = await teacherRepository.GetTeacherMaster(courseId);
            result.IsSuccess = true;
            return result;
        }

        public async Task<UserView> Get(string accountId)
        {
            return await userRepository.Get(accountId);
        }
    }
}
