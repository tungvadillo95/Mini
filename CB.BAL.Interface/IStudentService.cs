using CB.Domain.Request.User;
using CB.Domain.Response.Course;
using CB.Domain.Response.User;
using System.Threading.Tasks;

namespace CB.BAL.Interface
{
    public interface IStudentService
    {
        Task<CourseDetails> Get(int courseId);
        Task<UserView> Get(string  accountId);
        Task<SaveUserRes> Create(SaveUserReq request);
        Task<SaveUserRes> Edit(SaveUserReq request);
        Task<SaveUserRes> ChangeStatus(StatusUserReq request);
    }
}
