using CB.DAL.Interface;
using CB.Domain.Request.Transcript;
using CB.Domain.Response.Student;
using CB.Domain.Response.Transcript;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class TranscriptRepository : BaseRepository, ITranscriptRepository
    {

        public async Task<IEnumerable<StudentPoint>> GetStudentsPoint(int courseId, int subjectId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", courseId);
                parameters.Add("@SubjectId", subjectId);
                var result = await SqlMapper.QueryAsync<StudentPoint>(cnn: connection,
                                                                                sql: "sp_GetStudentsPointInCourse",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<StudentPoint> GetStudentPoint(string studentId, int subjectId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@StudentId", studentId);
                parameters.Add("@SubjectId", subjectId);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<StudentPoint>(cnn: connection,
                                                                                sql: "sp_GetStudentPoint",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<SaveTranscriptRes> SaveStudentPoint(SaveTranscriptReq request)
        {
            var result = new SaveTranscriptRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@IsUpdate", request.IsUpdate);
                    parameters.Add("@StudentId", request.StudentId);
                    parameters.Add("@SubjectId", request.SubjectId);
                    parameters.Add("@Coefficient", request.Coefficient);
                    parameters.Add("@Score", request.Score);
                    parameters.Add("@Scores", request.Scores);
                    parameters.Add("@GeneratebBy", request.GeneratebBy);
                    result = await SqlMapper.QueryFirstOrDefaultAsync<SaveTranscriptRes>(cnn: connection,
                                                                        sql: "sp_SaveStudentPoint",
                                                                        param: parameters,
                                                                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch
            {
                return result;
            }
        }
        public async Task<IEnumerable<DetailsStudentPoint>> GetDetailsStudentPoint(string studentId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@StudentId", studentId);
                var result = await SqlMapper.QueryAsync<DetailsStudentPoint>(cnn: connection,
                                                                                sql: "sp_GetDetailsStudentPoint",
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
