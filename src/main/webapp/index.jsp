<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Product Management Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255,255,255,0.1);
            transform: translateX(5px);
        }

        .nav-link i {
            margin-right: 12px;
        }

        .main-content {
            flex: 1;
            margin-left: 260px;
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
        }

        .theme-toggle {
            background: var(--primary);
            color: var(--white);
            border: none;
            padding: 10px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: var(--transition);
        }

        .theme-toggle:hover {
            background: var(--primary-dark);
        }

        .content {
            padding: 40px 30px;
        }

        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            overflow: visible;
        }

        .action-card {
            background: var(--white);
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: var(--shadow);
            text-align: center;
            text-decoration: none;
            color: var(--black);
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
            transition: all 0.4s ease;
            transform-origin: center center;
            opacity: 0;
    		animation: fadeUp 0.8s ease forwards;
        }

        .action-card:hover {
    transform: translateY(-10px) scale(5.05);
    box-shadow: 0 20px 40px rgba(103, 58, 183, 0.25),
                0 0 15px rgba(103, 58, 183, 0.15);
    color: var(--primary);
}




        .action-card i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
            transition: transform 0.6s ease;
        }

        .action-card:hover i {
            transform: rotate(360deg) scale(1.1);
        }

        .action-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--primary-dark);
        }

        .action-desc {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .action-link {
            display: inline-block;
            background: var(--primary);
            color: var(--white);
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 1rem;
            text-decoration: none;
            transition: var(--transition);
            margin-top: auto;
        }

        .action-link:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }
        
        
        
        
        @keyframes fadeUp {
    0% {
        opacity: 0;
        transform: translateY(30px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}



/* Optional: stagger effect for cards */
.action-card:nth-child(1) { animation-delay: 0.1s; }
.action-card:nth-child(2) { animation-delay: 0.2s; }
.action-card:nth-child(3) { animation-delay: 0.3s; }
.action-card:nth-child(4) { animation-delay: 0.4s; }
.action-card:nth-child(5) { animation-delay: 0.5s; }
        

        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }

            .main-content {
                margin-left: 0;
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
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link active">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="productadd.jsp" class="nav-link">
                        <i class="fas fa-plus-circle"></i> Add Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="displayProducts" class="nav-link">
                        <i class="fas fa-edit"></i> Update Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="displayProducts" class="nav-link">
                        <i class="fas fa-trash"></i> Delete Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="displayProducts" class="nav-link">
                        <i class="fas fa-eye"></i> View Products
                    </a>
                </li>
                <li class="nav-item">
                    <a href="reports.jsp" class="nav-link">
                        <i class="fas fa-chart-bar"></i> Reports
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <header class="header">
                <h1>Dashboard</h1>
                
            </header>

            <div class="content">
                <div class="actions-grid">
                    <div class="action-card">
                        <i class="fas fa-plus-circle"></i>
                        <div class="action-title">Add Product</div>
                        <div class="action-desc">Easily create new product entries with detailed information including name, category, price, and stock.</div>
                        <a href="productadd.jsp" class="action-link">Go to Add Product</a>
                    </div>

                    <div class="action-card">
                        <i class="fas fa-edit"></i>
                        <div class="action-title">Update Product</div>
                        <div class="action-desc">Modify existing product details, update pricing, stock, or categories to keep your inventory current.</div>
                        <a href="displayProducts" class="action-link">Go to Update Product</a>
                    </div>

                    <div class="action-card">
                        <i class="fas fa-trash"></i>
                        <div class="action-title">Delete Product</div>
                        <div class="action-desc">Remove outdated or discontinued products from your inventory safely and efficiently.</div>
                        <a href="displayProducts" class="action-link">Go to Delete Product</a>
                    </div>

                    <div class="action-card">
                        <i class="fas fa-eye"></i>
                        <div class="action-title">View Products</div>
                        <div class="action-desc">Browse through all products with filters and sorting options to find what you need quickly.</div>
                        <a href="displayProducts" class="action-link">Go to View Products</a>
                    </div>

                    <div class="action-card">
                        <i class="fas fa-chart-line"></i>
                        <div class="action-title">Generate Report</div>
                        <div class="action-desc">Create detailed inventory and sales reports to analyze performance and trends.</div>
                        <a href="reports.jsp" class="action-link">Go to Reports</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
