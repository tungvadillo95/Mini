using CB.DAL.Interface;
using CB.Domain.Response.Course;
using CB.Domain.Response.Teacher;
using CB.Domain.Response.User;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class TeacherRepository : BaseRepository,ITeacherRepository
    {
        public async Task<UserView> Get(string teacherId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", teacherId);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetTeacher",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<CourseView> GetCourseIdByTeacherMasterId(string teacherId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@TeacherId", teacherId);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<CourseView>(cnn: connection,
                                                                                sql: "sp_GetCourseIdByTeacherMasterId",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<UserView>> Gets()
        {
            try
            {
                var result = await SqlMapper.QueryAsync<UserView>(cnn: connection,
                                                                sql: "sp_GetAllTeachers",
                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<UserView> GetTeacherMaster(int courseId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", courseId);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetTeacherMaster",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<IEnumerable<TeacherCourse>> GetCourseTeacherSubject(int courseId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", courseId);
                var result = await SqlMapper.QueryAsync<TeacherCourse>(cnn: connection,
                                                                                sql: "sp_GetCourseTeacherSubject",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<IEnumerable<TeacherCourse>> GetTeachersSubject(int subjectId)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@SubjectId", subjectId);
                var result = await SqlMapper.QueryAsync<TeacherCourse>(cnn: connection,
                                                                                sql: "sp_GetTeachersSubject",
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
