using CB.DAL.Interface;
using CB.Domain.Response.Role;
using Dapper;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CB.DAL.Implement
{
    public class RoleRepository : BaseRepository, IRoleRepository
    {
        public async Task<IEnumerable<RoleView>> Gets()
        {
            try
            {
                return await SqlMapper.QueryAsync<RoleView>(cnn: connection,
                                                        sql: "sp_GetRoles",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<RoleView> Get(string roleName)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@RoleName", roleName);
                return await SqlMapper.QueryFirstOrDefaultAsync<RoleView>(cnn: connection,
                                                                                sql: "sp_GetRoleId",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
