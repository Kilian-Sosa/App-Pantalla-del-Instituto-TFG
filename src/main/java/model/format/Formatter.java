package model.format;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Formatter {

    public Formatter(){
        //Empty Constructor to call the static methods
    }
    
    /*
     *   Sets the first letter in Uppercase and the rest in Lowercase
     *
     *   @param Chain of characters to format
     *
     *   @returns The chain formatted
     */
    public static String capitalizeWords(String s){
        String[] array = s.split("\\s");
        String res = "";
        if(s.length() == 0) return res;
        //If the String given is empty (Example: A field is not filled), it is 
        //controlled and it finishes before entering the for loop
        
        for(int i = 0; i < array.length ; i++)
            res += array[i].substring(0, 1).toUpperCase() + array[i].substring(1).toLowerCase() + " ";
        
        //Finally, the 'trim()' method is used in order to erase innecesary blanks
        return res.trim();
    }
    
    /*
     *   Sets the first letter in Uppercase and the rest in Lowercase
     *
     *   @param Chain of characters to format
     *
     *   @returns The chain formatted
     */
    public static String setDateFormat(String s) throws ParseException{
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/aaaa");
        Date date = (Date) sdf.parse(s);
        sdf.applyPattern("dd/MM/aaaa");
        return sdf.format(date);
    }
}