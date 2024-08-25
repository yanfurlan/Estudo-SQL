
-- Criação das tabelas

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Category TEXT NOT NULL,
    Price REAL NOT NULL
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate TEXT NOT NULL,
    CustomerName TEXT NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inserção de dados

INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Desk', 'Furniture', 150.00),
('Chair', 'Furniture', 85.00),
('Headphones', 'Electronics', 200.00);

INSERT INTO Orders (OrderDate, CustomerName) VALUES
('2024-08-01', 'Alice'),
('2024-08-02', 'Bob'),
('2024-08-03', 'Charlie');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 2),
(1, 5, 1),
(2, 3, 4),
(2, 4, 2),
(3, 2, 1);

-- Consultas e Otimizações

-- Consulta 1: Total de vendas por categoria
SELECT p.Category, SUM(od.Quantity * p.Price) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category;

-- Otimização: Índice na coluna Category
CREATE INDEX idx_category ON Products(Category);

-- Consulta 2: Listar pedidos e seus totais
SELECT o.OrderID, o.CustomerName, SUM(od.Quantity * p.Price) AS OrderTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID, o.CustomerName;

-- Otimização: Índice composto em OrderDetails(OrderID, ProductID)
CREATE INDEX idx_orderdetails_orderid_productid ON OrderDetails(OrderID, ProductID);

-- Consulta 3: Produtos mais vendidos
SELECT p.ProductName, SUM(od.Quantity) AS QuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY QuantitySold DESC
LIMIT 5;

-- Otimização: Índice na coluna ProductID em OrderDetails
CREATE INDEX idx_orderdetails_productid ON OrderDetails(ProductID);

-- Análise de planos de execução
EXPLAIN QUERY PLAN
SELECT p.Category, SUM(od.Quantity * p.Price) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category;
