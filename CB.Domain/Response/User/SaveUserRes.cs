using CB.Domain.Response.Role;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.User
{
    public class SaveUserRes : ResultRes
    {
        public string AccountId { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public string Avatarpath { get; set; }
        public List<string> Roles { get; set; }
        public string CourseName { get; set; }
    }
}
