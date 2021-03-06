using CB.Domain.Request.User;
using CB.Domain.Response.User;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface IUserService
    {
        Task<UserView> Get(string id);
        Task<SaveUserRes> Create(SaveUserReq request);
        Task<SaveUserRes> Edit(SaveUserReq request);
        Task<SaveUserRes> CheckLoginUser(string email);
    }
}
