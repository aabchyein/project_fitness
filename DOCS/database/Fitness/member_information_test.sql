SELECT * FROM db_fitness.member_information;

-- update
update member_information
set EMAIL_ADDRESS = 'user254@gmail.com',
	PHONE_NUMBER = '010-2587-3895'
where ID = 'davids';