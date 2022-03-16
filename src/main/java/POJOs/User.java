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

/**
 *
 * @author kilian
 */
@Entity
@Table(name = "usuarios")
public class User{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "nombre")
    private String name;
    
    @Column(name = "correo")
    private String emailS;
    
    @Column(name = "contraseña")
    private String password;
    
    @Column(name = "rol")
    private int rol;
    
    public User(){
        
    }
    
    public User(String name, Email email){
        this.name = name;
        this.emailS = email.getEmail();
        this.password = email.getPassword();
    }
    
    public User(String name, Email email, int rol){
        this.name = name;
        this.emailS = email.getEmail();
        this.password = email.getPassword();
        this.rol = rol;
    }
    
    public User(int id, String name, Email email, int rol){
        this.id = id;
        this.name = name;
        this.emailS = email.getEmail();
        this.password = email.getPassword();
        this.rol = rol;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Email getEmail() {
        return new Email(emailS, password);
    }

    public void setEmail(Email email) {
        this.emailS = email.getEmail();
        this.password = email.getPassword();
    }

    public String getPassword() {
        return password;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getRolS(){
        if(rol == 0) return "Profesor";
        return "Administrador";
    }
    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }
}