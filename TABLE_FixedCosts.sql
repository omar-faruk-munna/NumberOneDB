CREATE TABLE tblFixedCosts (
    CostID INT PRIMARY KEY,  
    CostType VARCHAR(50) NOT NULL CHECK (CostType IN ('RENT', 'SALARY', 'UTILITIES', 'OTHER')),  -- Type of cost
    CostName VARCHAR(255) NOT NULL,
    CostDetails VARCHAR(MAX) NULL,  -- Additional details about the cost
    CostAmount DECIMAL(10,2) NOT NULL,
    CostDate DATE NOT NULL,  
    
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Cannot be updated
    CreatedBy VARCHAR(100) NOT NULL,  -- Cannot be updated
    UpdatedDate DATETIME NULL,  -- Needs manual update
    UpdatedBy VARCHAR(100) NULL,  -- Needs to be manually updated when modifying
    Status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (Status IN ('ACTIVE', 'INACTIVE'))  -- Logical delete
);
