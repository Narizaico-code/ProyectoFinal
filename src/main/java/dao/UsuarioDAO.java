package dao;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.EntityManager;
import model.Usuario;

/**
 *
 * @author Angel Geovanny
 */
public class UsuarioDAO {
    
    //Entity Manager Factory - PU
    private EntityManager fabrica = (EntityManager) Persistence.createEntityManagerFactory("LibreriaPU");
    
    public void guardar(Usuario usuario){
        //Entity Manager, manejar las transacciones.
//        EntityManager admin = fabrica.createEntityManager();
    }
}
