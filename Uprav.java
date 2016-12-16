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

    private static final String ORIGLINE = "msgid ";
    private static final String EDITLINE = "msgstr ";
    private static final String TOEDIT   = "STRINGS.NAMES";


    static void modifyFile(String inputFileName, String outputFileName, String separator) {
        BufferedReader br = null;
        PrintWriter pw;
        System.out.println("Encoding: " + Charset.defaultCharset());
        try {
            br = new BufferedReader(new FileReader(new File(inputFileName)));
            pw = new PrintWriter(new File(outputFileName));

            String line, originalWord = "", translatedWord;
            boolean edit = false;
            while ((line = br.readLine()) != null) {
                if (line.contains(TOEDIT)) {
                    edit = true;
                } else if (edit && line.toLowerCase().startsWith(ORIGLINE)) {
                    originalWord = line.substring(line.indexOf("\"") + 1, line.lastIndexOf("\""));
                } else if (edit && line.toLowerCase().startsWith(EDITLINE)) {
                    translatedWord = line.substring(line.indexOf("\"") + 1, line.lastIndexOf("\""));
                    line = EDITLINE + "\"" + translatedWord + separator + originalWord + "\"";
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

    private static void usage() {
        System.out.println("usage: " + Uprav.class.getSimpleName() + " input_file output_file separator\n"
             + "\tinput_file .... file to be modified\n"
             + "\toutput_file ... where to save the modified file\n"
             + "\tinput_file .... original & translated string separator\n");
    }

    public static void main(String[] as) {
        if (as != null && as.length == 3) {
            modifyFile(as[0], as[1], as[2]);
        } else {
            usage();
            return;
        }
    }

}
