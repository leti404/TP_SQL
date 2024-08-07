using System.Data.SqlClient;
using System;
using Dapper;
public class BD{

    public static void AgregarDeportista(Deportista Dep)
    {
        string sql = "INSERT INTO Deportistas(Nombre, Apellido, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES (@dNombre, @dApellido, @dFechaNacimiento, @dFoto, @dIdPais, @dIdDeporte)";
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            JJOO.Execute(sql, new{dNombre = Dep.Nombre, dApellido = Dep.Apellido, dFechaNacimiento = Dep.FechaNacimiento, dFoto = Dep.Foto, dIdPais = Dep.IdPais, dIdDeporte = Dep.IdDeporte}); 
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
    public static Deporte VerInfoDeporte(int idDeporte)
    {
        Deporte deporte = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes WHERE IdDeporte = @idDeporte";
            deporte = JJOO.Query<Deporte>(sql, new{idDeporte = idDeporte}).ToList(); 
        }
        return deporte; 
    }
    public static Pais VerInfoPais(int idPais)
    {
        Pais pais = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises WHERE IdPais = @idPais";
            pais = JJOO.Query<Pais>(sql, new{idPais = idPais}).ToList(); 
        }
        return pais;
    }
    public static Deportista VerInfoDeportista(int idDeportista)
    {
        Deportista deportista = null;
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdDeportistas = @idDeportista";
            deportista = JJOO.Query<Deportista>(sql, new{idDeportista = idDeportista}).ToList(); 
        }
        return deportista;
    }
    private static List<Pais> _ListadoPaises = new List<Pais>();
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
    public static List<Deportista> ListarDeportistasPorDeporte(int idDeporte)
    {
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises WHERE IdDeporte = @idDeporte";
            _ListadoDeportistasPorDeporte = JJOO.Query<Deportista>(sql, new{idDeporte = idDeporte}).ToList(); 
        }
        return _ListadoDeportistasPorDeporte;
    }
    private static List<Deportista> _ListadoDeportistasPorPais = new List<Deportista>();
    public static List<Deportista> ListarDeportistasPorPais(int idPais)
    {
        using(SqlConnection JJOO = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises WHERE IdPais = @idPais";
            _ListadoDeportistasPorPais = JJOO.Query<Deportista>(sql, new{idPais = idPais}).ToList(); 
        }
        return _ListadoDeportistasPorPais;
    }
}

