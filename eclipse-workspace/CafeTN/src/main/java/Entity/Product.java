package Entity;

import java.math.BigDecimal;
import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long categoryId; 
	private String name;
	private BigDecimal price;
	private String detailDescription;
	private String imageUrl;
	private Integer stockQuantity;
	private String categoryName;
	private String status; 

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Product() {
		super();
	}

	public Product(Long id, Long categoryId, String name, BigDecimal price, String detailDescription, String imageUrl,
			Integer stockQuantity) {
		super();
		this.id = id;
		this.categoryId = categoryId;
		this.name = name;
		this.price = price;
		this.detailDescription = detailDescription;
		this.imageUrl = imageUrl;
		this.stockQuantity = stockQuantity;
	}

	// Getters
	public Long getId() {
		return id;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public String getName() {
		return name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public Integer getStockQuantity() {
		return stockQuantity;
	}

	// Setters
	public void setId(Long id) {
		this.id = id;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public void setStockQuantity(Integer stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", price=" + price
				+ ", stockQuantity=" + stockQuantity + "]";
	}

	public String getCategoryName() {
		return categoryName;
	}

	// ... Setters
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}