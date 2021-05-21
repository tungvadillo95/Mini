using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Response.Student
{
    public class StudentPoint
    {
        public string AccountId { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public string DobStr { get; set; }
        public bool Gender { get; set; }
        public string AvatarPath { get; set; }
        public string PhoneNumber { get; set; }
        public string Coefficient1 { get; set; }
        public string Coefficient2 { get; set; }
        public string Coefficient3 { get; set; }
    }
}
