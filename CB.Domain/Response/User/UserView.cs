using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.User
{
    public class UserView : ResView
    {
        public string AccountId { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime Dob { get; set; }
        public string DobStr { get; set; }
        public bool Gender { get; set; }
        public string Address { get; set; }
        public string AvatarPath { get; set; }
        public string RoleName { get; set; }
        //public string RoleId { get; set; }???
        public string SubjectsStr { get; set; }
        public string SubjectIds { get; set; }
        public string Courses { get; set; }
        public string Responsible { get; set; }
        public int ResponsibleId { get; set; }
        public int CourseId { get; set; }
    }
}
