/* --------------------------------------------------------------------- */
/* Skrypt aktualizaję bazę IB_Demo do celów warstatowych */
/* UWAGA !!!!!  */
/* ZMIEŃ RODZAJ TRANSAKCJI Z OPCJĄ ZAPISU: IB Console : Access Mode = Write */
/* --------------------------------------------------------------------- */
/*  * Usuwa table FDQA_xxx  */
/*  * Dodaje generatory dla tabel bazy Northwind i aktualizuje wyzwalacze BEFORE INSERT  */
/*  * Tworzy tabele użytkowników USERS  */
/*  * Aktualizuje daty w tabeli Orders do dnia dzisiejszego */
/* --------------------------------------------------------------------- */

/* --------------------------------------------------------------------- */
/* --------------------------------------------------------------------- */

DROP TABLE FDQA_ARRAY;
DROP TABLE "FDQA_Batch_test";
DROP TABLE "FDQA_Bcd";
DROP TABLE "FDQA_Blob";
DROP TABLE FDQA_CATEGORIES;
DROP TABLE "FDQA_Calc";
DROP TABLE "FDQA_Clob";
DROP TABLE "FDQA_FK_tab";
DROP TABLE "FDQA_ForAsync";
DROP TABLE "FDQA_Identity_tab";
DROP TABLE "FDQA_LockTable";
DROP TABLE "FDQA_MaxLength";
DROP TABLE "FDQA_NoValsTable";
DROP TABLE "FDQA_Numbers";
DROP TABLE "FDQA_NumbersPrec";
DROP TABLE FDQA_ORDERDETAILS;
DROP TABLE FDQA_PRODUCTS;
DROP TABLE "FDQA_ParamBind";
DROP TABLE "FDQA_TabWithPK";
DROP TABLE "FDQA_TransTable";
DROP TABLE "FDQA_V_Test";
DROP TABLE "FDQA_WString";
DROP TABLE "FDQA_details_autoinc";
DROP TABLE "FDQA_map1";
DROP TABLE "FDQA_map2";
DROP TABLE "FDQA_map3";
DROP TABLE "FDQA_map4";
DROP TABLE "FDQA_master_autoinc";
DROP PROCEDURE "FDQA_All_Values";
DROP PROCEDURE FDQA_BATCH;
DROP PROCEDURE FDQA_GET_VALUES;
DROP PROCEDURE "FDQA_Set_Values";
DROP PROCEDURE FDQA_TESTBINDING;
DROP PROCEDURE FDQA_ZGET_REGION;
DROP TABLE "FDQA_All_types";

DROP GENERATOR "GEN_DET";
DROP GENERATOR "GEN_IDENT_TAB";
DROP GENERATOR "GEN_MAST";

/* --------------------------------------------------------------------- */
/* --------------------------------------------------------------------- */

DROP TABLE "EmployeeTerritories";
DROP TABLE "Territories";
DROP TABLE "CustomerCustomerDemo";
DROP TABLE "CustomerDemographics";

/* --------------------------------------------------------------------- */
/* --------------------------------------------------------------------- */

DROP TRIGGER "TR_employees";

CREATE GENERATOR GEN_CATEGORYID;
SET GENERATOR GEN_CATEGORYID TO 8;
DROP TRIGGER "TR_Categories";
SET TERM ^ ;
CREATE TRIGGER SET_Categories_ID FOR "Categories" 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.CATEGORYID IS NULL) THEN
    NEW.CATEGORYID = GEN_ID( GEN_CATEGORYID, 1);
END^
SET TERM ;^

CREATE GENERATOR GEN_PRODUCTID;
SET GENERATOR GEN_PRODUCTID TO 8;
DROP TRIGGER "TR_Products";
SET TERM ^ ;
CREATE TRIGGER SET_Products_ID FOR "Products" 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.CATEGORYID IS NULL) THEN
    NEW.CATEGORYID = GEN_ID( GEN_PRODUCTID, 1);
END^
SET TERM ;^

CREATE GENERATOR GEN_ORDERID;
SET GENERATOR GEN_ORDERID TO 11077;
DROP TRIGGER "TR_Orders";
SET TERM ^ ;
CREATE TRIGGER SET_Orders_ID FOR "Orders" 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ORDERID IS NULL) THEN
    NEW.ORDERID = GEN_ID( GEN_ORDERID, 1);
END^
SET TERM ;^

CREATE GENERATOR GEN_SHIPPERID;
SET GENERATOR GEN_SHIPPERID TO 3;
DROP TRIGGER "TR_Shippers";
SET TERM ^ ;
CREATE TRIGGER SET_Shippers_ID FOR "Shippers" 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.SHIPPERID IS NULL) THEN
    NEW.SHIPPERID = GEN_ID( GEN_SHIPPERID, 1);
END^
SET TERM ;^

CREATE GENERATOR GEN_SUPPLIERID;
SET GENERATOR GEN_SUPPLIERID TO 29;
DROP TRIGGER "TR_Suppliers";
SET TERM ^ ;
CREATE TRIGGER SET_Suppliers_ID FOR "Suppliers" 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.SUPPLIERID IS NULL) THEN
    NEW.SUPPLIERID = GEN_ID( GEN_SUPPLIERID, 1);
END^
SET TERM ;^

/* ************************************************************************** */
/*                                 New tables                                 */
/* ************************************************************************** */

CREATE TABLE Users (
   UserID VARCHAR(10) NOT NULL,
   UserName VARCHAR(30) NOT NULL,
   UserPassword VARCHAR(60) NOT NULL,
   FirstName VARCHAR(60),
   LastName VARCHAR(60),
   Status CHARACTER(1)
     CHECK (Status IN ('A', 'D', 'B')),
   CONSTRAINT PK_Users PRIMARY KEY (UserID)
);

CREATE TABLE DatabaseInfo (
    VersionNr  INTEGER NOT NULL,
	UpgradeDate  TIMESTAMP
);

INSERT INTO Users (UserID, UserName, UserPassword, Status) VALUES ('ADM','admin','d033e22ae348aeb5660fc2140aec35850c4da997','A');
INSERT INTO Users (UserID, UserName, UserPassword, Status) VALUES ('U01','user1','b3daa77b4c04a9551b8781d03191fe098f325e67','A');

INSERT INTO DatabaseInfo (VersionNr, UpgradeDate) VALUES (1, cast('now' as DATE)-5);

CREATE UNIQUE INDEX IDX_Users_UserName ON Users COMPUTED BY (UPPER(UserName));


/* ************************************************************************** */
/*                                   Views                                    */
/* ************************************************************************** */

CREATE VIEW "PaidForOrders" (OrderID,Paid) AS
SELECT OrderID, sum(UnitPrice * Quantity * (1-Discount)) FROM "Order Details"
group by OrderID;


/* ************************************************************************** */
/*               Update dates in the "Order Details" table                    */
/* ************************************************************************** */

/*
SELECT cast('now' as DATE) - MAX(OrderDate) - 1 FROM "Orders"
*/

UPDATE "Orders" SET  
  ORDERDATE =  ORDERDATE + 7163,  
  REQUIREDDATE = REQUIREDDATE + 7163, 
  SHIPPEDDATE = SHIPPEDDATE + 7163;


