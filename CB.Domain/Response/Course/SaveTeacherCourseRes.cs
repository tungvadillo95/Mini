using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Course
{
    public class SaveTeacherCourseRes : ResultRes
    {
        public int CourseId { get; set; }
        public string TeacherId { get; set; }
    }
}
