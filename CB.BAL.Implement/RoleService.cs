using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Response.Role;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class RoleService : IRoleService
    {
        private readonly IRoleRepository roleRepository;

        public RoleService(IRoleRepository roleRepository)
        {
            this.roleRepository = roleRepository;
        }

        public async Task<RoleView> Get(string roleName)
        {
            return await roleRepository.Get(roleName);
        }

        public async Task<IEnumerable<RoleView>> Gets()
        {
            return await roleRepository.Gets();
        }
    }
}
