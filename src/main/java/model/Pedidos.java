package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Pedidos")
public class Pedidos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPedido")
    private Integer idPedido;

    @Column(name = "idUsuario")
    private Integer idUsuario;

    @Temporal(TemporalType.DATE)
    @Column(name = "fechaPedido")
    private Date fechaPedido;

    @Column(name = "total")
    private Double total;

    @Column(name = "metodoPago")
    private String metodoPago;  

    @Column(name = "estado")
    private String estado;  


    // getters y setters aquí...

    public Pedidos() {
    }

    public Pedidos(Integer idPedido, Integer idUsuario, Date fechaPedido, Double total, String metodoPago, String estado) {
        this.idPedido = idPedido;
        this.idUsuario = idUsuario;
        this.fechaPedido = fechaPedido;
        this.total = total;
        this.metodoPago = metodoPago;
        this.estado = estado;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
