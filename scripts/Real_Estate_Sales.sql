CREATE SCHEMA INSTANCE;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_date ( 
	date_id int64 NOT NULL  ,
	yearNumber int64  ,
	monthNumber int64  ,
	quarter int64  ,
	dayNumber int64  ,
	dayName int64  ,
	monthName int64  ,
	weekoftheMonth int64  ,
	weekoftheYear int64  ,
	dateIsoformat datetime  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_location ( 
	location_id int64 NOT NULL  ,
	town int64  ,
	address int64  ,
	latitude bignumeric  ,
	longitude bignumeric  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_location ADD PRIMARY KEY ( location_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_nonUseCode ( 
	nonUseCode_id int64 NOT NULL  ,
	nonUseCode int64  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_nonUseCode ADD PRIMARY KEY ( nonUseCode_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_propertyType ( 
	propertyType_id int64 NOT NULL  ,
	propertyType int64  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_propertyType ADD PRIMARY KEY ( propertyType_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_remarks ( 
	remarks_id int64 NOT NULL  ,
	assessorRemarks int64  ,
	opmRemarks int64  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_remarks ADD PRIMARY KEY ( remarks_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_residentialType ( 
	residentialType_id int64 NOT NULL  ,
	residentialType int64  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.dim_residentialType ADD PRIMARY KEY ( residentialType_id )  NOT ENFORCED;

CREATE TABLE Real_Estate_Sales_dw_lgl.INSTANCE.facts_RESales ( 
	fact_id int64 NOT NULL  ,
	sale_amount numeric  ,
	assessed_value numeric  ,
	sales_ratio numeric  ,
	location_id int64 NOT NULL  ,
	propertyType_id int64  ,
	residentialType_id int64  ,
	nonUseCode_id int64  ,
	remarks_id int64  ,
	date_id int64  
 );

ALTER TABLE Real_Estate_Sales_dw_lgl.INSTANCE.facts_RESales ADD PRIMARY KEY ( fact_id, location_id )  NOT ENFORCED;
