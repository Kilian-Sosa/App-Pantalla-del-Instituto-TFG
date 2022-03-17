/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import POJOs.News;
import java.util.ArrayList;
import model.view.ControlNews;

/**
 *
 * @author kilian
 */
public class ControlNewsManager {
    private News news;
    private int id;
    private String title = "";
    private String description = "";
    private String date_init = "";
    private String date_fin = "";
    private String author = "";
    private int mills = 0;
    private ArrayList<News> list;

    public ControlNewsManager(){

    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDateInit(String date_init) {
        this.date_init = date_init;
    }

    public void setDateFin(String date_fin) {
        this.date_fin = date_fin;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getMills() {
        return mills;
    }

    public void setMills(int mills) {
        this.mills = mills;
    }

    public ArrayList<News> getList() {
        return list;
    }

    public void setList(ArrayList<News> list) {
        this.list = list;
    }
    
    public ArrayList<News> getListByOrder(String field, String order){
        ControlNews controlNeews = new ControlNews(null);
        return controlNeews.getNewsByOrder(field, order);
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    /*
     *   Creates a new instance of ControlNews and executes the method depending
     *   on the number given
     *
     *   @param 0 meaning getNews(), 1 meaning insertNews(), 2 meaning 
     *          modifyNews(), 3 meaning deleteNews() or 4 meaning getNewsByDate()
     *
     *   @returns 1 if it worked or -1 if it did not work
     */
    public int execute(int num){
        news = new News(id, title, description, author, date_init, date_fin, mills);
        ControlNews controlNews = new ControlNews(news);
        if(num == 0) { 
            list = controlNews.getNews(); 
            if(list == null || list.isEmpty()) return -1;
            return 1;
        }else if(num == 4){
            list = controlNews.getNewsByDate(); 
            if(list == null || list.isEmpty()) return -1;
            return 1;

        }
        
        switch(num){
            case 1: if(controlNews.insertNews()) return 1;
                    break;
            case 2: if(controlNews.modifyNews()) return 1;
                    break;
            case 3: if(controlNews.deleteNews()) return 1;
                    break;
        }    
        return -1;
    }
}