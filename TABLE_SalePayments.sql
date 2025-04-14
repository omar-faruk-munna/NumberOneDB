CREATE TABLE tblSalePayments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
	
    SaleID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMethod NVARCHAR(50), -- Cash, bKash, Card, etc.
    PaymentDetails NVARCHAR(255) NULL,

    CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    IsActive BIT DEFAULT 1, -- For soft delete handling

    FOREIGN KEY (SaleID) REFERENCES tblSales(SaleID)
);
