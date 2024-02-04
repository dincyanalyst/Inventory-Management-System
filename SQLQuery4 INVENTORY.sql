CREATE DATABASE INVENTORY;

USE INVENTORY;

CREATE TABLE PRODUCT
(PID CHAR(5) NOT NULL,
 PDESC VARCHAR(30) NOT NULL,
 PRICE INT,
 CATEGORY VARCHAR(2),
 PRIMARY KEY(PID));
 
 ALTER TABLE PRODUCT
 ADD SUID CHAR(5);

 alter table product
 add constraint chkpdesc check (category in ('IT','HA','HC'));
 
  alter table product
 add constraint chkPRICE check (PRICE>0);
   
 ALTER TABLE PRODUCT
 add constraint FKID1 FOREIGN KEY (suID) REFERENCES SUPPLIER (SUID);
 

 ALTER TABLE PRODUCT
 ALTER COLUMN PDESC VARCHAR(80);

 CREATE TABLE SUPPLIER
 (SuID CHAR(5) NOT NULL,
 SNAME VARCHAR(20) NOT NULL ,
 SADD VARCHAR(30) NOT NULL,
 SCITY VARCHAR(20),
 SPHONE CHAR(10) UNIQUE,
 EMAIL VARCHAR(30)
 PRIMARY KEY (SuID));
 
 alter table supplier
 add constraint df default 'DELHI' FOR SCITY;
 
  CREATE TABLE STOCK
 (PID CHAR(5),
  SQTY INT,
  ROL INT,
  MOQ INT);

 alter table STOCK
 add constraint chkSQTY check (SQTY >=0);

  alter table STOCK
 add constraint chkROL check (ROL >0);
 
 alter table STOCK
 add constraint chkMOQ check (MOQ >=5);
 
  ALTER TABLE STOCK
 add constraint FKID2 FOREIGN KEY (PID) REFERENCES PRODUCT (PID);

  CREATE TABLE CUST
  (CID CHAR(5) NOT NULL,
   CNAME VARCHAR(20) NOT NULL,
   ADDRES VARCHAR(30) NOT NULL,
   CITY VARCHAR(20) NOT NULL,
   PHONE CHAR(10) NOT NULL,
   EMAIL VARCHAR(30) NOT NULL,
   DOB DATE
   PRIMARY KEY (CID));
  
    alter table cust
    add constraint chkdob check (DOB <'01-JAN-2000');

   CREATE TABLE ORDERS
   (OID CHAR(5) NOT NULL,
    ODATE DATE,
	PID CHAR(5),
	CID CHAR(5),
	OQTY INT
	PRIMARY KEY(OID));
	

	ALTER TABLE ORDERS
 add constraint FKID3 FOREIGN KEY (PID) REFERENCES PRODUCT (PID);

 ALTER TABLE ORDERS
 add constraint FKID4 FOREIGN KEY (CID) REFERENCES CUST (CID);

 alter table ORDERS
 add constraint chkOQTY check (OQTY >=1);



 ---Insertion OF values in SUPPLIER TABLE-----

 insert into Supplier
 values ('S0001','MANPREET SINGH','B320,JANAKPURI','DELHI','9999912399','MSINGH@GMAIL.COM');

 insert into Supplier
 values ('S0002','ROHIT GUPTA','A32/620 MAIN ROAD,SECTOR 56','DELHI','8899001123','RGUPTA@GMAIL.COM');

 insert into Supplier
 values ('S0003','KAPIL SHARMA','JAY MAA APARTMENTS FLAT 32','DELHI','9999001099','KSHARMA@GMAIL.COM');

 insert into Supplier
 values ('S0004','ARCHANA SHARMA','5C KARANPUR,NP ROAD','DELHI','9899249700','ASHARMA@GMAIL.COM');

 insert into Supplier
 values ('S0005','RANJEETA GOYAL','FLAT NO 6A,RAJPUR ROAD','DELHI','9999002700','RGOYAL@GMAIL.COM');

 insert into Supplier
 values ('S0006','KOMAL SINGH','SECTOR 64,OLD GURGAON ROAD','DELHI','7285912349','KSING@GMAIL.COM');

 insert into Supplier
 values ('S0007','AMIT KAPOOR','B2/45 DDA FLATS,JANAKPURI','DELHI','9874256310','AKAPOOR@GMAIL.COM');

 SELECT * FROM SUPPLIER;
 ---Insertion OF values in PRODUCT TABLE-----
  
  insert into product
  values ('p0001','dell mouse',1449,'IT','S0001');

  insert into product
  values ('p0002','HP PAVILION INTELi5 16GBRAM',66999,'IT','S0007');

  insert into product
  values ('p0003','LENOVO E41-55 LAPTOP,AMD ATHLON,4GBRAM',19976,'IT','S0007');

  insert into product
  values ('p0004','DELL KB216 WIRED MULTIMEDIA KEYBOARD',549,'IT','S0007');

  insert into product
  values ('p0005','fingertip pulse oximeter',599,'HC','S0002');

  insert into product
  values ('p0006','DIAMOND BPMR112 REGULAR VELCRO CUFF SPHYGMOMANOMETER',2999,'HC','S0003');

  insert into product
  values ('p0007','DR. MORPEN BLOOD PRESSURE',1178,'HC','S0003');

  insert into product
  values ('p0008','Connect handheld pulse oximeter',8999,'HC','S0002');

  insert into product
  values ('p0009','accu-chek glucometer',752,'HC','S0002');

  insert into product
  values ('p0010','APOLLO PHARMACY GLUCOMETER',648,'HC','S0002');

  insert into product
  values ('p0011','SAMSUNG AR18CY3ZAGD 1.5 TON 3 STAR 2023 INVERTER SPLIT AC',33850,'HA','S0004');

  insert into product
  values ('p0012','IFB Neo Diva BX 7 kg Fully Automatic Front Load Washing Machine',79990,'HA','S0005');

  insert into product
  values ('p0013','AQUAGUARD GLORY 6 L RO+UV+UF WATER PURIFIER',12999,'HA','S0006');

  insert into product
  values ('p0014','LIVPURE PREP PRO GRAND DX 7 L RO+UV+MINERALISER WATER PURIFIER',16490,'HA','S0006');

  insert into product
  values ('p0015','MarQ by Flipkart FKAC083SIAEXT 0.8 Ton 3 Star Split Inverter AC',21490,'HA','S0004');

  insert into product
  values ('p0016','DELL INSPIRON 14-5420 LAPTOP,12THGEN,INTEL CORE 16GB 512GBYTES',72989,'IT','S0007');

  insert into product
  values ('p0017','BPL INFRARED THERMOMETER F1',2700,'HC','S0002');

  SELECT * FROM PRODUCT;

  ---Insertion OF values in CUST TABLE-----

  INSERT INTO CUST
  VALUES ('C0001','LALIT SHARMA','C2-401,JANAKPURI','DELHI',9898999989,'LSHARMA@GMAIL.COM','12-10-1989');

  INSERT INTO CUST
  VALUES ('C0002','MONIKA BAJAJ','DLF,PHASE 5','GURGAON',9898101089,'MBAJAJ@GMAIL.COM','12-10-1992');

  INSERT INTO CUST
  VALUES ('C0003','DEVENDER KAPOOR','E102/3 SECTOR 3,DWARKA','DELHI',9899346907,'DK@GMAIL.COM','10-10-1987');

  INSERT INTO CUST
  VALUES ('C0004','RAVINDER KUMAR','B302 JAYMAA APT,SWARKA','DELHI',9986742510,'RK@GMAIL.COM','12-10-1985');

  INSERT INTO CUST
  VALUES ('C0005','GAURAV GUPTA','D41-JAY MAA APARTMENT','DELHI',9962874698,'GGUPTA@GMAIL.COM','2-11-1989');
  
  SELECT * FROM CUST;

---Insertion OF values in ORDER TABLE-----
   
  INSERT INTO ORDERS
  VALUES('O0001','2-11-2022','P0005','C0003',15);

  INSERT INTO ORDERS
  VALUES('O0002','01-29-2023','P0017','C0001',30);

  INSERT INTO ORDERS
  VALUES('O0003','10-15-2022','P0002','C0002',5);

  INSERT INTO ORDERS
  VALUES('O0004','03-21-2023','P0010','C0005',50);

  INSERT INTO ORDERS
  VALUES('O0005','02-11-2023','P0014','C0004',7);

  SELECT * FROM ORDERS;


  ---Insertion OF values in STOCK TABLE-----
  INSERT INTO STOCK           
  VALUES('P0001',7,2,150);      

  INSERT INTO STOCK
  VALUES('P0002',15,5,250);

  INSERT INTO STOCK
  VALUES('P0003',10,4,200);

  INSERT INTO STOCK
  VALUES('P0004',12,3,150);

  INSERT INTO STOCK
  VALUES('P0005',35,10,100);

  INSERT INTO STOCK
  VALUES('P0006',20,5,120);

  INSERT INTO STOCK
  VALUES('P0008',15,4,210);

  INSERT INTO STOCK
  VALUES('P0009',40,15,180);

  INSERT INTO STOCK
  VALUES('P0011',7,2,140);

  INSERT INTO STOCK
  VALUES('P0013',10,3,90);


  SELECT * FROM STOCK;

  ----USE JOIN -PID, PDESC, CATEGORY, SNAME, SCITY----

  SELECT p1.pid,p1.pdesc,p1.category,s1.sname,s1.scity
  from product p1
  inner join supplier s1
  on p1.suid=s1.suid;


  ------USE JOIN DISPLAY OID , ODATE , CNAME, CADDRESS, CPHONE, PDESC, PRICE,OQTY, AMT-------

  SELECT T1.OID,T1.ODATE,T1.OQTY,T2.CNAME,T2.ADDRES,T2.PHONE,T3.PDESC,T3.PRICE,(PRICE*OQTY) AS AMOUNT
  FROM ORDERS T1
  INNER JOIN CUST T2
  ON T1.CID=T2.CID
  INNER JOIN PRODUCT T3
  ON T1.PID=T3.PID;


  --------CREATING A VIEW BILL TO DISPLAY OID,ODATE,CNAME,ADDRESS,PHONE,PDESC, PRICE, OQTY, AMOUNT-----

  CREATE VIEW BILL
  AS 
     SELECT ORDERS.OID,ODATE,OQTY,CNAME,ADDRES,PHONE,PDESC,PRICE,(PRICE*OQTY) AS AMOUNT
	 FROM ORDERS 
	 INNER JOIN CUST
	 ON ORDERS.CID=CUST.CID
	 INNER JOIN PRODUCT
	 ON ORDERS.PID=PRODUCT.PID;

SELECT * FROM BILL;


    --------CREATING PROCEDURES-------

	1)  ----ADDSUPPLIER –SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OF THE NEW SUPPLIER ADDED.-----
	    
		create procedure AddSupplier @SID AS CHAR(5),@SNA AS VARCHAR(20),@SA AS VARCHAR(30),@SC AS VARCHAR(20),@SP AS CHAR(10),@SEM AS VARCHAR(30)
		AS
		BEGIN
		     INSERT INTO SUPPLIER
			 VALUES(@SID,@SNA,@SA,@SC,@SP,@SEM);
		
		     SELECT * FROM SUPPLIER
	         WHERE SUID=@SID;
		END;
		
		ADDSUPPLIER 'S0008','AKSHAY KHANNA','C204,RAMKY ONE,MANIKONDA','DELHI','9632487251','AKHANNA@GMAIL.COM';

		2)--ADDPRO–SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE NEW PRODUCT ADDED.---


		CREATE PROCEDURE AddPro @PIID as CHAR(5),@PD AS VARCHAR(80),@PR AS INT,@C AS VARCHAR(2),@SUID AS CHAR(5)
		AS
		BEGIN
		      INSERT INTO PRODUCT
			  VALUES (@PIID,@PD,@PR,@C,@SUID);

			  SELECT * FROM PRODUCT;
	    END;

		ADDPRO 'P0018','DELL KB216 WIRED MULTIMEDIA KEYBOARD','600','IT','S0007';


      3)---ADDCUST–SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF THE NEW CUSTOMER ADDED.---

	     CREATE PROCEDURE ADDCUST @CID AS CHAR(5),@CN AS VARCHAR(20),@AS AS VARCHAR(30),@CI AS VARCHAR(20),@P AS CHAR(10),@EM AS VARCHAR(30),@DOB AS DATE
		 AS
		 BEGIN 
		      INSERT INTO CUST
			  VALUES(@CID,@CN,@AS,@CI,@P,@EM,@DOB);

			  SELECT * FROM CUST
			  WHERE CID=@CID;
		END;


		ADDCUST 'C0006','MAHESH SINGH','DURGA SOCIETY,BHAIRAVNATH ROAD','AHMEDABAD',9863574223,'MSINGH1@GMAIL.COM','10-03-2000';


	4)--ADDORDER–SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.----

	    CREATE PROCEDURE ADDORDER @OID AS CHAR(5),@P AS CHAR(5),@CID AS CHAR(5),@OQ AS INT
		AS 
	    BEGIN
		     INSERT INTO ORDERS
			 VALUES(@OID,GETDATE(),@P,@CID,@OQ);

			 SELECT * FROM ORDERS
			 WHERE OID=@OID;
	    END;

		ADDORDER 'O0007','P0010','C0004',25;



	------Creating function to autogenerate 5 characters alphanumeric ID.-------
	     DROP FUNCTION CID;
	1)  Create function CID (@C AS CHAR(1),@I AS INT)
	    RETURNS CHAR(5)
		AS
		BEGIN
		     DECLARE @ID AS CHAR(5)
			 IF @I<10
			       SET @ID=CONCAT(@C,'000',@I);
             ELSE IF @I<100
			       SET @ID=CONCAT(@C,'00',@I);
			 ELSE IF @I<1000
			       SET @ID=CONCAT(@C,'0',@I);
			 ELSE IF @I<10000
			       SET @ID=CONCAT(@C,@I);
			 ELSE
			       SET @ID='NA';
             RETURN @ID;
		END;

    ------Creating Sequence for entering next value------
	     DROP SEQUENCE MYSEQ; 
		  Create Sequence MySeq
		  As int
		  Start with 0009
		  increment by 1;
	    
	------Creating procedure for adding supplier in supplier table--------
	     DROP PROCEDURE ADDSUPP1;  
		   Create procedure ADDSUPP1 @SNA AS VARCHAR(20),@SA AS VARCHAR(30),@SC AS VARCHAR(20),@SP AS CHAR(10),@SEM AS VARCHAR(30)
		   AS
		   BEGIN
			   Declare @ID as Char(5);
			   DECLARE @I AS INT;

			   SET @I=(NEXT VALUE FOR MYSEQ);
			   SET @ID=DBO.CID('S',@I);
			   
		       INSERT INTO SUPPLIER
			   VALUES(@ID,@SNA,@SA,@SC,@SP,@SEM);
		
		     SELECT * FROM SUPPLIER;  
	         
		END;


		ADDSUPP1 'RAHUL TANEJA','GOKUL COLONY,GIRIDHAR LANE','DELHI','9865471258','RATAN12@GMAIL.COM';
        ADDSUPP1 'NANDISH THAPAR','HEALTH CARE SERVICE CENTER','DELHI','9989761451','NTHAPAR@GMAIL.COM';

     ------------ADDPRO---------------------------


	 Create function pID (@C AS CHAR(1),@I AS INT)
	 RETURNS CHAR(5)                                                                          
     AS
	 BEGIN
	         DECLARE @ID AS CHAR(5)
			 IF @I<10
			       SET @ID=CONCAT(@C,'000',@I);
             ELSE IF @I<100
			       SET @ID=CONCAT(@C,'00',@I);
			 ELSE IF @I<1000
			       SET @ID=CONCAT(@C,'0',@I);
			 ELSE IF @I<10000
			       SET @ID=CONCAT(@C,@I);
			 ELSE
			       SET @ID='NA';
             RETURN @ID;
		END;
                                                                                 
	-------Creating Sequence for entering next value------
	     DROP SEQUENCE MYSEQ1;
		  Create Sequence MySeq1
		  As int
		  Start with 19
		  Increment by 1;																														 
		
	-------Creating procedure for adding product in product table-------
	     
		   Create procedure ADDprod1 @PD AS VARCHAR(80),@PR AS INT,@C AS VARCHAR(2),@SUID AS CHAR(5)
		   AS
		   BEGIN
		        DECLARE @I AS INT;
				DECLARE @ID AS CHAR(5);

				SET @I=(NEXT VALUE FOR MYSEQ1);
				SET @ID=DBO.PID('P',@I);

				INSERT INTO PRODUCT
				VALUES (@ID,@PD,@PR,@C,@SUID);

				SELECT * FROM PRODUCT;
		   END;										 
																				 
		ADDPROD1 '3M Littmann Classic III Stethoscope 5620',7800,'HC','S0011';


	-------ADDCUST–-------------

			CREATE SEQUENCE MYSEQ2
			AS INT
			START WITH 7
			INCREMENT BY 1; 


	-----Creating procedure for adding CUSTOMER in CUST table-------
	     
		   DROP PROCEDURE ADDCUST1;
	       Create procedure ADDCUST1 @CN AS VARCHAR(20),@AS AS VARCHAR(30),@CI AS VARCHAR(20),@P AS CHAR(10),@EM AS VARCHAR(30),@DOB AS DATE
		   AS
		   BEGIN
		        DECLARE @I AS INT;
				DECLARE @ID AS CHAR(5);

				SET @I=(NEXT VALUE FOR MYSEQ2);
				SET @ID=DBO.CID('C',@I);

				INSERT INTO CUST
				VALUES (@ID,@CN,@AS,@CI,@P,@EM,@DOB);

				SELECT * FROM CUST;
		   END;					
																	 
																				 
			ADDCUST1 'SHAHID KAPOOR','FILMNAGAR CITY, ANDHERI','MUMBAI',9898764758,'SKAPOOR@GMAIL.COM','1987-02-04';

	
	---------------ADDORDER-------------------------------------------------------

	CREATE SEQUENCE MYSEQ3
	AS INT
	START WITH 8
	INCREMENT BY 1;

	drop procedure addorder1;
    CREATE PROCEDURE ADDORDER1 @P AS CHAR(5),@CID AS CHAR(5),@OQ AS INT
	AS 
	BEGIN
		  DECLARE @I AS INT;
		  DECLARE @ID AS CHAR(5);

	      SET @I=(NEXT VALUE FOR MYSEQ3);
		  SET @ID=DBO.CID('O',@I);

		  INSERT INTO ORDERS
		  VALUES (@ID,GETDATE(),@P,@CID,@OQ);

		  SELECT * FROM ORDERS;
	 END;																					 
		
	ADDORDER1 'P0018','C0007',20;																	 
																				