/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJOs;

/**
 *
 * @author kilian
 */
public class Email {
    private  String mail, password;

    public Email(String mail, String password){
        this.mail = mail.toLowerCase();
        this.password = password;
    }

    public String getEmail() {
        return mail;
    }

    public void setEmail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
