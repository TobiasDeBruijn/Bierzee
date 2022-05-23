package dev.array21.bierzee.pdf;

import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import org.springframework.lang.Nullable;

public class Common {
    public static Cell getCell(String text, boolean bold, @Nullable TextAlignment alignment) {
        Cell cell = new Cell();
        cell.setBorder(Border.NO_BORDER);
        cell.add(new Paragraph(text));

        if(alignment != null) {
            cell.setTextAlignment(alignment);
        }

        if(bold) {
            cell.setBold();
        }

        return cell;
    }
}
