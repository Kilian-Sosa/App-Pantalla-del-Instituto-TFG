/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.view;

import POJOs.Log;
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
public class ControlLog {
    private Log log;
    private static SessionFactory factory;
    private static Session session;
    
    public ControlLog(Log log){
        this.log = log;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(Log.class).buildSessionFactory();
    }
    
    /*
     *   Gets all records in the DB
     *
     *   @returns an ArrayList of the records
     */
    public ArrayList<Log> getLog(){
        try{
            ArrayList<Log> list;
            
            session = factory.openSession();
            session.beginTransaction();
            
            list = (ArrayList) session.createQuery("from Log").getResultList();

            return list;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger los registros: " + e);
            return null;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Gets all records in the DB
     *
     *   @returns an ArrayList of the records
     */
    public ArrayList<Log> getLogByOrder(String field, String order){
        try{
            ArrayList<Log> list;
            
            session = factory.openSession();
            session.beginTransaction();
            
            String hql = "from Log ORDER BY " + field + " " + order;
            list = (ArrayList)  session.createQuery(hql).getResultList();

            return list;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger los registros: " + e);
            return null;
        }finally{
            session.close();
        }
    }

    /*
     *   Inserts the log in the DB
     *
     *   @returns a boolean depending if it worked or not
     */
    public boolean insertLog(){
        try{
            session = factory.openSession();
            session.beginTransaction();

            session.save(log);
            
            session.getTransaction().commit();

            System.out.println("Log insertado correctamente.");
            return true;
        } catch(RollbackException ex){
            System.out.println("Error al insertar el log: "+ ex);
           return false;
        }finally{
            session.close();
        }
    }
}
