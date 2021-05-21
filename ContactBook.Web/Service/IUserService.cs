using Microsoft.AspNetCore.Http;

namespace ContactBook.Web.Service
{
    public interface IUserService
    {
        void SaveImg(IFormFile img, string imgPath);
        string ProcessImgPath(IFormFile file);
        void CreateImg(IFormFile file, string fileName);
        void EditImg(IFormFile file, string fileName, string fileNameOld);
    }
}
