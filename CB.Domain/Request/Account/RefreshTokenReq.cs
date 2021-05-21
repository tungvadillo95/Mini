using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.Account
{
    public class RefreshTokenReq
    {
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
    }
}
