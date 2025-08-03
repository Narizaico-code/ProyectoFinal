package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Categorias;

/**
 *
 * @author informatica
 */
public class categoriaDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

    public void guardar(Categorias categoria) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            admin.getTransaction().begin();
            admin.persist(categoria);
            admin.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error al guardar categoría: " + e.getMessage());
            if (admin.getTransaction().isActive()) {
                admin.getTransaction().rollback();
            }
        } finally {
            admin.close();
        }
    }

    public List<Categorias> listarTodos() {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery("SELECT c FROM Categorias c", Categorias.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public Categorias buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(Categorias.class, id);
        } finally {
            admin.close();
        }
    }

    public List<Categorias> listarPorBusqueda(String busqueda) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            String consulta = "select * from Categorias";
            Query query = admin.createQuery(consulta, Categorias.class);
            query.setParameter("filtro", "%" + busqueda + "%");
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            admin.close();
        }
    }

    public void actualizar(Categorias categoria) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.merge(categoria);
            transaccion.commit();
        } catch (Exception e) {
            System.out.println("Error al actualizar categoría: " + e.getMessage());
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            admin.close();
        }
    }

    public void eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            Categorias categoria = admin.find(Categorias.class, id);
            if (categoria != null) {
                // asegurar la sincronización
                if (!admin.contains(categoria)) {
                    categoria = admin.merge(categoria);
                }
                admin.remove(categoria);
                System.out.println("Categoría eliminada correctamente");
            } else {
                System.out.println("Categoría con ID " + id + " no encontrada");
            }
            transaccion.commit();
        } catch (Exception e) {
            System.out.println("Error al eliminar categoría: " + e.getMessage());
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            admin.close();
        }
    }

}
