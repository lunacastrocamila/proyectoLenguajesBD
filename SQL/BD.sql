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

































































































































