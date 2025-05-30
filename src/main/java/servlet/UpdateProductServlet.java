package servlet;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    // Show update form with existing product data
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getProductById(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }

    // Handle form submission to update product
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Optional: handle sales field
        String salesParam = request.getParameter("sales");
        Integer sales = null;
        if (salesParam != null && !salesParam.trim().isEmpty()) {
            sales = Integer.parseInt(salesParam);
        }

        // Create updated Product object
        Product updatedProduct = new Product(id, name, category, price, quantity, sales);

        try {
            productDAO.updateProduct(updatedProduct);
            response.sendRedirect("displayProducts?success=updated");
        } catch (SQLException e) {
            throw new ServletException("Failed to update product", e);
        }
    }
}
