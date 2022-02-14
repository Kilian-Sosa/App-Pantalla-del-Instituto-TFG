import java.sql.Date;

public class DateFormatter {
    
    public DateFormatter(){
        //Empty Constructor to call the static method 'capitalize()'
    }
    
    public static String setFormat(String s){
        /*
        *   Sets the first letter in Uppercase and the rest in Lowercase
        *
        *   @param Chain of characters to format
        *
        *   @returns The chain formatted
        */
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/aaaa");
        Date date = sdf.parse(s);
        sdf.applyPattern("dd/MM/aaaa");
        return sdf.format(date);
    }
}