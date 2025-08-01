package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Productos;

public class ProductoDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

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

    public Productos buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(Productos.class, id);
        } finally {
            admin.close();
        }
    }

    public List<Productos> listarPorBusqueda(String busqueda) {

        EntityManager admin = fabrica.createEntityManager();

        try {

            String consulta = "SELECT p FROM Producto p WHERE p.estado = 'activo' AND (p.talla = :filtro OR p.categoria = :filtro)";

            Query query = admin.createQuery(consulta);

            query.setParameter("filtro", busqueda);

            List<Productos> resultados = query.getResultList();

            return resultados;

        } catch (Exception e) {

            e.printStackTrace();

            return null; // o Collections.emptyList();

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
