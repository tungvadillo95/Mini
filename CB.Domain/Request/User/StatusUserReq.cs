using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.User
{
    public class StatusUserReq : StatusReq
    {
        public string AccountId { get; set; }
    }
}
