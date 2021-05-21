using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace CB.DAL.Implement
{
    public class ApplicationUser : IdentityUser
    {
        [Required]
        [MaxLength(100)]
        public string FullName { get; set; }
        [Required]
        public DateTime Dob { get; set; }
        [Required]
        public bool Gender { get; set; }
        [Required]
        [MaxLength(200)]
        public string Address { get; set; }
        [Required]
        public DateTime CreatedDate { get; set; }
        [Required]
        [MaxLength(100)]
        public string CreatedBy { get; set; }
        [Required]
        public DateTime ModifiedDate { get; set; }
        [Required]
        [MaxLength(100)]
        public string ModifiedBy { get; set; }
        [Required]
        [MaxLength(200)]
        public string AvatarPath { get; set; }
        public int CourseId { get; set; }
        [Required]
        public int StatusId { get; set; }
    }
}
