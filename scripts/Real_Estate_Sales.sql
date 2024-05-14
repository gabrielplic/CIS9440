-- Create the schema
CREATE SCHEMA RE_Sales;

-- Create dim_date table
CREATE TABLE RE_Sales.dim_date (
	date_id INT NOT NULL,
	date_iso_format DATE,
	year_number INT,
	month_number INT,
	day_number INT,
	quarter_number INT,
	month_name VARCHAR(100),
	day_name VARCHAR(100),
	week_of_year INT,
	week_of_month INT
);

-- Add primary key to dim_date
ALTER TABLE RE_Sales.dim_date ADD PRIMARY KEY (date_id);

-- Create dim_location table
CREATE TABLE RE_Sales.dim_location (
	location_id INT NOT NULL,
	town VARCHAR(255), -- Adjusted if town names or other string data are stored
	address VARCHAR(255) -- Adjusted if full addresses are to be stored
);

-- Add primary key to dim_location
ALTER TABLE RE_Sales.dim_location ADD PRIMARY KEY (location_id);

-- Create dim_propertyType table
CREATE TABLE RE_Sales.dim_propertyType (
	property_type_id INT NOT NULL,
	property_type VARCHAR(255) -- Adjusted if it's a string code or description
);

-- Add primary key to dim_propertyType
ALTER TABLE RE_Sales.dim_propertyType ADD PRIMARY KEY (property_type_id);

-- Create dim_residentialType table
CREATE TABLE RE_Sales.dim_residentialType (
	residential_type_id INT NOT NULL,
	residential_type VARCHAR(255) -- Adjusted if it's a string code or description
);

-- Add primary key to dim_residentialType
ALTER TABLE RE_Sales.dim_residentialType ADD PRIMARY KEY (residential_type_id);

-- Create facts_RESales table
CREATE TABLE RE_Sales.facts_RESales (
	fact_id INT NOT NULL,
	sale_amount numeric,
	assessed_value numeric,
	sales_ratio numeric,
	location_id INT NOT NULL,
	property_type_id INT,
	residential_type_id INT,
	date_id INT
);

-- Add primary key to facts_RESales
ALTER TABLE RE_Sales.facts_RESales ADD PRIMARY KEY (fact_id, location_id);

-- Add foreign key from facts_RESales.location_id to dim_location.location_id
ALTER TABLE RE_Sales.facts_RESales
ADD CONSTRAINT fk_facts_RESales_location_id
FOREIGN KEY (location_id) REFERENCES RE_Sales.dim_location(location_id);

-- Add foreign key from facts_RESales.property_type_id to dim_propertyType.property_type_id
ALTER TABLE RE_Sales.facts_RESales
ADD CONSTRAINT fk_facts_RESales_property_type_id
FOREIGN KEY (property_type_id) REFERENCES RE_Sales.dim_propertyType(property_type_id);

-- Add foreign key from facts_RESales.residential_type_id to dim_residentialType.residential_type_id
ALTER TABLE RE_Sales.facts_RESales
ADD CONSTRAINT fk_facts_RESales_residential_type_id
FOREIGN KEY (residential_type_id) REFERENCES RE_Sales.dim_residentialType(residential_type_id);

-- Add foreign key from facts_RESales.date_id to dim_date.date_id
ALTER TABLE RE_Sales.facts_RESales
ADD CONSTRAINT fk_facts_RESales_date_id
FOREIGN KEY (date_id) REFERENCES RE_Sales.dim_date(date_id);
