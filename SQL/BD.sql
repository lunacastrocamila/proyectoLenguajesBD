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

CREATE TABLE LogCambios (
    Id_Log NUMBER GENERATED ALWAYS AS IDENTITY,
    TablaAfectada VARCHAR2(50),
    Id_Registro VARCHAR2(50),
    Accion VARCHAR2(10),
    FechaHora TIMESTAMP,
    Usuario VARCHAR2(50)
);


--INSERTS!!!

-- Insertar roles en la tabla Rol
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES ('ADMIN', 'Administrador');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES ('DOCTOR', 'Doctor');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES ('EMPLEADO', 'Empleado');
INSERT INTO Rol (Id_Rol, DescripcionRol) VALUES ('PACIENTE', 'Paciente');

-- Inserts para la tabla Usuario 
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('johnsmith', 'pass1', 'Johnson', 'Brown', 'ADMIN');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('marydoe', 'pass2', 'Martinez', 'Garcia', 'DOCTOR');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('davidjones', 'pass3', 'Miller', 'Martinez', 'EMPLEADO');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('sarahbrown', 'pass4', 'Anderson', 'Johnson', 'PACIENTE');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('samwilson', 'pass5', 'Davis', 'Lopez', 'ADMIN');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('emilyrodriguez', 'pass6', 'Garcia', 'Rodriguez', 'DOCTOR');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('michaelclark', 'pass7', 'Hernandez', 'Smith', 'EMPLEADO');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('laurasmith', 'pass8', 'Brown', 'Gonzalez', 'PACIENTE');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('alexjohnson', 'pass9', 'Johnson', 'Taylor', 'ADMIN');
INSERT INTO Usuario (Usuario, Contraseña, Apellido1User, Apellido2User, Id_Rol) VALUES ('rachelwilliams', 'pass10', 'Williams', 'Jones', 'DOCTOR');

-- Inserts para la tabla Pacientes 
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('1', 'Juan', 'Garcia', 'Martinez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('2', 'Maria', 'Rodriguez', 'Lopez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('3', 'Carlos', 'Hernandez', 'Gonzalez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('4', 'Laura', 'Martinez', 'Diaz');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('5', 'Luis', 'Perez', 'Sanchez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('6', 'Ana', 'Sanchez', 'Ramirez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('7', 'David', 'Gonzalez', 'Martin');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('8', 'Paula', 'Lopez', 'Jimenez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('9', 'Sergio', 'Fernandez', 'Alvarez');
INSERT INTO Pacientes (Id_Paciente, NombrePaciente, Apellido1Paciente, Apellido2Paciente) VALUES ('10', 'Elena', 'Diaz', 'Gomez');

-- Inserts para la tabla DatosClinicos 
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('1', 'Hipertensión', '1');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('2', 'Diabetes Tipo 2', '2');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('3', 'Asma', '3');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('4', 'EPOC', '4');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('5', 'Artritis Reumatoide', '5');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('6', 'Fibromialgia', '6');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('7', 'Depresión', '7');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('8', 'Síndrome del Intestino Irritable', '8');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('9', 'Cáncer de Mama', '9');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('10', 'Gastritis', '10');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('11', 'Hipotiroidismo', '1');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('12', 'Ansiedad', '2');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('13', 'Bronquitis Crónica', '3');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('14', 'Dermatitis Atópica', '4');
INSERT INTO DatosClinicos (Id_DatosClinicos, DescripcionDato, Id_Paciente) VALUES ('15', 'Insuficiencia Renal', '5');

-- Inserts para la tabla Especialidades 
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES ('1', 'Cardiología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES ('2', 'Dermatología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES ('3', 'Ginecología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES ('4', 'Oftalmología');
INSERT INTO Especialidades (Id_Especialidad, DescripcionEspecialidad) VALUES ('5', 'General')

-- Inserts para la tabla Doctores 
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('1', 'Juan', 'González', 'Martínez', '1');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('2', 'María', 'Rodríguez', 'López', '2');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('3', 'Carlos', 'Hernández', 'García', '3');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('4', 'Laura', 'Martínez', 'Díaz', '4');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('5', 'Luis', 'Pérez', 'Sanchez', '5');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('6', 'Ana', 'García', 'Rodríguez', '1');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('7', 'David', 'Hernández', 'López', '2');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('8', 'Paula', 'Martínez', 'González', '3');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('9', 'Sergio', 'López', 'Martínez', '4');
INSERT INTO Doctores (Id_Doctores, NombreDoctor, Apellido1Doctor, Apellido2Doctor, Id_Especialidad) VALUES ('10', 'Elena', 'García', 'Rodríguez', '5');

-- Inserts para la tabla Citas 
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('1', '12/04/24', '08:30 am', 'Pendiente', '1', '1', '1');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('2', '15/05/23', '09:00 am', 'Asistida', '2', '2', '2');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('3', '18/06/24', '10:30 am', 'Pendiente', '3', '3', '3');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('4', '21/07/23', '11:00 am', 'Asistida', '4', '4', '4');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('5', '24/08/23', '02:00 pm', 'Perdida', '5', '5', '5');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('6', '27/09/24', '03:30 pm', 'Pendiente', '1', '6', '6');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('7', '03/10/24', '04:00 pm', 'Perdida', '2', '7', '7');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('8', '08/11/23', '05:30 pm', 'Asistida', '3', '8', '8');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('9', '12/12/24', '06:00 pm', 'Pendiente', '4', '9', '9');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('10', '18/01/23', '07:30 pm', 'Perdida', '5', '10', '10');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('11', '25/02/25', '08:00 am', 'Pendiente', '1', '1', '1');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('12', '03/03/23', '09:30 am', 'Asistida', '2', '2', '2');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('13', '10/04/25', '10:00 am', 'Pendiente', '3', '3', '3');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('14', '18/05/25', '11:30 am', 'Perdida', '4', '4', '4');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('15', '26/06/25', '12:00 pm', 'Asistida', '5', '5', '5');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('16', '04/07/25', '01:30 pm', 'Pendiente', '1', '6', '6');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('17', '12/08/23', '02:00 pm', 'Perdida', '2', '7', '7');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('18', '21/09/23', '03:30 pm', 'Asistida', '3', '8', '8');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('19', '29/10/25', '04:00 pm', 'Pendiente', '4', '9', '9');
INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores) VALUES ('20', '07/11/23', '05:30 pm', 'Perdida', '5', '10', '10');







-- Triggers

CREATE OR REPLACE TRIGGER trg_log_cambios
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

    INSERT INTO LogCambios (TablaAfectada, Id_Registro, Accion, FechaHora, Usuario)
    VALUES ('Usuario', COALESCE(:NEW.Usuario, :OLD.Usuario), v_action, SYSTIMESTAMP, USER);
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

-- Procedimientos

--Procedimiento para obtener los datos clínicos de un paciente:
--Este procedimiento toma como entrada el ID de un paciente y devuelve una lista de sus datos clínicos.

CREATE OR REPLACE PROCEDURE GetDatosClinicos(
    Id_Paciente IN VARCHAR2,
    DatosClinicos OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN DatosClinicos FOR
    SELECT * FROM DatosClinicos WHERE Id_Paciente = Id_Paciente;
END;


--Procedimiento para programar una cita:
--Este procedimiento toma como entrada la información necesaria para programar una cita y la inserta en la tabla de citas.

CREATE OR REPLACE PROCEDURE ProgramarCita(
    Id_Cita IN VARCHAR2,
    Fecha IN VARCHAR2,
    Hora IN VARCHAR2,
    Estado IN VARCHAR2,
    Id_Especialidad IN VARCHAR2,
    Id_Paciente IN VARCHAR2,
    Id_Doctor IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Citas (Id_Citas, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctores)
    VALUES (Id_Cita, Fecha, Hora, Estado, Id_Especialidad, Id_Paciente, Id_Doctor);
END;


--Procedimiento para obtener citas por especialidad:
--Este procedimiento toma como entrada el ID de una especialidad y devuelve una lista de citas programadas para esa especialidad.

CREATE OR REPLACE PROCEDURE GetCitasPorEspecialidad(
    Id_Especialidad IN VARCHAR2,
    Citas OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Citas FOR
    SELECT * FROM Citas WHERE Id_Especialidad = Id_Especialidad;
END;

--Procedimiento para registrar un cliente

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
sql
Copy code
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
END;
/
--Este procedimiento almacenado crea un cursor que devuelve las citas pendientes junto con la información del paciente y del doctor asociados a cada cita.

--Cursor para obtener la lista de doctores y sus especialidades:

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
END;
/
--Este procedimiento almacenado crea un cursor que devuelve la lista de doctores junto con sus especialidades.























































































































