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
public class LogIn {
    private Email email;
    private static SessionFactory factory;
    private static Session session;

    public LogIn(Email object){
        this.email = object;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(User.class).buildSessionFactory();
    }

    /*
     *   Checks if the record is in the DB
     *
     *   @returns a boolean depending if it is already in the DB or not
     */
    public boolean isInserted(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            System.out.println(email.getEmail());
            String hql = "from User "  + 
             "WHERE lower(correo) like lower('%" + email.getEmail() + "%')";
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
     *   Gets the password of the record in the DB
     *
     *   @returns the password as String
     */
    public String getPassword(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from User "  + 
             "WHERE contraseña = '" + email.getPassword() + "'";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            if(arraylist == null || arraylist.isEmpty()) return "Contraseña no encontrada";
            return arraylist.get(0).getEmail().getPassword();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return null;
        }finally{
            session.close();
        }
    }

    /*
     *   Checks if the password written belongs to the email given
     *
     *   @returns a boolean depending if it is the correct password or not
     */
    public boolean isSamePassword(){
        if(email.getPassword().equals(getPassword())){
            System.out.println("Es la misma contraseña");
            return true;
        }
        return false;
    }
    
    /*
     *   Gets the name of the record in the DB
     *
     *   @returns the name as String
     */
    public String getName(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from User "  + 
             "WHERE lower(correo) like lower('%" + email.getEmail() + "%')";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            if(arraylist == null || arraylist.isEmpty()) return "No tiene nombre";
            return arraylist.get(0).getName();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return "Error";
        }finally{
            session.close();
        }
    }
    
    
    /*
     *   Gets the rol of the record in the DB
     *
     *   @returns the rol as int
     */
    public int getRol(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from User "  + 
             "WHERE contraseña = '" + email.getPassword() + "'";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            if(arraylist == null || arraylist.isEmpty()) return -1;
            return arraylist.get(0).getRol();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return -1;
        }finally{
            session.close();
        }
    }
}