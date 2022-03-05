package model.view;

import POJOs.News;
import java.io.File;
import java.util.ArrayList;
import javax.persistence.RollbackException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ControlNews {
    private News news;
    private static SessionFactory factory;
    private static Session session;

    public ControlNews(News news, String url_image){
        this.news = news;
        this.news.setUrl_Image(url_image);
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(News.class).buildSessionFactory();
    }

    public boolean hasRecords(){
        /*
        *   Checks if there is any record
        *
        *   @returns Returns a boolean depending if the DB has records or not
        */
        
        try{
            session = factory.openSession();
            session.beginTransaction();
            //CONSULA HQL
            ArrayList<News> list = (ArrayList) session.createQuery("from News").getResultList();
            
            if(list.isEmpty() || list == null) return false;
            return true;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
            return false;
        }
    }
    
    public ArrayList<News> getNews(){
        /*
        *   Checks if there is any record
        *
        *   @returns Returns a boolean depending if the DB has records or not
        */
        
        try{
            ArrayList<News> list;
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();
                //CONSULA HQL
                list = (ArrayList) session.createQuery("from News").getResultList();

                return list;
            }
            return null;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
            return null;
        }
    }
    
    public boolean isInserted(){
        /*
        *   Checks if the record is in the DB
        *
        *   @returns Returns a boolean depending if it is already in the DB or not
        */
        
        try{
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();

                String hql = "SELECT * from News "  + 
                 "WHERE title = " + news.getTitle();
                ArrayList<News> arraylist = (ArrayList) session.createQuery(hql).getResultList();

                session.close();
                return arraylist != null;
            }  
            return false;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
            return false;
        }
    }
    
    public int getID(){
        /*
        *   Gets the ID of the record in the DB
        *
        *   @returns Returns -1 or the ID depending if it is in the DB or not
        */
        
        try{
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();

                String hql = "SELECT id from News "  + 
                 "WHERE title = " + news.getTitle();
                ArrayList<News> arraylist = (ArrayList) session.createQuery(hql).getResultList();

                session.close();
                if(arraylist == null) throw new RollbackException();
                return arraylist.get(0).getId();
            }    
            return -1;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return -1;
        }
    }

    public boolean insertNews(){
        /*
        *   Inserts the news in the DB
        *
        *   @returns Returns a boolean depending if it worked or not
        */

        try{
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();

                session.save(news);

                session.getTransaction().commit();

                session.close();
                System.out.println("Noticia insertada correctamente.");
                return true;
            }    
            return false;
        } catch(RollbackException ex){
            session.close();
            System.out.println("Error al insertar una noticia: "+ ex);
           return false;
        }       
    }

    public boolean modifyNews(){
        /*
        *   Updates the record in the DB
        *
        *   @return boolean depending if the action was succesful or not
        */
        
        try{
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();

                News newsDB = (News) session.get(News.class, getID());

                newsDB.setTitle(news.getTitle());
                newsDB.setDescription(news.getDescription());
                newsDB.setDate_Init(news.getDate_Init());
                newsDB.setDate_Fin(news.getDate_Fin());
                newsDB.setUrl_Image(news.getUrl_Image());

                session.update(newsDB);
                session.getTransaction().commit();

                session.close();
                return true;
            }    
            return false;
        }catch (RollbackException ex) {
            System.out.println("Error al modificar el alumno: " + ex);
            return false;
        }
    }
    
    public boolean deleteNews(){
        /*
        *   Deletes the news given in the constructor
        *
        *   @returns Returns a boolean depending if it worked or not
        */
        
        try{
            if(hasRecords()){
                session = factory.openSession();
                session.beginTransaction();

                String hql = "DELETE from News "  + 
                 "WHERE title = " + news.getTitle();
                if(session.createQuery(hql).executeUpdate() == 0) throw new RollbackException();

                session.close();
                return true;
            }
            return false;
        }catch(RollbackException ex){
            session.close();
            System.out.println("Error al eliminar la noticia: "+ ex);
            return false;
        }
    }
}    