/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Chunk;

public class head extends PdfPageEventHelper {
    public void onStartPage(PdfWriter writer,Document document) {
    	Rectangle rect = writer.getBoxSize("art");
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Rumah Sakit Medicare"), (rect.getRight()-(rect.getLeft())+40)/2, rect.getTop()+39, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Jl. Raya ITS - Kampus ITS Sukolilo"), (rect.getRight()-(rect.getLeft())+40)/2, rect.getTop()+26, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Surabaya 60111, Tlp 031-889922"), (rect.getRight()-(rect.getLeft())+40)/2, rect.getTop()+13, 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("=========================================================================================================="), (rect.getRight()-(rect.getLeft())+40)/2, rect.getTop(), 0);
        
        //ColumnText.s
        //ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Top Right"), rect.getRight(), rect.getTop(), 0);
    }
} 