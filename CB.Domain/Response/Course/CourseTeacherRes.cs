using CB.Domain.Response.Teacher;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Course
{
    public class CourseTeacherRes
    {
        public CourseView Course { get; set; }
        public IEnumerable<TeacherCourse> Teachers { get; set; }
    }
}
