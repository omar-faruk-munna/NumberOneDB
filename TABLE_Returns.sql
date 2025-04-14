CREATE TABLE tblReturns (
    ReturnID INT PRIMARY KEY IDENTITY(1,1),
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    ReturnReason NVARCHAR(MAX) NOT NULL,
	ReturnDate DATETIME NOT NULL,
    ReturnDateByDefault DATETIME DEFAULT GETDATE(),
    RefundAmount DECIMAL(10,2) DEFAULT 0.00, -- if any amount is refunded

    CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100),
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (SaleID) REFERENCES tblSales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
);
