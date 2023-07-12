INSERT INTO FACTORYS (COMPANY_ID, COMPANY)
VALUES ('C001', '현대자동차');

INSERT INTO CAR_INFORS (CAR_NAME, YEAR, CAR_INFOR_ID, COMPANY_ID)
VALUES ('소나타', '2020', 'CI001', 'C001');

INSERT INTO OPTION_INFORS (OPTION_INFOR_ID, OPTION_NAME)
VALUES ('OI001', '네비게이션');

INSERT INTO OPTIONS (OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES ('O001', 'CI001', 'OI001');

INSERT INTO FACTORYS (COMPANY_ID, COMPANY)
VALUES ('C002', '기아자동차');

INSERT INTO CAR_INFORS (CAR_NAME, YEAR, CAR_INFOR_ID, COMPANY_ID)
VALUES ('쏘렌토', '2021', 'CI002', 'C002');

INSERT INTO OPTION_INFORS (OPTION_INFOR_ID, OPTION_NAME)
VALUES ('OI002', '후방 카메라');

INSERT INTO OPTIONS (OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES ('O002', 'CI002', 'OI002');

INSERT INTO FACTORYS (COMPANY_ID, COMPANY)
VALUES ('C003', '르노삼성자동차');

INSERT INTO CAR_INFORS (CAR_NAME, YEAR, CAR_INFOR_ID, COMPANY_ID)
VALUES ('SM6', '2019', 'CI003', 'C003');

INSERT INTO OPTION_INFORS (OPTION_INFOR_ID, OPTION_NAME)
VALUES ('OI003', '가죽 시트');

INSERT INTO OPTIONS (OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES ('O003', 'CI003', 'OI003');

INSERT INTO FACTORYS (COMPANY_ID, COMPANY)
VALUES ('C004', 'BMW');

INSERT INTO CAR_INFORS (CAR_NAME, YEAR, CAR_INFOR_ID, COMPANY_ID)
VALUES ('3 시리즈', '2022', 'CI004', 'C004');

INSERT INTO OPTION_INFORS (OPTION_INFOR_ID, OPTION_NAME)
VALUES ('OI004', '파노라마 썬루프');

INSERT INTO OPTIONS (OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES ('O004', 'CI004', 'OI004');

INSERT INTO FACTORYS (COMPANY_ID, COMPANY)
VALUES ('C005', '토요타');

INSERT INTO CAR_INFORS (CAR_NAME, YEAR, CAR_INFOR_ID, COMPANY_ID)
VALUES ('캠리', '2020', 'CI005', 'C005');

INSERT INTO OPTION_INFORS (OPTION_INFOR_ID, OPTION_NAME)
VALUES ('OI005', '안전 패키지');

INSERT INTO OPTIONS (OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES ('O005', 'CI005', 'OI005');

delete
from COMMONS_CODE;

insert into COMMONS_CODE 
(COMMON_CODE_ID,NAME,ORDER_NUMBER,ATTRIBUTION_1,ATTRIBUTION_2,DESCRIPTION,SYSTEM_CODE_YN,USE_YN,PARENT_COMMON_CODE_ID,REGISTER_SEQ,REGISTRY_DATE,MODIFIER_SEQ,MODIFY_DATE) 
select 'CarInforSearch','CarInfor Search',1,NULL,NULL,'CarInfor Search','System_Code_Yes','Yes',NULL,'UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Car-01','YEAR',1,NULL,NULL,'Using Yes','System_Code_Yes','Yes','CarInforSearch','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Car-02','CAR_NAME',2,NULL,NULL,'Using No','System_Code_Yes','Yes','CarInforSearch','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Use_YN','Yes or No',1,NULL,NULL,'Using Yes or No','System_Code_Yes','Yes',NULL,'UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Yes','Yes',1,NULL,NULL,'Using Yes','System_Code_Yes','Yes','Use_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'No','No',2,NULL,NULL,'Using No','System_Code_Yes','Yes','Use_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'System_Code_YN','Sytem Yes or No',1,NULL,NULL,'Sytem Using Yes or No','System_Code_Yes','Yes',NULL,'UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'System_Code_Yes','Yes',1,NULL,NULL,'Sytem Using Yes','System_Code_Yes','Yes','System_Code_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'System_Code_No','No',2,NULL,NULL,'Sytem Using No','System_Code_Yes','Yes','System_Code_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Commons_Code_Yes','Yes',1,NULL,NULL,'Sytem Using Yes',NULL,'Yes','System_Code_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all 
select 'Syste_Code_No','No',2,NULL,NULL,'Sytem Using No','System_Code_Yes','Yes','System_Code_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual
select 'Syste_Code_No','No',2,NULL,NULL,'Sytem Using No','System_Code_Yes','Yes','System_Code_YN','UUID-1111-1111111',now(),'UUID-1111-1111111',now() from dual union all
;

select PARENT_COMMON_CODE_ID, COMMON_CODE_ID, NAME
from COMMONS_CODE
where PARENT_COMMON_CODE_ID = 'CarInforSearch'
;