SELECT * FROM db_fitness.reservation;

update reservation
set reservation_date = '2023-12-34',
    reservation_time = '12:34-56:78',
    notes = ''
where reservation_id = 'reser07'
;

delete
from reservation
where reservation_id = 'reser07';

insert into reservation (RESERVATION_ID, RESERVATION_DATE, RESERVATION_TIME, NOTES, ID, COMPANY_ID)
values
 ('RESER07', '2023-07-18', '16:00-17:00', '참고사항7', 'davids', 'COM07');
