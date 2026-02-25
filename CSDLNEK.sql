create database cafe;
use cafe;
SELECT orders.id, first_name, last_name, email, phone, address,
				       city, state, total_amount, status, payment_method,
				       orders.created_at, orders.updated_at,order_items
				FROM orders
				JOIN
				    order_items c ON orders.id = c.order_id
				ORDER BY created_at DESC
TRUNCATE TABLE product;
cREATE TABLE IF NOT EXISTS category (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
ALTER TABLE product 
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' AFTER stock_quantity;

-- Tạo index cho cột status
ALTER TABLE product 
ADD INDEX idx_status (status);

-- Cập nhật tất cả sản phẩm hiện tại thành ACTIVE
UPDATE product SET status = 'ACTIVE' WHERE status IS NULL OR status = '';
-- 3. TẠO BẢNG PRODUCT (SẢN PHẨM)
-- Tương ứng với POJO Product
CREATE TABLE IF NOT EXISTS product (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    category_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    detail_description TEXT,
    image_url VARCHAR(255) NOT NULL,
    stock_quantity INT NOT NULL,
    
    -- Khóa ngoại liên kết với bảng category
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- 4. THÊM DỮ LIỆU MẪU VÀO BẢNG CATEGORY
INSERT INTO category (name) VALUES 
('Cà phê Hòa tan'),      -- id = 1
('Cà phê Rang xay'),     -- id = 2
('Cà phê Hạt mộc'),          -- id = 3
('Sản phẩm mới');         -- id = 4
INSERT INTO product (category_id, name, price, detail_description, image_url, stock_quantity) VALUES 
(1, 'Cà Phê Hòa Tan Sấy Lạnh Trung Nguyên Legend Gold – Hũ 100 gram', 199000.00, 
 'Cà phê hòa tan sấy lạnh Trung Nguyên Legend Gold – Hũ 100g – Tiện lợi, đậm đà, giữ trọn hương vị nguyên bản, dành cho người yêu cà phê chất lượng.',
 'img/product/HT/legend_gold_100g_new.png', 500),

(1, 'Cà Phê Hòa Tan G7 GOLD MOTHERLAND - Hộp 14 sticks', 78000.00, 
 'Mang phong vị của ly cà phê Motherland tại không gian Thế giới Cà phê Trung Nguyên Legend với vị cà phê cân bằng, xen lẫn hương vị thơm nồng và ngọt thanh tự nhiên của gừng. Đóng gói: Hộp 14 sticks x 18gr (12 hộp / thùng).',
 'img/product/HT/g7_gold_motherland.png', 600),

(1, 'Cà Phê Hòa Tan G7 GOLD RUMI - Hộp 14 sticks', 78000.00, 
 'Mang phong vị của ly cà phê Rumi tại không gian Thế giới Cà phê Trung Nguyên Legend với vị cà phê đậm, bùi béo đặc trưng của cà phê Ottoman; cùng vị ngọt ngào hòa quyện của sữa. Đặc biệt: Cà phê đặc trưng và tươi hơn (5% cà phê rang xay nhuyễn), cà phê lắng đọng tại hậu vị sau khi uống. Đóng gói: Hộp 14 sticks x 18gr (12 hộp / thùng).',
 'img/product/HT/g7_gold_rumi.png', 550),

(1, 'Cà Phê Hòa Tan G7 GOLD PICASSO - Hộp 14 sticks', 78000.00, 
 'Mang phong vị của ly cà phê Picasso Latte tại không gian Thế giới Cà phê Trung Nguyên Legend với vị béo, chút đắng nhẹ hòa lẫn hương vanilla ngọt dịu và lớp foam dày, mịn. Đóng gói: Hộp 14 sticks x 18gr (12 hộp / thùng).',
 'img/product/HT/g7_gold_picasso.png', 520),
 
 (1, 'CTrung Nguyên Legend Classic – Hộp 21 gói', 96000.00, 
 'MCảm hứng từ những Bản giao hưởng lừng danh của Thiên tài Âm nhạc người Đức – Ludwig Van Beethoven và ước muốn phụng sự Người đam mê cà phê trên toàn thế giới những Tách cà phê năng lượng tuyệt hảo, các chuyên gia của Tập đoàn cà phê số 1 – Trung Nguyên Legend đã tiên tác nên Tuyệt phẩm cà phê Legend Classic.
  
Những khi không có thời gian đến quán cà phê, bạn có thể tự pha cho mình ly cà phê Legend Classic để nạp năng lượng sáng tạo cho một ngày làm việc.

 Đóng gói:Hộp : 21 góix 18gr (12 hộp / thùng) .',
 'img/product/HT/Classic-24-LE.png', 600),

-- SẢN PHẨM CÀ PHÊ PHIN GIẤY VÀ HÒA TAN ĐẶC BIỆT (CATEGORY_ID = 4)
INSERT INTO product (category_id, name, price, detail_description, image_url, stock_quantity) VALUES 
(4, 'Cà phê hòa tan Trung Nguyên Legend – Americano - Hộp 15 gói', 46000.00, 
 'Thành phần: Cà phê Robusta, Arabica. Đặc tính: Không quá vị đắng như cà phê thông thường, hậu vị ngọt, hương thơm dịu nhẹ. Mô tả sản phẩm: Tuyệt phẩm Trung Nguyên Legend Americano là phiên bản cà phê đen hòa tan rang xay độc đáo...',
 'img/product/SPNew/Americano-LE-600x600.png', 750),

(4, 'Cà phê phin giấy Trung Nguyên Legend – Americano', 130000.00, 
 'Thành phần: Cà phê Arabica, Robusta. Đặc tính: Hương thơm dịu mạnh, xen lẫn một ít vị trà xanh, vị chua ngọt dịu, hậu vị thanh thoát. Mô tả sản phẩm: Tuyệt phẩm Cà Phê Phin Giấy Trung Nguyên Legend Americano...',
 'img/product/SPNew/CPG-Americano-LE-600x600.png', 400),

(4, 'Cà phê phin giấy Trung Nguyên Legend – Vietnamese Blend', 130000.00, 
 'Thành phần: Cà phê Arabica, Robusta, hương cà phê, hương chocolate. Đặc tính: Hương thơm mang phong vị truyền thống của cà phê Việt Nam...',
 'img/product/SPNew/CPG-Fussion-Blend-LE-600x600.png', 450),

(4, 'Cà phê phin giấy Trung Nguyên Legend – Fusion Blend', 130000.00, 
 'Thành phần: Cà phê Arabica. Đặc tính: Hương thơm nồng mùi trái cây tươi xen lẫn một ít mùi vỏ chanh, chua ngọt mạnh và thanh, hậu thanh thoát nhẹ nhàng. Mô tả sản phẩm: Tuyệt phẩm Cà Phê Phin Giấy Trung Nguyên Legend Fushion Blend...',
 'img/product/SPNew/CPG-VNBlend-LE.png', 350);
 
 -- Bước 1: Xóa tất cả bảng con trước (bảng có FOREIGN KEY)
DROP TABLE IF EXISTS payment_transactions;
DROP TABLE IF EXISTS order_items;

-- Bước 2: Xóa bảng cha
DROP TABLE IF EXISTS orders;

-- Bước 3: Tạo lại bảng orders
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    company VARCHAR(200),
    address VARCHAR(500) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    notes TEXT,
    total_amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    payment_method VARCHAR(50) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_phone (phone),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bước 4: Tạo lại bảng order_items
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(15, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bước 5: Tạo lại bảng payment_transactions (nếu cần)
CREATE TABLE payment_transactions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    transaction_id VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT * FROM cafe.order_items;
use cafe;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS payment_transactions;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Mã hóa MD5 hoặc BCrypt
    email VARCHAR(150) UNIQUE NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(500),
    role VARCHAR(20) NOT NULL DEFAULT 'USER', -- USER hoặc ADMIN
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE, BANNED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm tài khoản mặc định
-- Password: admin123 (MD5: 0192023a7bbd73250516f069df18b500)
-- Password: user123 (MD5: 482c811da5d5b4bc6d497ffa98491e38)
INSERT INTO users (username, password, email, full_name, phone, role) VALUES
('admin', '0192023a7bbd73250516f069df18b500', 'admin@cafe.com', 'Administrator', '0901234567', 'ADMIN'),
('user1', '482c811da5d5b4bc6d497ffa98491e38', 'user1@gmail.com', 'Nguyễn Văn A', '0909876543', 'USER');

-- ==================== BẢNG ORDERS (Đơn hàng) ====================
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT, -- NULL nếu khách vãng lai
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    company VARCHAR(200),
    address VARCHAR(500) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    notes TEXT,
    total_amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    -- Status: PENDING, PROCESSING, COMPLETED, CANCELLED, FAILED
    payment_method VARCHAR(50) DEFAULT 'PENDING',
    -- Payment: PENDING, VNPAY, COD, BANK_CARD, MOMO
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_email (email),
    INDEX idx_phone (phone),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== BẢNG ORDER_ITEMS (Chi tiết đơn hàng) ====================
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(15, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== BẢNG PAYMENT_TRANSACTIONS (Giao dịch thanh toán) ====================
CREATE TABLE payment_transactions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    payment_method VARCHAR(50) NOT NULL, -- VNPAY, BANK_CARD, MOMO, COD
    transaction_no VARCHAR(200), -- Mã giao dịch từ VNPay
    bank_code VARCHAR(50), -- Mã ngân hàng
    card_type VARCHAR(50), -- Loại thẻ
    amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(20) NOT NULL, -- SUCCESS, FAILED, PENDING
    response_code VARCHAR(10), -- Mã phản hồi từ VNPay
    transaction_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    INDEX idx_order_id (order_id),
    INDEX idx_transaction_no (transaction_no),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS blog (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(500) NOT NULL,
    slug VARCHAR(500) UNIQUE NOT NULL, -- URL-friendly title
    thumbnail_url VARCHAR(500), -- Ảnh đại diện
    content LONGTEXT NOT NULL, -- Nội dung HTML từ CKEditor
    excerpt TEXT, -- Tóm tắt ngắn
    author_id BIGINT,
    author_name VARCHAR(200) NOT NULL,
    category VARCHAR(100), 
    view_count INT DEFAULT 0,
    statusblog VARCHAR(20) DEFAULT 'PUBLISHED', -- DRAFT, PUBLISHED, ARCHIVED
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_slug (slug),
    INDEX idx_category (category),
    INDEX idx_status (status),
    INDEX idx_published_at (published_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu mẫu
INSERT INTO blog (title, slug, thumbnail_url, content, excerpt, author_name, category, status) VALUES 
('CHƯƠNG TRÌNH ƯU ĐÃI ĐỒNG HÀNH CÙNG LỄ HỘI CÀ PHÊ BUÔN MA THUỘT', 
 'chuong-trinh-uu-dai-dong-hanh-cung-le-hoi-ca-phe-buon-ma-thuot',
 'img/blog/main-blog/blog-1.jpg',
 '<p>Hòa trong không khí Lễ hội Cà phê Buôn Ma Thuột lần thứ 9, Trung Nguyên Legend tự hào là Nhà tài trợ đặc biệt của sự kiện năm nay với nhiều hoạt động đặc sắc...</p>',
 'Ưu đãi hấp dẫn khi mua sản phẩm tại hệ thống Trung Nguyên Legend Cafe',
 'Admin',
 'bekery, sweet',
 'PUBLISHED'),

('Bí quyết pha chế cà phê hoàn hảo tại nhà', 
 'bi-quyet-pha-che-ca-phe-hoan-hao-tai-nha',
 'img/blog/main-blog/blog-2.jpg',
 '<p>Để có một tách cà phê ngon, bạn cần chú ý đến nhiều yếu tố: chất lượng hạt cà phê, tỷ lệ pha chế, nhiệt độ nước...</p>',
 'Hướng dẫn chi tiết cách pha chế cà phê ngon tại nhà',
 'Admin',
 'Baking Tips',
 'PUBLISHED');
 CREATE TABLE IF NOT EXISTS contacts (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT, -- NULL nếu khách vãng lai
    name VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(500),
    message TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'NEW', -- NEW, READ, REPLIED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_email (email),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ==================== BẢNG CHATBOT_HISTORY (Lịch sử chat) ====================
CREATE TABLE IF NOT EXISTS chatbot_history (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    session_id VARCHAR(100) NOT NULL,
    user_id BIGINT,
    user_message TEXT NOT NULL,
    bot_response TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_session_id (session_id),
    INDEX idx_user_id (user_id),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== BẢNG PRODUCT_EMBEDDINGS (Tìm kiếm sản phẩm) ====================
CREATE TABLE IF NOT EXISTS product_embeddings (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT NOT NULL,
    description_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    INDEX idx_product_id (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== INSERT DỮ LIỆU MẪU ====================
INSERT INTO product_embeddings (product_id, description_text) 
SELECT id, CONCAT(
    name, '. ', 
    COALESCE(detail_description, ''), 
    '. Giá: ', FORMAT(price, 0), ' VNĐ. ',
    'Còn hàng: ', stock_quantity, ' sản phẩm.'
) 
FROM product 
WHERE status = 'ACTIVE';
USE cafe;

CREATE TABLE IF NOT EXISTS chatbot_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id VARCHAR(255),
    user_id VARCHAR(100),
    user_message TEXT,
    bot_response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE product_profile (
    product_id BIGINT PRIMARY KEY,
    flavor_intensity INT,
    bitterness_level INT,
    acidity_level INT,
    roast_level VARCHAR(20),
    caffeine_level VARCHAR(20),
    taste_notes VARCHAR(255),
    suitable_for VARCHAR(50),
    recommended_time VARCHAR(50),
    CONSTRAINT fk_product_profile
        FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SELECT orders.user_id, first_name, last_name, orders.email, orders.phone, orders.address,
				       orders.city, orders.state, total_amount, orders.status, payment_method,
				       orders.created_at, orders.updated_at
				FROM orders
                join users us on us.id =  orders.user_id 
				where orders.user_id = 5 ;
INSERT INTO product_profile VALUES
(1, 4, 4, 2, 'DARK', 'HIGH', 'Socola, Hạt', 'Người thích đậm', 'Morning'),
(2, 2, 1, 3, 'LIGHT', 'LOW', 'Trái cây', 'Người mới uống', 'Evening');
CREATE TABLE IF NOT EXISTS stock_movement_log (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT NOT NULL,
    order_id BIGINT NULL,                    -- NULL nếu là nhập kho thủ công
    movement_type ENUM('IN', 'OUT') NOT NULL, -- IN = Nhập, OUT = Xuất
    quantity INT NOT NULL,                    -- Số lượng
    note TEXT,                                -- Ghi chú
    created_by VARCHAR(100),                  -- Người thực hiện
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL,
    
    INDEX idx_product_id (product_id),
    INDEX idx_order_id (order_id),
    INDEX idx_movement_type (movement_type),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Lịch sử nhập xuất kho sản phẩm';

ALTER TABLE product 
ADD CONSTRAINT chk_stock_non_negative 
CHECK (stock_quantity >= 0);
CREATE OR REPLACE VIEW v_stock_summary AS
SELECT 
    p.id,
    p.name,
    p.stock_quantity,
    COALESCE(SUM(CASE WHEN l.movement_type = 'IN' THEN l.quantity ELSE 0 END), 0) as total_in,
    COALESCE(SUM(CASE WHEN l.movement_type = 'OUT' THEN l.quantity ELSE 0 END), 0) as total_out,
    p.price,
    (p.stock_quantity * p.price) as stock_value,
    CASE 
        WHEN p.stock_quantity = 0 THEN 'HẾT HÀNG'
        WHEN p.stock_quantity < 10 THEN 'SẮP HẾT'
        WHEN p.stock_quantity < 50 THEN 'ÍT'
        ELSE 'ĐỦ'
    END as stock_status
FROM product p
LEFT JOIN stock_movement_log l ON p.id = l.product_id
WHERE p.status = 'ACTIVE'
GROUP BY p.id, p.name, p.stock_quantity, p.price
ORDER BY p.stock_quantity ASC;
CREATE OR REPLACE VIEW v_low_stock_products AS
SELECT 
    id,
    name,
    stock_quantity,
    price,
    (stock_quantity * price) as stock_value
FROM product
WHERE status = 'ACTIVE' AND stock_quantity < 10
ORDER BY stock_quantity ASC;

-- View hoạt động nhập xuất kho gần đây
CREATE OR REPLACE VIEW v_recent_stock_movements AS
SELECT 
    l.id,
    l.product_id,
    p.name as product_name,
    l.movement_type,
    l.quantity,
    l.order_id,
    l.note,
    l.created_by,
    l.created_at,
    CASE 
        WHEN l.movement_type = 'IN' THEN CONCAT('+', l.quantity)
        ELSE CONCAT('-', l.quantity)
    END as quantity_display
FROM stock_movement_log l
JOIN product p ON l.product_id = p.id
ORDER BY l.created_at DESC
LIMIT 100;

DELIMITER //
CREATE PROCEDURE sp_import_stock(
    IN p_product_id BIGINT,
    IN p_quantity INT,
    IN p_note TEXT,
    IN p_created_by VARCHAR(100),
    OUT p_result VARCHAR(255)
)
BEGIN
    DECLARE v_current_stock INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_result = 'ERROR: Không thể nhập kho';
    END;
    
    START TRANSACTION;
    
    -- Kiểm tra sản phẩm tồn tại
    SELECT stock_quantity INTO v_current_stock
    FROM product
    WHERE id = p_product_id AND status = 'ACTIVE'
    FOR UPDATE;
    
    IF v_current_stock IS NULL THEN
        SET p_result = 'ERROR: Sản phẩm không tồn tại';
        ROLLBACK;
    ELSE
        -- Cập nhật tồn kho
        UPDATE product
        SET stock_quantity = stock_quantity + p_quantity
        WHERE id = p_product_id;
        
        -- Ghi log
        INSERT INTO stock_movement_log 
        (product_id, movement_type, quantity, note, created_by)
        VALUES 
        (p_product_id, 'IN', p_quantity, p_note, p_created_by);
        
        COMMIT;
        SET p_result = CONCAT('SUCCESS: Đã nhập ', p_quantity, ' sản phẩm');
    END IF;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_export_stock(
    IN p_product_id BIGINT,
    IN p_quantity INT,
    IN p_note TEXT,
    IN p_created_by VARCHAR(100),
    OUT p_result VARCHAR(255)
)
BEGIN
    DECLARE v_current_stock INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_result = 'ERROR: Không thể xuất kho';
    END;
    
    START TRANSACTION;
    
    -- Kiểm tra tồn kho
    SELECT stock_quantity INTO v_current_stock
    FROM product
    WHERE id = p_product_id AND status = 'ACTIVE'
    FOR UPDATE;
    
    IF v_current_stock IS NULL THEN
        SET p_result = 'ERROR: Sản phẩm không tồn tại';
        ROLLBACK;
    ELSEIF v_current_stock < p_quantity THEN
        SET p_result = CONCAT('ERROR: Không đủ hàng (Còn: ', v_current_stock, ')');
        ROLLBACK;
    ELSE
        -- Cập nhật tồn kho
        UPDATE product
        SET stock_quantity = stock_quantity - p_quantity
        WHERE id = p_product_id;
        
        -- Ghi log
        INSERT INTO stock_movement_log 
        (product_id, movement_type, quantity, note, created_by)
        VALUES 
        (p_product_id, 'OUT', p_quantity, p_note, p_created_by);
        
        COMMIT;
        SET p_result = CONCAT('SUCCESS: Đã xuất ', p_quantity, ' sản phẩm');
    END IF;
END //

DELIMITER ;

ELIMITER //
CREATE TRIGGER trg_product_stock_change
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    DECLARE v_quantity_change INT;
    DECLARE v_movement_type VARCHAR(10);
    
    -- Tính thay đổi
    SET v_quantity_change = NEW.stock_quantity - OLD.stock_quantity;
    
    -- Chỉ ghi log nếu có thay đổi
    IF v_quantity_change != 0 THEN
        IF v_quantity_change > 0 THEN
            SET v_movement_type = 'IN';
        ELSE
            SET v_movement_type = 'OUT';
            SET v_quantity_change = ABS(v_quantity_change);
        END IF;
        
        -- Chỉ ghi log nếu không phải từ stored procedure
        -- (stored procedure tự ghi log rồi)
        IF @skip_stock_log IS NULL OR @skip_stock_log = 0 THEN
            INSERT INTO stock_movement_log 
            (product_id, movement_type, quantity, note, created_by)
            VALUES 
            (NEW.id, v_movement_type, v_quantity_change, 
             'Cập nhật tự động', 'SYSTEM');
        END IF;
    END IF;
END //

DELIMITER ;

CALL sp_import_stock(1, 100, 'Nhập kho từ NCC', 'admin', @result);
SELECT @result;

-- Test xuất kho
CALL sp_export_stock(1, 10, 'Xuất kho hỏng hóc', 'admin', @result);
SELECT @result;

-- Kiểm tra có đủ hàng không
SELECT trg_product_stock_change(1, 50) as is_available;