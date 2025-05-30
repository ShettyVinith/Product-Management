<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reports Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            gap: 12px;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-link i {
            width: 20px;
            text-align: center;
        }

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
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .main-content {
                margin-left: 0;
            }
        }

        .content {
            padding: 30px;
            text-align: center;
        }

        .report-link {
            display: inline-block;
            margin: 20px;
            padding: 18px 30px;
            background-color: var(--primary);
            color: var(--white);
            text-decoration: none;
            font-size: 18px;
            border-radius: 10px;
            transition: var(--transition);
            box-shadow: var(--shadow);
        }

        .report-link:hover {
            background-color: var(--primary-dark);
            transform: translateY(-3px);
        }

        .back-btn {
            margin-top: 20px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            background: var(--gray);
            color: var(--black);
            padding: 12px 20px;
            border-radius: 8px;
            transition: var(--transition);
        }

        .back-btn:hover {
            background: #bbb;
        }
        
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }

        .report-card {
            background: var(--white);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 30px 20px;
            text-align: center;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .report-card:hover {
    transform: translateY(-5px) scale(5.05);
    box-shadow: 0 20px 40px rgba(103, 58, 183, 0.25),
                0 0 15px rgba(103, 58, 183, 0.15);
}

.report-card:hover i {
    transform: rotate(360deg) scale(1.1);
}


        .report-card h3 {
            font-size: 24px;
            color: var(--primary-dark);
            margin-bottom: 10px;
        }

        .report-card p {
            font-size: 20px;
            color: #555;
            margin-bottom: 20px;
        }

        .report-card a {
            display: inline-block;
            background: var(--primary);
            color: var(--white);
            padding: 12px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 15px;
            transition: var(--transition);
        }

        .report-card a:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .back-btn {
            margin-top: 40px;
        }
        
        .report-card i {
    		font-size: 36px;
    		color: var(--primary);
    		margin-bottom: 15px;
    		transition: transform 0.8s ease;  /* add smooth transition */
		}

		.report-card:hover i {
    		transform: rotate(360deg) scale(1.1);  /* rotate and scale on hover */
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

.report-card {
    opacity: 0;
    animation: fadeUp 0.8s ease forwards;
}

.report-card:nth-child(1) { animation-delay: 0.1s; }
.report-card:nth-child(2) { animation-delay: 0.2s; }
.report-card:nth-child(3) { animation-delay: 0.3s; }

        
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
            <li class="nav-item"><a href="displayProducts" class="nav-link"><i class="fas fa-eye"></i> View Products</a></li>
            <li class="nav-item"><a href="reports.jsp" class="nav-link active"><i class="fas fa-chart-bar"></i> Reports</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <header class="header">
            <button class="mobile-menu-btn" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <h1>Reports Dashboard</h1>
        </header>

        <div class="content">
            <h2>Select a Report</h2>

            <div class="card-grid">
                <div class="report-card">
                    <i class="fas fa-rupee-sign"></i>
                    <h3>Products Above Price</h3>
                    <p>Generate a list of products whose price exceeds a given value for inventory analysis.</p>
                    <a href="report_form.jsp?type=price">Generate Report →</a>
                </div>

                <div class="report-card">
                    <i class="fas fa-tags"></i>
                    <h3>Products by Category</h3>
                    <p>Filter products based on category to track availability and performance by type.</p>
                    <a href="report_form.jsp?type=category">Generate Report →</a>
                </div>

                <div class="report-card">
                    <i class="fas fa-star"></i>
                    <h3>Top N Products</h3>
                    <p>Retrieve top N best-selling or highest-rated products based on sales or feedback.</p>
                    <a href="report_form.jsp?type=top">Generate Report →</a>
                </div>
            </div>

            <a href="index.jsp" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
</div>

<script>
    function toggleSidebar() {
        document.querySelector('.sidebar').classList.toggle('active');
    }
</script>

</body>
</html>
