CREATE TABLE tblCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL UNIQUE,
    CategoryDetails NVARCHAR(MAX) NULL,
    
	CreatedDate DATETIME DEFAULT GETDATE(), -- Not updateable
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),
);
