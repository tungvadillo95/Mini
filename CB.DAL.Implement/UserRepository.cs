using CB.DAL.Interface;
using CB.Domain.Request.User;
using CB.Domain.Response.User;
using Dapper;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class UserRepository : BaseRepository, IUserRepository
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;

        public UserRepository(UserManager<ApplicationUser> userManager,
                                 RoleManager<IdentityRole> roleManager)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
        }
        public async Task<SaveUserRes> ChangeStatus(StatusUserReq request)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", request.AccountId);
                parameters.Add("@StatusId", request.StatusId);
                parameters.Add("@ModifiedBy", request.ModifiedBy);
                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                                sql: "sp_ChangeStatusUser",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch
            {
                return result;
            }
        }

        public async Task<SaveUserRes> Create(SaveUserReq request)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                var user = ConvertObject(request);
                request.ModifiedBy = request.CreatedBy;
                var check = await CheckSave(request);
                if (check.Email != null)
                {
                    var resSave = await userManager.CreateAsync(user, request.Password);
                    if (resSave.Succeeded)
                    {
                        if (!string.IsNullOrEmpty(request.RoleId))
                        {
                            var role = await roleManager.FindByIdAsync(request.RoleId);
                            var addRoleResult = await userManager.AddToRoleAsync(user, role.Name);
                            if (addRoleResult.Succeeded)
                            {
                                result.Message = "Thao tác tạo mới Tài khoản thành công";
                                result.AccountId = user.Id;
                                result.Email = user.Email;
                                if (request.Subjects != null)
                                {
                                    request.AccountId = result.AccountId;
                                    await MappingDataTeacherSubject(request);
                                }
                            }
                        }
                    }
                    else
                    {
                        result.Message = "Thao tác tạo mới Tài khoản không thành công, có thể do email hoặc password không hợp lệ";
                    }
                }
                else
                {
                    result.Message = check.Message;
                }
                return result;
            }
            catch
            {
                return result;
            }
        }

        public async Task<SaveUserRes> Edit(SaveUserReq request)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                var check = await CheckSave(request);
                if (check.Email != null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@AccountId", request.AccountId);
                    parameters.Add("@Email", request.Email);
                    parameters.Add("@FullName", request.FullName);
                    parameters.Add("@Dob", request.Dob);
                    parameters.Add("@Gender", request.Gender);
                    parameters.Add("@PhoneNumber", request.PhoneNumber);
                    parameters.Add("@Address", request.Address);
                    parameters.Add("@AvatarPath", request.AvatarPath);
                    parameters.Add("@ModifiedBy", request.ModifiedBy);
                    parameters.Add("@CourseId", request.CourseId);
                    parameters.Add("@Subjects", request.Subjects);
                    result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                        sql: "sp_UpdateUser",
                                                                        param: parameters,
                                                                        commandType: CommandType.StoredProcedure);
                }
                else
                {
                    result.Message = check.Message;
                }

                return result;
            }
            catch
            {
                return result;
            }
        }
        public async Task<UserView> Get(string id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", id);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetUser",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<UserView>> Gets(int courseId, string roleName)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@CourseId", courseId);
                parameters.Add("@RoleName", roleName);
                var result = await SqlMapper.QueryAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetUsersInCourse",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ApplicationUser ConvertObject(SaveUserReq request)
        {
            var user = new ApplicationUser()
            {
                Email = request.Email,
                UserName = request.Email,
                PhoneNumber = request.PhoneNumber,
                FullName = request.FullName,
                Dob = request.Dob,
                Gender = request.Gender,
                Address = request.Address,
                AvatarPath = request.AvatarPath,
                CourseId = request.CourseId,
                ModifiedDate = DateTime.Now,
                ModifiedBy = request.CreatedBy,
                StatusId = 1,
                CreatedDate = DateTime.Now,
                CreatedBy = request.CreatedBy
            };
            return user;
        }
        public async Task<SaveUserRes> CheckSave(SaveUserReq request)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@AccountId", request.AccountId);
                parameters.Add("@Email", request.Email);
                parameters.Add("@FullName", request.FullName);
                parameters.Add("@Dob", request.Dob);
                parameters.Add("@PhoneNumber", request.PhoneNumber);
                parameters.Add("@Address", request.Address);
                parameters.Add("@AvatarPath", request.AvatarPath);
                parameters.Add("@ModifiedBy", request.ModifiedBy);
                parameters.Add("@CourseId", request.CourseId);
                parameters.Add("@RoleId", request.RoleId);
                parameters.Add("@Subjects", request.Subjects);
                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                                sql: "sp_CheckSaveUser",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch
            {
                return result;
            }
        }
        public async Task<SaveUserRes> MappingDataTeacherSubject(SaveUserReq request)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@TeacherId", request.AccountId);
                parameters.Add("@Subjects", request.Subjects);
                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                                sql: "sp_MappingDataTeacherSubject",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch 
            { 
                return result;
            }
        }
        public async Task<SaveUserRes> CheckLoginUser(string email)
        {
            var result = new SaveUserRes()
            {
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Email", email);
                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                                sql: "sp_CheckLoginUser",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch
            {
                return result;
            }
        }
    }
}
