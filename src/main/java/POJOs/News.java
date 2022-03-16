/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJOs;

import java.io.File;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
    
    @Column(name = "imagen")
    private Blob image;
    
    @Transient
    private File file;
    
    @Column(name = "diaInicio")
    private String date_init;
    
    @Column(name = "diaFin")
    private String date_fin;
    
    @Column(name = "autor")
    private String author;
    
    @Column(name = "milisegundos")
    private int mills;
    
    public News(){
        
    }
    
    public News(String title, String description, String date_init, String date_fin){
        this.title = title;
        this.description = description;
        this.date_init = date_init;
        this.date_fin = date_fin;
        this.image = null;
        this.file = null;
        this.mills = 0;
    }
    
    public News(String title, String description, String author, String date_init, String date_fin, File image){
        this.title = title;
        this.description = description;
        this.author = author;
        this.date_init = date_init;
        this.date_fin = date_fin;
        this.image = (Blob) image;
        this.file = image;
        this.mills = 0;
    }
    
    public News(int id, String title, String description, String author, String date_init, String date_fin, File image, int mills){
        this.id = id;
        this.title = title;
        this.description = description;
        this.author = author;
        this.date_init = date_init;
        this.date_fin = date_fin;
        this.image = (Blob) image;
        this.file = image;
        this.mills = mills;
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

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getMills() {
        return mills;
    }

    public void setMills(int mills) {
        this.mills = mills;
    }
    
    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }
}