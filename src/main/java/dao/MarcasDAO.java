/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Marca;

public class MarcasDAO {

    private Connection conexion;

    public MarcasDAO(Connection conexion) {
        this.conexion = conexion;
    }

    // Método para listar todas las marcas
    public List<Marca> listarMarcas() throws SQLException {
        List<Marca> marcas = new ArrayList<>();
        String sql = "SELECT * FROM Marcas";

        try (PreparedStatement stmt = conexion.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Marca marca = new Marca();
                marca.setIdMarca(rs.getInt("idMarca"));
                marca.setNombreMarca(rs.getString("nombreMarca"));
                marca.setCorreoMarca(rs.getString("correoMarca"));
                marca.setDescripcion(rs.getString("descripcion"));

                marcas.add(marca);
            }
        }

        return marcas;
    }

    // Método para obtener una marca por ID
    public Marca obtenerMarcaPorId(int id) throws SQLException {
        String sql = "SELECT * FROM Marcas WHERE idMarca = ?";
        Marca marca = null;

        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    marca = new Marca();
                    marca.setIdMarca(rs.getInt("idMarca"));
                    marca.setNombreMarca(rs.getString("nombreMarca"));
                    marca.setCorreoMarca(rs.getString("correoMarca"));
                    marca.setDescripcion(rs.getString("descripcion"));
                }
            }
        }

        return marca;
    }

    // Método para insertar una nueva marca
    public boolean insertarMarca(Marca marca) throws SQLException {
        String sql = "INSERT INTO Marcas (nombreMarca, correoMarca, descripcion) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, marca.getNombreMarca());
            stmt.setString(2, marca.getCorreoMarca());
            stmt.setString(3, marca.getDescripcion());

            return stmt.executeUpdate() > 0;
        }
    }

    // Método para actualizar una marca
    public boolean actualizarMarca(Marca marca) throws SQLException {
        String sql = "UPDATE Marcas SET nombreMarca = ?, correoMarca = ?, descripcion = ? WHERE idMarca = ?";

        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, marca.getNombreMarca());
            stmt.setString(2, marca.getCorreoMarca());
            stmt.setString(3, marca.getDescripcion());
            stmt.setInt(4, marca.getIdMarca());

            return stmt.executeUpdate() > 0;
        }
    }

    // Método para eliminar una marca
    public boolean eliminarMarca(int id) throws SQLException {
        String sql = "DELETE FROM Marcas WHERE idMarca = ?";

        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        }
    }
}
