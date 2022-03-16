/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import POJOs.Log;
import java.util.ArrayList;
import model.view.ControlLog;

/**
 *
 * @author kilian
 */
public class ControlLogManager {
    
    private String action, author, date;
    private ArrayList<Log> list;
    
    public ControlLogManager(){
        
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public ArrayList<Log> getList() {
        return list;
    }

    public void setList(ArrayList<Log> list) {
        this.list = list;
    }
    
    public ArrayList<Log> getListByOrder(String field, String order){
        ControlLog controlLog = new ControlLog(null);
        return controlLog.getLogByOrder(field, order);
    }
    
    /*
     *   Creates a new instance of ControlNews and executes the method depending
     *   on the number given
     *
     *   @param 0 meaning getNews() or 1 meaning insertNews()
     *
     *   @returns 1 if it worked or -1 if it did not work
     */
    public int execute(int num){
        ControlLog controlLog = new ControlLog(new Log(action, author, date));
        
        if(num == 0){
            list = controlLog.getLog();
            if(list == null || list.isEmpty()) return -1;
            return 1;
        }else if(num == 1) if(controlLog.insertLog()) return 1;
        
        return -1;
    }
}
