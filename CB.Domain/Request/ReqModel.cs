﻿using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request
{
    public class ReqModel
    {
        public int StatusId { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedByName { get; set; }
    }
}
