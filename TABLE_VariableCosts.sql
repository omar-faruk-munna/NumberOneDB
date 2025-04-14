CREATE TABLE tblVariableCosts (
    CostID INT PRIMARY KEY IDENTITY(1,1),  
    SaleID INT NOT NULL,
    CostType VARCHAR(50) NOT NULL CHECK (CostType IN ('DELIVERY', 'OTHER')),  -- Type of variable cost
    CostName NVARCHAR(255) NOT NULL,  -- Optional cost label
    CostDetails NVARCHAR(MAX) NULL,  -- Additional notes
    CostAmount DECIMAL(10,2) NOT NULL,
    CostDate DATE NOT NULL,  

    CreatedDate DATETIME DEFAULT GETDATE(),  -- Not updateable
    CreatedBy NVARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy NVARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (SaleID) REFERENCES tblSales(SaleID)
);
