using CB.BAL.Interface;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService roleService;

        public RoleController(IRoleService roleService)
        {
            this.roleService = roleService;
        }
        [HttpGet("api/role/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var roles = await roleService.Gets();
            return Ok(roles);
        }
        [HttpGet("api/role/get/{roleName}")]
        public async Task<OkObjectResult> Get(string roleName)
        {
            var role = await roleService.Get(roleName);
            return Ok(role);
        }
    }
}
