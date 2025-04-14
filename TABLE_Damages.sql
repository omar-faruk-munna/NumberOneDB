CREATE TABLE tblDamages (
    DamageID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    DamageReason NVARCHAR(MAX),
    DamageDate DATETIME DEFAULT GETDATE(),

    CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100),
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
	Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
);
