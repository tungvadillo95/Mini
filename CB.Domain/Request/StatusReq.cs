using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request
{
    public class StatusReq
    {
        public int StatusId { get; set; }
        public string ModifiedBy { get; set; }
    }
}
