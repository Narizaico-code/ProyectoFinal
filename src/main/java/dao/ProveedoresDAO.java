package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.Proveedores;

public class ProveedoresDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

    // Guardar nuevo proveedor
    public void guardar(Proveedores proveedor) {
        EntityManager em = fabrica.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(proveedor);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error al guardar proveedor: " + e.getMessage());
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            em.close();
        }
    }

    // Listar todos los proveedores (activos)
    public List<Proveedores> listarActivos() {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.createQuery("SELECT p FROM Proveedores p WHERE p.estado = 'activo'", Proveedores.class).getResultList();
        } finally {
            em.close();
        }
    }

    // Buscar proveedor por ID
    public Proveedores buscar(int id) {
        EntityManager em = fabrica.createEntityManager();
        try {
            return em.find(Proveedores.class, id);
        } finally {
            em.close();
        }
    }

    // Actualizar proveedor
    public void actualizar(Proveedores proveedor) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(proveedor);
            tx.commit();
        } catch (Exception e) {
            System.out.println("Error al actualizar proveedor: " + e.getMessage());
            if (tx.isActive()) {
                tx.rollback();
            }
        } finally {
            em.close();
        }
    }

    // Eliminar proveedor (cambio de estado a "inactivo")
    public void eliminar(int id) {
        EntityManager em = fabrica.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Proveedores proveedor = em.find(Proveedores.class, id);
            if (proveedor != null) {
                proveedor.setEstado("inactivo"); // no borramos, solo cambiamos estado
                em.merge(proveedor);
            }
            tx.commit();
        } catch (Exception e) {
            System.out.println("Error al eliminar proveedor: " + e.getMessage());
            if (tx.isActive()) {
                tx.rollback();
            }
        } finally {
            em.close();
        }
    }
}