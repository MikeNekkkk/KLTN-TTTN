package Entity;

import java.sql.Timestamp;

public class Blog{
    private Long id;
    private String title;
    private String slug;
    private String thumbnailUrl;
    private String content;
    private String excerpt;
    private Long authorId;
    private String authorName;
    private String category;
    private int viewCount;
    private String status; // DRAFT, PUBLISHED, ARCHIVED
    private Timestamp publishedAt;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructor
    public Blog() {}

    public Blog(Long id, String title, String slug, String thumbnailUrl, 
                String content, String excerpt, Long authorId, String authorName,
                String category, int viewCount, String status, 
                Timestamp publishedAt, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.title = title;
        this.slug = slug;
        this.thumbnailUrl = thumbnailUrl;
        this.content = content;
        this.excerpt = excerpt;
        this.authorId = authorId;
        this.authorName = authorName;
        this.category = category;
        this.viewCount = viewCount;
        this.status = status;
        this.publishedAt = publishedAt;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getExcerpt() {
        return excerpt;
    }

    public void setExcerpt(String excerpt) {
        this.excerpt = excerpt;
    }

    public Long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Long authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(Timestamp publishedAt) {
        this.publishedAt = publishedAt;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", slug='" + slug + '\'' +
                ", authorName='" + authorName + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}