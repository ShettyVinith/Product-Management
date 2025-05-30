package servlet;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        List<Product> results = new ArrayList<>();

        String action = request.getParameter("action");
        boolean isDownload = "true".equals(request.getParameter("download"));

        try {
            if ("price".equals(action)) {
                String minPriceStr = request.getParameter("minPrice");
                if (minPriceStr != null && !minPriceStr.trim().isEmpty()) {
                    double minPrice = Double.parseDouble(minPriceStr);
                    results = dao.getProductsAbovePrice(minPrice);
                }

            } else if ("category".equals(action)) {
                String category = request.getParameter("category");
                if (category != null && !category.trim().isEmpty()) {
                    results = dao.getProductsByCategory(category);
                }

            } else if ("top".equals(action)) {
                String topNStr = request.getParameter("topN");
                String sortBy = request.getParameter("sortBy");

                if (topNStr != null && !topNStr.trim().isEmpty()) {
                    int topN = Integer.parseInt(topNStr);

                    if ("price".equals(sortBy)) {
                        results = dao.getTopNProductsByPrice(topN);
                    } else if ("quantity".equals(sortBy)) {
                        results = dao.getTopNProductsByQuantity(topN);
                    } else if ("sales".equals(sortBy)) {
                        results = dao.getTopNProductsBySales(topN);
                    }
                }
            }

            // If user clicked Download PDF
            if (isDownload && results != null && !results.isEmpty()) {
                generatePdfReport(results, response);
                return;
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input. Please enter valid numbers.");
        }

        request.setAttribute("products", results);
        request.setAttribute("action", action);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }

    // ✅ Now with Sales column
    private void generatePdfReport(List<Product> products, HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=report.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Paragraph title = new Paragraph("Product Report", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(6); // 6 columns now
            table.setWidthPercentage(100);
            table.setWidths(new float[]{1, 3, 2, 2, 2, 2});

            addTableHeader(table);

            for (Product product : products) {
                table.addCell(String.valueOf(product.getProductId()));
                table.addCell(product.getProductName());
                table.addCell(product.getCategory());
                table.addCell(String.valueOf(product.getPrice()));
                table.addCell(String.valueOf(product.getQuantity()));
                table.addCell(String.valueOf(product.getSales())); // ✅ added Sales cell
            }

            document.add(table);
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Added "Sales" to header
    private void addTableHeader(PdfPTable table) {
        Stream.of("ID", "Name", "Category", "Price", "Quantity", "Sales").forEach(columnTitle -> {
            PdfPCell header = new PdfPCell();
            header.setPhrase(new Phrase(columnTitle));
            header.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(header);
        });
    }
}
