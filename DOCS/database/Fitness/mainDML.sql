INSERT INTO GENDER (GENDER_ID, GENDER)
VALUES
  ('GEN01', '남'),
  ('GEN02', '여');

INSERT INTO MEMBER_INFORMATION (ID, NAME, PASSWORD, BIRTHDATE, PHONE_NUMBER, EMAIL_ADDRESS, ADDRESS, GENDER_ID)
VALUES
  ('user789', '태식', 'SecurePass987', '1993-04-17', '010-9999-3333', 'taesik@example.com', '서울시', 'GEN01'),
  ('sarahlee', '사라', 'Paw0rd', '1995-12-25', '010-7777-8888', 'sarahlee@example.com', '서울시', 'GEN02'),
  ('admin123', '김홍도', 'Pssw0rd123', '1990-01-01', '010-1234-5678', 'user123@gmail.com', '서울시', 'GEN01'),
  ('johndoe', '이종도', 'Password9876', '1985-03-15', '010-9876-5432', 'johndoe@example.com', '서울시', 'GEN01'),
  ('annasm', '안나', 'SecurePass456', '1992-07-22', '010-5555-1234', 'annasm@example.com', '서울시', 'GEN02'),
  ('user456', '알렉스', '1234abcd', '1988-09-10', '010-1111-2222', 'alex@example.com', '서울시', 'GEN01'),
  ('admin987', '이민정', 'M1nJng5678', '1994-08-12', '010-5555-9999', 'minjung@example.com', '서울시', 'GEN02'),
  ('davids', '다비드', 'StrongPass123', '1991-06-05', '010-2222-3333', 'david@example.com', '서울시', 'GEN01'),
  ('jisulee', '이지수', 'J1sU5678', '1996-02-28', '010-4444-5555', 'jisulee@example.com', '서울시', 'GEN02'),
  ('user654', '김성호', 'Password2022', '1987-11-09', '010-6666-7777', 'seongho@example.com', '서울시', 'GEN01');



INSERT INTO NOTICE (NOTICE_ID, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_DATE, NOTICE_VIEWS, ID)
VALUES
  ('NOTICE01', '첫번째 공지입니다.', '공지내용1', '2022-02-10', 234, 'admin123'),
  ('NOTICE02', '두번째 공지입니다.', '공지내용2', '2022-02-11', 46, 'admin987'),
  ('NOTICE03', '세번째 공지입니다.', '공지내용3', '2022-02-12', 928, 'admin123');
  
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, PHONE_NUMBER, ADDRESS, ROAD_ADDRESS)
VALUES
  ('COM01', '(주) 더랩스휘트니스 석촌고분', '02-422-4365', '서울특별시 송파구 석촌동 210 공익빌딩', '서울특별시 송파구 백제고분로 276, 공익빌딩 3층 2호 (석촌동)'),
  ('COM02', '(주) 스포니스 마곡점', '02-3662-9987', '서울특별시 강서구 마곡동 771-3 보타닉파크타워3', '서울특별시 강서구 마곡중앙6로 11, 보타닉파크타워3 B103, B105,B106호 (마곡동)'),
  ('COM03', '(주)다이나믹케어', '02-6326-0717', '서울특별시 서초구 서초동 1337 강남미래타워', '서울특별시 서초구 사임당로 174, 강남미래타워 5층 503호 (서초동)'),
  ('COM04', '(주)더 파스칼', '2057-7575', '서울특별시 서초구 양재동 275-4 트윈타워 B동(지1층)', '서울특별시 서초구 마방로10길 15 (양재동,트윈타워 B동(지1층))'),
  ('COM05', '(주)더프라자 언주', '02-511-6741', '서울특별시 강남구 논현동 235-9번지', '서울특별시 강남구 봉은사로 209, 지하1층 (논현동)'),
  ('COM06', '(주)더한 오리엔스 호텔 & 레지던스', '02-2280-8000', '서울특별시 중구 예장동 2-19번지 지하2층', '서울특별시 중구 삼일대로2길 50, 지하2층 (예장동)'),
  ('COM07', '(주)스포짐옐로우 신당역점', '02-2233-8487', '서울특별시 중구 황학동 2523번지 황학 아크로타워', '서울특별시 중구 퇴계로 447, 지하층 B142호 (황학동, 황학 아크로타워)'),
  ('COM08', '(주)신안관광 호텔리베라 체력단련장', '02-3438-4125', '서울특별시 강남구 청담동 53-7 리베라호텔', '서울특별시 강남구 영동대로 737, 리베라호텔 지하2층 (청담동)'),
  ('COM09', '(주)아이비스마트', '02-6670-9219', '서울특별시 영등포구 여의도동 45-21번지 ABL타워', '서울특별시 영등포구 의사당대로 147, ABL타워 (여의도동)'),
  ('COM10', '(주)에이블짐 교대역점', '02-2088-3036', '서울특별시 서초구 서초동 1674-4번지 하림인터내셔날빌딩', '서울특별시 서초구 서초대로 320, 하림인터내셔날빌딩 지하2층 (서초동)');  

INSERT INTO RESERVATION (RESERVATION_ID, RESERVATION_DATE, RESERVATION_TIME, NOTES, ID, COMPANY_ID)
VALUES
  ('RESER01', '2023-07-12', '10:00-11:00', '참고사항1', 'user789', 'COM01'),
  ('RESER02', '2023-07-13', '11:00-12:00', '참고사항2', 'sarahlee', 'COM02'),
  ('RESER03', '2023-07-14', '10:00-11:00', '참고사항3', 'johndoe', 'COM03'),
  ('RESER04', '2023-07-15', '13:00-14:00', '참고사항4', 'johndoe', 'COM04'),
  ('RESER05', '2023-07-16', '11:00-12:00', '참고사항5', 'annasm', 'COM05'),
  ('RESER06', '2023-07-17', '13:00-14:00', '참고사항6', 'user456', 'COM06'),
  ('RESER07', '2023-07-18', '16:00-17:00', '참고사항7', 'davids', 'COM07'),
  ('RESER08', '2023-07-19', '15:00-16:00', '참고사항8', 'davids', 'COM08'),
  ('RESER09', '2023-07-20', '13:00-14:00', '참고사항9', 'jisulee', 'COM09'),
  ('RESER10', '2023-07-21', '11:00-12:00', '참고사항10', 'user654', 'COM10');


INSERT INTO REVIEW (REVIEW_ID, REVIEW, GRADE, ID, COMPANY_ID)
VALUES
  ('REV01', '리뷰1', 4, 'user789', 'COM01'),
  ('REV02', '리뷰2', 2, 'sarahlee', 'COM02'),
  ('REV03', '리뷰3', 3, 'user789', 'COM03'),
  ('REV04', '리뷰4', 1, 'johndoe', 'COM04'),
  ('REV05', '리뷰5', 4, 'annasm', 'COM05'),
  ('REV06', '리뷰6', 2, 'user456', 'COM06'),
  ('REV07', '리뷰7', 3, 'jisulee', 'COM07'),
  ('REV08', '리뷰8', 5, 'davids', 'COM08'),
  ('REV09', '리뷰9', 2, 'jisulee', 'COM09'),
  ('REV10', '리뷰10', 1, 'user654', 'COM10');




INSERT INTO BOARD (NUMBER, ID, TITLE, CONTENTS, DATE, VIEWS, BOARD_ID)
VALUES 
(1, 'user789', '자유로운 토론의 장', '내용1', '2022-02-10', 102, 'BOARD01'),
(2, 'sarahlee', '흥미로운 이야기를 들려주세요', '내용2', '2022-02-11', 75, 'BOARD02'),
(3, 'admin123', '다양한 정보를 공유합니다', '내용3', '2022-02-12', 98, 'BOARD03'),
(4, 'johndoe', '함께 운동해요', '내용4', '2022-02-13', 62, 'BOARD04'),
(5, 'annasm', '함게 성장해요', '내용5', '2022-02-14', 153, 'BOARD05'),
(6, 'user456', '문의사항입니다', '내용6', '2022-02-15', 120, 'BOARD06'),
(7, 'admin987', '꿈과 열정을 나누는 곳이에요', '내용7', '2022-02-16', 87, 'BOARD07'),
(8, 'davids', '일상의 소소한 행복을 나눠봐요', '내용8', '2022-02-17', 105, 'BOARD08'),
(9, 'jisulee', '위치문의입니다', '내용9', '2022-02-18', 92, 'BOARD09'),
(10, 'user654', '인생을 생각하는 시간을 가져보세요', '내용10', '2022-02-19', 143, 'BOARD10');

INSERT INTO BOARD_ANSWER (ADMIN_ID, ANSWER, BOARD_ANSWER_ID, BOARD_ID)
VALUES
  ('ADMIN01', '답변1', 'ANS01', 'BOARD01'),
  ('ADMIN02', '답변2', 'ANS02', 'BOARD02'),
  ('ADMIN01', '답변3', 'ANS03', 'BOARD03'),
  ('ADMIN02', '답변4', 'ANS04', 'BOARD04'),
  ('ADMIN01', '답변5', 'ANS05', 'BOARD05'),
  ('ADMIN02', '답변6', 'ANS06', 'BOARD06'),
  ('ADMIN01', '답변7', 'ANS07', 'BOARD07'),
  ('ADMIN02', '답변8', 'ANS08', 'BOARD08'),
  ('ADMIN01', '답변9', 'ANS09', 'BOARD09'),
  ('ADMIN02', '답변10', 'ANS10', 'BOARD10');
  
insert into AUTH_NAMES 
(UNIQUE_ID,AUTH_NAME)
values
('ROLE_ADMIN','ADMIN'),
('ROLE_GUEST','GUEST')
;