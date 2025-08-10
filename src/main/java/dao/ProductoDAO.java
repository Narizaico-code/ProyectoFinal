package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Productos;

public class ProductoDAO {

    private static EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

    public void guardar(Productos producto) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            admin.getTransaction().begin();
            admin.persist(producto);
            admin.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error al guardar producto: " + e.getMessage());
            if (admin.getTransaction().isActive()) {
                admin.getTransaction().rollback();
            }
        } finally {
            admin.close();
        }
    }

    public List<Productos> listarTodos() {

        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery("SELECT p FROM Productos p", Productos.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public List<Productos> listarPorCategoria(int idCategoria) {
        EntityManager admin = null;
        try {
            admin = fabrica.createEntityManager();
            List<Productos> productos = admin.createQuery("SELECT p FROM Productos p WHERE p.idCategoria = :id", Productos.class)
                    .setParameter("id", idCategoria)
                    .getResultList();
            System.out.println("DAO: Se encontraron " + productos.size() + " productos para la categoría " + idCategoria);
            return productos;
        } finally {
            admin.close();
        }
    }

    public Productos buscarPorId(int id) {

        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(Productos.class, id);
        } finally {
            admin.close();
        }
    }

    public List<Productos> listarPorBusqueda(String filtro, int idCategoria) {
        EntityManager admin = null;
        try {
            admin = fabrica.createEntityManager();
            String jpql = "SELECT p FROM Productos p "
                    + "WHERE p.idCategoria = :idCategoria AND "
                    + "(LOWER(p.nombreProducto) LIKE :filtro OR "
                    + "LOWER(p.talla) LIKE :filtro OR "
                    + "LOWER(p.color) LIKE :filtro)";
            Query query = admin.createQuery(jpql, Productos.class);
            query.setParameter("idCategoria", idCategoria);
            query.setParameter("filtro", "%" + filtro.toLowerCase() + "%");
            List<Productos> productos = query.getResultList();
            System.out.println("DAO: Se encontraron " + productos.size() + " productos en la búsqueda para la categoría " + idCategoria);
            return productos;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            admin.close();
        }
    }

    public void actualizar(Productos producto) {

        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.merge(producto);
            transaccion.commit();
        } catch (Exception e) {
            System.out.println("Error al actualizar producto: " + e.getMessage());
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            admin.close();
        }
    }

    public void eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction tr = admin.getTransaction();
        try {
            tr.begin();
            Productos producto = admin.find(Productos.class, id);
            if (producto != null) {
                admin.remove(producto);
            }
            tr.commit();
        } catch (Exception e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
            if (tr.isActive()) {
                tr.rollback();
            }
        } finally {
            admin.close();
        }
    }
}
