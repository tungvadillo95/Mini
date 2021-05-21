using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Course
{
    public class CourseView
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public string TeacherName { get; set; }
        public int Member { get; set; }
    }
}
