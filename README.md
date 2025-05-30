# **Product Management System**

**Subject Name**: Advanced Java  
**Subject Code**: BCS613D  
**Name**: Shetty Prakhyat  
**USN**: 4AL22CS142  
**Sem/Section**: VI/C  

A comprehensive web application for managing product inventory, sales data, and business reports built with JSP, Servlets, and MySQL following MVC architecture principles.

## 🚀 Features

* **Product Management**: Complete CRUD operations for product records
* **Category Management**: Organize products by categories
* **Inventory Control**: Manage stock quantities and track inventory levels
* **Sales Tracking**: Record sales data per product
* **Product Reports**: Generate various reports including:
   * Products above a specific price
   * Products by category
   * Top N products by price, quantity, or sales
* **Search Functionality**: Search products by ID, name, or category
* **Professional UI**: Responsive design with modern dashboards and tables
* **PDF Report Generation**: Download product reports as PDF documents
* **MVC Architecture**: Clean separation of concerns
* **Database Integration**: MySQL with JDBC connectivity

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

* **Java Development Kit (JDK) 8 or higher**
* **Apache Tomcat 9.0 or higher**
* **MySQL Server 5.7 or XAMPP Server**
* **MySQL JDBC Driver (mysql-connector-java)**
* **IDE**: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE
* **Web Browser**: Chrome, Firefox, or Edge

## 🛠️ Project Structure

```
└── 📁ProductWebApp
    └── 📁src
        └── 📁main
            └── 📁java
                └── 📁dao
                    └── ProductDAO.java
                └── 📁model
                    └── Product.java
                └── 📁servlet
                    └── AddProductServlet.java
                    └── DeleteProductServlet.java
                    └── DisplayProductsServlet.java
                    └── ReportCriteriaServlet.java
                    └── ReportServlet.java
                    └── UpdateProductServlet.java
            └── 📁webapp
                └── index.jsp
                └── 📁META-INF
                    └── MANIFEST.MF
                └── productadd.jsp
                └── productdelete.jsp
                └── productdisplay.jsp
                └── productupdate.jsp
                └── report_form.jsp
                └── report_result.jsp
                └── reports.jsp
                └── 📁WEB-INF
                    └── 📁lib
                        └── itextpdf-5.5.13.2.jar
                        └── mysql-connector-j-9.3.0.jar
                    └── web.xml
    └── .classpath
    └── .project
```
