using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.User;
using CB.Domain.Response.User;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class UserService : IUserService
    {
        private readonly IUserRepository userRepository;
        private readonly IRoleRepository roleRepository;

        public UserService(IUserRepository userRepository,
                           IRoleRepository roleRepository)
        {
            this.userRepository = userRepository;
            this.roleRepository = roleRepository;
        }

        public async Task<SaveUserRes> CheckLoginUser(string email)
        {
            return await userRepository.CheckLoginUser(email);
        }

        public async Task<SaveUserRes> Create(SaveUserReq request)
        {
            var role = await roleRepository.Get(request.RoleName);
            request.RoleId = role.RoleName;
            return await userRepository.Create(request);
        }
        public async Task<SaveUserRes> Edit(SaveUserReq request)
        {
            return await userRepository.Edit(request);
        }
        public async Task<UserView> Get(string id)
        {
            return await userRepository.Get(id);
        }
    }
}
