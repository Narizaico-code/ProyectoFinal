package dao;

import model.Proveedores;

import javax.persistence.*;
import java.util.List;

public class ProveedoresDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

    public List<Proveedores> listar() {
        EntityManager admin = fabrica.createEntityManager();
        List<Proveedores> proveedores = null;
        try {
            proveedores = admin.createQuery("SELECT p FROM Proveedor p WHERE p.estado = 'activo'", Proveedores.class)
                    .getResultList();
        } finally {
            admin.close();
        }
        return proveedores;
    }

    public void agregar(Proveedores proveedor) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction tx = admin.getTransaction();
        try {
            tx.begin();
            admin.persist(proveedor);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public void desactivar(int idProveedor) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction tx = admin.getTransaction();
        try {
            tx.begin();
            Proveedores proveedor = admin.find(Proveedores.class, idProveedor);
            if (proveedor != null) {
                proveedor.setEstado("inactivo");
                admin.merge(proveedor);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public Proveedores buscar(int idProveedor) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(Proveedores.class, idProveedor);
        } finally {
            admin.close();
        }
    }
}
