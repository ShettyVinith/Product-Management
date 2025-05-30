package servlet;

import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {

    // Handle GET request to load the form with required data (like categories)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("type"); // e.g. "price", "category", "top"
        request.setAttribute("reportType", reportType);

        if ("category".equals(reportType)) {
            ProductDAO dao = new ProductDAO();
            List<String> categories = dao.getAllCategories();  // Fetch categories from DB
            request.setAttribute("categories", categories);
        }

        request.getRequestDispatcher("report_form.jsp").forward(request, response);
    }

    // Optional: You can keep or remove POST handler as per your flow.
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward POST to ReportServlet directly or handle criteria as needed
        request.getRequestDispatcher("ReportServlet").forward(request, response);
    }
}
