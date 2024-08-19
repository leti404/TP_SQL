using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_SQL.Models;

namespace TP_SQL.Controllers;

public class HomeController : Controller
{
    private readonly ILogger _logger;
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
        ViewBag.ListaDeportes = BD.ListarDeportes();
        return View();
    }
    public IActionResult Paises()
    {
        ViewBag.ListaPaises = BD.ListarPaises();
        return View();
    }
    public IActionResult VerDetalleDeporte(int idDeporte)
    {
        ViewBag.DetalleDeporte = BD.VerInfoDeporte(idDeporte); 
        ViewBag.DeportistasPorDeporte = BD.ListarDeportistasPorDeporte(idDeporte); 
        return View();
    }
    public IActionResult VerDetallePais(int idPais)
    {
        ViewBag.DetallePais = BD.VerInfoPais(idPais); 
        ViewBag.DeportistasPorPais = BD.ListarDeportistasPorPais(idPais); 
        return View();
    }
    public IActionResult VerDetalleDeportista(int idDeportista)
    {
        ViewBag.DetalleDeportista = BD.VerInfoDeportista(idDeportista); 
        return View();
    }
    public IActionResult AgregarDeportista()
    {
        ViewBag._ListadoPaises = BD.ListarPaises();
        ViewBag._ListadoDeportes = BD.ListarDeportes();
        return View(); 
    }
    public IActionResult Creditos()
    {
        return View();
    }
    public IActionResult Historia()
    {
        return View();
    }

    [HttpPost]
    public IActionResult GuardarDeportista(Deportista dep)
    {
        BD.AgregarDeportista(dep);
        return RedirectToAction("Index");
    }
    public IActionResult EliminarDeportista (int idCandidato)
    {
        BD.EliminarDeportista(idCandidato);
        return RedirectToAction("Index");
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}