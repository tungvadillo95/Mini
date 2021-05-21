using CB.DAL.Interface;
using CB.Domain.Response.Subject;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class SubjectRepository : BaseRepository, ISubjectRepository
    {
        public async Task<IEnumerable<SubjectView>> Gets()
        {
            try
            {
                return await SqlMapper.QueryAsync<SubjectView>(cnn: connection,
                                                        sql: "sp_GetSubjects",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<SubjectView>> GetSubjectTeachingInCourse(string teacherId, int courseId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@TeacherId", teacherId);
                parameters.Add("@CourseId", courseId);
                return await SqlMapper.QueryAsync<SubjectView>(cnn: connection, 
                                                        param: parameters,
                                                        sql: "sp_GetSubjectTeachingInCourse",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
