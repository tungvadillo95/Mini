using CB.Domain.Request.Account;
using CB.Domain.Response;
using CB.Domain.Response.Account;
using CB.Domain.Response.User;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface IAccountRepository
    {
        Task<RefreshTokenRes> SaveRefreshToken(SaveRefreshTokenReq req);
        Task<SaveUserRes> Login(LoginReq loginReq);
        Task<ResultRes> RevokedRefreshToken(SaveRefreshTokenReq req);
        Task<ResultRes> CheckRefreshToken(SaveRefreshTokenReq req);
        void DeletedRefreshTokenExpired(string accountId);
    }
}
