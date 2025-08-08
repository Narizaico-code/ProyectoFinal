package dao;

import model.Factura;
import javax.persistence.*;
import java.util.List;

public class FacturaDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("LibreriaPU");

    public void guardar(Factura factura) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(factura);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Factura> listarPorPedido(int idPedido) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT f FROM Factura f WHERE f.idPedido = :idPedido", Factura.class)
                     .setParameter("idPedido", idPedido)
                     .getResultList();
        } finally {
            em.close();
        }
    }
}
