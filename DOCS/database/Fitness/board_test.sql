SELECT * FROM db_fitness.board;

-- update-- 
UPDATE board
set TITLE = '함께하는 운동 건강한 생활'
where ID = 'johndoe';

-- delete
delete 
from board
where ID = 'johndoe';