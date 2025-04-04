CREATE TABLE tblVariableCosts (
    CostID INT PRIMARY KEY,  
    SaleID INT NOT NULL,
    CostType VARCHAR(50) NOT NULL CHECK (CostType IN ('DELIVERY', 'OTHER')),  -- Type of variable cost
    CostName VARCHAR(255) NOT NULL,  -- Optional cost label
    CostDetails VARCHAR(MAX) NULL,  -- Additional notes
    CostAmount DECIMAL(10,2) NOT NULL,
    CostDate DATE NOT NULL,  

    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Not updateable
    CreatedBy VARCHAR(100) NOT NULL,
    UpdatedDate DATETIME NULL,
    UpdatedBy VARCHAR(100) NULL,
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE')),

    FOREIGN KEY (SaleID) REFERENCES tblSales(SaleID)
);
