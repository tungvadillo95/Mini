using CB.Domain.Response.User;
using ContactBook.Web.Models;
using ContactBook.Web.Ultilities;
using ContactBook.Web.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ContactBook.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly UserManager<ApplicationUser> userManager;

        public AccountController(SignInManager<ApplicationUser> signInManager,
                                UserManager<ApplicationUser> userManager)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }
        [HttpGet]
        [Route("/account/getInfoUser")]
        public IActionResult GetInfoUser()
        {
            var user = new UserView();
            var userId = userManager.GetUserId(HttpContext.User);
            if (userId != null)
            {
                user = ApiHelper<UserView>.HttpGetAsync($"user/get/{userId}");
            }
            return Json(new { data = user });
        }
        [AllowAnonymous]
        [HttpPost]
        [Route("/account/login")]
        public async Task<ActionResult> Login([FromBody] LoginViewModel model)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                var siginResult = await signInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, false);
                if (siginResult.Succeeded)
                {
                    var user = await userManager.FindByNameAsync(model.Email);
                    var roles = await userManager.GetRolesAsync(user);
                    if (user != null)
                    {
                        result.Message = "Đăng nhập thành công";
                        result.AccountId = user.Id;
                        result.Avatarpath = user.AvatarPath;
                        result.Email = user.Email;
                        result.FullName = user.FullName;
                        result.Roles = (List<string>)roles;
                    }
                }
                else
                {
                    result.Message = "Mật khẩu không đúng";
                }
                return Json(new { data = result });
            }
            catch
            {
                return Json(new { data = result });
            }
        }
        [Authorize]
        [HttpPost]
        [Route("/account/logout")]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return Ok(true);
        }
        [AllowAnonymous]
        [HttpGet]
        [Route("/account/checkLoginUser/{email}")]
        public IActionResult CheckLoginUser(string email)
        {
            var result = ApiHelper<SaveUserRes>.HttpGetAsync($"user/checkLoginUser/{email}");
            return Json(new { data = result });
        }
        [Authorize]
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
