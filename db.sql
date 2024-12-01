
CREATE TABLE Category (
    id NUMBER PRIMARY KEY,  
    name VARCHAR2(100) NOT NULL,
    description CLOB
);

CREATE TABLE Supplier (
    id NUMBER PRIMARY KEY,  
    name VARCHAR2(100) NOT NULL,
    address CLOB NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    email VARCHAR2(254) NOT NULL
);

CREATE TABLE Product (
    id NUMBER PRIMARY KEY,  
    name VARCHAR2(100) NOT NULL,
    category_id NUMBER REFERENCES Category(id) ON DELETE CASCADE,
    supplier_id NUMBER REFERENCES Supplier(id) ON DELETE SET NULL,
    price NUMBER(10, 2) NOT NULL,
    stock NUMBER NOT NULL,
    description CLOB,
    image VARCHAR2(100)  -- ???ng d?n ?nh (tùy ch?n)
);

CREATE TABLE Orders (
    id NUMBER PRIMARY KEY,  
    customer_name VARCHAR2(100) NOT NULL,
    customer_address CLOB NOT NULL,
    customer_phone VARCHAR2(15) NOT NULL,
    date_ordered TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) CHECK (status IN ('Pending', 'Completed')) NOT NULL
);

CREATE TABLE OrderDetail (
    id NUMBER PRIMARY KEY,  
    order_id NUMBER REFERENCES Orders(id) ON DELETE CASCADE,
    product_id NUMBER REFERENCES Product(id) ON DELETE CASCADE,
    quantity NUMBER NOT NULL,
    price NUMBER(10, 2) NOT NULL
);



