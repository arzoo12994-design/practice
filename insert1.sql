CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
VALUES(
'Arzoo',
	'kothariya',
	'arzoo12@gmail.com',
	'1234YU','Arzoo',CURRENT_DATE,
	'Arzoo',CURRENT_DATE,
	true,false,
	'12/09/2005',
	'ahmedabad','78589393869');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Komeel',
	'padharshi',
	'komeel@gmail.com','879HH','komeel',CURRENT_DATE,
	'komeeel',CURRENT_DATE,
	true,false,
	'30/09/2006',
	'ahmedabad','7858939669',
	TRUE,FALSE,
	CURRENT_TIMESTAMP);

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Kaiyum',
	'kothariya','6T79HH',
	'kaiyum@gmail.com',
	'kaiyum',CURRENT_DATE,
	'kaiyum',CURRENT_DATE,
	true,false,
	'30/09/2010',
	'ahmedabad','7858937769');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Khushbu',
	'kothariya',
	'khushbu@gmail.com',
	'779HH','khushbu',CURRENT_DATE,
	'khushbu',CURRENT_DATE,
	true,false,
	'15/09/2006',
	'Rajkot','8858939669',
	TRUE,FALSE,
	CURRENT_TIMESTAMP);
Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Divya',
	'padhariya',
	'divya@gmail.com',
	'879HL','divya',CURRENT_DATE,
	'divya',CURRENT_DATE,
	'12/07/2006',
	TRUE,FALSE,
	'Mumbai','8958939669'
	);
Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Sophie',
	'Christian',
	'sophie@gmail.com','879HH',
	'sophie',CURRENT_DATE,
	'sophie',CURRENT_DATE,
	true,false,
	'30/11/2006',
	'Pune','7858939669');
Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Jignasha',
	'Vanara',
	'Jignasha@gmail.com',
	'879HP',
	
	'jigi',CURRENT_DATE,
	'jigi',CURRENT_DATE,
	
	TRUE,FALSE,'11/09/2006',
	'usa','7858936669');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'jahnvi','patel',
	'jan@gmail.com',
	'669HP',
	'janhvi',CURRENT_DATE,
	'janhvi',CURRENT_DATE,
	
	
	TRUE,FALSE,
	'08/09/1999',
	'surat','7858936896');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Jignasha',
	'Vanara',
	'Jignasha@gmail.com',
	'879HP',
	
	'jigi',CURRENT_DATE,
	'jigi',CURRENT_DATE,
	
	TRUE,FALSE,'11/09/2006',
	'usa','7858936669');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Shivani',
	'Patel',
	'shivani@gmail.com','879HP',
	'shivani',CURRENT_DATE,
	'shivani',CURRENT_DATE,
	'11/09/1995',
	'VAPI','7858936669');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	birth_date,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	address,
	mobile_number)
	
VALUES(
	'Aarush',
	'Patel',
	'Aarush@gmail.com',
	'UY9HP',
	'aarush',CURRENT_DATE,
	'aarush',CURRENT_DATE,
	true,false,
	'11/09/2010',
	'Baroda','7758936669');

Insert Into hc.Users(
	first_name,
	last_name,
	email,
	password,
	created_by,
	created_date,modified_by,modified_date,
	is_active,is_deleted,
	birth_date,
	address,
	mobile_number)
	
VALUES(
	'Zidan',
	'Kothariya',
	'zidan@gmail.com',
	'879HP',
	'zidan',CURRENT_DATE,
	'zidan',CURRENT_DATE,
	true,false,
	'18/09/2006',
	'Surat','7858936669');

SELECT * FROM hc.users;