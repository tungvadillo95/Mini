using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.Transcript
{
    public class SaveTranscriptReq
    {
        public bool IsUpdate { get; set; }
        public string StudentId { get; set; }
        public int SubjectId { get; set; }
        public int Coefficient { get; set; }
        public float Score { get; set; }
        public string Scores { get; set; }
        public string GeneratebBy { get; set; }
    }
}
