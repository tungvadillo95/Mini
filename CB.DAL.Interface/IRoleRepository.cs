using CB.Domain.Response.Role;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface IRoleRepository
    {
        Task<IEnumerable<RoleView>> Gets();
        Task<RoleView> Get(string roleName);
    }
}
