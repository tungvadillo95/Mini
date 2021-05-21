using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Account
{
    public class RefreshTokenRes
    {
        public int TokenId { get; set; }
        public string RefreshToken { get; set; }
    }
}
