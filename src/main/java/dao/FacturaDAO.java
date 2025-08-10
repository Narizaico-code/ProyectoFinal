package dao;

import model.Factura;
import javax.persistence.*;
import java.util.List;

public class FacturaDAO {

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("LibreriaPU");

    public boolean guardar(Factura factura) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(factura);
            em.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    public List<Factura> listarPorPedido(int idPedido) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Factura> q = em.createQuery("SELECT f FROM Factura f WHERE f.idPedido = :idPedido", Factura.class);
            q.setParameter("idPedido", idPedido);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public boolean eliminarPorId(Integer idDetallePedido) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Factura f = em.find(Factura.class, idDetallePedido);
            if (f != null) {
                em.remove(f);
            }
            em.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }
}
