/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import POJOs.Email;
import POJOs.User;
import java.util.ArrayList;
import model.view.ControlUsers;
import model.view.LogIn;

/**
 *
 * @author kilian
 */
public class ControlUsersManager{
    private User user;
    private String email;
    private String password;
    private String name;
    private int rol;
    private int id;
    private ArrayList<User> list;

    public ControlUsersManager(){

    }  

    public void setEmail(String email){
        this.email = email;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getRol() {
        return rol;
    }

    public String getName() {
        return name;
    }

    public ArrayList<User> getList() {
        return list;
    }

    public void setList(ArrayList<User> list) {
        this.list = list;
    }

    /*
     *   Creates a new instance of ControlUsers or LogIn and executes the method 
     *   depending of the number given
     *
     *   @param 0 meaning LogIn, 1 meaning getUsers(), 2 meaning insertUser(), 
     *          3 meaning modifyUser() or 4 meaning deleteUser()
     *
     *   @returns 1 if it worked or -1 if it did not work
     */
    public int execute(int num){
        Email emailObject = new Email(email, password);

        if(num == 0){
            LogIn login = new LogIn(emailObject);
            if(login.isInserted())
                if(login.isSamePassword()){
                    rol = login.getRol();
                    name = login.getName();
                    System.out.println("El correo y la contraseña son correctos");
                    return 1;
                }else{
                    System.out.println("La contraseña no es correcta");
                    return -1;
                }
            System.out.println("El correo no figura en la base de datos");
        }else{
            user = new User(name, emailObject, rol);
            ControlUsers controlUsers = new ControlUsers(user);
            switch(num){
                case 1: list = controlUsers.getUsers(); 
                        if(list == null || list.isEmpty()) return -1;
                        return 1;
                case 2: if(controlUsers.insertUser()) return 1;
                        break;
                case 3: if(controlUsers.modifyUser()) return 1;
                        break;
                case 4: if(controlUsers.deleteUser()) return 1;
                        break;
            }  
        }
        return -1;
    }
}