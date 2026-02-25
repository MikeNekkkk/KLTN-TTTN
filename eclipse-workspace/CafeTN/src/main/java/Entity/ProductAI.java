package Entity;

/**
 * Entity cho sản phẩm với thông tin AI (từ product_profile)
 * Dùng để AI có thể tư vấn theo khẩu vị và đặc điểm sản phẩm
 */
public class ProductAI {
    
    // Thông tin cơ bản từ bảng product
    private Long id;
    private String name;
    private double price;
    private String detailDescription;
    private int stockQuantity;
    
    // Thông tin khẩu vị từ bảng product_profile
    private int flavorIntensity;    // Độ đậm (1-5)
    private int bitternessLevel;     // Độ đắng (1-5)
    private int acidityLevel;        // Độ chua (1-5)
    private String roastLevel;       // LIGHT/MEDIUM/DARK
    private String caffeineLevel;    // LOW/MEDIUM/HIGH
    private String tasteNotes;       // Hương vị chính
    private String suitableFor;      // Phù hợp cho ai
    private String recommendedTime;  // Thời điểm tốt nhất
    
    // Constructor mặc định
    public ProductAI() {
    }
    
    // Constructor đầy đủ
    public ProductAI(Long id, String name, double price, String detailDescription,
                     int stockQuantity, int flavorIntensity, int bitternessLevel,
                     int acidityLevel, String roastLevel, String caffeineLevel,
                     String tasteNotes, String suitableFor, String recommendedTime) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.detailDescription = detailDescription;
        this.stockQuantity = stockQuantity;
        this.flavorIntensity = flavorIntensity;
        this.bitternessLevel = bitternessLevel;
        this.acidityLevel = acidityLevel;
        this.roastLevel = roastLevel;
        this.caffeineLevel = caffeineLevel;
        this.tasteNotes = tasteNotes;
        this.suitableFor = suitableFor;
        this.recommendedTime = recommendedTime;
    }
    
    // Getters and Setters
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getDetailDescription() {
        return detailDescription;
    }
    
    public void setDetailDescription(String detailDescription) {
        this.detailDescription = detailDescription;
    }
    
    public int getStockQuantity() {
        return stockQuantity;
    }
    
    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }
    
    public int getFlavorIntensity() {
        return flavorIntensity;
    }
    
    public void setFlavorIntensity(int flavorIntensity) {
        this.flavorIntensity = flavorIntensity;
    }
    
    public int getBitternessLevel() {
        return bitternessLevel;
    }
    
    public void setBitternessLevel(int bitternessLevel) {
        this.bitternessLevel = bitternessLevel;
    }
    
    public int getAcidityLevel() {
        return acidityLevel;
    }
    
    public void setAcidityLevel(int acidityLevel) {
        this.acidityLevel = acidityLevel;
    }
    
    public String getRoastLevel() {
        return roastLevel;
    }
    
    public void setRoastLevel(String roastLevel) {
        this.roastLevel = roastLevel;
    }
    
    public String getCaffeineLevel() {
        return caffeineLevel;
    }
    
    public void setCaffeineLevel(String caffeineLevel) {
        this.caffeineLevel = caffeineLevel;
    }
    
    public String getTasteNotes() {
        return tasteNotes;
    }
    
    public void setTasteNotes(String tasteNotes) {
        this.tasteNotes = tasteNotes;
    }
    
    public String getSuitableFor() {
        return suitableFor;
    }
    
    public void setSuitableFor(String suitableFor) {
        this.suitableFor = suitableFor;
    }
    
    public String getRecommendedTime() {
        return recommendedTime;
    }
    
    public void setRecommendedTime(String recommendedTime) {
        this.recommendedTime = recommendedTime;
    }
    
    /**
     * Kiểm tra sản phẩm có phù hợp cho người mới không
     */
    public boolean isBeginnerFriendly() {
        return flavorIntensity <= 3 && bitternessLevel <= 3;
    }
    
    /**
     * Kiểm tra sản phẩm có an toàn cho dạ dày không
     */
    public boolean isSafeForStomach() {
        return acidityLevel <= 3;
    }
    
    /**
     * Kiểm tra sản phẩm có an toàn cho tim mạch không
     */
    public boolean isSafeForHeart() {
        return "LOW".equals(caffeineLevel) || "MEDIUM".equals(caffeineLevel);
    }
    
    /**
     * Kiểm tra có phù hợp uống buổi tối không
     */
    public boolean isSuitableForEvening() {
        return "LOW".equals(caffeineLevel) && 
               (recommendedTime != null && recommendedTime.contains("Evening"));
    }
    
    @Override
    public String toString() {
        return "ProductAI{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", flavorIntensity=" + flavorIntensity +
                ", bitternessLevel=" + bitternessLevel +
                ", acidityLevel=" + acidityLevel +
                ", caffeineLevel='" + caffeineLevel + '\'' +
                ", tasteNotes='" + tasteNotes + '\'' +
                '}';
    }
}