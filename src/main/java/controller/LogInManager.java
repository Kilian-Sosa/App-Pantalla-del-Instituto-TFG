/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import POJOs.Email;
import model.view.LogIn;

/**
 *
 * @author kilian
 */
public class LogInManager{

    private String email;
    private String password;


    public LogInManager(){

    }  

    public void setEmail(String email){
        this.email = email;
        System.out.println("aaaaaa" + email);
    }

    public void setPassword(String password){
        this.password = password;
    }

    public int execute(){
        Email emailObject = new Email(email, password);
        LogIn login = new LogIn(emailObject);

        if(login.isInserted())
            if(login.isSamePassword()){
                System.out.println("El correo y la contraseña son correctos");
                return 1;
            }else{
                System.out.println("La contraseña no es correcta");
                return -1;
            }
        System.out.println("El email no figura en la base de datos");
        return 0;
    }
    
    public String getRol(){
        Email emailObject = new Email(email, password);
        LogIn login = new LogIn(emailObject);
        return login.getRol();
    }
}