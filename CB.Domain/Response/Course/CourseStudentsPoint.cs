using CB.Domain.Response.Student;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Course
{
    public class CourseStudentsPoint
    {
        public IEnumerable<StudentPoint> StudentPoints { get; set; }
        public CourseView Course { get; set; }
    }
}
