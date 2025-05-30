<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Product Deleted</title>
    <meta http-equiv="refresh" content="3;url=displayProducts" />
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
        h2 {
            text-align: center;
            color: #28a745;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            padding: 10px 20px;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
        a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Product deleted successfully!</h2>
    <div class="container">
        <a href="displayProducts">Back to Product List</a>
        <p>You will be redirected automatically in 3 seconds...</p>
    </div>
</body>
</html>
