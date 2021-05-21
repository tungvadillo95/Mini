using CB.Domain.Response.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Course
{
    public class CourseDetails : ResultRes
    {
        public UserView TeacherMaster { get; set; }
        public IEnumerable<UserView> Students { get; set; }
    }
}
