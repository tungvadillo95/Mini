using CB.Domain.Response.Subject;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Teacher
{
    public class TeacherCourse : SubjectView
    {
        public string TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string AvatarPath { get; set; }
    }
}
