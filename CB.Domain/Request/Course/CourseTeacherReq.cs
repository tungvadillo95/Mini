using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.Course
{
    public class CourseTeacherReq
    {
        public int CourseId { get; set; }
        public string TeacherId { get; set; }
        public int SubjectId { get; set; }
    }
}
