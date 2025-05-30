<%@ page import="java.util.*, model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Product Management Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
 <style>
        :root {
            --primary: #673ab7;
            --primary-dark: #522e93;
            --black: #000000;
            --white: #ffffff;
            --gray: #cdcdcd;
            --transition: all 0.3s ease;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: #f9f9f9;
            color: var(--black);
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, var(--primary), var(--primary-dark));
            color: var(--white);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            z-index: 1000;
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-header h2 {
            font-size: 1.4rem;
        }

        .nav-menu {
            list-style: none;
            padding: 20px 0;
        }

        .nav-item {
            margin: 5px 0;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: var(--white);
            text-decoration: none;
            transition: var(--transition);
            gap: 12px;
            position: relative;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-link i {
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 260px;
            transition: var(--transition);
        }

        .header {
            background: var(--white);
            padding: 20px 30px;
            box-shadow: var(--shadow);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 999;
        }

        .header h1 {
            font-size: 1.8rem;
            color: var(--primary);
            font-weight: 600;
        }

        .header-actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .theme-toggle {
            background: var(--primary);
            color: var(--white);
            border: none;
            padding: 10px 15px;
            border-radius: 25px;
            cursor: pointer;
            transition: var(--transition);
        }

        .theme-toggle:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .content {
            padding: 30px;
        }

        /* Forms */
        .form-container {
            background: var(--white);
            padding: 30px;
            border-radius: 15px;
            box-shadow: var(--shadow);
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--primary);
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--gray);
            border-radius: 8px;
            font-size: 1rem;
            transition: var(--transition);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(103, 58, 183, 0.1);
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: var(--primary);
            color: var(--white);
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: var(--gray);
            color: var(--black);
        }

        .btn-danger {
            background: #dc3545;
            color: var(--white);
        }

        .btn-warning {
            background: #ffc107;
            color: var(--black);
        }

        /* Tables */
        .table-container {
            background: var(--white);
            border-radius: 15px;
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .table th {
            background: var(--primary);
            color: var(--white);
            font-weight: 600;
        }

        .table tr:hover {
            background: rgba(103, 58, 183, 0.05);
        }
        
        /* Alert Success Box */
  #alert-success {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: white;
  color: #4CAF50;
  border-radius: 6px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.15);
  z-index: 10000;
  font-weight: bold;
  font-family: Arial, sans-serif;
  display: flex;
  align-items: center;
  gap: 10px;
  min-width: 250px;
  max-width: 300px;
  overflow: hidden;
  padding: 15px 20px;
  border-left: 6px solid #4CAF50;
  display: none;
}

#alert-success i {
  color: #4CAF50;
  font-size: 20px;
}

#alert-success .progress-bar {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 4px;
  width: 100%;
  background-color: #4CAF50;
  animation: depleteBar 4s linear forwards;
  z-index: 10001;
  
}


@keyframes depleteBar {
  from {
    width: 100%;
  }
  to {
    width: 0%;
  }
}


        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .actions-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        /* Animations */
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-slide-up {
            animation: slideInUp 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .animate-fade-in {
            animation: fadeIn 0.4s ease-out;
        }

        /* Page-specific styles */
        .page {
            display: none;
        }

        .page.active {
            display: block;
            animation: fadeIn 0.4s ease-out;
        }

        .back-btn {
            margin-bottom: 20px;
        }

        .filter-form {
            background: var(--white);
            padding: 20px;
            border-radius: 15px;
            box-shadow: var(--shadow);
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
            align-items: end;
        }

        .mobile-menu-btn {
            display: none;
            background: var(--primary);
            color: var(--white);
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .mobile-menu-btn {
                display: block;
            }
        }
    </style>
</head>
<body>

<div class="container">
  <!-- Sidebar -->
    <nav class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-box"></i> Product Manager</h2>
        </div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="index.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li class="nav-item"><a href="productadd.jsp" class="nav-link"><i class="fas fa-plus-circle"></i> Add Product</a></li>
            <li class="nav-item"><a href="displayProducts" class="nav-link"><i class="fas fa-edit"></i> Update Product</a></li>
            <li class="nav-item"><a href="displayProducts" class="nav-link"><i class="fas fa-trash"></i> Delete Product</a></li>
            <li class="nav-item"><a href="displayProducts" class="nav-link active"><i class="fas fa-eye"></i> View Products</a></li>
            <li class="nav-item"><a href="reports.jsp" class="nav-link"><i class="fas fa-chart-bar"></i> Reports</a></li>
        </ul>
    </nav>

  <!-- Main content -->
  <div class="main-content">
    <header class="header">
      <button class="mobile-menu-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
      </button>
      <h1>Product List</h1>
      <div class="header-actions">
        <!-- optional -->
      </div>
    </header>

    <div class="content">
      <!-- Alert success -->
      <div id="alert-success">
  <i class="fas fa-check-circle"></i>
  <span id="alert-message"></span>
  <div class="progress-bar"></div>
</div>

      

      <!-- Back to dashboard -->
      <a href="index.jsp" class="btn btn-secondary back-btn">
        	<i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>

      <!-- Product table -->
      <div class="table-container animate-slide-up" style="margin-top: 15px;">
        <table class="table">
          <thead>
  <tr>
    <th>ID</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Sales</th> <!-- New column -->
    <th style="text-align:center;">Actions</th>
  </tr>
</thead>
<tbody>
  <%
    List<Product> productList = (List<Product>) request.getAttribute("products");
    if (productList != null) {
      for(Product p : productList){
  %>
  <tr>
    <td><%= p.getProductId() %></td>
    <td><%= p.getProductName() %></td>
    <td><%= p.getCategory() %></td>
    <td>₹<%= String.format("%.2f", p.getPrice()) %></td>
    <td><%= p.getQuantity() %></td>
    <td><%= p.getSales() %></td> <!-- Show sales -->
    <td style="text-align:center;">
      <form action="updateProduct" method="get" style="display:inline;">
        <input type="hidden" name="id" value="<%= p.getProductId() %>" />
        <button type="submit" class="btn btn-warning" title="Update Product">
          <i class="fas fa-edit"></i>
        </button>
      </form>
      <form action="deleteProduct" method="post" style="display:inline;"
        onsubmit="return confirm('Are you sure you want to delete this product?');">
        <input type="hidden" name="id" value="<%= p.getProductId() %>" />
        <button type="submit" class="btn btn-danger" title="Delete Product">
          <i class="fas fa-trash"></i>
        </button>
      </form>
    </td>
  </tr>
  <%
      }
    } else {
  %>
  <tr>
    <td colspan="7" style="text-align:center;">No products found.</td>
  </tr>
  <% } %>
</tbody>

        </table>
      </div>

      <!-- Add and Delete All buttons -->
      <div style="margin-top: 25px; display: flex; gap: 15px;">
        <form action="productadd.jsp" method="get" style="display:inline;">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-plus"></i> Add New Product
          </button>
        </form>

        <form action="deleteProduct" method="post" style="display:inline;"
          onsubmit="return confirm('Are you sure you want to delete ALL products? This action cannot be undone.');">
          <input type="hidden" name="deleteAll" value="true" />
          <button type="submit" class="btn btn-danger">
            <i class="fas fa-trash-alt"></i> Delete All Products
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  // Sidebar toggle for mobile
  function toggleSidebar() {
    document.querySelector('.sidebar').classList.toggle('active');
  }

  (function() {
	  const success = '<%= request.getAttribute("success") != null ? request.getAttribute("success") : "" %>';
	  const alertBox = document.getElementById('alert-success');
	  const alertMessage = document.getElementById('alert-message');
	  
	  if(success === "updated") {
	    alertMessage.textContent = 'Product updated successfully!';
	    alertBox.style.display = 'flex';
	  } else if(success === "deleted") {
	    alertMessage.textContent = 'Product deleted successfully!';
	    alertBox.style.display = 'flex';
	  } else if(success === "added") {
	    alertMessage.textContent = 'Product added successfully!';
	    alertBox.style.display = 'flex';
	  } else if(success === "allDeleted") {
	    alertMessage.textContent = 'All products deleted successfully!';
	    alertBox.style.display = 'flex';
	  }

	  if(alertBox.style.display === 'flex') {
	    // Reset progress bar animation
	    const progressBar = alertBox.querySelector(".progress-bar");
	    progressBar.style.animation = 'none';
	    progressBar.offsetHeight;
	    progressBar.style.animation = null;

	    setTimeout(() => {
	      alertBox.style.display = 'none';
	    }, 4000);
	  }
	})();

</script>

</body>
</html>
