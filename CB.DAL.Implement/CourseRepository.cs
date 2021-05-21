using CB.DAL.Interface;
using CB.Domain.Request.Course;
using CB.Domain.Response.Course;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class CourseRepository : BaseRepository, ICourseRepository
    {
        public async Task<CourseView> Get(int courseId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@CourseId", courseId);
            var result = await SqlMapper.QueryFirstOrDefaultAsync<CourseView>(cnn: connection,
                                                                            sql: "sp_GetCourse",
                                                                            param: parameters,
                                                                            commandType: CommandType.StoredProcedure);
            return result;
        }

        public async Task<IEnumerable<CourseView>> Gets()
        {
            try
            {
                return await SqlMapper.QueryAsync<CourseView>(cnn: connection,
                                                        sql: "sp_GetCourses",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<SaveTeacherCourseRes> UpdateCourseTeacherSubject(CourseTeacherReq request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", request.CourseId);
                parameters.Add("@TeacherId", request.TeacherId);
                parameters.Add("@SubjectId", request.SubjectId);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<SaveTeacherCourseRes>(cnn: connection,
                                                                                sql: "sp_UpdateCourseTeacherSubject",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<IEnumerable<CourseView>> GetCoursesTeaching(string teacherId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@TeacherId", teacherId);
                return await SqlMapper.QueryAsync<CourseView>(cnn: connection,
                                                        param: parameters,
                                                        sql: "sp_GetCoursesTeaching",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
