using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Transcript
{
    public class DetailsStudentPoint
    {
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
        public string TeacherName { get; set; }
        public string Coefficient1 { get; set; }
        public string Coefficient2 { get; set; }
        public string Coefficient3 { get; set; }
    }
}
