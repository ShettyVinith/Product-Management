package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import dao.ProductDAO;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO(); // initialize DAO once during servlet init
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the product add form JSP
        response.sendRedirect("productadd.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch data from form
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Optional: Fetch sales field, allow null if empty
        String salesParam = request.getParameter("sales");
        Integer sales = null;
        if (salesParam != null && !salesParam.trim().isEmpty()) {
            sales = Integer.parseInt(salesParam);
        }

        // Create Product object with sales
        Product product = new Product(productName, category, price, quantity, sales);

        try {
            productDAO.addProduct(product);
            response.sendRedirect("displayProducts?success=added");
        } catch (SQLException e) {
            throw new ServletException("Database error while adding product", e);
        }
    }
}
