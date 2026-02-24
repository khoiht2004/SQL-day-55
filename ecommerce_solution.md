# Bài 1: Tính tổng doanh thu của hệ thống

## 1. Thêm cột lưu giá tại thời điểm mua vào bảng `order_items`

```sql
ALTER TABLE `order_items`
ADD COLUMN `price_at_purchase` DECIMAL(10, 2) NOT NULL AFTER `quantity`;
```

## 2. Cập nhật dữ liệu cho cột mới từ giá hiện tại của sản phẩm

```sql
UPDATE `order_items` oi
JOIN `products` p ON oi.product_id = p.id
SET oi.price_at_purchase = p.current_price;
```

## 3. Query tính tổng tiền đơn hàng sử dụng cột giá mới

```sql
SELECT
    o.id AS order_id,
    u.full_name AS customer_name,
    o.order_date,
    SUM(oi.quantity * oi.price_at_purchase) AS total_amount,
    o.status
FROM `orders` o
JOIN `users` u ON o.user_id = u.id
JOIN `order_items` oi ON o.id = oi.order_id
GROUP BY o.id, u.full_name, o.order_date, o.status
ORDER BY o.order_date DESC;
```

# Bài 2: Lấy ra 5 khách hàng chi tiêu nhiều nhất trong tháng 1/2026

```sql
SELECT
    u.id as 'ID',
    u.full_name as 'Tên khách hàng',
    SUM(oi.price_at_purchase * oi.quantity) as 'Tổng số tiền đã chi'
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_items oi ON o.id = oi.order_id
WHERE MONTH(o.order_date) = 1 AND YEAR(o.order_date) = 2026 AND o.`status` = 'completed'
GROUP BY u.id, u.full_name
ORDER BY `Tổng số tiền đã chi` DESC
LIMIT 5
```

# Bài 3: Lấy ra 5 user có số lượng bình luận nhiều nhất trong tháng 1/2026

```sql
SELECT
  u.id as 'ID',
  full_name as 'Tên người dùng',
  COUNT(user_id) as 'Số lượng bình luận'
FROM comments c
JOIN users u on c.user_id = u.id
WHERE YEAR(c.created_at) = 2026 AND MONTH(c.created_at) = 1
GROUP BY u.id, full_name
ORDER BY `Số lượng bình luận` DESC
LIMIT 5
```

# Bài 4: Lấy ra tất cả sản phẩm kèm số lượng bình luận

```sql
SELECT
  p.id AS 'ID',
  p.`name` AS 'Tên sản phẩm',
  p.current_price AS 'Giá',
  COUNT(c.id) AS 'Số lượng bình luận'
FROM products p
LEFT JOIN comments c ON p.id = c.product_id
GROUP BY p.id, p.`name`, p.current_price
ORDER BY `Số lượng bình luận` DESC
```

# Bài 5: Lấy ra các khách hàng có tổng chi tiêu lớn hơn mức chi tiêu trung bình trong tháng 1/2026

```sql

WITH customer_spending AS (
   SELECT
       u.id,
       u.full_name,
       SUM(oi.price_at_purchase * oi.quantity) AS total_spent
   FROM users u
   JOIN orders o ON u.id = o.user_id
   JOIN order_items oi ON o.id = oi.order_id
   WHERE MONTH(o.order_date) = 1
     AND YEAR(o.order_date) = 2026
     AND o.status = 'completed'
   GROUP BY u.id, u.full_name
)
SELECT
   id AS 'ID',
   full_name AS 'Tên khách hàng',
   total_spent AS 'Tổng chi tiêu',
   (SELECT AVG(total_spent) FROM customer_spending) AS 'Mức trung bình'
FROM customer_spending
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spending);
```
