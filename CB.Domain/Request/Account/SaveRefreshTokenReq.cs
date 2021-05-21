using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.Account
{
    public class SaveRefreshTokenReq
    {
        public string AccountId { get; set; }
        public string RefreshToken { get; set; }
    }
}
