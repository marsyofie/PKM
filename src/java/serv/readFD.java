package serv;
import java.io.*;
public class readFD {
   public static String readFD() throws IOException {    
        String[] letters = new String[]{ "D","E","F", "G", "H", "I","J","K"};
        File[] drives = new File[letters.length];
        boolean[] isDrive = new boolean[letters.length];
        for ( int i = 0; i < letters.length; ++i ){
            drives[i] = new File(letters[i]+":/");
            isDrive[i] = drives[i].canRead();
        }
         while(true){
            for ( int i = 0; i < letters.length; ++i ){
                boolean pluggedIn = drives[i].canRead();
                if ( pluggedIn != isDrive[i] ){
                    if ( pluggedIn ){
                                String status=letters[i];
                                return status;
                    }
                    else{
                    }
                    isDrive[i] = pluggedIn;
                }
            }
            try { 
                Thread.sleep(100); 
            }catch (InterruptedException e) { 
            }
        }
    }
}