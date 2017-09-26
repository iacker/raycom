drop sequence SEQ_COM_DICT;
drop sequence SEQ_COM_USER;
drop sequence SEQ_COM_ROLE;
drop sequence SEQ_COM_FILE;
drop sequence SEQ_MENU_PERMISSION;
drop sequence SEQ_COM_MENU;
drop sequence SEQ_USC_HOSPITAL;
drop sequence SEQ_USC_NOTICE;
drop sequence SEQ_USC_ORG;
drop sequence SEQ_USC_MANUFACTURE;
drop sequence SEQ_USC_DOC_OP_LOG;
drop sequence SEQ_USC_DOC_TYPE;
drop sequence seq_BUSINESS_LOG;
CREATE sequence SEQ_COM_DICT
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_COM_USER
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_COM_ROLE
minvalue 10000000
maxvalue 99999999
start with 10000100
increment by 1
cache 20;

create sequence SEQ_COM_FILE
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_MENU_PERMISSION
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_COM_MENU
minvalue 1000000
maxvalue 9999999
start with 7000100
increment by 1
cache 20;

create sequence SEQ_USC_NOTICE
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_HOSPITAL
minvalue 1001
maxvalue 9999
start with 1001
cache 20;

create sequence SEQ_USC_ORG
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_USC_MANUFACTURE
minvalue 100000
maxvalue 999999
start with 100100
increment by 1
cache 20;

create sequence SEQ_USC_DOC_OP_LOG
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_DOC_TYPE
minvalue 1000000
maxvalue 9999999
start with 1000001
increment by 1;

create sequence seq_BUSINESS_LOG
start with 1000
increment by 1;

drop sequence SEQ_USC_VENDOR_CATEGORY;
drop sequence SEQ_USC_UNITS;
drop sequence SEQ_USC_MATERIAL;
drop sequence SEQ_USC_MATERIAL_NAME;
drop sequence SEQ_USC_MATERIAL_UNITS_MAPPING;
drop sequence SEQ_USC_WAREHOUSE;
drop sequence SEQ_USC_STORAGE;
drop sequence SEQ_USC_WH_MATERIAL_MAPPING;
drop sequence SEQ_USC_LOCATION_MATERIAL;
drop sequence SEQ_USC_LOCATION;

drop sequence SEQ_USC_VENDOR_CERTIFICATE;
drop sequence SEQ_USC_VENDOR_CERT_APPROVE;
drop sequence SEQ_USC_VENDOR_CERT_HISTORY;
drop sequence SEQ_USC_VENDOR_FINANCE;
drop sequence SEQ_USC_VENDOR_FINANCE_APPROVE;
drop sequence SEQ_USC_VENDOR_FINANCE_HISTORY;
drop sequence SEQ_USC_VENDOR;
drop sequence SEQ_USC_VENDOR_APPROVE;
drop sequence SEQ_USC_VENDOR_HISTORY;
drop sequence SEQ_USC_AUTHORIZATION;
drop sequence SEQ_USC_APPROVE_MASTER;
drop sequence SEQ_USC_APPROVE_MANAGEMENT;
drop sequence SEQ_USC_APPROVE_DETAIL;
drop sequence SEQ_USC_VENDOR_MATERIAL;
drop sequence SEQ_USC_VENDOR_MATERIAL_APPLY;
drop sequence SEQ_USC_VENDOR_MATERIAL_HIS;
drop sequence SEQ_USC_MY_MENU;
drop sequence SEQ_IF_USER;
drop sequence SEQ_IF_ORG;
drop sequence SEQ_USC_BILLS_MST;
drop sequence SEQ_USC_BILLS_DTL;
drop sequence SEQ_USC_PICKING;
drop sequence SEQ_USC_VENDOR_APPROVE_RECODE;
drop sequence SEQ_MATERIAL_APPROVE_RECORD;
drop sequence SEQ_USC_CHECK_MASTER;
drop sequence SEQ_USC_CHECK_DETAIL;
drop sequence SEQ_USC_UNPACK_MST;
drop sequence SEQ_USC_UNPACK_DTL;
drop sequence SEQ_USC_APPROVE_LINE_MST;
drop sequence SEQ_USC_APPROVE_LINE_DTL;

CREATE sequence SEQ_USC_VENDOR_CATEGORY
minvalue 100000
maxvalue 999999
start with 100060
increment by 1
cache 20;

create sequence SEQ_USC_WAREHOUSE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_STORAGE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_USC_LOCATION_MATERIAL
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_USC_LOCATION
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_WH_MATERIAL_MAPPING
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_MATERIAL_UNITS_MAPPING
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

CREATE sequence SEQ_USC_MATERIAL
minvalue 1
maxvalue 99999999999
start with 1
increment by 1
cache 20;

CREATE sequence SEQ_USC_MATERIAL_NAME
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_UNITS
minvalue 1000000
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_CERTIFICATE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_CERT_APPROVE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
create sequence SEQ_USC_VENDOR_CERT_HISTORY
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_FINANCE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_FINANCE_APPROVE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_FINANCE_HISTORY
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_HISTORY
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_APPROVE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
create sequence SEQ_USC_VENDOR
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
create sequence SEQ_USC_AUTHORIZATION
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
create sequence SEQ_USC_APPROVE_MASTER
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
create sequence SEQ_USC_APPROVE_MANAGEMENT
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_APPROVE_DETAIL
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

CREATE SEQUENCE SEQ_USC_VENDOR_MATERIAL
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

CREATE SEQUENCE SEQ_USC_VENDOR_MATERIAL_APPLY
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

CREATE SEQUENCE SEQ_USC_VENDOR_MATERIAL_HIS
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_USC_MY_MENU
minvalue 10000000
maxvalue 9999999999
start with 10000000
increment by 1
cache 20;

create sequence SEQ_IF_ORG
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;  

create sequence SEQ_IF_USER
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;  

create sequence SEQ_USC_BILLS_MST
minvalue 1
maxvalue 9999999999
start with 1020
increment by 1
cache 20;

create sequence SEQ_USC_BILLS_DTL
minvalue 1
maxvalue 9999999999
start with 1020
increment by 1
cache 20;

create sequence SEQ_USC_PICKING
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

create sequence SEQ_USC_VENDOR_APPROVE_RECODE
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;

create sequence SEQ_MATERIAL_APPROVE_RECORD
minvalue 1000000000
maxvalue 9999999900
start with 1000000000
increment by 1
cache 20;

  -- Create sequence 
create sequence SEQ_USC_CHECK_MASTER
minvalue 100099
maxvalue 999999
start with 100131
increment by 1
cache 20
cycle
order;


-- Create sequence 
create sequence SEQ_USC_CHECK_DETAIL
minvalue 100000
maxvalue 999999
start with 100139
increment by 1
cache 20
cycle
order;

-- Create sequence 
create sequence SEQ_USC_UNPACK_MST
minvalue 1000000
maxvalue 9999999
start with 1000001
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_USC_UNPACK_DTL
minvalue 1000000
maxvalue 9999999
start with 1000001
increment by 1
cache 20;


-- Create sequence 
create sequence SEQ_USC_APPROVE_LINE_MST
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;


-- Create sequence 
create sequence SEQ_USC_APPROVE_LINE_DTL
minvalue 100000
maxvalue 999999
start with 100000
increment by 1
cache 20;
drop sequence SEQ_INVENTORY_RESULT_MASTER;
drop sequence IF_YYUSC_SPARES_RETURNS_DTL;
drop sequence IF_YYUSC_SPARES_RETURNS_MST;
create sequence SEQ_INVENTORY_RESULT_MASTER
minvalue 10000000
maxvalue 99999999
start with 10000240
increment by 1
cache 20;

create sequence IF_YYUSC_SPARES_RETURNS_DTL
minvalue 10000000
maxvalue 99999999
start with 10000240
increment by 1
cache 20;

create sequence IF_YYUSC_SPARES_RETURNS_MST
minvalue 10000000
maxvalue 99999999
start with 10000240
increment by 1
cache 20;





