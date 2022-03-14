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

    public ControlNews(News news){
        this.news = news;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(News.class).buildSessionFactory();
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
            ArrayList<News> list = (ArrayList) session.createQuery("from News").getResultList();
            
            return !(list == null || list.isEmpty());
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
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
    public ArrayList<News> getNews(){
        try{
            ArrayList<News> list;
            
            session = factory.openSession();
            session.beginTransaction();
            
            list = (ArrayList) session.createQuery("from News").getResultList();

            return list;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
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

            String hql = "SELECT * from News "  + 
             "WHERE lower(title) like lower('%" + news.getTitle() + "%')";
            ArrayList<News> list = (ArrayList) session.createQuery(hql).getResultList();

            return list != null;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
            return false;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Checks if there is already a record with that same title in the DB
     *
     *   @returns a boolean depending if it is already in the DB or not
     */
    private boolean isInserted(String newTitle){
        try{
            session = factory.openSession();
            session.beginTransaction();

            String hql = "SELECT * from News "  + 
             "WHERE lower(title) like lower('%" + newTitle + "%')";
            ArrayList<News> list = (ArrayList) session.createQuery(hql).getResultList();

            return list != null;
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al revisar si está insertado: " + e);
            return false;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Gets the ID of the record in the DB
     *
     *   @returns -1 or the ID depending if it is in the DB or not
     */
    public int getID(){
        try{
            if(!hasRecords()) return -1;
            session = factory.openSession();
            session.beginTransaction();

            String hql = "SELECT id from News "  + 
             "WHERE lower(title) like lower('%" + news.getTitle() + "%')";
            ArrayList<News> list = (ArrayList) session.createQuery(hql).getResultList();

            if(list == null) throw new RollbackException();
            return list.get(0).getID();
        }catch(RollbackException e){
            System.out.println("Se ha producido un error al recoger el id: " + e);
            return -1;
        }finally{
            session.close();
        }
    }

    /*
     *   Inserts the news in the DB
     *
     *   @returns Returns a boolean depending if it worked or not
     */
    public boolean insertNews(){
        try{
            if(isInserted()) return false;
            session = factory.openSession();
            session.beginTransaction();

            session.save(news);

            session.getTransaction().commit();

            System.out.println("Noticia insertada correctamente.");
            return true;
        } catch(RollbackException ex){
            System.out.println("Error al insertar una noticia: "+ ex);
           return false;
        }finally{
            session.close();
        }
    }

    /*
     *   Updates the record in the DB
     *
     *   @return Returns boolean depending if the action was succesful or not
     */
    public boolean modifyNews(){
        try{
            if(!isInserted()) return false;
            if(isInserted(news.getNewTitle())) return false;
            session = factory.openSession();
            session.beginTransaction();

            News newsDB = (News) session.get(News.class, getID());

            newsDB.setTitle(news.getNewTitle());
            newsDB.setDescription(news.getDescription());
            newsDB.setAuthor(news.getAuthor());
            newsDB.setDate_Init(news.getDate_Init());
            newsDB.setDate_Fin(news.getDate_Fin());
            newsDB.setUrl_Image(news.getUrl_Image());

            session.update(newsDB);
            session.getTransaction().commit();
            return true;
        }catch (RollbackException ex) {
            System.out.println("Error al modificar el alumno: " + ex);
            return false;
        }finally{
            session.close();
        }
    }
    
    /*
     *   Deletes the news given in the constructor
     *
     *   @returns a boolean depending if it worked or not
     */
    public boolean deleteNews(){
        try{
            if(!isInserted()) return false;
                session = factory.openSession();
                session.beginTransaction();

                String hql = "DELETE from News "  + 
                 "WHERE lower(title) like lower('%" + news.getTitle() + "%')";
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