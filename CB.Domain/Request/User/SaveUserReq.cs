using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace CB.Domain.Request.User
{
    public class SaveUserReq : ReqModel
    {
        public string AccountId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime Dob { get; set; }
        public bool Gender { get; set; }
        public string Address { get; set; }
        public string AvatarPath { get; set; }
        public string RoleName { get; set; }
        public string RoleId { get; set; }
        public string Subjects { get; set; }
        public int CourseId { get; set; }
        public IFormFile Avatar { get; set; }
    }
}
