create table Buyer
(
Buyer_ID NUMBER(10), 
First_Name varchar2(25), 
Last_Name varchar2(25),
constraint Buyer_ID_PK primary key (Buyer_ID)
);

create table Auctioner 
(
Auctioner_ID number(10), 
First_Name varchar2(25), 
Last_Name varchar2(25),
constraint Auctioner_ID_PK primary key (Auctioner_ID)
);

create table Bid
(
Amount number(10), 
Buyer_ID number(10),
CONSTRAINT Amount_pk primary key (Amount),
CONSTRAINT Buyer_ID_FK foreign key (Buyer_ID) references Buyer(Buyer_ID)
);

create table Auction 
(
Auction_ID number(10) ,
Title varchar2(25), 
A_category varchar2(25) ,
Highest_bid number(10),
Start_price number(10),
Auctioner_ID number(10) NOT NULL UNIQUE ,
Bid_amount number(10),
Buyer_ID number(10) NOT NULL UNIQUE ,
CONSTRAINT Auction_ID_pk primary key (Auction_ID),
CONSTRAINT Buyer_ID_FK2 foreign key (Buyer_ID) references Buyer(Buyer_ID),
CONSTRAINT Auctioner_ID_FK2 foreign key (Auctioner_ID) references Auctioner(Auctioner_ID),
CONSTRAINT Bid_Amount_FK foreign key (Bid_amount) references Bid(Amount)
);

create table Seller
(
Seller_ID NUMBER(10), 
First_Name varchar2(25), 
Last_Name varchar2(25),
constraint Seller_ID_PK primary key (Seller_ID)
);

create  table Item
(  
Item_ID number(10),
I_Name varchar2(25),
Buyer_ID number(10),
Auction_ID number(10),
Seller_ID number(10),
CONSTRAINT Item_ID_pk primary key (Item_ID),
CONSTRAINT Buyer_ID_FK3 foreign key (Buyer_ID) references Buyer(Buyer_ID),
CONSTRAINT Auction_ID_FK foreign key (Auction_ID) references Auction(Auction_ID),
CONSTRAINT Seller_ID_FK foreign key (Seller_ID) references Seller(Seller_ID)
);

create table Payment 
(
Payment_ID number(10),
Buyer_ID number(10),
P_date date,
Method_Name varchar2(25),
Final_Price number(10),
CONSTRAINT Payment_ID_pk primary key (Payment_ID),
CONSTRAINT Buyer_ID_FK4 foreign key (Buyer_ID) references Buyer(Buyer_ID)
);

create table Participate
(
Buyer_ID number(10),
Auction_ID number(10) ,
CONSTRAINT Auction_ID_FK2 foreign key (Auction_ID) references Auction(Auction_ID),
CONSTRAINT Buyer_ID_FK5 foreign key (Buyer_ID) references Buyer(Buyer_ID)
);

create table Preferred_Category
(
Buyer_ID number(10),
P_Category varchar2(25) ,
CONSTRAINT P_Category_pk primary key (P_Category),
CONSTRAINT Buyer_ID_FK6 foreign key (Buyer_ID) references Buyer(Buyer_ID)
);

create table Recieve
(
Buyer_ID number(10),
Bid_Amount Number(25) ,
Auction_ID number(10) ,
CONSTRAINT Auction_ID_FK3 foreign key (Auction_ID) references Auction(Auction_ID),
CONSTRAINT Bid_Amount_fk2 foreign key (Bid_Amount) references Bid(Amount),
CONSTRAINT Buyer_ID_FK7 foreign key (Buyer_ID) references Buyer(Buyer_ID)
);



INSERT INTO Buyer (Buyer_id, First_Name, Last_Name)
VALUES (201, 'John', 'Doe');

INSERT INTO Buyer (Buyer_id, First_Name, Last_Name)
VALUES (202, 'Jane', 'Smith');

INSERT INTO Buyer (Buyer_id, First_Name, Last_Name)
VALUES (203, 'Alice', 'Johnson');


INSERT INTO Seller (Seller_id, First_Name, Last_Name)
VALUES (301, 'Mark', 'Lee');

INSERT INTO Seller (Seller_id, First_Name, Last_Name)
VALUES (302, 'Sarah', 'Brown');

INSERT INTO Seller (Seller_id, First_Name, Last_Name)
VALUES (303, 'Paul', 'Green');


INSERT INTO Auctioner (Auctioner_id, First_Name, Last_Name)
VALUES (101, 'William', 'Black');

INSERT INTO Auctioner (Auctioner_id, First_Name, Last_Name)
VALUES (102, 'Emily', 'White');

INSERT INTO Auctioner (Auctioner_id, First_Name, Last_Name)
VALUES (103, 'Oliver', 'Gray');


INSERT INTO Bid (Amount, Buyer_id)
VALUES (500, 201);

INSERT INTO Bid (Amount, Buyer_id)
VALUES (20000, 202);

INSERT INTO Bid (Amount, Buyer_id)
VALUES (800, 203);



INSERT INTO Payment (Payment_id, Buyer_id, p_Date, Method_Name, Final_Price)
VALUES (501, 201, '10/jan/2023', 'Credit Card', 500);

INSERT INTO Payment (Payment_id, Buyer_id, p_Date, Method_Name, Final_Price)
VALUES (502, 202, '15/feb/2023', 'PayPal', 20000);

INSERT INTO Payment (Payment_id, Buyer_id, p_Date, Method_Name, Final_Price)
VALUES (503, 203, '20/jun/2023', 'Bank Transfer', 800);


INSERT INTO Auction (Auction_id, Title, a_Category, Highest_bid, Start_Price, Auctioner_id, Bid_Amount, Buyer_id)
VALUES (1, 'Painting A', 'Art', 500, 200, 101, 500, 201);

INSERT INTO Auction (Auction_id, Title, a_Category, Highest_bid, Start_Price, Auctioner_id, Bid_Amount, Buyer_id)
VALUES (2, 'Vintage Car', 'Vehicles', 20000, 15000, 102, 20000, 202);

INSERT INTO Auction (Auction_id, Title, a_Category, Highest_bid, Start_Price, Auctioner_id, Bid_Amount, Buyer_id)
VALUES (3, 'Sculpture B', 'Collectibles', 800, 500, 103, 800, 203);


INSERT INTO Recieve (Auction_id, Bid_Amount, Buyer_id)
VALUES (1, 500, 201);

INSERT INTO Recieve (Auction_id, Bid_Amount, Buyer_id)
VALUES (2, 20000, 202);

INSERT INTO Recieve (Auction_id, Bid_Amount, Buyer_id)
VALUES (3, 800, 203);


INSERT INTO Bid (Amount, Buyer_id)
VALUES (500, 201);

INSERT INTO Bid (Amount, Buyer_id)
VALUES (20000, 202);

INSERT INTO Bid (Amount, Buyer_id)
VALUES (900, 204);



INSERT INTO Participate (Buyer_id, Auction_id)
VALUES (201, 1);

INSERT INTO Participate (Buyer_id, Auction_id)
VALUES (202, 2);

INSERT INTO Participate (Buyer_id, Auction_id)
VALUES (203, 3);


INSERT INTO Preferred_Category (Buyer_id, P_Category)
VALUES (201, 'Art');

INSERT INTO Preferred_Category (Buyer_id, P_Category)
VALUES (202, 'Vehicles');

INSERT INTO Preferred_Category (Buyer_id, P_Category)
VALUES (203, 'Collectibles');



INSERT INTO Item (Item_id, I_Name, Buyer_id, Auction_id, Seller_id)
VALUES (401, 'Painting A', 201, 1, 301);

INSERT INTO Item (Item_id, I_Name, Buyer_id, Auction_id, Seller_id)
VALUES (402, 'Vintage Car', 202, 2, 302);

INSERT INTO Item (Item_id, I_Name, Buyer_id, Auction_id, Seller_id)
VALUES (403, 'Sculpture B', 203, 3, 303);

commit;






