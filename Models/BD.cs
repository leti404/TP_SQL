using System.Data.SqlClient;
using System;
using Dapper;
public class BD{
    private static string _connectionString = @"Server=L-LE-LE\SQLEXPRESS;
    DataBase=JJOO;Trusted_Connection=True;";
    public static void AgregarDeportista(Deportista Dep)
    {
        string sql = "INSERT INTO Deportistas(Nombre, Apellido, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES (@dNombre, @dApellido, @dFechaNacimiento, @dFoto, @dIdPais, @dIdDeporte)";
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            JJOO.Execute(sql, new{dNombre = Dep.Nombre, dApellido = Dep.Apellido, dFechaNacimiento = Dep.FechaNacimiento, dFoto = Dep.Foto, dIdPais = Dep.IdPais, dIdDeporte = Dep.IdDeporte}); 
        }
    }
    public static void AgregarPais(Pais pais)
    {
        string sql = "INSERT INTO Paises(Nombre, Bandera, FechaFundacion) VALUES (@dNombre, @dBandera, @dFechaFundacion)";
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            JJOO.Execute(sql, new{dNombre = pais.Nombre, dBandera = pais.Bandera, dFechaFundacion = pais.FechaFundacion}); 
        }
    }
    public static void AgregarDeporte(Deporte Dep)
    {
        string sql = "INSERT INTO Deportes(Nombre, Foto) VALUES (@dNombre, @dFoto)";
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            JJOO.Execute(sql, new{dNombre = Dep.Nombre, dFoto = Dep.Foto}); 
        }
    }
    public static int EliminarDeportista(int DeportistaEliminar)
    {
        int DeportistasEliminados = 0;
        string sql = "DELETE FROM Deportistas WHERE IdDeportista = @idDeportista";
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            DeportistasEliminados = JJOO.Execute(sql, new{idDeportista = DeportistaEliminar}); 
        }
        return DeportistasEliminados;
    }
    public static Deporte VerInfoDeporte(int idDeporteIng)
    {
        Deporte deporte = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes WHERE IdDeporte = @pidDeporte";
            deporte = JJOO.QueryFirstOrDefault<Deporte>(sql, new{pidDeporte = idDeporteIng}); 
        }
        return deporte; 
    }
    public static Pais VerInfoPais(int idPais)
    {
        Pais pais = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises WHERE IdPais = @idPais";
            pais = JJOO.QueryFirstOrDefault<Pais>(sql, new{idPais = idPais});  
        }
        return pais;
    }
    public static Deportista VerInfoDeportista(int IdDeportista)
    {
        Deportista deportista = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdDeportista = @idDeportista";
            deportista = JJOO.QuerySingleOrDefault<Deportista>(sql, new{idDeportista = IdDeportista}); 
            
        }
        return deportista;
    }
    public static List<Pais> _ListadoPaises = new List<Pais>();
    public static List<Pais> ListarPaises()
    {
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises";
            _ListadoPaises = JJOO.Query<Pais>(sql).ToList(); 
        }
        return _ListadoPaises;
    }
     private static List<Deportista> _ListadoDeportistasPorDeporte = new List<Deportista>();
    public static List<Deportista> ListarDeportistasPorDeporte(int idDeporteIng)
    {
        List<Deportista> _ListadoDeportistasPorDeporte = new List<Deportista>();
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdDeporte= @pIdDeporte";
            _ListadoDeportistasPorDeporte = JJOO.Query<Deportista>(sql, new{pIdDeporte = idDeporteIng}).ToList(); 
        }
        return _ListadoDeportistasPorDeporte;
    }
    private static List<Deportista> _ListadoDeportistasPorPais = new List<Deportista>();
    public static List<Deportista> ListarDeportistasPorPais(int idPais)
    {
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdPais = @idPais";
            _ListadoDeportistasPorPais = JJOO.Query<Deportista>(sql, new{idPais = idPais}).ToList(); 
        }
        return _ListadoDeportistasPorPais;
    }

    private static List<Deporte> _ListadoDeportes = new List<Deporte>();
    public static List<Deporte> ListarDeportes()
    {
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes";
            _ListadoDeportes = JJOO.Query<Deporte>(sql).ToList(); 
        }
        return _ListadoDeportes;
    }
}

