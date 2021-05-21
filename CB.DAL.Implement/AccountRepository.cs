using CB.DAL.Interface;
using CB.Domain.Request.Account;
using CB.Domain.Response;
using CB.Domain.Response.Account;
using CB.Domain.Response.User;
using Dapper;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class AccountRepository : BaseRepository, IAccountRepository
    {
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly UserManager<ApplicationUser> userManager;
        private readonly IUserRepository userRepository;

        public AccountRepository(SignInManager<ApplicationUser> signInManager,
                                UserManager<ApplicationUser> userManager,
                                IUserRepository userRepository
)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.userRepository = userRepository;
        }
        public async Task<RefreshTokenRes> SaveRefreshToken(SaveRefreshTokenReq req)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", req.AccountId);
                parameters.Add("@RefreshToken", req.RefreshToken);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<RefreshTokenRes>(cnn: connection,
                                                                                    sql: "sp_CreateToken",
                                                                                    param: parameters,
                                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<SaveUserRes> Login(LoginReq loginReq)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                var checkEmail = await userRepository.CheckLoginUser(loginReq.Email);
                if (checkEmail.Email != null)
                {
                    var account = await GetEmPwAccount(loginReq.Email);
                    var hashre = new PasswordHasher<LoginAccountRes>();
                    if (account.Email == loginReq.Email
                        && hashre.VerifyHashedPassword(account, account.PasswordHash, loginReq.Password)!= PasswordVerificationResult.Failed)
                    {
                        result.Message = "Đăng nhập thành công";
                        result.AccountId = account.AccountId;
                        result.Email = account.Email;
                        var arrRole = account.Roles.Split(",");
                        result.Roles = arrRole.AsList<string>() ;
                    }
                    else
                    {
                        result.Message = "Mật khẩu không đúng";
                    }
                }
                else
                {
                    result.Message = checkEmail.Message;
                }
                return result;
            }
            catch
            {
                return result;
            }

        }
        //public async Task<SaveUserRes> Login(LoginReq loginReq)
        //{
        //    var result = new SaveUserRes()
        //    {
        //        Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
        //    };
        //    try
        //    {
        //        var checkEmail = await userRepository.CheckLoginUser(loginReq.Email);
        //        if (checkEmail.Email != null)
        //        {
        //            var siginResult = await signInManager.PasswordSignInAsync(loginReq.Email, loginReq.Password, false, false);
        //            if (siginResult.Succeeded)
        //            {
        //                var user = await userManager.FindByNameAsync(loginReq.Email);
        //                var roles = await userManager.GetRolesAsync(user);
        //                if (user != null)
        //                {
        //                    result.Message = "Đăng nhập thành công";
        //                    result.AccountId = user.Id;
        //                    result.Avatarpath = user.AvatarPath;
        //                    result.Email = user.Email;
        //                    result.FullName = user.FullName;
        //                    result.Roles = (List<string>)roles;
        //                }
        //            }
        //            else
        //            {
        //                result.Message = "Mật khẩu không đúng";
        //            }
        //        }
        //        else
        //        {
        //            result.Message = checkEmail.Message;
        //        }
        //        return result;
        //    }
        //    catch
        //    {
        //        return result;
        //    }

        //}
        public async Task<LoginAccountRes> GetEmPwAccount(string email)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Email", email);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<LoginAccountRes>(cnn: connection,
                                                                                    sql: "sp_GetEmPwAccount",
                                                                                    param: parameters,
                                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<ResultRes> RevokedRefreshToken(SaveRefreshTokenReq req)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", req.AccountId);
                parameters.Add("@RefreshToken", req.RefreshToken);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<ResultRes>(cnn: connection,
                                                                                    sql: "sp_RevokedRefreshToken",
                                                                                    param: parameters,
                                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<ResultRes> CheckRefreshToken(SaveRefreshTokenReq req)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", req.AccountId);
                parameters.Add("@RefreshToken", req.RefreshToken);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<ResultRes>(cnn: connection,
                                                                                    sql: "sp_CheckRefreshToken",
                                                                                    param: parameters,
                                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async void DeletedRefreshTokenExpired(string accountId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", accountId);
                await SqlMapper.QueryFirstOrDefaultAsync(cnn: connection,
                                                        sql: "sp_DeleteRefreshTokenExpired",
                                                        param: parameters,
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
