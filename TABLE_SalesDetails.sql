CREATE TABLE tblSalesDetails (
    SaleDetailID INT PRIMARY KEY IDENTITY(1,1),
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitSellingPrice DECIMAL(10,2) NOT NULL,
    DiscountType VARCHAR(10) CHECK (DiscountType IN ('FIXED', 'PERCENT')) NULL,
    DiscountValue DECIMAL(10,2) DEFAULT 0.00,
	NetUnitPrice DECIMAL(10,2) DEFAULT 0.00,
    
    TotalLineAmount AS (
        CASE 
            WHEN DiscountType = 'PERCENT' THEN Quantity * (UnitSellingPrice - (UnitSellingPrice * DiscountValue / 100))
            WHEN DiscountType = 'FIXED' THEN Quantity * (UnitSellingPrice - DiscountValue)
            ELSE Quantity * UnitSellingPrice
        END
    ) PERSISTED,
	
	CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),


    FOREIGN KEY (SaleID) REFERENCES tblSales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
);
