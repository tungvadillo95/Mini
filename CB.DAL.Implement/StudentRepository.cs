using CB.DAL.Interface;
using CB.Domain.Response.User;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class StudentRepository : BaseRepository, IStudentRepository
    {
        public async Task<IEnumerable<UserView>> Gets(int courseId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", courseId);
                var result = await SqlMapper.QueryAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetStudents",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
