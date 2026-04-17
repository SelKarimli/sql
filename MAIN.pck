create or replace package seljan.MAIN is
  procedure get_students(p_student_id in number, p_res out sys_refcursor);
  procedure insert_student(p_first_name in varchar2,
                           p_last_name  in varchar2,
                           p_birth_date in date,
                           p_gender     in varchar2,
                           p_email      in varchar2,
                           p_phone      in varchar2,
                           p_student_id out number);
  procedure delete_student(p_id in number);
  
   procedure update_student(p_student_id in number,
                           p_first_name in varchar2,
                           p_last_name  in varchar2,
                           p_birth_date in date,
                           p_gender     in varchar2,
                           p_email      in varchar2,
                           p_phone      in varchar2);

end MAIN;
/
create or replace package body seljan.MAIN is

  procedure get_students(p_student_id in number, p_res out sys_refcursor) as
  begin
    open p_res for
      select *
        from seljan.students a
       where a.student_id = p_student_id
          or p_student_id = 0;
  end;

  procedure insert_student(p_first_name in varchar2,
                           p_last_name  in varchar2,
                           p_birth_date in date,
                           p_gender     in varchar2,
                           p_email      in varchar2,
                           p_phone      in varchar2,
                           p_student_id out number) as
  begin
    insert into seljan.students
      (first_name, last_name, birth_date, gender, email, phone)
    values
      (p_first_name, p_last_name, p_birth_date, p_gender, p_email, p_phone)
    returning student_id into p_student_id;
  end;

  procedure delete_student(p_id in number) as
  begin
    delete from seljan.students a where a.student_id = p_id;
  end;

  procedure update_student(p_student_id in number,
                           p_first_name in varchar2,
                           p_last_name  in varchar2,
                           p_birth_date in date,
                           p_gender     in varchar2,
                           p_email      in varchar2,
                           p_phone      in varchar2) as
  begin
    update seljan.students
       set first_name = NVL(p_first_name, first_name),
           last_name  = NVL(p_last_name, last_name),
           birth_date = NVL(p_birth_date, birth_date),
           gender     = NVL(p_gender, gender),
           email      = NVL(p_email, email),
           phone      = NVL(p_phone, phone),
           updated_at  = current_timestamp
     where student_id = p_student_id;
  end;
end MAIN;
/
