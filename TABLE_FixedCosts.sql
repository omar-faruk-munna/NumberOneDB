CREATE TABLE FixedCosts (
    CostID INT PRIMARY KEY,  
    CostType ENUM('Rent', 'Salary', 'Utilities', 'Other') NOT NULL,  -- Type of cost
    CostName VARCHAR
(255) NOT NULL,
    CostDetails TEXT NULL,  -- Additional details about the cost
    CostAmount DECIMAL
(10,2) NOT NULL,
    CostDate DATE NOT NULL,  
    
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Cannot be updated
    CreatedBy VARCHAR
(255) NOT NULL,  -- Cannot be updated
    UpdatedDate TIMESTAMP NULL ON
UPDATE CURRENT_TIMESTAMP,  -- Updates automatically
    UpdatedBy VARCHAR(255)
NULL  -- Needs to be manually updated when modifying
    Status ENUM
('Active', 'Inactive') DEFAULT 'Active',  -- Logical delete
);
