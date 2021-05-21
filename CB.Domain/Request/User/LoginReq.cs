using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.User
{
    public class LoginReq
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
