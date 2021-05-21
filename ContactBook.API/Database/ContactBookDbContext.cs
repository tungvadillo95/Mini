using CB.DAL.Implement;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace ContactBook.API.Database
{
    public class ContactBookDbContext : IdentityDbContext<ApplicationUser>
    {
        public ContactBookDbContext(DbContextOptions<ContactBookDbContext> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //string ADMIN_ID ="02174cf0–9412–4cfe-afbf-59f706d72cf6";
            //string ROLE_ID = "341743f0-asd2–42de-afbf-59kmkkmk72cf6";

            ////seed admin role
            //modelBuilder.Entity<IdentityRole>().HasData(new IdentityRole
            //{
            //    Name = "SuperAdmin",
            //    NormalizedName = "SuperAdmin",
            //    Id = ROLE_ID,
            //    ConcurrencyStamp = ROLE_ID
            //});

            ////create user
            //var appUser = new ApplicationUser
            //{
            //    Id = ADMIN_ID,
            //    Email = "superadmin@gmail.com",
            //    EmailConfirmed = true,
            //    FullName = "Nguyễn Admin",
            //    UserName = "superadmin@gmail.com",
            //    Dob = new DateTime(1995, 10, 19),
            //    Gender = true,
            //    Address = "1 Lê Quý Đôn, Huế",
            //    CreatedDate = new DateTime(2021, 3, 2),
            //    CreatedBy = "admin",
            //    ModifiedDate = new DateTime(2021, 3, 2),
            //    ModifiedBy = "admin",
            //    AvatarPath = "none_avatar",
            //    CourseId = 1,
            //    StatusId = 1
            //};

            ////set user password
            //PasswordHasher<ApplicationUser> ph = new PasswordHasher<ApplicationUser>();
            //appUser.PasswordHash = ph.HashPassword(appUser, "Asd123!");

            ////seed user
            //modelBuilder.Entity<ApplicationUser>().HasData(appUser);

            ////set user role to admin
            //modelBuilder.Entity<IdentityUserRole<string>>().HasData(new IdentityUserRole<string>
            //{
            //    RoleId = ROLE_ID,
            //    UserId = ADMIN_ID
            //});
        }
    }
}
