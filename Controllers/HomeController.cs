using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_SQL.Models;

namespace TP_SQL.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }
    public IActionResult Deportes()
    {
        return View();
    }
    public IActionResult Paises()
    {
        return View();
    }
    public IActionResult VerDetalleDeporte(int idDeporte)
    {
        return View();
    }
    public IActionResult VerDetallePais(int idPais)
    {
        return View();
    }
    public IActionResult VerDetalleDeportista(int idDeportista)
    {
        return View();
    }
    public IActionResult AgregarDeportista()
    {
        return View();
    }
    public IActionResult Creditos()
    {
        return View();
    }

    [HttpPost]
    public IActionResult GuardarDeportista(Deportista dep)
    {
        return RedirectToAction("Index");
    }
    public IActionResult EliminarDeportista (int idCandidato)
    {
        return RedirectToAction("Index");
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
