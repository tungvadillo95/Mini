using CB.BAL.Interface;
using CB.Domain.Request.Account;
using ContactBook.API.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ContactBook.API.Controllers
{
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ITokenService tokenService;
        private readonly IAccountService accountService;
        private readonly IConfiguration config;

        public AccountController(ITokenService tokenService,
                                IAccountService accountService,
                                IConfiguration config)
        {
            this.tokenService = tokenService;
            this.accountService = accountService;
            this.config = config;
        }
        [HttpPost("api/account/login")]
        public async Task<IActionResult> Login([FromBody] LoginReq req)
        {
            var login = await accountService.Login(req);
            if(login.Email != null)
            {
                var claims = new List<Claim> {
                     new Claim(JwtRegisteredClaimNames.Sub, config["Jwt:Subject"]),
                     new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                     new Claim(JwtRegisteredClaimNames.Iat, DateTime.Now.ToString()),
                     new Claim(ClaimTypes.Name, login.AccountId )
                    };
                foreach (var role in login.Roles)
                {
                    claims.Add(new Claim(ClaimTypes.Role, role));
                }
                var refreshToken = new SaveRefreshTokenReq()
                {
                    AccountId = login.AccountId,
                    RefreshToken = tokenService.GenerateRefreshToken()
                };
                var accessToken = tokenService.GenerateAccessToken(claims);
                var saveRefreshToken = await accountService.SaveRefreshToken(refreshToken);
                if(saveRefreshToken.TokenId > 0)
                {
                    accountService.DeletedRefreshTokenExpired(login.AccountId);
                    return Ok(new
                    {
                        AccessToken = accessToken,
                        RefreshToken = refreshToken.RefreshToken
                    });
                }
            }
            return Ok();
        }
        [HttpPost("api/account/refreshToken")]
        public async Task<IActionResult> RefreshToken([FromBody] RefreshTokenReq req)
        {
            var principal = tokenService.GetPrincipalFromExpiredToken(req.AccessToken);
            var userId = principal.Identity.Name;
            var checkReq = new SaveRefreshTokenReq()
            {
                AccountId = userId,
                RefreshToken = req.RefreshToken
            };
            var checkExpiry = await accountService.CheckRefreshToken(checkReq);
            if (checkExpiry.IsSuccess)
            {
                //var refreshToken = new SaveRefreshTokenReq()
                //{
                //    AccountId = userId,
                //    RefreshToken = tokenService.GenerateRefreshToken()
                //};
                var accessToken = tokenService.GenerateAccessToken(principal.Claims);
                //var saveRefreshToken = await accountService.SaveRefreshToken(refreshToken);
                //if (saveRefreshToken.TokenId > 0)
                //{
                //var revokeReq = new SaveRefreshTokenReq()
                //{
                //    AccountId = userId,
                //    RefreshToken = req.RefreshToken
                //};
                //var revokeToken = await accountService.RevokedRefreshToken(revokeReq);
                //if (revokeToken.IsSuccess)
                //{
                return Ok(new
                {
                    AccessToken = accessToken,
                    RefreshToken = req.RefreshToken
                });
                //}
                //}
            }
            return Ok();
        }
        //[HttpPost("api/account/refreshToken")]
        //public async Task<IActionResult> RefreshToken([FromBody] RefreshTokenReq req)
        //{
        //    var principal = tokenService.GetPrincipalFromExpiredToken(req.AccessToken);
        //    var userId = principal.Identity.Name;
        //    var checkReq = new SaveRefreshTokenReq()
        //    {
        //        AccountId = userId,
        //        RefreshToken = req.RefreshToken
        //    };
        //    var checkExpiry = await accountService.CheckRefreshToken(checkReq);
        //    if (checkExpiry.IsSuccess)
        //    {
        //        var refreshToken = new SaveRefreshTokenReq()
        //        {
        //            AccountId = userId,
        //            RefreshToken = tokenService.GenerateRefreshToken()
        //        };
        //        var accessToken = tokenService.GenerateAccessToken(principal.Claims);
        //        var saveRefreshToken = await accountService.SaveRefreshToken(refreshToken);
        //        if(saveRefreshToken.TokenId > 0)
        //        {
        //            var revokeReq = new SaveRefreshTokenReq()
        //            {
        //                AccountId = userId,
        //                RefreshToken = req.RefreshToken
        //            };
        //            var revokeToken = await accountService.RevokedRefreshToken(revokeReq);
        //            if (revokeToken.IsSuccess)
        //            {
        //                return Ok(new
        //                {
        //                    AccessToken = accessToken,
        //                    RefreshToken = saveRefreshToken.RefreshToken
        //                });
        //            }
        //        }
        //    }
        //    return Ok();
        //}
        [Authorize(Roles = "System Admin")]
        [HttpPost("api/account/revokeToken/{accountId}")]
        public async Task<IActionResult> RevokeToken(string accountId)
        {
            var revokeReq = new SaveRefreshTokenReq()
            {
                AccountId = accountId,
                RefreshToken = null
            };
            var revokeToken = await accountService.RevokedRefreshToken(revokeReq);
            return Ok(new
            {
                IsSuccess = revokeToken.IsSuccess,
                Message = revokeToken.Message
            });
        }

        [HttpPost("api/account/revokeToken")]
        public async Task<IActionResult> RevokeToken([FromBody] RefreshTokenReq req)
        {
            var principal = tokenService.GetPrincipalFromExpiredToken(req.AccessToken);
            var userId = principal.Identity.Name;
            var revokeReq = new SaveRefreshTokenReq()
            {
                AccountId = userId,
                RefreshToken = req.RefreshToken
            };
            var revokeToken = await accountService.RevokedRefreshToken(revokeReq);
            return Ok(new
            {
                IsSuccess = revokeToken.IsSuccess,
                Message = revokeToken.Message
            });
        }
    }
}
