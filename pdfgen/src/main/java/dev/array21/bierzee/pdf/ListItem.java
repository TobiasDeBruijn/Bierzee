package dev.array21.bierzee.pdf;

import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.List;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;
import org.springframework.core.io.ClassPathResource;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Objects;

public class ListItem {

    public static byte[] createPdf(Listable[] items) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PdfDocument pdfDocument = new PdfDocument(new PdfWriter(byteArrayOutputStream));
        Document document = new Document(pdfDocument);
        document.setMargins(40f, 30f, 40f, 30f);

        ClassPathResource classPathResource = new ClassPathResource("sportfondsen-logo-150.png");
        FileInputStream fileInputStream = new FileInputStream(classPathResource.getFile());

        ImageInputStream imageInputStream = ImageIO.createImageInputStream(fileInputStream);
        BufferedImage bufferedImage = ImageIO.read(imageInputStream);
        Image logo = new Image(ImageDataFactory.create(classPathResource.getFile().toURI().toURL()))
                .setHeight(100f)
                .setWidth(bufferedImage.getWidth() / (bufferedImage.getHeight() / 100f))
                .setBorder(Border.NO_BORDER);

        Table headerTable = new Table(new float[] {8, 2});
        headerTable.startNewRow();
        headerTable.addCell(new Cell().setBorder(Border.NO_BORDER));
        headerTable.addCell(new Cell()
                .add(logo)
                .setBorder(Border.NO_BORDER)
                .setHorizontalAlignment(HorizontalAlignment.RIGHT));

        headerTable.startNewRow();
        headerTable.addCell(Common.getCell(String.format("%s Lijst", items[0].getName()), true, TextAlignment.LEFT)
                .setWidth(pdfDocument.getDefaultPageSize().getWidth() - document.getLeftMargin()));
        headerTable.addCell(new Cell().setBorder(Border.NO_BORDER));

        document.add(headerTable);

        SolidLine blackLine = new SolidLine(1f);
        blackLine.setColor(ColorConstants.BLACK);

        document.add(new LineSeparator(blackLine).setMarginBottom(15f).setMarginTop(5f));

        Table itemsTable = new Table(new float[] { 2, 2, 2 });
        itemsTable.setHorizontalAlignment(HorizontalAlignment.CENTER);
        itemsTable.useAllAvailableWidth();
        itemsTable.setBorder(Border.NO_BORDER);

        final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");

        itemsTable.startNewRow();
        itemsTable.addCell(Common.getCell("Naam item", true, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));
        itemsTable.addCell(Common.getCell("Naam gebruiker", true, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));
        itemsTable.addCell(Common.getCell("Datum", true, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));

        for(Listable listable : items) {
            itemsTable.addCell(Common.getCell(listable.getName(), false, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));
            itemsTable.addCell(Common.getCell(listable.getAuthorName(), false, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));

            LocalDateTime localDateTime = LocalDateTime.ofEpochSecond(listable.getDate(), 0, ZoneOffset.UTC);
            itemsTable.addCell(Common.getCell(formatter.format(localDateTime), false, TextAlignment.LEFT).setBorder(new SolidBorder(ColorConstants.BLACK, 1f)));
        }

        itemsTable.startNewRow();
        itemsTable.addCell(Common.getCell("", false, TextAlignment.LEFT));
        itemsTable.addCell(Common.getCell("Totaal:", true, TextAlignment.RIGHT));
        itemsTable.addCell(Common.getCell(String.format("%d %s", items.length, items[0].getName()), true, TextAlignment.RIGHT));

        document.add(itemsTable);

        document.close();
        return byteArrayOutputStream.toByteArray();
    }
}
