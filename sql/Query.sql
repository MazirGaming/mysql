CREATE DATABASE databasename;

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
-- Ví dụ
CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(100),
  PRIMARY KEY (user_id)
);


INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
-- Nếu thêm tất cả dữ liệu cho các cột thì không cần thêm column 
-- tuy nhiên dữ liệu phải theo thứ tự
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
-- Ví dụ
INSERT INTO Users (LastName, FirstName, Address, City)
VALUES ('Tom B. Erichsen', 'Skagen', 'NewYork', 'Ha Noi');


-- DROP TABLE
DROP TABLE table_name;
-- Ví dụ
DROP TABLE Users;


-- SELECT
SELECT column1, column2, ...
FROM table_name;
-- hoặc
SELECT * FROM table_name;
-- SELECT * sẽ lấy tất cả column có trong bảng
-- SELECT Column name sẽ chỉ lấy những column được select


-- WHERE được sử dụng để lọc các bản ghi.
-- Nó được sử dụng để chỉ trích xuất những bản ghi đáp ứng một điều kiện cụ thể.
SELECT column1, column2, ...
FROM table_name
WHERE condition;
-- Ví dụ lọc Country có tên là Mexico
SELECT * FROM Customers
WHERE Country = 'Mexico';


-- JOIN được sử dụng để kết hợp các hàng từ hai hoặc nhiều bảng, dựa trên một cột có liên quan giữa chúng.
-- Ví dụ : Lấy ra 3 cột OrderID, CustomerName, OrderDate
-- Bảng Orders sẽ JOIN với Bảng Customers dựa trên CustomerID. (sử dụng sau ON)
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


-- LIMIT được sử dụng để chỉ định số lượng bản ghi sẽ trả về.
-- LIMIT hữu ích trên các bảng lớn với hàng nghìn bản ghi. Việc trả lại một số lượng lớn bản ghi có thể ảnh hưởng đến hiệu suất.
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
-- Ví dụ: Lấy ra 3 bản ghi trong bảng Customers
SELECT * FROM Customers
LIMIT 3;


-- ORDER BY được sử dụng để sắp xếp tập kết quả theo thứ tự tăng dần hoặc giảm dần.
-- Theo mặc định, ORDER BY sắp xếp các bản ghi theo thứ tự tăng dần. Để sắp xếp các bản ghi theo thứ tự giảm dần, hãy sử dụng DESC.
-- Cú pháp:
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
-- Ví dụ: Chọn tất cả cột trong bảng Customer và sắp xếp theo Country
-- Có thể sắp xếp nhiều cột
SELECT * FROM Customers
ORDER BY Country;


-- DELETE được sử dụng để xóa các bản ghi hiện có trong một bảng.
DELETE FROM table_name WHERE condition;
-- Ví dụ: xóa tất cả bản ghi với điều kiện thỏa mãn CustomerName='Alfreds Futterkiste' trong bảng Customers 
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';


-- "TRUNCATE TABLE" được sử dụng để xóa tất cả các dữ liệu có trong bảng và giải phóng không gian đĩa cứng liên quan đến các dữ liệu đó.
TRUNCATE TABLE table_name;


-- Subquery được sử dụng để truy vấn các dữ liệu từ một bảng hoặc nhiều bảng khác nhau, 
-- rồi truyền các kết quả này vào một câu lệnh SQL khác.
SELECT *
FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE last_name = 'Smith');