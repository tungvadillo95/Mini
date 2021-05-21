using CB.Domain.Response.Role;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface IRoleService
    {
        Task<IEnumerable<RoleView>> Gets();
        Task<RoleView> Get(string roleName);
    }
}
