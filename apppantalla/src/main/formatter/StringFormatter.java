public class StringFormatter {
    
    public StringFormatter(){
        //Empty Constructor to call the static method 'capitalize()'
    }
    
    public static String capitalize(String s){
        /*
        *   Sets the first letter in Uppercase and the rest in Lowercase
        *
        *   @param Chain of characters to format
        *
        *   @returns The chain formatted
        */
        
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
}
