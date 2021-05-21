using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.IO;

namespace ContactBook.Web.Service
{
    public class UserService : IUserService
    {
        private readonly IWebHostEnvironment webHostEnvironment;

        public UserService(IWebHostEnvironment webHostEnvironment)
        {
            this.webHostEnvironment = webHostEnvironment;
        }
        public void SaveImg(IFormFile img, string imgPath)
        {
            throw new NotImplementedException();
        }
        public string ProcessImgPath(IFormFile file)
        {
            string fileName = null;
            if (file != null)
            {
                fileName = $"{Guid.NewGuid()}_{file.FileName}";
            }
            return fileName;
        }
        public void CreateImg(IFormFile file, string fileName)
        {
            string uploadFolder = Path.Combine(webHostEnvironment.WebRootPath, "img");
            var filePath = Path.Combine(uploadFolder, fileName);
            using (var fs = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fs);
            }
        }
        public void EditImg(IFormFile file, string fileName, string fileNameOld)
        {
            if (file != null)
            {
                string uploadFolder = Path.Combine(webHostEnvironment.WebRootPath, "img");
                var filePath = Path.Combine(uploadFolder, fileName);
                using (var fs = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(fs);
                }
                if (!string.IsNullOrEmpty(fileNameOld) && (fileNameOld != "none_avatar.png"))
                {
                    string delFile = Path.Combine(webHostEnvironment.WebRootPath
                                        , "img", fileNameOld);
                    System.IO.File.Delete(delFile);
                }
            }
        }
    }
}
