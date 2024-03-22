CREATE USER Proyecto 
  IDENTIFIED BY “12345”
  DEFAULT TABLESPACE tbs_perm_01
  TEMPORARY TABLESPACE tbs_temp_01
  QUOTA 20M on tbs_perm_01;
GRANT create session TO proyecto;
GRANT create table TO proyecto;
GRANT create view TO proyecto;
GRANT create any trigger TO proyecto;
GRANT create any procedure TO proyecto;
GRANT create sequence TO proyecto;
GRANT create synonym TO proyecto;