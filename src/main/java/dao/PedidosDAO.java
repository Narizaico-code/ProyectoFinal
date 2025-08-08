package dao;

import model.Pedidos;

import javax.persistence.*;
import java.util.Date;

public class PedidosDAO {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("LibreriaPU");

    public Pedidos crearPedido(int idUsuario, double total, String metodoPago) {
        EntityManager em = emf.createEntityManager();
        Pedidos pedido = new Pedidos();
        pedido.setIdUsuario(idUsuario);
        pedido.setFechaPedido(new Date());
        pedido.setTotal(total);
        pedido.setMetodoPago(metodoPago);
        pedido.setEstado("Pendiente");

        try {
            em.getTransaction().begin();
            em.persist(pedido);
            em.getTransaction().commit();
            return pedido; // Pedido con id generado
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            return null;
        } finally {
            em.close();
        }
    }

    public Pedidos buscarPorId(int idPedido) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Pedidos.class, idPedido);
        } finally {
            em.close();
        }
    }

    public boolean actualizarPedido(Pedidos pedido) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(pedido);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            return false;
        } finally {
            em.close();
        }
    }
    
    public boolean actualizar(Pedidos pedido) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(pedido);
            em.getTransaction().commit();
            return true;
        } catch(Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    // Otros métodos como eliminar, listar, etc. los puedes agregar aquí

}
