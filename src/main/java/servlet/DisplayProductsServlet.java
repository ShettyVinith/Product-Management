package servlet;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayProducts")
public class DisplayProductsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    ProductDAO dao = new ProductDAO();
	    List<Product> productList = dao.getAllProducts();

	    request.setAttribute("products", productList);

	    // Add this to pass the success message parameter to JSP
	    String success = request.getParameter("success");
	    request.setAttribute("success", success);

	    request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
	}

}
