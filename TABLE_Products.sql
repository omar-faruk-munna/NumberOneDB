CREATE TABLE tblProducts (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    CategoryID INT NOT NULL,
    ProductName NVARCHAR(255) NOT NULL,
    ProductDetails NVARCHAR(MAX) NULL,
    ProductCode NVARCHAR(100) NULL, -- SKU or internal code UNIQUE NOT 
    Brand NVARCHAR(100) NULL,
    UnitType NVARCHAR(100) NULL, -- e.g., pcs, box
    DefaultSellingPrice DECIMAL(10,2) NOT NULL,
    ProductImagePath NVARCHAR(500) NULL, -- local image path
	RemainingStock INT NOT NULL DEFAULT 0, -- Updated manually or via logic

    CreatedDate DATETIME DEFAULT GETDATE(),  -- Not updateable
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
	IsActive BIT DEFAULT 1, -- For soft delete handling

    FOREIGN KEY (CategoryID) REFERENCES tblCategories(CategoryID)
);
