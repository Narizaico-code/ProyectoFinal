package dao;

import model.Pedido;
import javax.persistence.*;
import java.util.List;

public class PedidoDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("LibreriaPU");

    public void guardar(Pedido pedido) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(pedido);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Pedido buscarPorId(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Pedido.class, id);
        } finally {
            em.close();
        }
    }

    public List<Pedido> listarTodos() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT p FROM Pedido p", Pedido.class).getResultList();
        } finally {
            em.close();
        }
    }
}
