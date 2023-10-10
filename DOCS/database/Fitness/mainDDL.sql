
CREATE TABLE AUTH_NAMES
(
  AUTH_NAME VARCHAR(200) NOT NULL COMMENT '접근권한명',
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '접근권한명';

CREATE TABLE AUTHS
(
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  ID        VARCHAR(50)  NOT NULL COMMENT '회원ID',
  PRIMARY KEY (UNIQUE_ID, ID)
) COMMENT '권한들';

CREATE TABLE BOARD
(
  ID       VARCHAR(50)   NOT NULL COMMENT '아이디',
  NUMBER   INTEGER       NOT NULL COMMENT '번호',
  TITLE    VARCHAR(50)   NOT NULL COMMENT '제목',
  CONTENTS VARCHAR(1000) NOT NULL COMMENT '내용',
  DATE     VARCHAR(50)   NOT NULL COMMENT '날짜',
  VIEWS    INTEGER       NOT NULL COMMENT '조회수',
  BOARD_ID VARCHAR(50)   NOT NULL COMMENT '게시판ID',
  PRIMARY KEY (BOARD_ID)
) COMMENT '게시판 리스트';

CREATE TABLE BOARD_ANSWER
(
  ADMIN_ID        VARCHAR(50)   NOT NULL COMMENT '관리자ID',
  ANSWER          VARCHAR(1000) NOT NULL COMMENT '답변',
  BOARD_ANSWER_ID VARCHAR(50)   NOT NULL COMMENT '게시판답변ID',
  BOARD_ID        VARCHAR(50)   NOT NULL COMMENT '게시판ID',
  PRIMARY KEY (BOARD_ANSWER_ID)
) COMMENT '게시판답변';

CREATE TABLE COMMONS_CODE
(
  COMMON_CODE_ID        varchar(40)   NOT NULL COMMENT '공통 코드_ID',
  NAME                  varchar(1000) NOT NULL COMMENT '명칭',
  ORDER_NUMBER          decimal       NULL     COMMENT '정렬순서',
  ATTRIBUTION_1         varchar(60)   NULL     COMMENT '속성_1',
  ATTRIBUTION_2         varchar(60)   NULL     COMMENT '속성_2',
  DESCRIPTION           varchar(1000) NULL     COMMENT '코드설명',
  SYSTEM_CODE_YN        varchar(40)   NOT NULL DEFAULT 'N' COMMENT '초기 시스템 코드 여부',
  USE_YN                varchar(40)   NOT NULL COMMENT '사용 여부',
  REGISTER_SEQ          varchar(50)   NOT NULL COMMENT '등록자SEQ',
  REGISTRY_DATE         varchar(20)   NOT NULL COMMENT '등록일자',
  MODIFIER_SEQ          varchar(40)   NOT NULL COMMENT '수정자_SEQ',
  MODIFY_DATE           varchar(20)   NOT NULL COMMENT '수정일자',
  PARENT_COMMON_CODE_ID varchar(40)   NULL     COMMENT '상위_공통 코드_ID',
  PRIMARY KEY (COMMON_CODE_ID)
);

CREATE TABLE COMPANY
(
  COMPANY_ID   VARCHAR(50)  NOT NULL COMMENT '업체ID',
  COMPANY_NAME VARCHAR(50)  NOT NULL COMMENT '업체명',
  PHONE_NUMBER VARCHAR(50)  NOT NULL COMMENT '전화번호',
  ADDRESS      VARCHAR(500) NOT NULL COMMENT '주소',
  ROAD_ADDRESS VARCHAR(500) NOT NULL COMMENT '도로명주소',
  PRIMARY KEY (COMPANY_ID)
) COMMENT '업체정보';

CREATE TABLE GENDER
(
  GENDER_ID VARCHAR(50) NOT NULL COMMENT '성별ID',
  GENDER    VARCHAR(50) NOT NULL COMMENT '성별',
  PRIMARY KEY (GENDER_ID)
) COMMENT '성별';

CREATE TABLE LOCAL_HUMAN
(
  LOCAL_NAME  VARCHAR(100) NOT NULL COMMENT '지역',
  HUMAN_COUNT INTEGER       NOT NULL COMMENT '인구수'
) COMMENT '지역별인구';

CREATE TABLE MEMBER_INFORMATION
(
  NAME          VARCHAR(50)   NOT NULL COMMENT '이름',
  ID            VARCHAR(50)   NOT NULL COMMENT '회원ID',
  PASSWORD      VARCHAR(50)   NOT NULL COMMENT '비밀번호',
  BIRTHDATE     VARCHAR(50)   NOT NULL COMMENT '생년월일',
  PHONE_NUMBER  VARCHAR(50)   NOT NULL COMMENT '폰번호',
  EMAIL_ADDRESS VARCHAR(50)   NOT NULL COMMENT '이메일주소',
  ADDRESS       VARCHAR(50)   NOT NULL COMMENT '주소',
  GENDER_ID     VARCHAR(50)   NOT NULL COMMENT '성별ID',
  JOIN_DATE     VARBINARY(50) NOT NULL COMMENT '가입날짜',
  PRIMARY KEY (ID)
) COMMENT '회원정보';

CREATE TABLE NOTICE
(
  NOTICE_ID       VARCHAR(50)   NOT NULL COMMENT '공지사항ID',
  NOTICE_TITLE    VARCHAR(50)   NOT NULL COMMENT '공지제목',
  NOTICE_CONTENTS VARCHAR(1000) NOT NULL COMMENT '공지내용',
  NOTICE_DATE     VARCHAR(50)   NOT NULL COMMENT '공지날짜',
  NOTICE_VIEWS    INTEGER       NOT NULL COMMENT '공지조회수',
  ID              VARCHAR(50)   NOT NULL COMMENT '회원ID',
  PRIMARY KEY (NOTICE_ID)
) COMMENT '공지사항';

CREATE TABLE RESERVATION
(
  RESERVATION_ID   VARCHAR(50) NOT NULL COMMENT '예약ID',
  RESERVATION_DATE VARCHAR(50) NOT NULL COMMENT '예약날짜',
  RESERVATION_TIME VARCHAR(50) NOT NULL COMMENT '예약시간',
  NOTES            VARCHAR(50) NOT NULL COMMENT '참고사항',
  ID               VARCHAR(50) NOT NULL COMMENT '회원ID',
  COMPANY_ID       VARCHAR(50) NOT NULL COMMENT '업체ID',
  PRIMARY KEY (RESERVATION_ID)
) COMMENT '예약';

CREATE TABLE REVIEW
(
  REVIEW_ID  VARCHAR(50)   NOT NULL COMMENT '후기ID',
  REVIEW     VARCHAR(1000) NOT NULL COMMENT '후기',
  GRADE      INTEGER       NOT NULL COMMENT '평점',
  ID         VARCHAR(50)   NOT NULL COMMENT '회원ID',
  COMPANY_ID VARCHAR(50)   NOT NULL COMMENT '업체ID',
  PRIMARY KEY (REVIEW_ID)
) COMMENT '후기';

ALTER TABLE BOARD
  ADD CONSTRAINT FK_MEMBER_INFORMATION_TO_BOARD
    FOREIGN KEY (ID)
    REFERENCES MEMBER_INFORMATION (ID);

ALTER TABLE MEMBER_INFORMATION
  ADD CONSTRAINT FK_GENDER_TO_MEMBER_INFORMATION
    FOREIGN KEY (GENDER_ID)
    REFERENCES GENDER (GENDER_ID);

ALTER TABLE NOTICE
  ADD CONSTRAINT FK_MEMBER_INFORMATION_TO_NOTICE
    FOREIGN KEY (ID)
    REFERENCES MEMBER_INFORMATION (ID);

ALTER TABLE RESERVATION
  ADD CONSTRAINT FK_MEMBER_INFORMATION_TO_RESERVATION
    FOREIGN KEY (ID)
    REFERENCES MEMBER_INFORMATION (ID);

ALTER TABLE RESERVATION
  ADD CONSTRAINT FK_COMPANY_TO_RESERVATION
    FOREIGN KEY (COMPANY_ID)
    REFERENCES COMPANY (COMPANY_ID);

ALTER TABLE REVIEW
  ADD CONSTRAINT FK_MEMBER_INFORMATION_TO_REVIEW
    FOREIGN KEY (ID)
    REFERENCES MEMBER_INFORMATION (ID);

ALTER TABLE REVIEW
  ADD CONSTRAINT FK_COMPANY_TO_REVIEW
    FOREIGN KEY (COMPANY_ID)
    REFERENCES COMPANY (COMPANY_ID);

ALTER TABLE COMMONS_CODE
  ADD CONSTRAINT FK_COMMONS_CODE_TO_COMMONS_CODE
    FOREIGN KEY (PARENT_COMMON_CODE_ID)
    REFERENCES COMMONS_CODE (COMMON_CODE_ID);

ALTER TABLE BOARD_ANSWER
  ADD CONSTRAINT FK_BOARD_TO_BOARD_ANSWER
    FOREIGN KEY (BOARD_ID)
    REFERENCES BOARD (BOARD_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_AUTH_NAMES_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID)
    REFERENCES AUTH_NAMES (UNIQUE_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_MEMBER_INFORMATION_TO_AUTHS
    FOREIGN KEY (ID)
    REFERENCES MEMBER_INFORMATION (ID);
