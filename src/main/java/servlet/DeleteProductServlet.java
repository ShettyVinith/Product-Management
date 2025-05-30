package servlet;

import dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteProduct")  // Matches your form action for single deletes
public class DeleteProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        try {
            if (idParam != null && !idParam.trim().isEmpty()) {
                // Delete single product by id
                int id = Integer.parseInt(idParam);
                productDAO.deleteProduct(id);
                response.sendRedirect("displayProducts?success=deleted");
            } else {
                // Delete all products (no id parameter provided)
                productDAO.deleteAllProducts();  // You need to implement this method in your DAO
                response.sendRedirect("displayProducts?success=deletedAll");
            }
        } catch (SQLException e) {
            throw new ServletException("Error deleting product(s)", e);
        }
    }
}
