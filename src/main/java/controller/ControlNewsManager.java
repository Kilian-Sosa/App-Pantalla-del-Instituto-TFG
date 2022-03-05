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
    private String title;
    private String description;
    private String url_image;
    private String date_init;
    private String date_fin;
    private String author;
    private ArrayList<News> list;

    public ControlNewsManager(){

    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setUrlImage(String url_image) {
        this.url_image = url_image;
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

    public String getUrl_Image() {
        return url_image;
    }

    public void setUrl_Image(String url_image) {
        this.url_image = url_image;
    }

    public ArrayList<News> getList() {
        return list;
    }

    public void setList(ArrayList<News> list) {
        this.list = list;
    }

    public int execute(int num){
        /*
        *   Creates a new instance of ControlNews and executes the method depending of the number given
        *
        *   @param  0 meaning getNews(), 1 meaning insertNews(), 2 meaning modifyNews() and 3 meaning deleteNews()
        *
        *   @returns 1 if it worked, 0 if the object is not in the DB or -1 if it did not work
        */
        
        News news = new News(title, description, author, date_init, date_fin);
        ControlNews controlNews = new ControlNews(news, url_image);
        
        if(controlNews.isInserted()){
            switch(num){
                case 0: { list = controlNews.getNews(); 
                        if(!list.isEmpty() && list != null);
                            return 1;
                        }
                case 1: if(controlNews.insertNews()) return 1;
                case 2: if(controlNews.modifyNews()) return 1;
                case 3: if(controlNews.deleteNews()) return 1;
            }    
            return -1;
        }
        return 0;
    }
}