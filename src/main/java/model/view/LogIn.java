package model.view;

import POJOs.Email;
import POJOs.User;
import java.io.File;
import java.util.ArrayList;
import javax.persistence.RollbackException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class LogIn {
    private Email email;
    private static SessionFactory factory;
    private static Session session;

    public LogIn(Email object){
        this.email = object;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(User.class).buildSessionFactory();
    }


    public boolean isInserted(){
        /*
        *   Checks if the record is in the DB
        *
        *   @returns Returns a boolean depending if it is already in the DB or not
        */
        
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            System.out.println(email.getEmail());
            String hql = "from User "  + 
             "WHERE correo = '" + email.getEmail() + "'";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            session.close();
            if(arraylist == null || arraylist.isEmpty()) return false;
            return true;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return false;
        }
    }
    
    public String getPassword(){
        /*
        *   Gets the password of the record in the DB
        *
        *   @returns Returns the password
        */
        
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from User "  + 
             "WHERE contraseña = '" + email.getPassword() + "'";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            session.close();
            if(arraylist == null || arraylist.isEmpty()) return "Contraseña no encontrada";
            return arraylist.get(0).getEmail().getPassword();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return null;
        }
    }

    public boolean isSamePassword(){
        /*
        *   Checks if the password written belongs to the email given
        *
        *   @returns Returns a boolean depending if it is the correct password or not
        */
        
        if(email.getPassword().equals(getPassword())){
            System.out.println("Es la misma contraseña");
            return true;
        }
        return false;
    }
    
    public String getRol(){
        /*
        *   Gets the password of the record in the DB
        *
        *   @returns Returns the password
        */
        
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from User "  + 
             "WHERE contraseña = '" + email.getPassword() + "'";
            ArrayList<User> arraylist = (ArrayList) session.createQuery(hql).getResultList();
            
            session.close();
            if(arraylist == null || arraylist.isEmpty()) return "Contraseña no encontrada";
            return arraylist.get(0).getRol();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return null;
        }
    }
}
