-- Insert Script for Extra Customers and Suppliers (Companies 0, 1, 2, 3, 4)

-- --------------------------------------------------------------------------------
-- COMPANY 0
-- --------------------------------------------------------------------------------

-- Extra Customers
INSERT INTO `0_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(3, 'TechZone Solutions', 'TechZone', '120 Innovation Way, Silicon Valley', 'TX9827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 5000, '', 0),
(4, 'GreenValley Organics', 'GreenValley', '45 Meadow Lane, Portland', 'GV7736251', 'USD', 1, 0, 0, 1, 4, 0, 0, 2000, '', 0),
(5, 'Alpha Builders Ltd', 'AlphaBuilders', '88 Construction Blvd, Chicago', 'AB3327182', 'USD', 1, 0, 0, 1, 4, 0, 0, 10000, '', 0),
(6, 'Apex Distributors', 'ApexDist', '310 Logistics Dr, Dallas', 'AD9982716', 'USD', 1, 0, 0, 1, 4, 0, 0, 3000, '', 0),
(7, 'Ocean Breeze Resorts', 'OceanBreeze', '5 Coastal Way, Miami Beach', 'OB1127362', 'USD', 1, 0, 0, 1, 4, 0, 0, 8000, '', 0),
(8, 'Future Retail Group', 'FutureRetail', '99 Commerce St, New York', 'FR5536271', 'USD', 1, 0, 0, 1, 4, 0, 0, 15000, '', 0),
(9, 'Dynamic Logistics', 'DynamicLog', '74 Airport Road, Atlanta', 'DL8827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 4000, '', 0),
(10, 'Horizon Healthcare', 'HorizonHealth', '20 Medical Plaza, Boston', 'HH6655221', 'USD', 1, 0, 0, 1, 4, 0, 0, 12000, '', 0),
(11, 'Synergy Consulting', 'SynergyCons', '500 Executive Tower, Seattle', 'SC2233445', 'USD', 1, 0, 0, 1, 4, 0, 0, 6000, '', 0),
(12, 'Vanguard Tech Corp', 'VanguardTech', '801 Enterprise Way, San Jose', 'VT8877665', 'USD', 1, 0, 0, 1, 4, 0, 0, 20000, '', 0);

-- Branches for Customers
INSERT INTO `0_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(3, 3, 'TechZone Solutions', 'TechZone HQ', '120 Innovation Way, Silicon Valley', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '120 Innovation Way, Silicon Valley', 0, '', NULL, 0),
(4, 4, 'GreenValley Organics', 'GreenValley Branch', '45 Meadow Lane, Portland', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '45 Meadow Lane, Portland', 0, '', NULL, 0),
(5, 5, 'Alpha Builders Ltd', 'Alpha Builders HQ', '88 Construction Blvd, Chicago', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '88 Construction Blvd, Chicago', 0, '', NULL, 0),
(6, 6, 'Apex Distributors', 'Apex Dallas Branch', '310 Logistics Dr, Dallas', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '310 Logistics Dr, Dallas', 0, '', NULL, 0),
(7, 7, 'Ocean Breeze Resorts', 'Miami Office', '5 Coastal Way, Miami Beach', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '5 Coastal Way, Miami Beach', 0, '', NULL, 0),
(8, 8, 'Future Retail Group', 'New York HQ', '99 Commerce St, New York', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '99 Commerce St, New York', 0, '', NULL, 0),
(9, 9, 'Dynamic Logistics', 'Atlanta Warehouse', '74 Airport Road, Atlanta', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '74 Airport Road, Atlanta', 0, '', NULL, 0),
(10, 10, 'Horizon Healthcare', 'Boston Main Hospital', '20 Medical Plaza, Boston', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '20 Medical Plaza, Boston', 0, '', NULL, 0),
(11, 11, 'Synergy Consulting', 'Seattle Suite', '500 Executive Tower, Seattle', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '500 Executive Tower, Seattle', 0, '', NULL, 0),
(12, 12, 'Vanguard Tech Corp', 'Vanguard San Jose', '801 Enterprise Way, San Jose', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '801 Enterprise Way, San Jose', 0, '', NULL, 0);

-- Extra Suppliers
INSERT INTO `0_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(3, 'Global Logistics Services', 'GlobalLogistics', '10 Port Way, Long Beach', '', 'GL9928374', 'Mark Peterson', '', 'www.globallogistics.com', '', 'USD', 3, 0, 0, 0, 1, 50000, '', '2100', '5060', '', 0),
(4, 'Nexus Packing Co', 'NexusPacking', '54 Industrial Rd, Detroit', '', 'NP8827361', 'Sarah Jenkins', '', 'www.nexuspacking.com', '', 'USD', 3, 0, 0, 0, 1, 20000, '', '2100', '5060', '', 0),
(5, 'Prime Industries', 'PrimeInd', '900 Manufacturer Ave, Cleveland', '', 'PI4438271', 'Robert Chen', '', 'www.primeindustries.com', '', 'USD', 3, 0, 0, 0, 1, 80000, '', '2100', '5060', '', 0),
(6, 'Pioneer Software Systems', 'PioneerSoftware', '32 Code Loop, San Francisco', '', 'PS2239182', 'Elena Rostova', '', 'www.pioneersoftware.com', '', 'USD', 3, 0, 0, 0, 1, 15000, '', '2100', '5060', '', 0),
(7, 'Zenith Energy Corp', 'ZenithEnergy', '77 Pipeline Rd, Houston', '', 'ZE7736251', 'James Sterling', '', 'www.zenithenergy.com', '', 'USD', 3, 0, 0, 0, 1, 100000, '', '2100', '5060', '', 0),
(8, 'United Steel Corp', 'UnitedSteel', '15 Foundry St, Pittsburgh', '', 'US1128372', 'Tom Ironfield', '', 'www.unitedsteel.com', '', 'USD', 3, 0, 0, 0, 1, 120000, '', '2100', '5060', '', 0),
(9, 'Infinity Office Supplies', 'InfinitySupplies', '88 Stationary Blvd, Denver', '', 'IO5536271', 'Alice Cooper', '', 'www.infinitysupplies.com', '', 'USD', 3, 0, 0, 0, 1, 10000, '', '2100', '5060', '', 0),
(10, 'Matrix Telco Group', 'MatrixTelco', '12 Telecom Tower, Philadelphia', '', 'MT9982736', 'David Miller', '', 'www.matrixtelco.com', '', 'USD', 3, 0, 0, 0, 1, 30000, '', '2100', '5060', '', 0),
(11, 'EcoPackaging Systems', 'EcoPackaging', '4 Green Way, Boulder', '', 'EP3348271', 'Jane Wilder', '', 'www.ecopackaging.com', '', 'USD', 3, 0, 0, 0, 1, 25000, '', '2100', '5060', '', 0),
(12, 'Delta Hardware', 'DeltaHardware', '611 Tool Rd, Cincinnati', '', 'DH8837261', 'William Vance', '', 'www.deltahardware.com', '', 'USD', 3, 0, 0, 0, 1, 40000, '', '2100', '5060', '', 0);


-- --------------------------------------------------------------------------------
-- COMPANY 1
-- --------------------------------------------------------------------------------

-- Extra Customers
INSERT INTO `1_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(3, 'TechZone Solutions', 'TechZone', '120 Innovation Way, Silicon Valley', 'TX9827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 5000, '', 0),
(4, 'GreenValley Organics', 'GreenValley', '45 Meadow Lane, Portland', 'GV7736251', 'USD', 1, 0, 0, 1, 4, 0, 0, 2000, '', 0),
(5, 'Alpha Builders Ltd', 'AlphaBuilders', '88 Construction Blvd, Chicago', 'AB3327182', 'USD', 1, 0, 0, 1, 4, 0, 0, 10000, '', 0),
(6, 'Apex Distributors', 'ApexDist', '310 Logistics Dr, Dallas', 'AD9982716', 'USD', 1, 0, 0, 1, 4, 0, 0, 3000, '', 0),
(7, 'Ocean Breeze Resorts', 'OceanBreeze', '5 Coastal Way, Miami Beach', 'OB1127362', 'USD', 1, 0, 0, 1, 4, 0, 0, 8000, '', 0),
(8, 'Future Retail Group', 'FutureRetail', '99 Commerce St, New York', 'FR5536271', 'USD', 1, 0, 0, 1, 4, 0, 0, 15000, '', 0),
(9, 'Dynamic Logistics', 'DynamicLog', '74 Airport Road, Atlanta', 'DL8827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 4000, '', 0),
(10, 'Horizon Healthcare', 'HorizonHealth', '20 Medical Plaza, Boston', 'HH6655221', 'USD', 1, 0, 0, 1, 4, 0, 0, 12000, '', 0),
(11, 'Synergy Consulting', 'SynergyCons', '500 Executive Tower, Seattle', 'SC2233445', 'USD', 1, 0, 0, 1, 4, 0, 0, 6000, '', 0),
(12, 'Vanguard Tech Corp', 'VanguardTech', '801 Enterprise Way, San Jose', 'VT8877665', 'USD', 1, 0, 0, 1, 4, 0, 0, 20000, '', 0);

-- Branches for Customers
INSERT INTO `1_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(3, 3, 'TechZone Solutions', 'TechZone HQ', '120 Innovation Way, Silicon Valley', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '120 Innovation Way, Silicon Valley', 0, '', NULL, 0),
(4, 4, 'GreenValley Organics', 'GreenValley Branch', '45 Meadow Lane, Portland', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '45 Meadow Lane, Portland', 0, '', NULL, 0),
(5, 5, 'Alpha Builders Ltd', 'Alpha Builders HQ', '88 Construction Blvd, Chicago', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '88 Construction Blvd, Chicago', 0, '', NULL, 0),
(6, 6, 'Apex Distributors', 'Apex Dallas Branch', '310 Logistics Dr, Dallas', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '310 Logistics Dr, Dallas', 0, '', NULL, 0),
(7, 7, 'Ocean Breeze Resorts', 'Miami Office', '5 Coastal Way, Miami Beach', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '5 Coastal Way, Miami Beach', 0, '', NULL, 0),
(8, 8, 'Future Retail Group', 'New York HQ', '99 Commerce St, New York', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '99 Commerce St, New York', 0, '', NULL, 0),
(9, 9, 'Dynamic Logistics', 'Atlanta Warehouse', '74 Airport Road, Atlanta', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '74 Airport Road, Atlanta', 0, '', NULL, 0),
(10, 10, 'Horizon Healthcare', 'Boston Main Hospital', '20 Medical Plaza, Boston', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '20 Medical Plaza, Boston', 0, '', NULL, 0),
(11, 11, 'Synergy Consulting', 'Seattle Suite', '500 Executive Tower, Seattle', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '500 Executive Tower, Seattle', 0, '', NULL, 0),
(12, 12, 'Vanguard Tech Corp', 'Vanguard San Jose', '801 Enterprise Way, San Jose', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '801 Enterprise Way, San Jose', 0, '', NULL, 0);

-- Extra Suppliers
INSERT INTO `1_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(3, 'Global Logistics Services', 'GlobalLogistics', '10 Port Way, Long Beach', '', 'GL9928374', 'Mark Peterson', '', 'www.globallogistics.com', '', 'USD', 3, 0, 0, 0, 1, 50000, '', '2100', '5060', '', 0),
(4, 'Nexus Packing Co', 'NexusPacking', '54 Industrial Rd, Detroit', '', 'NP8827361', 'Sarah Jenkins', '', 'www.nexuspacking.com', '', 'USD', 3, 0, 0, 0, 1, 20000, '', '2100', '5060', '', 0),
(5, 'Prime Industries', 'PrimeInd', '900 Manufacturer Ave, Cleveland', '', 'PI4438271', 'Robert Chen', '', 'www.primeindustries.com', '', 'USD', 3, 0, 0, 0, 1, 80000, '', '2100', '5060', '', 0),
(6, 'Pioneer Software Systems', 'PioneerSoftware', '32 Code Loop, San Francisco', '', 'PS2239182', 'Elena Rostova', '', 'www.pioneersoftware.com', '', 'USD', 3, 0, 0, 0, 1, 15000, '', '2100', '5060', '', 0),
(7, 'Zenith Energy Corp', 'ZenithEnergy', '77 Pipeline Rd, Houston', '', 'ZE7736251', 'James Sterling', '', 'www.zenithenergy.com', '', 'USD', 3, 0, 0, 0, 1, 100000, '', '2100', '5060', '', 0),
(8, 'United Steel Corp', 'UnitedSteel', '15 Foundry St, Pittsburgh', '', 'US1128372', 'Tom Ironfield', '', 'www.unitedsteel.com', '', 'USD', 3, 0, 0, 0, 1, 120000, '', '2100', '5060', '', 0),
(9, 'Infinity Office Supplies', 'InfinitySupplies', '88 Stationary Blvd, Denver', '', 'IO5536271', 'Alice Cooper', '', 'www.infinitysupplies.com', '', 'USD', 3, 0, 0, 0, 1, 10000, '', '2100', '5060', '', 0),
(10, 'Matrix Telco Group', 'MatrixTelco', '12 Telecom Tower, Philadelphia', '', 'MT9982736', 'David Miller', '', 'www.matrixtelco.com', '', 'USD', 3, 0, 0, 0, 1, 30000, '', '2100', '5060', '', 0),
(11, 'EcoPackaging Systems', 'EcoPackaging', '4 Green Way, Boulder', '', 'EP3348271', 'Jane Wilder', '', 'www.ecopackaging.com', '', 'USD', 3, 0, 0, 0, 1, 25000, '', '2100', '5060', '', 0),
(12, 'Delta Hardware', 'DeltaHardware', '611 Tool Rd, Cincinnati', '', 'DH8837261', 'William Vance', '', 'www.deltahardware.com', '', 'USD', 3, 0, 0, 0, 1, 40000, '', '2100', '5060', '', 0);


-- --------------------------------------------------------------------------------
-- COMPANY 2
-- --------------------------------------------------------------------------------

-- Extra Customers
INSERT INTO `2_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(3, 'TechZone Solutions', 'TechZone', '120 Innovation Way, Silicon Valley', 'TX9827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 5000, '', 0),
(4, 'GreenValley Organics', 'GreenValley', '45 Meadow Lane, Portland', 'GV7736251', 'USD', 1, 0, 0, 1, 4, 0, 0, 2000, '', 0),
(5, 'Alpha Builders Ltd', 'AlphaBuilders', '88 Construction Blvd, Chicago', 'AB3327182', 'USD', 1, 0, 0, 1, 4, 0, 0, 10000, '', 0),
(6, 'Apex Distributors', 'ApexDist', '310 Logistics Dr, Dallas', 'AD9982716', 'USD', 1, 0, 0, 1, 4, 0, 0, 3000, '', 0),
(7, 'Ocean Breeze Resorts', 'OceanBreeze', '5 Coastal Way, Miami Beach', 'OB1127362', 'USD', 1, 0, 0, 1, 4, 0, 0, 8000, '', 0),
(8, 'Future Retail Group', 'FutureRetail', '99 Commerce St, New York', 'FR5536271', 'USD', 1, 0, 0, 1, 4, 0, 0, 15000, '', 0),
(9, 'Dynamic Logistics', 'DynamicLog', '74 Airport Road, Atlanta', 'DL8827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 4000, '', 0),
(10, 'Horizon Healthcare', 'HorizonHealth', '20 Medical Plaza, Boston', 'HH6655221', 'USD', 1, 0, 0, 1, 4, 0, 0, 12000, '', 0),
(11, 'Synergy Consulting', 'SynergyCons', '500 Executive Tower, Seattle', 'SC2233445', 'USD', 1, 0, 0, 1, 4, 0, 0, 6000, '', 0),
(12, 'Vanguard Tech Corp', 'VanguardTech', '801 Enterprise Way, San Jose', 'VT8877665', 'USD', 1, 0, 0, 1, 4, 0, 0, 20000, '', 0);

-- Branches for Customers
INSERT INTO `2_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(3, 3, 'TechZone Solutions', 'TechZone HQ', '120 Innovation Way, Silicon Valley', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '120 Innovation Way, Silicon Valley', 0, '', NULL, 0),
(4, 4, 'GreenValley Organics', 'GreenValley Branch', '45 Meadow Lane, Portland', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '45 Meadow Lane, Portland', 0, '', NULL, 0),
(5, 5, 'Alpha Builders Ltd', 'Alpha Builders HQ', '88 Construction Blvd, Chicago', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '88 Construction Blvd, Chicago', 0, '', NULL, 0),
(6, 6, 'Apex Distributors', 'Apex Dallas Branch', '310 Logistics Dr, Dallas', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '310 Logistics Dr, Dallas', 0, '', NULL, 0),
(7, 7, 'Ocean Breeze Resorts', 'Miami Office', '5 Coastal Way, Miami Beach', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '5 Coastal Way, Miami Beach', 0, '', NULL, 0),
(8, 8, 'Future Retail Group', 'New York HQ', '99 Commerce St, New York', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '99 Commerce St, New York', 0, '', NULL, 0),
(9, 9, 'Dynamic Logistics', 'Atlanta Warehouse', '74 Airport Road, Atlanta', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '74 Airport Road, Atlanta', 0, '', NULL, 0),
(10, 10, 'Horizon Healthcare', 'Boston Main Hospital', '20 Medical Plaza, Boston', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '20 Medical Plaza, Boston', 0, '', NULL, 0),
(11, 11, 'Synergy Consulting', 'Seattle Suite', '500 Executive Tower, Seattle', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '500 Executive Tower, Seattle', 0, '', NULL, 0),
(12, 12, 'Vanguard Tech Corp', 'Vanguard San Jose', '801 Enterprise Way, San Jose', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '801 Enterprise Way, San Jose', 0, '', NULL, 0);

-- Extra Suppliers
INSERT INTO `2_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(3, 'Global Logistics Services', 'GlobalLogistics', '10 Port Way, Long Beach', '', 'GL9928374', 'Mark Peterson', '', 'www.globallogistics.com', '', 'USD', 3, 0, 0, 0, 1, 50000, '', '2100', '5060', '', 0),
(4, 'Nexus Packing Co', 'NexusPacking', '54 Industrial Rd, Detroit', '', 'NP8827361', 'Sarah Jenkins', '', 'www.nexuspacking.com', '', 'USD', 3, 0, 0, 0, 1, 20000, '', '2100', '5060', '', 0),
(5, 'Prime Industries', 'PrimeInd', '900 Manufacturer Ave, Cleveland', '', 'PI4438271', 'Robert Chen', '', 'www.primeindustries.com', '', 'USD', 3, 0, 0, 0, 1, 80000, '', '2100', '5060', '', 0),
(6, 'Pioneer Software Systems', 'PioneerSoftware', '32 Code Loop, San Francisco', '', 'PS2239182', 'Elena Rostova', '', 'www.pioneersoftware.com', '', 'USD', 3, 0, 0, 0, 1, 15000, '', '2100', '5060', '', 0),
(7, 'Zenith Energy Corp', 'ZenithEnergy', '77 Pipeline Rd, Houston', '', 'ZE7736251', 'James Sterling', '', 'www.zenithenergy.com', '', 'USD', 3, 0, 0, 0, 1, 100000, '', '2100', '5060', '', 0),
(8, 'United Steel Corp', 'UnitedSteel', '15 Foundry St, Pittsburgh', '', 'US1128372', 'Tom Ironfield', '', 'www.unitedsteel.com', '', 'USD', 3, 0, 0, 0, 1, 120000, '', '2100', '5060', '', 0),
(9, 'Infinity Office Supplies', 'InfinitySupplies', '88 Stationary Blvd, Denver', '', 'IO5536271', 'Alice Cooper', '', 'www.infinitysupplies.com', '', 'USD', 3, 0, 0, 0, 1, 10000, '', '2100', '5060', '', 0),
(10, 'Matrix Telco Group', 'MatrixTelco', '12 Telecom Tower, Philadelphia', '', 'MT9982736', 'David Miller', '', 'www.matrixtelco.com', '', 'USD', 3, 0, 0, 0, 1, 30000, '', '2100', '5060', '', 0),
(11, 'EcoPackaging Systems', 'EcoPackaging', '4 Green Way, Boulder', '', 'EP3348271', 'Jane Wilder', '', 'www.ecopackaging.com', '', 'USD', 3, 0, 0, 0, 1, 25000, '', '2100', '5060', '', 0),
(12, 'Delta Hardware', 'DeltaHardware', '611 Tool Rd, Cincinnati', '', 'DH8837261', 'William Vance', '', 'www.deltahardware.com', '', 'USD', 3, 0, 0, 0, 1, 40000, '', '2100', '5060', '', 0);


-- --------------------------------------------------------------------------------
-- COMPANY 3
-- --------------------------------------------------------------------------------

-- Extra Customers
INSERT INTO `3_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(3, 'TechZone Solutions', 'TechZone', '120 Innovation Way, Silicon Valley', 'TX9827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 5000, '', 0),
(4, 'GreenValley Organics', 'GreenValley', '45 Meadow Lane, Portland', 'GV7736251', 'USD', 1, 0, 0, 1, 4, 0, 0, 2000, '', 0),
(5, 'Alpha Builders Ltd', 'AlphaBuilders', '88 Construction Blvd, Chicago', 'AB3327182', 'USD', 1, 0, 0, 1, 4, 0, 0, 10000, '', 0),
(6, 'Apex Distributors', 'ApexDist', '310 Logistics Dr, Dallas', 'AD9982716', 'USD', 1, 0, 0, 1, 4, 0, 0, 3000, '', 0),
(7, 'Ocean Breeze Resorts', 'OceanBreeze', '5 Coastal Way, Miami Beach', 'OB1127362', 'USD', 1, 0, 0, 1, 4, 0, 0, 8000, '', 0),
(8, 'Future Retail Group', 'FutureRetail', '99 Commerce St, New York', 'FR5536271', 'USD', 1, 0, 0, 1, 4, 0, 0, 15000, '', 0),
(9, 'Dynamic Logistics', 'DynamicLog', '74 Airport Road, Atlanta', 'DL8827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 4000, '', 0),
(10, 'Horizon Healthcare', 'HorizonHealth', '20 Medical Plaza, Boston', 'HH6655221', 'USD', 1, 0, 0, 1, 4, 0, 0, 12000, '', 0),
(11, 'Synergy Consulting', 'SynergyCons', '500 Executive Tower, Seattle', 'SC2233445', 'USD', 1, 0, 0, 1, 4, 0, 0, 6000, '', 0),
(12, 'Vanguard Tech Corp', 'VanguardTech', '801 Enterprise Way, San Jose', 'VT8877665', 'USD', 1, 0, 0, 1, 4, 0, 0, 20000, '', 0);

-- Branches for Customers
INSERT INTO `3_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(3, 3, 'TechZone Solutions', 'TechZone HQ', '120 Innovation Way, Silicon Valley', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '120 Innovation Way, Silicon Valley', 0, '', NULL, 0),
(4, 4, 'GreenValley Organics', 'GreenValley Branch', '45 Meadow Lane, Portland', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '45 Meadow Lane, Portland', 0, '', NULL, 0),
(5, 5, 'Alpha Builders Ltd', 'Alpha Builders HQ', '88 Construction Blvd, Chicago', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '88 Construction Blvd, Chicago', 0, '', NULL, 0),
(6, 6, 'Apex Distributors', 'Apex Dallas Branch', '310 Logistics Dr, Dallas', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '310 Logistics Dr, Dallas', 0, '', NULL, 0),
(7, 7, 'Ocean Breeze Resorts', 'Miami Office', '5 Coastal Way, Miami Beach', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '5 Coastal Way, Miami Beach', 0, '', NULL, 0),
(8, 8, 'Future Retail Group', 'New York HQ', '99 Commerce St, New York', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '99 Commerce St, New York', 0, '', NULL, 0),
(9, 9, 'Dynamic Logistics', 'Atlanta Warehouse', '74 Airport Road, Atlanta', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '74 Airport Road, Atlanta', 0, '', NULL, 0),
(10, 10, 'Horizon Healthcare', 'Boston Main Hospital', '20 Medical Plaza, Boston', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '20 Medical Plaza, Boston', 0, '', NULL, 0),
(11, 11, 'Synergy Consulting', 'Seattle Suite', '500 Executive Tower, Seattle', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '500 Executive Tower, Seattle', 0, '', NULL, 0),
(12, 12, 'Vanguard Tech Corp', 'Vanguard San Jose', '801 Enterprise Way, San Jose', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '801 Enterprise Way, San Jose', 0, '', NULL, 0);

-- Extra Suppliers
INSERT INTO `3_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(3, 'Global Logistics Services', 'GlobalLogistics', '10 Port Way, Long Beach', '', 'GL9928374', 'Mark Peterson', '', 'www.globallogistics.com', '', 'USD', 3, 0, 0, 0, 1, 50000, '', '2100', '5060', '', 0),
(4, 'Nexus Packing Co', 'NexusPacking', '54 Industrial Rd, Detroit', '', 'NP8827361', 'Sarah Jenkins', '', 'www.nexuspacking.com', '', 'USD', 3, 0, 0, 0, 1, 20000, '', '2100', '5060', '', 0),
(5, 'Prime Industries', 'PrimeInd', '900 Manufacturer Ave, Cleveland', '', 'PI4438271', 'Robert Chen', '', 'www.primeindustries.com', '', 'USD', 3, 0, 0, 0, 1, 80000, '', '2100', '5060', '', 0),
(6, 'Pioneer Software Systems', 'PioneerSoftware', '32 Code Loop, San Francisco', '', 'PS2239182', 'Elena Rostova', '', 'www.pioneersoftware.com', '', 'USD', 3, 0, 0, 0, 1, 15000, '', '2100', '5060', '', 0),
(7, 'Zenith Energy Corp', 'ZenithEnergy', '77 Pipeline Rd, Houston', '', 'ZE7736251', 'James Sterling', '', 'www.zenithenergy.com', '', 'USD', 3, 0, 0, 0, 1, 100000, '', '2100', '5060', '', 0),
(8, 'United Steel Corp', 'UnitedSteel', '15 Foundry St, Pittsburgh', '', 'US1128372', 'Tom Ironfield', '', 'www.unitedsteel.com', '', 'USD', 3, 0, 0, 0, 1, 120000, '', '2100', '5060', '', 0),
(9, 'Infinity Office Supplies', 'InfinitySupplies', '88 Stationary Blvd, Denver', '', 'IO5536271', 'Alice Cooper', '', 'www.infinitysupplies.com', '', 'USD', 3, 0, 0, 0, 1, 10000, '', '2100', '5060', '', 0),
(10, 'Matrix Telco Group', 'MatrixTelco', '12 Telecom Tower, Philadelphia', '', 'MT9982736', 'David Miller', '', 'www.matrixtelco.com', '', 'USD', 3, 0, 0, 0, 1, 30000, '', '2100', '5060', '', 0),
(11, 'EcoPackaging Systems', 'EcoPackaging', '4 Green Way, Boulder', '', 'EP3348271', 'Jane Wilder', '', 'www.ecopackaging.com', '', 'USD', 3, 0, 0, 0, 1, 25000, '', '2100', '5060', '', 0),
(12, 'Delta Hardware', 'DeltaHardware', '611 Tool Rd, Cincinnati', '', 'DH8837261', 'William Vance', '', 'www.deltahardware.com', '', 'USD', 3, 0, 0, 0, 1, 40000, '', '2100', '5060', '', 0);


-- --------------------------------------------------------------------------------
-- COMPANY 4
-- --------------------------------------------------------------------------------

-- Extra Customers
INSERT INTO `4_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(3, 'TechZone Solutions', 'TechZone', '120 Innovation Way, Silicon Valley', 'TX9827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 5000, '', 0),
(4, 'GreenValley Organics', 'GreenValley', '45 Meadow Lane, Portland', 'GV7736251', 'USD', 1, 0, 0, 1, 4, 0, 0, 2000, '', 0),
(5, 'Alpha Builders Ltd', 'AlphaBuilders', '88 Construction Blvd, Chicago', 'AB3327182', 'USD', 1, 0, 0, 1, 4, 0, 0, 10000, '', 0),
(6, 'Apex Distributors', 'ApexDist', '310 Logistics Dr, Dallas', 'AD9982716', 'USD', 1, 0, 0, 1, 4, 0, 0, 3000, '', 0),
(7, 'Ocean Breeze Resorts', 'OceanBreeze', '5 Coastal Way, Miami Beach', 'OB1127362', 'USD', 1, 0, 0, 1, 4, 0, 0, 8000, '', 0),
(8, 'Future Retail Group', 'FutureRetail', '99 Commerce St, New York', 'FR5536271', 'USD', 1, 0, 0, 1, 4, 0, 0, 15000, '', 0),
(9, 'Dynamic Logistics', 'DynamicLog', '74 Airport Road, Atlanta', 'DL8827361', 'USD', 1, 0, 0, 1, 4, 0, 0, 4000, '', 0),
(10, 'Horizon Healthcare', 'HorizonHealth', '20 Medical Plaza, Boston', 'HH6655221', 'USD', 1, 0, 0, 1, 4, 0, 0, 12000, '', 0),
(11, 'Synergy Consulting', 'SynergyCons', '500 Executive Tower, Seattle', 'SC2233445', 'USD', 1, 0, 0, 1, 4, 0, 0, 6000, '', 0),
(12, 'Vanguard Tech Corp', 'VanguardTech', '801 Enterprise Way, San Jose', 'VT8877665', 'USD', 1, 0, 0, 1, 4, 0, 0, 20000, '', 0);

-- Branches for Customers
INSERT INTO `4_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(3, 3, 'TechZone Solutions', 'TechZone HQ', '120 Innovation Way, Silicon Valley', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '120 Innovation Way, Silicon Valley', 0, '', NULL, 0),
(4, 4, 'GreenValley Organics', 'GreenValley Branch', '45 Meadow Lane, Portland', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '45 Meadow Lane, Portland', 0, '', NULL, 0),
(5, 5, 'Alpha Builders Ltd', 'Alpha Builders HQ', '88 Construction Blvd, Chicago', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '88 Construction Blvd, Chicago', 0, '', NULL, 0),
(6, 6, 'Apex Distributors', 'Apex Dallas Branch', '310 Logistics Dr, Dallas', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '310 Logistics Dr, Dallas', 0, '', NULL, 0),
(7, 7, 'Ocean Breeze Resorts', 'Miami Office', '5 Coastal Way, Miami Beach', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '5 Coastal Way, Miami Beach', 0, '', NULL, 0),
(8, 8, 'Future Retail Group', 'New York HQ', '99 Commerce St, New York', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '99 Commerce St, New York', 0, '', NULL, 0),
(9, 9, 'Dynamic Logistics', 'Atlanta Warehouse', '74 Airport Road, Atlanta', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '74 Airport Road, Atlanta', 0, '', NULL, 0),
(10, 10, 'Horizon Healthcare', 'Boston Main Hospital', '20 Medical Plaza, Boston', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '20 Medical Plaza, Boston', 0, '', NULL, 0),
(11, 11, 'Synergy Consulting', 'Seattle Suite', '500 Executive Tower, Seattle', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '500 Executive Tower, Seattle', 0, '', NULL, 0),
(12, 12, 'Vanguard Tech Corp', 'Vanguard San Jose', '801 Enterprise Way, San Jose', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, '801 Enterprise Way, San Jose', 0, '', NULL, 0);

-- Extra Suppliers
INSERT INTO `4_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(3, 'Global Logistics Services', 'GlobalLogistics', '10 Port Way, Long Beach', '', 'GL9928374', 'Mark Peterson', '', 'www.globallogistics.com', '', 'USD', 3, 0, 0, 0, 1, 50000, '', '2100', '5060', '', 0),
(4, 'Nexus Packing Co', 'NexusPacking', '54 Industrial Rd, Detroit', '', 'NP8827361', 'Sarah Jenkins', '', 'www.nexuspacking.com', '', 'USD', 3, 0, 0, 0, 1, 20000, '', '2100', '5060', '', 0),
(5, 'Prime Industries', 'PrimeInd', '900 Manufacturer Ave, Cleveland', '', 'PI4438271', 'Robert Chen', '', 'www.primeindustries.com', '', 'USD', 3, 0, 0, 0, 1, 80000, '', '2100', '5060', '', 0),
(6, 'Pioneer Software Systems', 'PioneerSoftware', '32 Code Loop, San Francisco', '', 'PS2239182', 'Elena Rostova', '', 'www.pioneersoftware.com', '', 'USD', 3, 0, 0, 0, 1, 15000, '', '2100', '5060', '', 0),
(7, 'Zenith Energy Corp', 'ZenithEnergy', '77 Pipeline Rd, Houston', '', 'ZE7736251', 'James Sterling', '', 'www.zenithenergy.com', '', 'USD', 3, 0, 0, 0, 1, 100000, '', '2100', '5060', '', 0),
(8, 'United Steel Corp', 'UnitedSteel', '15 Foundry St, Pittsburgh', '', 'US1128372', 'Tom Ironfield', '', 'www.unitedsteel.com', '', 'USD', 3, 0, 0, 0, 1, 120000, '', '2100', '5060', '', 0),
(9, 'Infinity Office Supplies', 'InfinitySupplies', '88 Stationary Blvd, Denver', '', 'IO5536271', 'Alice Cooper', '', 'www.infinitysupplies.com', '', 'USD', 3, 0, 0, 0, 1, 10000, '', '2100', '5060', '', 0),
(10, 'Matrix Telco Group', 'MatrixTelco', '12 Telecom Tower, Philadelphia', '', 'MT9982736', 'David Miller', '', 'www.matrixtelco.com', '', 'USD', 3, 0, 0, 0, 1, 30000, '', '2100', '5060', '', 0),
(11, 'EcoPackaging Systems', 'EcoPackaging', '4 Green Way, Boulder', '', 'EP3348271', 'Jane Wilder', '', 'www.ecopackaging.com', '', 'USD', 3, 0, 0, 0, 1, 25000, '', '2100', '5060', '', 0),
(12, 'Delta Hardware', 'DeltaHardware', '611 Tool Rd, Cincinnati', '', 'DH8837261', 'William Vance', '', 'www.deltahardware.com', '', 'USD', 3, 0, 0, 0, 1, 40000, '', '2100', '5060', '', 0);
