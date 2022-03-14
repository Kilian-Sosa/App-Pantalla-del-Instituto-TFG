package model.view;

import POJOs.Email;
import POJOs.User;
import java.io.File;
import java.util.ArrayList;
import javax.persistence.RollbackException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author kilian
 */
public class ControlUsers {
    private User user;
    private static SessionFactory factory;
    private static Session session;

    public ControlUsers(User user){
        this.user = user;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(User.class).buildSessionFactory();
    }

    /*
     *   Checks if there is any record
     *
     *   @returns a boolean depending if the DB has records or not
     */
    private boolean hasRecords(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            ArrayList<User> list = (ArrayList) session.createQuery("from User").getResultList();
            
            return !(list == null || list.isEmpty());
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si hay registros: " + e);
            return false;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Gets all records in the DB
     *
     *   @returns an ArrayList of the records
     */
    public ArrayList<User> getUsers(){
        try{
            ArrayList<User> list;
            
            session = factory.openSession();
            session.beginTransaction();
            
            list = (ArrayList) session.createQuery("from User").getResultList();

            return list;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger los registros: " + e);
            return null;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Checks if the record is in the DB
     *
     *   @returns a boolean depending if it is already in the DB or not
     */
    public boolean isInserted(){
        try{
            if(!hasRecords()) return false;
            session = factory.openSession();
            session.beginTransaction();
            
            System.out.println(user.getEmail().getEmail());
            String hql = "from User "  + 
             "WHERE lower(correo) like lower('%" + user.getEmail().getEmail() + "%')";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            return !(arraylist == null || arraylist.isEmpty());
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return false;
        }finally{
            session.close();
        }
    }

    /*
     *   Inserts the user in the DB
     *
     *   @returns a boolean depending if it worked or not
     */
    public boolean insertUser(){
        try{
            if(isInserted()) return false;
            session = factory.openSession();
            session.beginTransaction();

            session.save(user);

            session.getTransaction().commit();

            System.out.println("Usuario insertado correctamente.");
            return true;
        } catch(RollbackException ex){
            System.out.println("Error al insertar el usuario: "+ ex);
           return false;
        }finally{
            session.close();
        }
    }

    /*
     *   Updates the record in the DB
     *
     *   @return a boolean depending if the action was succesful or not
     */
    public boolean modifyUser(){
        try{
            if(!isInserted()) return false;
            session = factory.openSession();
            session.beginTransaction();

            User userDB = (User) session.get(User.class, user.getID());

            userDB.setEmail(new Email(user.getEmail().getEmail(), user.getPassword()));
            userDB.setName(user.getName());
            userDB.setRol(user.getRol());

            session.update(userDB);
            session.getTransaction().commit();
            return true;
        }catch (RollbackException ex) {
            System.out.println("Error al modificar el usuario: " + ex);
            return false;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Deletes the user given in the constructor
     *
     *   @returns a boolean depending if it worked or not
     */
    public boolean deleteUser(){
        try{
            if(!isInserted()) return false;
                session = factory.openSession();
                session.beginTransaction();

                String hql = "DELETE from News "  + 
                 "WHERE id = '" + user.getID() + "'";
                if(session.createQuery(hql).executeUpdate() == 0) throw new RollbackException();
                return true;
        }catch(RollbackException ex){
            System.out.println("Error al eliminar la noticia: "+ ex);
            return false;
        }finally{
            session.close();
        }
    }
}