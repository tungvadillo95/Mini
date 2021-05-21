using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Account
{
    public class LoginAccountRes
    {
        public string AccountId { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public string Roles { get; set; }
    }
}
