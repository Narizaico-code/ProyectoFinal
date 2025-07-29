package dao;

import java.util.List;
import javax.persistence.Persistence;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import model.Usuario;

/**
 *
 * @author Angel Geovanny
 */
public class UsuarioDAO {

    //Entity Manager Factory - PU
    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("LibreriaPU");

    public void guardar(Usuario usuario) {
        //Entity Manager, manejar las transacciones.
        EntityManager admin = fabrica.createEntityManager();

        try {
            admin.getTransaction().begin();
            admin.persist(usuario);
            admin.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error al guardar usuario: " + e.getMessage());
        } finally {
            admin.close();
        }
    }

    public List<Usuario> listarTodos() {
        EntityManager admin = fabrica.createEntityManager();
        try {
            //getResultList -> lista de objetos

            //JPQL
            return admin.createQuery("SELECT u FROM Usuario u", Usuario.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public Usuario buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();

        try {
            return admin.find(Usuario.class, id);
        } finally {
            admin.close();
        }
    }

    public void actualizar(Usuario usuario) {
        //entitymanager, entitytransation -> begin, proceso, commit | rollback --> close
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.merge(usuario);
            transaccion.commit();
        } catch (Exception e) {
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
            Usuario usuario = admin.find(Usuario.class, id);
            if (usuario != null) {
                admin.remove(usuario);
            }
            tr.commit();
        } catch (Exception e) {
            if (tr.isActive()) {
                tr.rollback();
            }
        } finally {
            admin.close();
        }
    }
}
