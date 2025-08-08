package dao;

import model.DetallePedidos;
import javax.persistence.*;
import java.util.List;

public class DetallePedidosDAO {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("LibreriaPU");

    public boolean agregarDetalle(DetallePedidos detalle) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(detalle);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    public List<DetallePedidos> listarPorIdPedido(int idPedido) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<DetallePedidos> query = em.createQuery(
                    "SELECT d FROM DetallePedidos d WHERE d.idPedido = :idPedido", DetallePedidos.class);
            query.setParameter("idPedido", idPedido);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // Método para buscar un DetallePedidos por su ID
    public DetallePedidos buscarPorId(int idDetallePedido) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(DetallePedidos.class, idDetallePedido);
        } finally {
            em.close();
        }
    }

    // Add this method to your existing DetallePedidosDAO class
    public boolean actualizarDetalle(DetallePedidos detalle) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(detalle); // The merge operation is used for updating an existing entity
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }
}
