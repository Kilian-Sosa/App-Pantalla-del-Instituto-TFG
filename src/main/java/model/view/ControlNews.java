package model.view;

import POJOs.News;
import java.io.File;
import java.util.ArrayList;
import javax.persistence.RollbackException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.hql.internal.ast.QuerySyntaxException;

public class ControlNews {
    private News news;
    private static SessionFactory factory;
    private static Session session;

    public ControlNews(News news){
        this.news = news;
        factory = new Configuration().configure(new File("hibernate.cfg.xml")).addAnnotatedClass(News.class).buildSessionFactory();
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
            System.out.println("Se ha producido un error al recoger los registros: " + e);
            return null;
        }finally{
            session.close();
        }
    }

    /*
     *   Inserts the news in the DB
     *
     *   @returns a boolean depending if it worked or not
     */
    public boolean insertNews(){
        try{
            session = factory.openSession();
            session.beginTransaction();

            session.save(news);

            session.getTransaction().commit();

            System.out.println("Noticia insertada correctamente.");
            return true;
        } catch(RollbackException ex){
            System.out.println("Error al insertar la noticia: "+ ex);
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
    public boolean modifyNews(){
        try{
            session = factory.openSession();
            session.beginTransaction();
            
            News newsDB = (News) session.get(News.class, news.getID());

            newsDB.setTitle(news.getTitle());
            newsDB.setDescription(news.getDescription());
            newsDB.setAuthor(news.getAuthor());
            newsDB.setDate_Init(news.getDate_Init());
            newsDB.setDate_Fin(news.getDate_Fin());
            newsDB.setUrl_Image(news.getUrl_Image());

            session.update(newsDB);
            session.getTransaction().commit();
            return true;
        }catch (RollbackException ex) {
            System.out.println("Error al modificar la noticia: " + ex);
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
            session = factory.openSession();
            session.beginTransaction();

            String hql = "DELETE from News "  + 
                 "WHERE id = '" + news.getID() + "'";
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