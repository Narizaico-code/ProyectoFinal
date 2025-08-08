
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Marca")
public class Marca {

     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idMarca")
    private int idMarca;

    @Column(name = "nombreMarca")
    private String nombreMarca;

    @Column(name = "correoMarca")
    private String correoMarca;

    @Column(name = "descripcion")
    private String descripcion;

    public Marca() {}

    // Getters y Setters
    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNombreMarca() {
        return nombreMarca;
    }

    public void setNombreMarca(String nombreMarca) {
        this.nombreMarca = nombreMarca;
    }

    public String getCorreoMarca() {
        return correoMarca;
    }

    public void setCorreoMarca(String correoMarca) {
        this.correoMarca = correoMarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
