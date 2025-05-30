<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css"> 
    
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
            <li class="nav-item"><a href="displayProducts" class="nav-link active"><i class="fas fa-edit"></i> Update Product</a></li>
            <li class="nav-item"><a href="displayProducts" class="nav-link"><i class="fas fa-trash"></i> Delete Product</a></li>
            <li class="nav-item"><a href="displayProducts" class="nav-link"><i class="fas fa-eye"></i> View Products</a></li>
            <li class="nav-item"><a href="reports.jsp" class="nav-link"><i class="fas fa-chart-bar"></i> Reports</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <header class="header">
            <h1>Update Product</h1>
            <button class="theme-toggle"><i class="fas fa-moon"></i></button>
        </header>

        <div class="content">
            <a href="index.jsp" class="btn btn-secondary back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>

            <div class="form-container animate-slide-up">
                <h2 style="margin-bottom: 20px; color: var(--primary);">Update Product Details</h2>
                <form action="updateProduct" method="post">
    <input type="hidden" name="id" value="<%= product.getProductId() %>">

    <div class="form-group">
        <label class="form-label">Product Name</label>
        <input type="text" name="productName" class="form-control" value="<%= product.getProductName() %>" required>
    </div>
    <div class="form-group">
        <label class="form-label">Category</label>
        <input type="text" name="category" class="form-control" value="<%= product.getCategory() %>" required>
    </div>
    <div class="form-group">
        <label class="form-label">Price (₹)</label>
        <input type="number" name="price" step="0.01" class="form-control" value="<%= product.getPrice() %>" required>
    </div>
    <div class="form-group">
        <label class="form-label">Quantity</label>
        <input type="number" name="quantity" class="form-control" value="<%= product.getQuantity() %>" required>
    </div>
    <div class="form-group">
        <label class="form-label">Sales</label>
        <input type="number" name="sales" class="form-control" value="<%= product.getSales() %>" required>
    </div>

    <button type="submit" class="btn btn-primary">
        <i class="fas fa-save"></i> Update Product
    </button>
</form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
