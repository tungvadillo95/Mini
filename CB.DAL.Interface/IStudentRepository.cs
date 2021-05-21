using CB.Domain.Response.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CB.DAL.Interface
{
    public interface IStudentRepository
    {
        Task<IEnumerable<UserView>> Gets(int courseId);
    }
}
