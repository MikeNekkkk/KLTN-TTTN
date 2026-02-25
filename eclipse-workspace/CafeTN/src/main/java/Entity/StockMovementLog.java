package Entity;

import java.sql.Timestamp;

public class StockMovementLog {
    
    private Long id;
    private Long productId;
    private String productName;  // Join từ bảng product
    private Long orderId;         // NULL nếu là nhập/xuất thủ công
    private String movementType;  // "IN" hoặc "OUT"
    private int quantity;
    private String note;
    private String createdBy;
    private Timestamp createdAt;
    
    // Constructors
    public StockMovementLog() {
    }
    
    public StockMovementLog(Long productId, String movementType, 
                           int quantity, String note, String createdBy) {
        this.productId = productId;
        this.movementType = movementType;
        this.quantity = quantity;
        this.note = note;
        this.createdBy = createdBy;
    }
    
    // Getters and Setters
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getProductId() {
        return productId;
    }
    
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    
    public String getProductName() {
        return productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public Long getOrderId() {
        return orderId;
    }
    
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    
    public String getMovementType() {
        return movementType;
    }
    
    public void setMovementType(String movementType) {
        this.movementType = movementType;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getNote() {
        return note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }
    
    public String getCreatedBy() {
        return createdBy;
    }
    
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    // Helper methods
    
    public boolean isImport() {
        return "IN".equals(movementType);
    }
    
    public boolean isExport() {
        return "OUT".equals(movementType);
    }
    
    public String getMovementTypeDisplay() {
        return isImport() ? "Nhập kho" : "Xuất kho";
    }
    
    public String getQuantityDisplay() {
        return isImport() ? "+" + quantity : "-" + quantity;
    }
    
    @Override
    public String toString() {
        return "StockMovementLog{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", movementType='" + movementType + '\'' +
                ", quantity=" + quantity +
                ", createdAt=" + createdAt +
                '}';
    }
}