using Microsoft.AspNetCore.Mvc;

namespace ContactBook.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
