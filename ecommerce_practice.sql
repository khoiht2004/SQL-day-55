/*
 Navicat Premium Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : localhost:3306
 Source Schema         : ecommerce_practice

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 23/02/2026 21:57:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 1, 'Sản phẩm tuyệt vời! Camera chụp ảnh rất đẹp', '2026-01-16 10:00:00');
INSERT INTO `comments` VALUES (2, 1, 1, 'Giao hàng nhanh, đóng gói cẩn thận', '2026-01-17 11:00:00');
INSERT INTO `comments` VALUES (3, 1, 4, 'Chất lượng âm thanh tốt, chống ồn hiệu quả', '2026-01-16 12:00:00');
INSERT INTO `comments` VALUES (4, 2, 2, 'Màn hình đẹp, màu sắc sống động', '2026-01-11 09:00:00');
INSERT INTO `comments` VALUES (5, 2, 2, 'Pin khỏe, dùng cả ngày không lo', '2026-01-12 10:00:00');
INSERT INTO `comments` VALUES (6, 2, 6, 'Giày rất êm, phù hợp chạy bộ', '2026-01-11 13:00:00');
INSERT INTO `comments` VALUES (7, 3, 1, 'Đáng đồng tiền bát gạo', '2026-01-06 11:00:00');
INSERT INTO `comments` VALUES (8, 3, 1, 'Camera xuất sắc, quay phim 4K mượt mà', '2026-01-07 12:00:00');
INSERT INTO `comments` VALUES (9, 3, 1, 'Hiệu năng mượt mà, chơi game không giật lag', '2026-01-08 13:00:00');
INSERT INTO `comments` VALUES (10, 3, 7, 'Giày bền, thiết kế đẹp', '2026-01-19 14:00:00');
INSERT INTO `comments` VALUES (11, 4, 8, 'Ấm áp, nhẹ, dễ mang theo', '2026-01-13 10:00:00');
INSERT INTO `comments` VALUES (12, 5, 9, 'Vừa vặn, chất liệu tốt', '2026-01-23 11:00:00');
INSERT INTO `comments` VALUES (13, 6, 10, 'Nhiều ngăn, tiện lợi', '2026-01-09 12:00:00');
INSERT INTO `comments` VALUES (14, 7, 6, 'Đẹp, giá hợp lý', '2026-01-28 13:00:00');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, 1);
INSERT INTO `order_items` VALUES (2, 1, 4, 2);
INSERT INTO `order_items` VALUES (3, 2, 3, 1);
INSERT INTO `order_items` VALUES (4, 3, 2, 1);
INSERT INTO `order_items` VALUES (5, 3, 6, 2);
INSERT INTO `order_items` VALUES (6, 4, 5, 1);
INSERT INTO `order_items` VALUES (7, 5, 1, 2);
INSERT INTO `order_items` VALUES (8, 6, 7, 3);
INSERT INTO `order_items` VALUES (9, 7, 8, 5);
INSERT INTO `order_items` VALUES (10, 8, 9, 3);
INSERT INTO `order_items` VALUES (11, 9, 10, 2);
INSERT INTO `order_items` VALUES (12, 10, 6, 1);
INSERT INTO `order_items` VALUES (13, 10, 7, 1);
INSERT INTO `order_items` VALUES (14, 11, 1, 1);
INSERT INTO `order_items` VALUES (15, 12, 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_order_date`(`order_date` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, '2026-01-15 10:30:00', 'completed');
INSERT INTO `orders` VALUES (2, 1, '2026-01-20 14:20:00', 'completed');
INSERT INTO `orders` VALUES (3, 2, '2026-01-10 09:15:00', 'completed');
INSERT INTO `orders` VALUES (4, 2, '2026-01-25 16:45:00', 'completed');
INSERT INTO `orders` VALUES (5, 3, '2026-01-05 11:00:00', 'completed');
INSERT INTO `orders` VALUES (6, 3, '2026-01-18 13:30:00', 'completed');
INSERT INTO `orders` VALUES (7, 4, '2026-01-12 10:10:00', 'completed');
INSERT INTO `orders` VALUES (8, 5, '2026-01-22 15:20:00', 'completed');
INSERT INTO `orders` VALUES (9, 6, '2026-01-08 12:00:00', 'completed');
INSERT INTO `orders` VALUES (10, 7, '2026-01-28 09:30:00', 'completed');
INSERT INTO `orders` VALUES (11, 1, '2025-12-10 10:00:00', 'completed');
INSERT INTO `orders` VALUES (12, 2, '2025-12-15 14:00:00', 'completed');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `current_price` decimal(10, 2) NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category` ASC) USING BTREE,
  INDEX `idx_price`(`current_price` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'iPhone 15 Pro Max', 'Smartphone cao cấp từ Apple với chip A17 Pro', 25000000.00, 'Electronics', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (2, 'Samsung Galaxy S24 Ultra', 'Smartphone Android flagship với bút S-Pen', 22000000.00, 'Electronics', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (3, 'MacBook Pro M3', 'Laptop cho developer và designer', 45000000.00, 'Electronics', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (4, 'AirPods Pro 2', 'Tai nghe không dây chống ồn chủ động', 6000000.00, 'Electronics', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (5, 'iPad Air M2', 'Máy tính bảng đa năng', 18000000.00, 'Electronics', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (6, 'Nike Air Max 270', 'Giày thể thao nam nữ', 3500000.00, 'Fashion', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (7, 'Adidas Ultra Boost 22', 'Giày chạy bộ cao cấp', 4200000.00, 'Fashion', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (8, 'Áo khoác Uniqlo Ultra Light Down', 'Áo khoác mùa đông siêu nhẹ', 1200000.00, 'Fashion', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (9, "Quần Jean Levi's 501", 'Quần jean classic fit', 1800000.00, 'Fashion', '2026-02-23 20:07:09');
INSERT INTO `products` VALUES (10, 'Balo The North Face Borealis', 'Balo đi học đi làm 28L', 2500000.00, 'Fashion', '2026-02-23 20:07:09');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'nguyenvana', 'nguyenvana@email.com', 'Nguyễn Văn A', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (2, 'tranthib', 'tranthib@email.com', 'Trần Thị B', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (3, 'levanc', 'levanc@email.com', 'Lê Văn C', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (4, 'phamthid', 'phamthid@email.com', 'Phạm Thị D', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (5, 'hoangvane', 'hoangvane@email.com', 'Hoàng Văn E', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (6, 'vuthif', 'vuthif@email.com', 'Vũ Thị F', '2026-02-23 20:07:09');
INSERT INTO `users` VALUES (7, 'dangvang', 'dangvang@email.com', 'Đặng Văn G', '2026-02-23 20:07:09');

-- ----------------------------
-- Update order_items structure and data
-- ----------------------------
ALTER TABLE `order_items` 
ADD COLUMN `price_at_purchase` DECIMAL(10, 2) NOT NULL DEFAULT 0.00 AFTER `quantity`;

UPDATE `order_items` oi
JOIN `products` p ON oi.product_id = p.id 
SET oi.price_at_purchase = p.current_price;

SET FOREIGN_KEY_CHECKS = 1;
