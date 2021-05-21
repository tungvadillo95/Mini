using CB.BAL.Interface;
using CB.Domain.Request.User;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService userService;

        public UserController(IUserService userService)
        {
            this.userService = userService;
        }
        [HttpPost]
        [Route("/api/user/create")]
        public async Task<OkObjectResult> Create(SaveUserReq request)
        {
            var result = await userService.Create(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("/api/user/edit")]
        public async Task<OkObjectResult> Edit(SaveUserReq request)
        {
            var result = await userService.Edit(request);
            return Ok(result);
        }
        [HttpGet]
        [Route("/api/user/get/{accountId}")]
        public async Task<OkObjectResult> Get(string accountId)
        {
            var result = await userService.Get(accountId);
            return Ok(result);
        }
        [HttpGet]
        [Route("/api/user/checkLoginUser/{email}")]
        public async Task<OkObjectResult> CheckLoginUser(string email)
        {
            var result = await userService.CheckLoginUser(email);
            return Ok(result);
        }
    }
}
