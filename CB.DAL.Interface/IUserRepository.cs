using CB.Domain.Request.User;
using CB.Domain.Response.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface IUserRepository
    {
        Task<IEnumerable<UserView>> Gets(int courseId, string roleName);
        Task<UserView> Get(string id);
        Task<SaveUserRes> Create(SaveUserReq request);
        Task<SaveUserRes> Edit(SaveUserReq request);
        Task<SaveUserRes> ChangeStatus(StatusUserReq request);
        Task<SaveUserRes> CheckLoginUser(string email);
    }
}
