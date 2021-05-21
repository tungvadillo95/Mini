using CB.BAL.Interface;
using CB.DAL.Interface;
using CB.Domain.Request.Account;
using CB.Domain.Response;
using CB.Domain.Response.Account;
using CB.Domain.Response.User;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CB.BAL.Implement
{
    public class AccountService : IAccountService
    {
        private readonly IAccountRepository accountRepository;

        public AccountService(IAccountRepository accountRepository)
        {
            this.accountRepository = accountRepository;
        }

        public async Task<ResultRes> CheckRefreshToken(SaveRefreshTokenReq req)
        {
            return await accountRepository.CheckRefreshToken(req);
        }

        public void DeletedRefreshTokenExpired(string accountId)
        {
             accountRepository.DeletedRefreshTokenExpired(accountId);
        }

        public async Task<SaveUserRes> Login(LoginReq loginReq)
        {
            return await accountRepository.Login(loginReq);
        }

        public async Task<ResultRes> RevokedRefreshToken(SaveRefreshTokenReq req)
        {
            return await accountRepository.RevokedRefreshToken(req);
        }

        public async Task<RefreshTokenRes> SaveRefreshToken(SaveRefreshTokenReq req)
        {
            return await accountRepository.SaveRefreshToken(req);
        }
    }
}
