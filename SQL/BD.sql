CREATE TABLESPACE tbs_perm_01 DATAFILE 'tbs_perm_01.dbf' SIZE 100M;
CREATE TEMPORARY TABLESPACE tbs_temp_01 TEMPFILE 'tbs_temp_01.dbf' SIZE 50M;
CREATE USER proyecto 
  IDENTIFIED BY "12345"
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

--Crear Tablas
Create  Table Rol (
    Id_Rol VARCHAR2(50) PRIMARY KEY,
    DescripcionRol VARCHAR2(50)
);

CREATE TABLE Usuario (
    Usuario VARCHAR2(50) PRIMARY KEY,
    Contraseña VARCHAR2(50),
    Apellido1User VARCHAR2(50),
    Apellido2User VARCHAR2(50),
    Id_Rol VARCHAR2(50) ,
    FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
);

CREATE TABLE Pacientes (
    Id_Paciente VARCHAR2(50) PRIMARY KEY,
    NombrePaciente VARCHAR2(50),
    Apellido1Paciente VARCHAR2(50),
    Apellido2Paciente VARCHAR2(50)
);

CREATE TABLE DatosClinicos (
    Id_DatosClinicos VARCHAR2(50) PRIMARY KEY,
    DescripcionDato VARCHAR2(50),
    Id_Paciente VARCHAR2(50),
    FOREIGN KEY (Id_Paciente) REFERENCES PAcientes(Id_Paciente)
);

CREATE TABLE Especialidades (
    Id_Especialidad VARCHAR2(50) PRIMARY KEY,
    DescripcionEspecialidad VARCHAR2(50)
);

CREATE TABLE Doctores (
    Id_Doctores VARCHAR2(50) PRIMARY KEY,
    NombreDoctor VARCHAR2(50),
    Apellido1Doctor VARCHAR2(50),
    Apellido2Doctor VARCHAR2(50),
    Id_Especialidad VARCHAR2 (50),
    FOREIGN KEY (Id_Especialidad) REFERENCES Especialidades(Id_Especialidad)
);


CREATE TABLE Citas (
    Id_Citas VARCHAR2(50) PRIMARY KEY,
    Fecha VARCHAR2(50),
    Hora VARCHAR2(50),
    Estado VARCHAR2(50),
    Id_Especialidad VARCHAR2 (50),
    Id_Paciente VARCHAR2 (50),
    Id_Doctores VARCHAR2 (50),
    FOREIGN KEY (Id_Especialidad) REFERENCES Especialidades(Id_Especialidad),
    FOREIGN KEY (Id_Paciente) REFERENCES Pacientes(Id_Paciente),
    FOREIGN KEY (Id_Doctores) REFERENCES Doctores(Id_Doctores)
);



--TRIGGERS de LOG 

CREATE TABLE LogCambios (
    Id_Log NUMBER GENERATED ALWAYS AS IDENTITY,
    TablaAfectada VARCHAR2(50),
    Id_Registro VARCHAR2(50),
    Accion VARCHAR2(10),
    FechaHora TIMESTAMP,
    Usuario VARCHAR2(50)
);
-- Triggers

--trigger usuario 
CREATE OR REPLACE TRIGGER trg_log_cambios_Usuario
AFTER INSERT OR UPDATE OR DELETE ON Usuario
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Usuario', COALESCE(:NEW.Usuario, :OLD.Usuario), v_action, SYSTIMESTAMP, USER);
END;
/
--trigger Rol

CREATE OR REPLACE TRIGGER trg_log_cambios_Rol
AFTER INSERT OR UPDATE OR DELETE ON Rol
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Rol', COALESCE(:NEW.DescripcionRol, :OLD.DescripcionRol), v_action, SYSTIMESTAMP, USER);
END;
/

--trigger Pacientes

CREATE OR REPLACE TRIGGER trg_log_cambios_Pacientes
AFTER INSERT OR UPDATE OR DELETE ON Pacientes
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Pacientes', COALESCE(:NEW.Id_Paciente, :OLD.Id_Paciente), v_action, SYSTIMESTAMP, USER);
END;
/

--trigger DatosClinicos

CREATE OR REPLACE TRIGGER trg_log_cambios_DatosClinicos
AFTER INSERT OR UPDATE OR DELETE ON DatosClinicos
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('DatosClinicos', COALESCE(:NEW.Id_DatosClinicos, :OLD.Id_DatosClinicos), v_action, SYSTIMESTAMP, USER);
END;
/

--trigger DatosClinicos

CREATE OR REPLACE TRIGGER trg_log_cambios_DatosClinicos
AFTER INSERT OR UPDATE OR DELETE ON DatosClinicos
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('DatosClinicos', COALESCE(:NEW.Id_DatosClinicos, :OLD.Id_DatosClinicos), v_action, SYSTIMESTAMP, USER);
END;
/

--trigger Especialidades

CREATE OR REPLACE TRIGGER trg_log_cambios_Especialidades
AFTER INSERT OR UPDATE OR DELETE ON Especialidades
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Especialidades', COALESCE(:NEW.Id_Especialidad, :OLD.Id_Especialidad), v_action, SYSTIMESTAMP, USER);
END;
/

--trigger Doctores

CREATE OR REPLACE TRIGGER trg_log_cambios_Doctores
AFTER INSERT OR UPDATE OR DELETE ON Doctores
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Doctores', COALESCE(:NEW.Id_Doctores, :OLD.Id_Doctores), v_action, SYSTIMESTAMP, USER);
END;
/




--trigger Citas

CREATE OR REPLACE TRIGGER trg_log_cambios_Citas
AFTER INSERT OR UPDATE OR DELETE ON Citas
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, UsuarioORCL)
    VALUES ('Citas', COALESCE(:NEW.Id_Citas, :OLD.Id_Citas), v_action, SYSTIMESTAMP, USER);
END;
/

-- Funciones

-- Función para eliminar un doctor de la base de datos
CREATE OR REPLACE FUNCTION EliminarDoctor(
    Id_Doctor IN VARCHAR2
) RETURN VARCHAR2
AS
BEGIN
    DELETE FROM Doctores WHERE Id_Doctores = Id_Doctor;
    RETURN 'Doctor eliminado exitosamente';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al eliminar el doctor';
END;
/

-- Función para cancelar una cita en la base de datos
CREATE OR REPLACE FUNCTION CancelarCita(
    Id_Cita IN VARCHAR2
) RETURN VARCHAR2
AS
BEGIN
    UPDATE Citas SET Estado = 'Cancelada' WHERE Id_Citas = Id_Cita;
    RETURN 'Cita cancelada exitosamente';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al cancelar la cita';
END;
/

-- Función para buscar un paciente por su nombre
CREATE OR REPLACE FUNCTION BuscarPacientePorNombre(
    Nombre IN VARCHAR2
) RETURN SYS_REFCURSOR
AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * FROM Pacientes WHERE NombrePaciente = Nombre;
    RETURN v_cursor;
END;
/

-- Función para listar todas las citas de un paciente
CREATE OR REPLACE FUNCTION ListarCitasPorPaciente(
    Id_Paciente IN VARCHAR2
) RETURN SYS_REFCURSOR
AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * FROM Citas WHERE Id_Paciente = Id_Paciente;
    RETURN v_cursor;
END;
/

-- Función para registrar doctor

CREATE OR REPLACE PROCEDURE RegistrarDoctor(
    Id_Doctor IN VARCHAR2,
    NombreDoctor IN VARCHAR2,
    Apellido1Doctor IN VARCHAR2,
    Apellido2Doctor IN VARCHAR2,
    Id_Especialidad IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad)
    VALUES (Id_Doctor, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad);
END;

-- Función para actualizar información del paciente

CREATE OR REPLACE PROCEDURE ActualizarInformacionPaciente(
    Id_Paciente IN VARCHAR2,
    NuevoNombre IN VARCHAR2,
    NuevoApellido1 IN VARCHAR2,
    NuevoApellido2 IN VARCHAR2
)
AS
BEGIN
    UPDATE Pacientes
    SET NombrePaciente = NuevoNombre,
        Apellido1Paciente = NuevoApellido1,
        Apellido2Paciente = NuevoApellido2
    WHERE Id_Paciente = Id_Paciente;
END;


-- Función para registrar especialidad

CREATE OR REPLACE PROCEDURE RegistrarEspecialidad(
    Id_Especialidad IN VARCHAR2,
    DescripcionEspecialidad IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad)
    VALUES (Id_Especialidad, DescripcionEspecialidad);
END;

--Procedimientos Almacenados

--Procedimiento para obtener los datos clínicos de un paciente:
CREATE OR REPLACE PROCEDURE GetDatosClinicos(
    PacienteId IN VARCHAR2,
    DatosClinicos OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN DatosClinicos FOR
    SELECT * FROM DatosClinicos WHERE Id_Paciente = PacienteId;
END;


DECLARE
    datosCursor SYS_REFCURSOR;
BEGIN
    GetDatosClinicos('1', datosCursor); -- Aquí puedes especificar el Id_Paciente deseado
    DBMS_SQL.RETURN_RESULT(datosCursor);
END;

--Procedimiento para obtener citas por especialidad:

CREATE OR REPLACE PROCEDURE GetCitasPorEspecialidad(
    EspecialidadId IN VARCHAR2,
    Citas OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Citas FOR
    SELECT * FROM Citas WHERE Id_Especialidad = EspecialidadID;
END;

DECLARE
    datosCursor SYS_REFCURSOR;
Begin
    GetCitasPorEspecialidad('1', datosCursor); -- Aquí puedes especificar el Id_Paciente deseado
    DBMS_SQL.RETURN_RESULT(datosCursor);
END;

--Procedimiento para registrar un paciente

CREATE OR REPLACE PROCEDURE RegistrarPaciente(
    Id_Paciente IN VARCHAR2,
    NombrePaciente IN VARCHAR2,
    Apellido1Paciente IN VARCHAR2,
    Apellido2Paciente IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente)
    VALUES (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente);
END; 

--Procedimiento para obtener pacientes con datos clínicos

CREATE OR REPLACE PROCEDURE ObtenerPacientesConDatosClinicos AS
  CURSOR c_pacientes IS
    SELECT p.Id_Paciente, p.NombrePaciente, p.Apellido1Paciente, p.Apellido2Paciente,
           dc.DescripcionDato
    FROM Pacientes p
    LEFT JOIN DatosClinicos dc ON p.Id_Paciente = dc.Id_Paciente;

  r_paciente c_pacientes%ROWTYPE;
BEGIN
  OPEN c_pacientes;
  LOOP
    FETCH c_pacientes INTO r_paciente;
    EXIT WHEN c_pacientes%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || r_paciente.Id_Paciente ||
                         ' Nombre: ' || r_paciente.NombrePaciente ||
                         ' Apellido: ' || r_paciente.Apellido1Paciente ||
                         ' Dato Clínico: ' || r_paciente.DescripcionDato);
  END LOOP;
  CLOSE c_pacientes;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: no se obtuvieron DatosClinicos ' || SQLERRM);
END;
/

--Procedimiento para obtener citas pendientes

CREATE OR REPLACE PROCEDURE ObtenerCitasPendientes AS
  CURSOR c_citas IS
    SELECT c.Id_Citas, c.Fecha, c.Hora, c.Estado, p.NombrePaciente, d.NombreDoctor
    FROM Citas c
    JOIN Pacientes p ON c.Id_Paciente = p.Id_Paciente
    JOIN Doctores d ON c.Id_Doctores = d.Id_Doctores
    WHERE c.Estado = 'Pendiente';

  r_cita c_citas%ROWTYPE;
BEGIN
  OPEN c_citas;
  LOOP
    FETCH c_citas INTO r_cita;
    EXIT WHEN c_citas%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Cita ID: ' || r_cita.Id_Citas ||
                         ' Fecha: ' || r_cita.Fecha ||
                         ' Hora: ' || r_cita.Hora ||
                         ' Estado: ' || r_cita.Estado ||
                         ' Paciente: ' || r_cita.NombrePaciente ||
                         ' Doctor: ' || r_cita.NombreDoctor);
  END LOOP;
  CLOSE c_citas;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: no se obtuvieron Citas pendientes ' || SQLERRM);
END;
/

-- Cursores

--Cursor para obtener la lista de pacientes con sus datos clínicos:

CREATE OR REPLACE PROCEDURE ObtenerPacientesConDatosClinicos AS
  CURSOR c_pacientes IS
    SELECT p.Id_Paciente, p.NombrePaciente, p.Apellido1Paciente, p.Apellido2Paciente,
           dc.DescripcionDato
    FROM Pacientes p
    LEFT JOIN DatosClinicos dc ON p.Id_Paciente = dc.Id_Paciente;

  r_paciente c_pacientes%ROWTYPE;
BEGIN
  OPEN c_pacientes;
  LOOP
    FETCH c_pacientes INTO r_paciente;
    EXIT WHEN c_pacientes%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || r_paciente.Id_Paciente ||
                         ' Nombre: ' || r_paciente.NombrePaciente ||
                         ' Apellido: ' || r_paciente.Apellido1Paciente ||
                         ' Dato Clínico: ' || r_paciente.DescripcionDato);
  END LOOP;
  CLOSE c_pacientes;
END;
/

--Este procedimiento almacenado crea un cursor que une la tabla de pacientes con la de datos clínicos, devolviendo los datos de los pacientes y sus respectivos datos clínicos asociados.

--Cursor para obtener la lista de citas pendientes:

CREATE OR REPLACE PROCEDURE ObtenerCitasPendientes AS
  CURSOR c_citas IS
    SELECT c.Id_Citas, c.Fecha, c.Hora, c.Estado, p.NombrePaciente, d.NombreDoctor
    FROM Citas c
    JOIN Pacientes p ON c.Id_Paciente = p.Id_Paciente
    JOIN Doctores d ON c.Id_Doctores = d.Id_Doctores
    WHERE c.Estado = 'Pendiente';

  r_cita c_citas%ROWTYPE;
BEGIN
  OPEN c_citas;
  LOOP
    FETCH c_citas INTO r_cita;
    EXIT WHEN c_citas%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Cita ID: ' || r_cita.Id_Citas ||
                         ' Fecha: ' || r_cita.Fecha ||
                         ' Hora: ' || r_cita.Hora ||
                         ' Estado: ' || r_cita.Estado ||
                         ' Paciente: ' || r_cita.NombrePaciente ||
                         ' Doctor: ' || r_cita.NombreDoctor);
  END LOOP;
  CLOSE c_citas;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: no se obtuvieron Citas pendientes ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;
BEGIN
     ObtenerCitasPendientes;
END;
/
--Este procedimiento almacenado crea un cursor que devuelve las citas pendientes junto con la información del paciente y del doctor asociados a cada cita.

--Cursor para obtener la lista de doctores y sus especialidades:

CREATE OR REPLACE PROCEDURE ObtenerCitasPendientes AS
  CURSOR c_citas IS
    SELECT c.Id_Citas, c.Fecha, c.Hora, c.Estado, p.NombrePaciente, d.NombreDoctor
    FROM Citas c
    JOIN Pacientes p ON c.Id_Paciente = p.Id_Paciente
    JOIN Doctores d ON c.Id_Doctores = d.Id_Doctores
    WHERE c.Estado = 'Pendiente';

  r_cita c_citas%ROWTYPE;
BEGIN
  OPEN c_citas;
  LOOP
    FETCH c_citas INTO r_cita;
    EXIT WHEN c_citas%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Cita ID: ' || r_cita.Id_Citas ||
                         ' Fecha: ' || r_cita.Fecha ||
                         ' Hora: ' || r_cita.Hora ||
                         ' Estado: ' || r_cita.Estado ||
                         ' Paciente: ' || r_cita.NombrePaciente ||
                         ' Doctor: ' || r_cita.NombreDoctor);
  END LOOP;
  CLOSE c_citas;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: no se obtuvieron Citas pendientes ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;
BEGIN
     ObtenerCitasPendientes;
END;
/


---------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE ObtenerDoctoresConEspecialidades AS
  CURSOR c_doctores IS
    SELECT d.Id_Doctores, d.NombreDoctor, d.Apellido1Doctor, d.Apellido2Doctor, e.DescripcionEspecialidad
    FROM Doctores d
    JOIN Especialidades e ON d.Id_Especialidad = e.Id_Especialidad;

  r_doctor c_doctores%ROWTYPE;
BEGIN
  OPEN c_doctores;
  LOOP
    FETCH c_doctores INTO r_doctor;
    EXIT WHEN c_doctores%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Doctor: ' || r_doctor.NombreDoctor || ' ' || r_doctor.Apellido1Doctor ||
                         ' Especialidad: ' || r_doctor.DescripcionEspecialidad);
  END LOOP;
  CLOSE c_doctores;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: No se obtuvieron los doctores o las especialidades ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;
BEGIN
     ObtenerDoctoresConEspecialidades ;
END;
/


-- Secuencias

-- Crear una secuencia para IDs de roles
CREATE SEQUENCE seq_roles
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- Crear una secuencia para IDs de usuarios
CREATE SEQUENCE seq_usuarios
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- Crear una secuencia para IDs de pacientes
CREATE SEQUENCE seq_pacientes
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- Crear una secuencia para IDs de doctores
CREATE SEQUENCE seq_doctores
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- Crear una secuencia para IDs de citas
CREATE SEQUENCE seq_citas
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- Paquetes y expresiones regulares

-- Paquete para validación de datos clínicos
CREATE OR REPLACE PACKAGE DataValidationPackage AS
    FUNCTION IsValidBloodType(bloodType IN VARCHAR2) RETURN BOOLEAN;
END DataValidationPackage;
/

CREATE OR REPLACE PACKAGE BODY DataValidationPackage AS
    -- Función para validar tipo de sangre usando expresiones regulares
    FUNCTION IsValidBloodType(bloodType IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        -- Expresión regular para validar tipo de sangre (A, B, AB, O)
        RETURN REGEXP_LIKE(bloodType, '^(A|B|AB|O)[\+-]$');
    END IsValidBloodType;
END DataValidationPackage;
/

-- Ejemplo de uso 
DECLARE
    bloodType VARCHAR2(5) := 'A+';
    isValid BOOLEAN;
BEGIN
    isValid := DataValidationPackage.IsValidBloodType(bloodType);
    IF isValid THEN
        DBMS_OUTPUT.PUT_LINE('Tipo de sangre válido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tipo de sangre no válido.');
    END IF;
END;
/

-- Paquete para validación de datos de contacto
CREATE OR REPLACE PACKAGE ContactValidationPackage AS
    FUNCTION IsValidPhoneNumber(phoneNumber IN VARCHAR2) RETURN BOOLEAN;
    FUNCTION IsValidEmail(email IN VARCHAR2) RETURN BOOLEAN;
END ContactValidationPackage;
/

CREATE OR REPLACE PACKAGE BODY ContactValidationPackage AS
    -- Función para validar números de teléfono usando expresiones regulares
    FUNCTION IsValidPhoneNumber(phoneNumber IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        -- Expresión regular para validar números de teléfono
        RETURN REGEXP_LIKE(phoneNumber, '^[0-9]{3}-[0-9]{3}-[0-9]{4}$');
    END IsValidPhoneNumber;

    -- Función para validar direcciones de correo electrónico usando expresiones regulares
    FUNCTION IsValidEmail(email IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        -- Expresión regular para validar direcciones de correo electrónico
        RETURN REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    END IsValidEmail;
END ContactValidationPackage;
/

-- Ejemplo de uso 

DECLARE
    phoneNumber VARCHAR2(20) := '123-456-7890';
    email VARCHAR2(100) := 'ejemplo@correo.com';
BEGIN

    IF ContactValidationPackage.IsValidPhoneNumber(phoneNumber) THEN
        DBMS_OUTPUT.PUT_LINE('El número de teléfono es válido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El número de teléfono no es válido.');
    END IF;

    IF ContactValidationPackage.IsValidEmail(email) THEN
        DBMS_OUTPUT.PUT_LINE('La dirección de correo electrónico es válida.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La dirección de correo electrónico no es válida.');
    END IF;
END;
/



-- INSERTS

-- Insertar roles en la tabla Rol utilizando la secuencia
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES (seq_roles.NEXTVAL, 'Administrador');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES (seq_roles.NEXTVAL, 'Doctor');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES (seq_roles.NEXTVAL, 'Empleado');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES (seq_roles.NEXTVAL, 'Paciente');

-- Inserts para la tabla Usuario utilizando la secuencia
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('johnsmith', 'pass1', 'Johnson', 'Brown', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('marydoe', 'pass2', 'Martinez', 'Garcia', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('davidjones', 'pass3', 'Miller', 'Martinez', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('sarahbrown', 'pass4', 'Anderson', 'Johnson', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('samwilson', 'pass5', 'Davis', 'Lopez', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('emilyrodriguez', 'pass6', 'Garcia', 'Rodriguez', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('michaelclark', 'pass7', 'Hernandez', 'Smith', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('laurasmith', 'pass8', 'Brown', 'Gonzalez', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('alexjohnson', 'pass9', 'Johnson', 'Taylor', seq_roles.NEXTVAL);
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('rachelwilliams', 'pass10', 'Williams', 'Jones', seq_roles.NEXTVAL);

-- Inserts para la tabla Pacientes utilizando la secuencia
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Juan', 'Garcia', 'Martinez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Maria', 'Rodriguez', 'Lopez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Carlos', 'Hernandez', 'Gonzalez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Laura', 'Martinez', 'Diaz');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Luis', 'Perez', 'Sanchez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Ana', 'Sanchez', 'Ramirez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'David', 'Gonzalez', 'Martin');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Paula', 'Lopez', 'Jimenez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Sergio', 'Fernandez', 'Alvarez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES (seq_pacientes.NEXTVAL, 'Elena', 'Diaz', 'Gomez');

-- Inserts para la tabla Doctores utilizando la secuencia
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Juan', 'González', 'Martínez', '1');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'María', 'Rodríguez', 'López', '2');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Carlos', 'Hernández', 'García', '3');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Laura', 'Martínez', 'Díaz', '4');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Luis', 'Pérez', 'Sanchez', '5');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Ana', 'García', 'Rodríguez', '1');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'David', 'Hernández', 'López', '2');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Paula', 'Martínez', 'González', '3');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Sergio', 'López', 'Martínez', '4');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES (seq_doctores.NEXTVAL, 'Elena', 'García', 'Rodríguez', '5');

-- Inserts para la tabla DatosClinicos
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Hipertensión', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Diabetes Tipo 2', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Asma', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'EPOC', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Artritis Reumatoide', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Fibromialgia', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Depresión', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Síndrome del Intestino Irritable', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Cáncer de Mama', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Gastritis', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Hipotiroidismo', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Ansiedad', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Bronquitis Crónica', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Dermatitis Atópica', seq_pacientes.NEXTVAL);
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES (seq_pacientes.NEXTVAL, 'Insuficiencia Renal', seq_pacientes.NEXTVAL);

-- Inserts para la tabla Especialidades
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES (seq_especialidades.NEXTVAL, 'Cardiología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES (seq_especialidades.NEXTVAL, 'Dermatología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES (seq_especialidades.NEXTVAL, 'Ginecología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES (seq_especialidades.NEXTVAL, 'Oftalmología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES (seq_especialidades.NEXTVAL, 'General');

-- Inserts para la tabla Citas utilizando las secuencias
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '12/04/24', '08:30 am', 'Pendiente', '1', seq_pacientes.NEXTVAL, '1');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '15/05/23', '09:00 am', 'Asistida', '2', seq_pacientes.NEXTVAL, '2');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '18/06/24', '10:30 am', 'Pendiente', '3', seq_pacientes.NEXTVAL, '3');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '21/07/23', '11:00 am', 'Asistida', '4', seq_pacientes.NEXTVAL, '4');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '24/08/23', '02:00 pm', 'Perdida', '5', seq_pacientes.NEXTVAL, '5');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '27/09/24', '03:30 pm', 'Pendiente', '1', seq_pacientes.NEXTVAL, '6');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '03/10/24', '04:00 pm', 'Perdida', '2', seq_pacientes.NEXTVAL, '7');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '08/11/23', '05:30 pm', 'Asistida', '3', seq_pacientes.NEXTVAL, '8');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '12/12/24', '06:00 pm', 'Pendiente', '4', seq_pacientes.NEXTVAL, '9');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '18/01/23', '07:30 pm', 'Perdida', '5', seq_pacientes.NEXTVAL, '10');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '25/02/25', '08:00 am', 'Pendiente', '1', seq_pacientes.NEXTVAL, '1');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '03/03/23', '09:30 am', 'Asistida', '2', seq_pacientes.NEXTVAL, '2');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '10/04/25', '10:00 am', 'Pendiente', '3', seq_pacientes.NEXTVAL, '3');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '18/05/25', '11:30 am', 'Perdida', '4', seq_pacientes.NEXTVAL, '4');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '26/06/25', '12:00 pm', 'Asistida', '5', seq_pacientes.NEXTVAL, '5');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '04/07/25', '01:30 pm', 'Pendiente', '1', seq_pacientes.NEXTVAL, '6');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '12/08/23', '02:00 pm', 'Perdida', '2', seq_pacientes.NEXTVAL, '7');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '21/09/23', '03:30 pm', 'Asistida', '3', seq_pacientes.NEXTVAL, '8');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '29/10/25', '04:00 pm', 'Pendiente', '4', seq_pacientes.NEXTVAL, '9');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES (seq_citas.NEXTVAL, '07/11/23', '05:30 pm', 'Perdida', '5', seq_pacientes.NEXTVAL, '10');



















































































































