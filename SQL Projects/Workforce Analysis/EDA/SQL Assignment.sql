-- Count employees in each department using pl/sql
set serveroutput on
declare
    emp_count integer;
    dep_name varchar(20);
begin
    for c in ( 
        select count(employee_id) as e_count, department_name as d_name
        from employees e
        join departments d
           on e.department_id = d.department_id
        group by department_name)
    loop
        emp_count := c.e_count;
        dep_name := c.d_name;
        
        DBMS_OUTPUT.PUT_LINE('The count of employees in ' ||dep_name|| ' is ' ||emp_count);
        
    end loop;
end;
/

-- Count employees in each country using pl/sql
declare
    emp_count integer;
    country_name varchar(30);
begin
    for x in ( 
        select count(employee_id) as e_count, country_name as c_name
        from employees e
        join departments d
           on e.department_id = d.department_id
        join locations l
            on l.location_id = d.location_id
        join countries c
            on c.country_id = l.country_id
        group by country_name)
    loop
        emp_count := x.e_count;
        country_name := x.c_name;
        
        DBMS_OUTPUT.PUT_LINE('The count of employees in ' ||country_name|| ' is ' ||emp_count);
        
    end loop;
end;
/

-- Compare salaries by geographical location(region) using function.

create or replace type emp_salary_object as object(
    region varchar(20),
    max_salary number (8,2),
    min_salary number (8,2),
    avg_salary number (8,2) 
);
/
create type salary_analysis as table of emp_salary_object;
/
create or replace function emp_salary_analysis
return salary_analysis
is 
    --declaration of variables
    compare_salary salary_analysis := salary_analysis();
begin
    select emp_salary_object(region_name, MAX(salary), MIN(salary), AVG(salary)) bulk collect
    into compare_salary
    from employees e
    join departments d
        on e.department_id = d.department_id
    join locations l
        on l.location_id = d.location_id
    join countries c
        on c.country_id = l.country_id
    join regions r
        on c.region_id = r.region_id
    group by region_name;
    
    return compare_salary;
end;
/
    
select * from table(emp_salary_analysis);
    
--  create a view for total salary by department 
create or replace view total_salary as
select department_name , sum(salary)as total_salary
from employees e
join departments d
    on e.department_id = d.department_id
group by department_name
having sum(salary) >40000
;

select * from total_salary;
 
-- employee promotion procedue. IF employee_id has title of 'Marketing Representative','Human Resources Representative','Public Relations Representative',

--'Sales Representative' and has been with company for atleast 2 years, eligible for promotion using stored procedure.

create or replace procedure emp_promotion_eligiblity(i_emp_id in number) 
is 
   emp_job_title varchar(50);
   emp_hire_date date;
   today_date date := sysdate;
   eligible_for_promotion varchar(20);
   emp_id number;
begin
    select employee_id,job_title,hire_date
    into emp_id,emp_job_title,emp_hire_date
    from employees e
    join jobs j
        on e.job_id = j.job_id
    where e.employee_id = i_emp_id;
    
    if (emp_job_title = 'Marketing Representative' or
        emp_job_title = 'Human Resources Representative' or
        emp_job_title = 'Public Relations Representative' or
        emp_job_title = 'Sales Representative') and 
        (today_date - emp_hire_date > 730 )
    then
        eligible_for_promotion:= 'Eligible';
    else 
        eligible_for_promotion:= 'Not Eligible';
    end if;
    
    DBMS_OUTPUT.PUT_LINE(emp_id||' You are '||eligible_for_promotion||' for Promotion.');
end;
/


exec emp_promotion_eligiblity(192);


-- triggers 
-- creating a table to keep track of users who have updated, inserted and deleted values from employees table

create table emp_audit(
    new_first_name varchar(20),
    old_first_name varchar (20),
    new_last_name varchar(20),
    old_last_name varchar (20),
    new_email varchar(50),
    old_email varchar (50),
    new_phone_number varchar(20),
    old_phone_number varchar (20),
    new_job_id varchar(20),
    old_job_id varchar (20),
    new_salary number(8,0),
    old_salary number(8,0),
    new_COMMISSION_PCT number(2,2),
    old_COMMISSION_PCT number(2,2),
    new_manager_id number(6,0),
    old_manager_id number(6,0),
    modified_by varchar(30),
    event_timestamp timestamp default current_timestamp,
    operation varchar(20)
    );

select * from emp_audit;

create or replace trigger TRG4
before update or insert or delete ON employees
for each row
enable
declare
    v_user varchar(20);
    v_timestamp timestamp;
begin
    v_user := user;
    v_timestamp:= current_timestamp;
    
    if inserting then
        insert into emp_audit(new_first_name, old_first_name,new_last_name,old_last_name,new_email,old_email,new_phone_number,
                                old_phone_number,new_job_id,old_job_id,new_salary,old_salary,new_COMMISSION_PCT,
                                old_COMMISSION_PCT,new_manager_id,old_manager_id,modified_by,event_timestamp,operation)
        values (:new.first_name,null,:new.last_name,null,:new.email,null,:new.phone_number,null,:new.job_id,null,:new.salary,
                null,:new.commission_pct,null,:new.manager_id,null,v_user,v_timestamp,'Insert');
    
    elsif updating then
        insert into emp_audit(new_first_name, old_first_name,new_last_name,old_last_name,new_email,old_email,new_phone_number,
                                old_phone_number,new_job_id,old_job_id,new_salary,old_salary,new_COMMISSION_PCT,
                                old_COMMISSION_PCT,new_manager_id,old_manager_id,modified_by,event_timestamp,operation)
        values (:new.first_name,:old.first_name,:new.last_name,:old.last_name,:new.email,:old.email,:new.phone_number,
                :old.phone_number,:new.job_id,:old.job_id,:new.salary,:old.salary,:new.commission_pct,:old.commission_pct,
                :new.manager_id,:old.manager_id,v_user,v_timestamp,'Update');
            
    elsif deleting then
        insert into emp_audit(new_first_name, old_first_name,new_last_name,old_last_name,new_email,old_email,new_phone_number,
                                old_phone_number,new_job_id,old_job_id,new_salary,old_salary,new_COMMISSION_PCT,
                                old_COMMISSION_PCT,new_manager_id,old_manager_id,modified_by,event_timestamp,operation)
        values(null,:old.first_name,null,:old.last_name,null,:old.email,null,:old.phone_number,null,:old.job_id,null,:old.salary,
                null,:old.commission_pct, null,:old.manager_id,v_user,v_timestamp,'Delete');
    end if;
    
end;
/


select  * from employees;

update employees set first_name = 'Emily' , salary = 34400 where last_name = 'Hunold';

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,
                        department_id) 
            values (300,'Filza','Shehzad','FAJGDYS','650.158.1334','12-FEB-06','ST_CLERK',45000,0.23,123,50);

delete from employees where first_name = 'Filza';

select * from emp_audit;




    
