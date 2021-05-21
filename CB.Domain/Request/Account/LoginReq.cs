using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.Account
{
    public class LoginReq
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
