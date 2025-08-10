package model;

import javax.persistence.*;

@Entity
@Table(name = "Detallepedidos")
public class Factura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idDetallePedido")
    private Integer idDetallePedido;

    @Column(name = "idPedido", nullable = false)
    private Integer idPedido;

    @Column(name = "idProducto", nullable = false)
    private Integer idProducto;

    @Column(name = "talla", length = 64)
    private String talla;

    @Column(name = "cantidad", nullable = false)
    private Integer cantidad;

    @Column(name = "precioUnitario")
    private Double precioUnitario;

    @Column(name = "subTotal")
    private Double subTotal;
    @Transient
    private String nombreProducto;

    public Factura() {
    }

    // Constructor para usar en sesión antes de persistir
    public Factura(Integer idProducto, String talla, Integer cantidad, Double precioUnitario, String nombreProducto) {
        this.idProducto = idProducto;
        this.talla = talla;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.nombreProducto = nombreProducto;
        recalcSubTotal();
    }

    // Si quieres un constructor sin nombreProducto:
    public Factura(Integer idProducto, String talla, Integer cantidad, Double precioUnitario) {
        this(idProducto, talla, cantidad, precioUnitario, null);
    }

    // getters y setters
    public Integer getIdDetallePedido() {
        return idDetallePedido;
    }

    public void setIdDetallePedido(Integer idDetallePedido) {
        this.idDetallePedido = idDetallePedido;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
        recalcSubTotal();
    }

    public Double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(Double precioUnitario) {
        this.precioUnitario = precioUnitario;
        recalcSubTotal();
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    private void recalcSubTotal() {
        if (this.cantidad != null && this.precioUnitario != null) {
            this.subTotal = this.cantidad * this.precioUnitario;
        }
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
}
