/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJOs;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 *
 * @author kilian
 */
@Entity
@Table(name = "noticias")
public class News{
            
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "titulo")
    private String title;
    
    @Column(name = "cuerpo")
    private String description;
    
    @Column(name = "url_imagen")
    private String url_image;
    
    @Column(name = "diaInicio")
    private String date_init;
    
    @Column(name = "diaFin")
    private String date_fin;
    
    //@Column(name = "autor")
    //private String author;

    public News(){
        
    }
    
    public News(String title, String description, String date_init, String date_fin){
        this.title = title;
        this.description = description;
        this.date_init = date_init;
        this.date_fin = date_fin;
    }
    
    public News(String title, String description, String author, String date_init, String date_fin){
        this.title = title;
        this.description = description;
        //this.author = author;
        this.date_init = date_init;
        this.date_fin = date_fin;
    }
    
    public News(int id, String title, String description, String author, String date_init, String date_fin){
        this.id = id;
        this.title = title;
        this.description = description;
        //this.author = author;
        this.date_init = date_init;
        this.date_fin = date_fin;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate_Init() {
        return date_init;
    }

    public void setDate_Init(String date_init) {
        this.date_init = date_init;
    }

    public String getDate_Fin() {
        return date_fin;
    }

    public void setDate_Fin(String date_fin) {
        this.date_fin = date_fin;
    }

    public String getUrl_Image() {
        return url_image;
    }

    public void setUrl_Image(String url_image) {
        this.url_image = url_image;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
