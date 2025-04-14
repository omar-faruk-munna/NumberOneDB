CREATE TABLE tblSales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NULL,
    SaleDate DATETIME DEFAULT GETDATE(),
    InvoiceNumber NVARCHAR(100) NULL,
    TotalAmount DECIMAL(10,2) NOT NULL, -- Before discount
    DiscountAmount DECIMAL(10,2) DEFAULT 0.00,
    NetAmount AS (TotalAmount - DiscountAmount) PERSISTED,
    SaleDetails NVARCHAR(MAX) NULL,

    CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (CustomerID) REFERENCES tblCustomers(CustomerID)
);
