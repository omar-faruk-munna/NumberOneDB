CREATE TABLE tblProductPurchases (
	PurchaseID INT PRIMARY KEY,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL, -- Per-unit cost for this batch
    TotalPrice AS (Quantity * UnitPrice) PERSISTED,
    PurchaseDate DATE NOT NULL,
    InvoiceNumber NVARCHAR(200) NULL, -- use as batch
    PurchaseDetails NVARCHAR(MAX) NULL,
	
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,

    CreatedDate DATETIME DEFAULT GETDATE(),  -- Not updateable
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
	Status VARCHAR(20) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
    FOREIGN KEY (SupplierID) REFERENCES tblSuppliers(SupplierID)
);
