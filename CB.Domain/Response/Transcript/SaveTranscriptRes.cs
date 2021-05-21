using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Transcript
{
    public class SaveTranscriptRes : ResultRes
    {
        public int TranscriptId { get; set; }
        public string StudentId { get; set; }
    }
}
