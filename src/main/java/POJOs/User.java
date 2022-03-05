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
    private String rol;
    
    public User(){
        
    }
    
    public User(String name, Email email){
        this.name = name;
        this.emailS = email.getEmail();
        this.password = email.getPassword();
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

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
