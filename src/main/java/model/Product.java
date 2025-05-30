package model;

public class Product {
    private int productId;
    private String productName;
    private String category;
    private double price;
    private int quantity;
    private Integer sales; // Use Integer to allow null values if needed

    public Product() {
    }

    // Full constructor with sales
    public Product(int productId, String productName, String category, double price, int quantity, Integer sales) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
        this.sales = sales;
    }

    // Constructor without productId (for adding new products)
    public Product(String productName, String category, double price, int quantity, Integer sales) {
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
        this.sales = sales;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }
}
