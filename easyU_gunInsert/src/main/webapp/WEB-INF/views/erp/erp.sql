create table code_skill(
	skill_code	number(3),
	skill_name	varchar2(20)	unique not null,
	primary key(skill_code)
);
create sequence code_skill_seq start with 1 increment by 1;
drop sequence code_skill_seq
drop table code_skill;
select * from CODE_SKILL

create table code_religion(
	religion_code	number(3),
	religion_name	varchar2(20)	unique not null,
	primary key(religion_code)
);
create sequence code_religion_seq start with 1 increment by 1;
drop table code_religion;
drop sequence code_religion_seq
select * from code_religion

create table code_school(
	school_code		number(3),
	school_name		varchar2(20) 	unique not null,
	primary key(school_code)
);
create sequence code_school_seq start with 1 increment by 1;
select * from code_school
drop sequence code_school_seq
drop table code_school

create table staff(
	staff_no	number(3),
	staff_name	varchar2(14) not null,
	jumin_no	char(14)	unique not null,
	school_code	number(3)	not null,
	religion_code	number(3)	not null,
	graduate_day	char(10) not null,
	foreign key(religion_code) references code_religion(religion_code),
	foreign key(school_code) references code_school(school_code),

	primary key(staff_no)
);
create sequence staff_seq start with 1 increment by 1;
drop table staff;
drop sequence staff_seq
select * from staff

create table staff_skill(
 	staff_skill_no	number(3),
 	staff_no		number(3) not null,
 	skill_code		number(3) not null,
 	primary key(staff_skill_no),
 	foreign key(staff_no) references staff(staff_no),
 	foreign key(skill_code) references code_skill(skill_code)
  );
create sequence staff_skill_seq start with 1 increment by 1;
drop sequence staff_skill_seq
drop table staff_skill;
select * from staff_skill

select * from keyword_skill

insert into code_skill values(code_skill_seq.nextval, 'Java');
insert into code_skill values(code_skill_seq.nextval, 'JSP');
insert into code_skill values(code_skill_seq.nextval, 'ASP');
insert into code_skill values(code_skill_seq.nextval, 'PHP');
insert into code_skill values(code_skill_seq.nextval, 'Delphi');

insert into code_religion values(code_religion_seq.nextval, '기독교');
insert into code_religion values(code_religion_seq.nextval, '천주교');
insert into code_religion values(code_religion_seq.nextval, '불교');
insert into code_religion values(code_religion_seq.nextval, '이슬람');
insert into code_religion values(code_religion_seq.nextval, '무교');

insert into code_school values(code_school_seq.nextval, '고졸');
insert into code_school values(code_school_seq.nextval, '전문대졸');
insert into code_school values(code_school_seq.nextval, '일반대졸');

select * from keyword_skill
insert into keyword_skill values(keyword_skill_seq.nextval, 63, 'oracle');
create sequence keyword_seq start with 1 increment by 1;

delete from staff where staff_no=35

SELECT *
		FROM staff s 
		inner join code_religion r on s.religion_code=r.religion_code 
		
		and substr(s.jumin_no,7,1) = 2
	
		SELECT *
		FROM staff s
		inner join staff_skill k on s.staff_no=k.staff_no 
		WHERE s.staff_no=64
		s
		select * from staff
		
	SELECT *
		FROM staff s 
		inner join code_religion r on s.religion_code=r.religion_code 
		where rownum between 1 and 5
		
		
		select *
		from staff s
		inner join code_religion r on s.religion_code=r.religion_code 
		where rownum between 5 and 10
		
		select * 
		from (
			select a.*, rownum as rnum
			from (
				select *
					from staff s
						inner join code_religion r on s.religion_code = r.religion_code
						)a
			where rownum <= 5)
		where rnum >= 1;
		
		
				select * 
		from (
			select a.*, ROWNUM as RNUM
			from (
				select *
					from staff s
						inner join code_religion r on s.religion_code = r.religion_code
						)a
			where ROWNUM <![CDATA[<=]]> #{endRow})
		where RNUM <![CDATA[>=]]> #{startRow};
		
		
	
		
		
		
		
		