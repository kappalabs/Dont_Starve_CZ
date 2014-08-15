import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Uprav {
    
    private static final String IDENT = "-#&#-";
    private static final String ORIGLINE = "msgid ";
    private static final String EDITLINE = "msgstr ";
    private static final String TOEDIT = "STRINGS.NAMES";
    
    
    static void readFile(String file_in, String file_out) {
        BufferedReader br = null;
        PrintWriter pw;
        System.out.println("Encoding: "+ Charset.defaultCharset());
        try {
            File f_in = new File(file_in);
            br = new BufferedReader(new FileReader(f_in));
            File f_out = new File(file_out);
            pw = new PrintWriter(f_out);
            
            String line, orig="", trans;
            boolean edit = false;
            while ((line=br.readLine()) != null) {
                if (line.contains(TOEDIT))
                    edit = true;
                else if (edit && line.startsWith(ORIGLINE))
                    orig = line.substring(line.indexOf("\"")+1, line.lastIndexOf("\""));
                else if (edit && line.startsWith(EDITLINE)) {
                    trans = line.substring(line.indexOf("\"")+1, line.lastIndexOf("\""));
//                    line = EDITLINE+"\""+orig+IDENT+trans+"\"";
                    line = EDITLINE+"\""+trans+IDENT+orig+"\"";
                    edit = false;
                }
                pw.println(line);
            }
            br.close();
            pw.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Uprav.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Uprav.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] a) {
        if(a!=null && a.length==2)
            readFile(a[0], a[1]);
        else
            System.out.println("Please write input and output files as two arguments.");
    }
    
}
