prompt PL/SQL Developer Export Tables for user JROJAS@LOCALHOST:1521/FREE
prompt Created by igmml on domingo, 11 de mayo de 2025
set feedback off
set define off

prompt Dropping ESTADOS...
drop table ESTADOS cascade constraints;
prompt Dropping MONITORES...
drop table MONITORES cascade constraints;
prompt Dropping OTROS...
drop table OTROS cascade constraints;
prompt Dropping RATONES...
drop table RATONES cascade constraints;
prompt Dropping TECLADOS...
drop table TECLADOS cascade constraints;
prompt Dropping DISCOS...
drop table DISCOS cascade constraints;
prompt Dropping MEMORIAS...
drop table MEMORIAS cascade constraints;
prompt Dropping TORRES...
drop table TORRES cascade constraints;
prompt Dropping EQUIPOS...
drop table EQUIPOS cascade constraints;
prompt Dropping TIPO_ACT...
drop table TIPO_ACT cascade constraints;
prompt Dropping GENEROS...
drop table GENEROS cascade constraints;
prompt Dropping ROLES...
drop table ROLES cascade constraints;
prompt Dropping USUARIOS...
drop table USUARIOS cascade constraints;
prompt Dropping ACTIVIDADES...
drop table ACTIVIDADES cascade constraints;
prompt Dropping FEEDBACK...
drop table FEEDBACK cascade constraints;
prompt Dropping HISTORIAL...
drop table HISTORIAL cascade constraints;
prompt Dropping SOPORTE_ACT...
drop table SOPORTE_ACT cascade constraints;
prompt Dropping TALLER_ACT...
drop table TALLER_ACT cascade constraints;

prompt Creating ESTADOS...
create table ESTADOS
(
  id     NUMBER generated always as identity,
  estado VARCHAR2(15)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ESTADOS
  add constraint ESTADO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating MONITORES...
create table MONITORES
(
  id      NUMBER generated always as identity,
  n_bien  VARCHAR2(20),
  n_serie VARCHAR2(20),
  tipo    VARCHAR2(20),
  marca   VARCHAR2(20),
  modelo  VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MONITORES
  add constraint MONITOR_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating OTROS...
create table OTROS
(
  id          NUMBER generated always as identity,
  dispositivo VARCHAR2(20),
  n_bien      VARCHAR2(20),
  n_serie     VARCHAR2(20),
  marca       VARCHAR2(20),
  modelo      VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OTROS
  add constraint OTRO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating RATONES...
create table RATONES
(
  id      NUMBER generated always as identity,
  n_bien  VARCHAR2(20),
  n_serie VARCHAR2(20),
  marca   VARCHAR2(20),
  modelo  VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RATONES
  add constraint RATON_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating TECLADOS...
create table TECLADOS
(
  id      NUMBER generated always as identity,
  n_bien  VARCHAR2(20),
  n_serie VARCHAR2(20),
  marca   VARCHAR2(20),
  modelo  VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TECLADOS
  add constraint TECLADO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating DISCOS...
create table DISCOS
(
  id         NUMBER generated always as identity,
  disco_duro VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DISCOS
  add constraint DISCO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating MEMORIAS...
create table MEMORIAS
(
  id        NUMBER generated always as identity,
  marca     VARCHAR2(20),
  capacidad NUMBER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MEMORIAS
  add constraint MEMORIA_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating TORRES...
create table TORRES
(
  id         NUMBER generated always as identity,
  n_bien     VARCHAR2(20),
  n_serie    VARCHAR2(20),
  marca      VARCHAR2(20),
  modelo     VARCHAR2(20),
  procesador VARCHAR2(20),
  disco_id   NUMBER,
  memoria_id NUMBER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TORRES
  add constraint TORRE_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table TORRES
  add constraint TORRE_X_DISCO_FK foreign key (DISCO_ID)
  references DISCOS (ID);
alter table TORRES
  add constraint TORRE_X_MEMORIA_FK foreign key (MEMORIA_ID)
  references MEMORIAS (ID);

prompt Creating EQUIPOS...
create table EQUIPOS
(
  id         NUMBER generated always as identity,
  estado_id  NUMBER,
  torre_id   NUMBER,
  monitor_id NUMBER,
  teclado_id NUMBER,
  raton_id   NUMBER,
  otro_id    NUMBER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EQUIPOS
  add constraint EQUIPO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table EQUIPOS
  add constraint EQUIPO_X_ESTADO_FK foreign key (ESTADO_ID)
  references ESTADOS (ID);
alter table EQUIPOS
  add constraint EQUIPO_X_MONITOR_FK foreign key (MONITOR_ID)
  references MONITORES (ID);
alter table EQUIPOS
  add constraint EQUIPO_X_OTRO_FK foreign key (OTRO_ID)
  references OTROS (ID);
alter table EQUIPOS
  add constraint EQUIPO_X_RATON_FK foreign key (RATON_ID)
  references RATONES (ID);
alter table EQUIPOS
  add constraint EQUIPO_X_TECLADO_FK foreign key (TECLADO_ID)
  references TECLADOS (ID);
alter table EQUIPOS
  add constraint EQUIPO_X_TORRE_FK foreign key (TORRE_ID)
  references TORRES (ID);

prompt Creating TIPO_ACT...
create table TIPO_ACT
(
  id   NUMBER generated always as identity,
  tipo VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TIPO_ACT
  add constraint TIPO_ACT_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating GENEROS...
create table GENEROS
(
  id     NUMBER generated always as identity,
  genero VARCHAR2(15)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GENEROS
  add constraint GENERO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ROLES...
create table ROLES
(
  id   NUMBER generated always as identity,
  role VARCHAR2(15)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES
  add constraint ROLE_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating USUARIOS...
create table USUARIOS
(
  id        NUMBER generated always as identity,
  n_usuario VARCHAR2(20),
  cedula    VARCHAR2(20),
  nombre    VARCHAR2(20),
  apellido  VARCHAR2(20),
  genero_id NUMBER,
  contra    VARCHAR2(100),
  rol_id    NUMBER,
  correo    VARCHAR2(60)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USUARIOS
  add constraint USUARIO_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table USUARIOS
  add constraint USUARIO_X_GENERO_FK foreign key (GENERO_ID)
  references GENEROS (ID);
alter table USUARIOS
  add constraint USUARIO_X_ROL_FK foreign key (ROL_ID)
  references ROLES (ID);

prompt Creating ACTIVIDADES...
create table ACTIVIDADES
(
  id         NUMBER generated always as identity,
  usuario_id NUMBER,
  tipo_id    NUMBER,
  equipo_id  NUMBER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACTIVIDADES
  add constraint ACTIVIDAD_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACTIVIDADES
  add constraint ACTIVIDAD_X_EQUIPO_FK foreign key (EQUIPO_ID)
  references EQUIPOS (ID);
alter table ACTIVIDADES
  add constraint ACTIVIDAD_X_TIPO_ACT_FK foreign key (TIPO_ID)
  references TIPO_ACT (ID);
alter table ACTIVIDADES
  add constraint ACTIVIDAD_X_USUARIO_FK foreign key (USUARIO_ID)
  references USUARIOS (ID);

prompt Creating FEEDBACK...
create table FEEDBACK
(
  id          NUMBER generated always as identity,
  usuario_id  NUMBER,
  comentarios VARCHAR2(600)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FEEDBACK
  add constraint FEEDBACK_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table FEEDBACK
  add constraint FEEDBACK_X_USUAARIO_PK foreign key (USUARIO_ID)
  references USUARIOS (ID);

prompt Creating HISTORIAL...
create table HISTORIAL
(
  id           NUMBER generated always as identity,
  actividad_id NUMBER,
  equipo_id    NUMBER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HISTORIAL
  add constraint HISTORIAL_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HISTORIAL
  add constraint HISTORIAL_X_ACTIVIDAD_FK foreign key (ACTIVIDAD_ID)
  references ACTIVIDADES (ID);
alter table HISTORIAL
  add constraint HISTORIAL_X_EQUIPO foreign key (EQUIPO_ID)
  references EQUIPOS (ID);

prompt Creating SOPORTE_ACT...
create table SOPORTE_ACT
(
  id              NUMBER generated always as identity,
  usuario_id      NUMBER,
  actividad_id    NUMBER,
  tipo_id         NUMBER,
  fecha           TIMESTAMP(6),
  origen          VARCHAR2(50),
  localidad       VARCHAR2(50),
  atencion        VARCHAR2(50),
  descripcion     VARCHAR2(500),
  tiempo_solucion VARCHAR2(50),
  solucion        VARCHAR2(500)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SOPORTE_ACT
  add constraint SOPORTE_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SOPORTE_ACT
  add constraint SOPORTE_X_ACTIVIDAD_FK foreign key (ACTIVIDAD_ID)
  references ACTIVIDADES (ID);
alter table SOPORTE_ACT
  add constraint SOPORTE_X_TIPO_ACT_FK foreign key (TIPO_ID)
  references TIPO_ACT (ID);
alter table SOPORTE_ACT
  add constraint SOPORTE_X_USUARIO_FK foreign key (USUARIO_ID)
  references USUARIOS (ID);

prompt Creating TALLER_ACT...
create table TALLER_ACT
(
  id           NUMBER generated always as identity,
  usuario_id   NUMBER,
  actividad_id NUMBER,
  tipo_id      NUMBER,
  fecha        TIMESTAMP(6),
  origen       VARCHAR2(50),
  localidad    VARCHAR2(50),
  proceso      VARCHAR2(50),
  descripcion  VARCHAR2(100)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TALLER_ACT
  add constraint TALLER_PK primary key (ID)
  using index
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table TALLER_ACT
  add constraint TALLER_X_ACTIVIDAD_FK foreign key (ACTIVIDAD_ID)
  references ACTIVIDADES (ID);
alter table TALLER_ACT
  add constraint TALLER_X_TIPO_ACT_FK foreign key (TIPO_ID)
  references TIPO_ACT (ID);
alter table TALLER_ACT
  add constraint TALLER_X_USUARIO_FK foreign key (USUARIO_ID)
  references USUARIOS (ID);

prompt Disabling triggers for ESTADOS...
alter table ESTADOS disable all triggers;
prompt Disabling triggers for MONITORES...
alter table MONITORES disable all triggers;
prompt Disabling triggers for OTROS...
alter table OTROS disable all triggers;
prompt Disabling triggers for RATONES...
alter table RATONES disable all triggers;
prompt Disabling triggers for TECLADOS...
alter table TECLADOS disable all triggers;
prompt Disabling triggers for DISCOS...
alter table DISCOS disable all triggers;
prompt Disabling triggers for MEMORIAS...
alter table MEMORIAS disable all triggers;
prompt Disabling triggers for TORRES...
alter table TORRES disable all triggers;
prompt Disabling triggers for EQUIPOS...
alter table EQUIPOS disable all triggers;
prompt Disabling triggers for TIPO_ACT...
alter table TIPO_ACT disable all triggers;
prompt Disabling triggers for GENEROS...
alter table GENEROS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for USUARIOS...
alter table USUARIOS disable all triggers;
prompt Disabling triggers for ACTIVIDADES...
alter table ACTIVIDADES disable all triggers;
prompt Disabling triggers for FEEDBACK...
alter table FEEDBACK disable all triggers;
prompt Disabling triggers for HISTORIAL...
alter table HISTORIAL disable all triggers;
prompt Disabling triggers for SOPORTE_ACT...
alter table SOPORTE_ACT disable all triggers;
prompt Disabling triggers for TALLER_ACT...
alter table TALLER_ACT disable all triggers;
prompt Disabling foreign key constraints for TORRES...
alter table TORRES disable constraint TORRE_X_DISCO_FK;
alter table TORRES disable constraint TORRE_X_MEMORIA_FK;
prompt Disabling foreign key constraints for EQUIPOS...
alter table EQUIPOS disable constraint EQUIPO_X_ESTADO_FK;
alter table EQUIPOS disable constraint EQUIPO_X_MONITOR_FK;
alter table EQUIPOS disable constraint EQUIPO_X_OTRO_FK;
alter table EQUIPOS disable constraint EQUIPO_X_RATON_FK;
alter table EQUIPOS disable constraint EQUIPO_X_TECLADO_FK;
alter table EQUIPOS disable constraint EQUIPO_X_TORRE_FK;
prompt Disabling foreign key constraints for USUARIOS...
alter table USUARIOS disable constraint USUARIO_X_GENERO_FK;
alter table USUARIOS disable constraint USUARIO_X_ROL_FK;
prompt Disabling foreign key constraints for ACTIVIDADES...
alter table ACTIVIDADES disable constraint ACTIVIDAD_X_EQUIPO_FK;
alter table ACTIVIDADES disable constraint ACTIVIDAD_X_TIPO_ACT_FK;
alter table ACTIVIDADES disable constraint ACTIVIDAD_X_USUARIO_FK;
prompt Disabling foreign key constraints for FEEDBACK...
alter table FEEDBACK disable constraint FEEDBACK_X_USUAARIO_PK;
prompt Disabling foreign key constraints for HISTORIAL...
alter table HISTORIAL disable constraint HISTORIAL_X_ACTIVIDAD_FK;
alter table HISTORIAL disable constraint HISTORIAL_X_EQUIPO;
prompt Disabling foreign key constraints for SOPORTE_ACT...
alter table SOPORTE_ACT disable constraint SOPORTE_X_ACTIVIDAD_FK;
alter table SOPORTE_ACT disable constraint SOPORTE_X_TIPO_ACT_FK;
alter table SOPORTE_ACT disable constraint SOPORTE_X_USUARIO_FK;
prompt Disabling foreign key constraints for TALLER_ACT...
alter table TALLER_ACT disable constraint TALLER_X_ACTIVIDAD_FK;
alter table TALLER_ACT disable constraint TALLER_X_TIPO_ACT_FK;
alter table TALLER_ACT disable constraint TALLER_X_USUARIO_FK;

prompt Loading ESTADOS...
insert into ESTADOS (estado) values ('Activo');
insert into ESTADOS (estado) values ('Inactivo');
insert into ESTADOS (estado) values ('Reparación');
insert into ESTADOS (estado) values ('Obsoleto');

prompt Loading MONITORES...
insert into MONITORES (n_bien, n_serie, tipo, marca, modelo) values ('MB001', 'SNM001', 'LED', 'Samsung', 'S24F350');
insert into MONITORES (n_bien, n_serie, tipo, marca, modelo) values ('MB002', 'SNM002', 'LCD', 'LG', '22MK430H');
insert into MONITORES (n_bien, n_serie, tipo, marca, modelo) values ('MB003', 'SNM003', 'Curvo', 'Dell', 'S2721HGF');
insert into MONITORES (n_bien, n_serie, tipo, marca, modelo) values ('MB004', 'SNM004', '4K', 'ASUS', 'VG289Q');

prompt Loading OTROS...
insert into OTROS (dispositivo, n_bien, n_serie, marca, modelo) values ('Impresora', 'OB001', 'SNO001', 'HP', 'LaserJet Pro');
insert into OTROS (dispositivo, n_bien, n_serie, marca, modelo) values ('Escáner', 'OB002', 'SNO002', 'Epson', 'Perf V39');
insert into OTROS (dispositivo, n_bien, n_serie, marca, modelo) values ('Proyector', 'OB003', 'SNO003', 'BenQ', 'MH535');
insert into OTROS (dispositivo, n_bien, n_serie, marca, modelo) values ('Altavoces', 'OB004', 'SNO004', 'Logitech', 'Z623');

prompt Loading RATONES...
insert into RATONES (n_bien, n_serie, marca, modelo) values ('RB001', 'SNR001', 'Logitech', 'M185');
insert into RATONES (n_bien, n_serie, marca, modelo) values ('RB002', 'SNR002', 'Microsoft', 'Mouse 1850');
insert into RATONES (n_bien, n_serie, marca, modelo) values ('RB003', 'SNR003', 'Razer', 'DeathAdder');
insert into RATONES (n_bien, n_serie, marca, modelo) values ('RB004', 'SNR004', 'HP', 'X3000');

prompt Loading TECLADOS...
insert into TECLADOS (n_bien, n_serie, marca, modelo) values ('TB001', 'SNT001', 'Logitech', 'K120');
insert into TECLADOS (n_bien, n_serie, marca, modelo) values ('TB002', 'SNT002', 'Microsoft', 'KB600');
insert into TECLADOS (n_bien, n_serie, marca, modelo) values ('TB003', 'SNT003', 'Corsair', 'K70');
insert into TECLADOS (n_bien, n_serie, marca, modelo) values ('TB004', 'SNT004', 'Dell', 'KB216');

prompt Loading DISCOS...
insert into DISCOS (disco_duro) values ('SSD 500GB');
insert into DISCOS (disco_duro) values ('HDD 1TB');
insert into DISCOS (disco_duro) values ('NVMe 1TB');
insert into DISCOS (disco_duro) values ('SSD 250GB');

prompt Loading MEMORIAS...
insert into MEMORIAS (marca, capacidad) values ('Kingston', 8);
insert into MEMORIAS (marca, capacidad) values ('Corsair', 16);
insert into MEMORIAS (marca, capacidad) values ('Crucial', 32);
insert into MEMORIAS (marca, capacidad) values ('HyperX', 8);

prompt Loading TORRES...
insert into TORRES (n_bien, n_serie, marca, modelo, procesador, disco_id, memoria_id) 
values ('TR001', 'SNT001', 'Dell', 'OptiPlex 3080', 'Intel i5', 1, 1);
insert into TORRES (n_bien, n_serie, marca, modelo, procesador, disco_id, memoria_id) 
values ('TR002', 'SNT002', 'HP', 'EliteDesk 800', 'Intel i7', 2, 2);
insert into TORRES (n_bien, n_serie, marca, modelo, procesador, disco_id, memoria_id) 
values ('TR003', 'SNT003', 'Lenovo', 'ThinkCentre', 'AMD R5', 3, 3);
insert into TORRES (n_bien, n_serie, marca, modelo, procesador, disco_id, memoria_id) 
values ('TR004', 'SNT004', 'Asus', 'ExpertCenter', 'Intel i3', 4, 4);

prompt Loading EQUIPOS...
insert into EQUIPOS (estado_id, torre_id, monitor_id, teclado_id, raton_id, otro_id) 
values (1, 1, 1, 1, 1, 1);
insert into EQUIPOS (estado_id, torre_id, monitor_id, teclado_id, raton_id, otro_id) 
values (1, 2, 2, 2, 2, 2);
insert into EQUIPOS (estado_id, torre_id, monitor_id, teclado_id, raton_id, otro_id) 
values (3, 3, 3, 3, 3, 3);
insert into EQUIPOS (estado_id, torre_id, monitor_id, teclado_id, raton_id, otro_id) 
values (2, 4, 4, 4, 4, 4);

prompt Loading TIPO_ACT...
insert into TIPO_ACT (tipo) values ('Soporte');
insert into TIPO_ACT (tipo) values ('Taller');
insert into TIPO_ACT (tipo) values ('Mantenim');
insert into TIPO_ACT (tipo) values ('Instalac');

prompt Loading GENEROS...
insert into GENEROS (genero) values ('Masculino');
insert into GENEROS (genero) values ('Femenino');
insert into GENEROS (genero) values ('No bin');
insert into GENEROS (genero) values ('Otro');

prompt Loading ROLES...
insert into ROLES (role) values ('Admin');
insert into ROLES (role) values ('Usuario');
insert into ROLES (role) values ('Técnico');
insert into ROLES (role) values ('Supervis');

prompt Loading USUARIOS...
insert into USUARIOS (n_usuario, cedula, nombre, apellido, genero_id, contra, rol_id, correo) 
values ('admin', '12345678', 'Juan', 'Pérez', 1, 'admin123', 1, 'juan.perez@example.com');
insert into USUARIOS (n_usuario, cedula, nombre, apellido, genero_id, contra, rol_id, correo) 
values ('user1', '87654321', 'María', 'Gómez', 2, 'user123', 2, 'maria.gomez@example.com');
insert into USUARIOS (n_usuario, cedula, nombre, apellido, genero_id, contra, rol_id, correo) 
values ('tecnico1', '11223344', 'Carlos', 'López', 1, 'tec123', 3, 'carlos.lopez@example.com');
insert into USUARIOS (n_usuario, cedula, nombre, apellido, genero_id, contra, rol_id, correo) 
values ('super1', '44332211', 'Ana', 'Martínez', 2, 'sup123', 4, 'ana.martinez@example.com');

prompt Loading ACTIVIDADES...
insert into ACTIVIDADES (usuario_id, tipo_id, equipo_id) values (1, 1, 1);
insert into ACTIVIDADES (usuario_id, tipo_id, equipo_id) values (2, 2, 2);
insert into ACTIVIDADES (usuario_id, tipo_id, equipo_id) values (3, 3, 3);
insert into ACTIVIDADES (usuario_id, tipo_id, equipo_id) values (4, 4, 4);

prompt Loading FEEDBACK...
insert into FEEDBACK (usuario_id, comentarios) 
values (1, 'El servicio fue excelente, muy rápido y eficiente');
insert into FEEDBACK (usuario_id, comentarios) 
values (2, 'Buen servicio pero podrían mejorar los tiempos de respuesta');
insert into FEEDBACK (usuario_id, comentarios) 
values (3, 'El técnico resolvió el problema rápidamente');
insert into FEEDBACK (usuario_id, comentarios) 
values (4, 'Necesitan más personal para atender la demanda');

prompt Loading HISTORIAL...
insert into HISTORIAL (actividad_id, equipo_id) values (1, 1);
insert into HISTORIAL (actividad_id, equipo_id) values (2, 2);
insert into HISTORIAL (actividad_id, equipo_id) values (3, 3);
insert into HISTORIAL (actividad_id, equipo_id) values (4, 4);

prompt Loading SOPORTE_ACT...
insert into SOPORTE_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, atencion, descripcion, tiempo_solucion, solucion) 
values (1, 1, 1, SYSTIMESTAMP, 'Remoto', 'Oficina Central', 'Inmediata', 'Problema con conexión a red', '1 hora', 'Se reconfiguró la red');
insert into SOPORTE_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, atencion, descripcion, tiempo_solucion, solucion) 
values (2, 2, 1, SYSTIMESTAMP, 'Presencial', 'Sucursal Norte', 'Programada', 'Instalación de software', '2 horas', 'Se instaló el paquete Office');
insert into SOPORTE_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, atencion, descripcion, tiempo_solucion, solucion) 
values (3, 3, 1, SYSTIMESTAMP, 'Remoto', 'Oficina Sur', 'Urgente', 'Equipo no enciende', '4 horas', 'Se cambió fuente de poder');
insert into SOPORTE_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, atencion, descripcion, tiempo_solucion, solucion) 
values (4, 4, 1, SYSTIMESTAMP, 'Presencial', 'Sucursal Este', 'Programada', 'Actualización de sistema', '3 horas', 'Se actualizó Windows y drivers');

prompt Loading TALLER_ACT...
insert into TALLER_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, proceso, descripcion) 
values (1, 1, 2, SYSTIMESTAMP, 'Taller Central', 'Oficina Principal', 'Mantenimiento', 'Limpieza interna de torre');
insert into TALLER_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, proceso, descripcion) 
values (2, 2, 2, SYSTIMESTAMP, 'Taller Secundario', 'Sucursal Sur', 'Reparación', 'Cambio de fuente de poder');
insert into TALLER_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, proceso, descripcion) 
values (3, 3, 2, SYSTIMESTAMP, 'Taller Central', 'Oficina Principal', 'Actualización', 'Cambio de memoria RAM');
insert into TALLER_ACT (usuario_id, actividad_id, tipo_id, fecha, origen, localidad, proceso, descripcion) 
values (4, 4, 2, SYSTIMESTAMP, 'Taller Secundario', 'Sucursal Norte', 'Diagnóstico', 'Revisión de placa base');

prompt Enabling foreign key constraints for TORRES...
alter table TORRES enable constraint TORRE_X_DISCO_FK;
alter table TORRES enable constraint TORRE_X_MEMORIA_FK;
prompt Enabling foreign key constraints for EQUIPOS...
alter table EQUIPOS enable constraint EQUIPO_X_ESTADO_FK;
alter table EQUIPOS enable constraint EQUIPO_X_MONITOR_FK;
alter table EQUIPOS enable constraint EQUIPO_X_OTRO_FK;
alter table EQUIPOS enable constraint EQUIPO_X_RATON_FK;
alter table EQUIPOS enable constraint EQUIPO_X_TECLADO_FK;
alter table EQUIPOS enable constraint EQUIPO_X_TORRE_FK;
prompt Enabling foreign key constraints for USUARIOS...
alter table USUARIOS enable constraint USUARIO_X_GENERO_FK;
alter table USUARIOS enable constraint USUARIO_X_ROL_FK;
prompt Enabling foreign key constraints for ACTIVIDADES...
alter table ACTIVIDADES enable constraint ACTIVIDAD_X_EQUIPO_FK;
alter table ACTIVIDADES enable constraint ACTIVIDAD_X_TIPO_ACT_FK;
alter table ACTIVIDADES enable constraint ACTIVIDAD_X_USUARIO_FK;
prompt Enabling foreign key constraints for FEEDBACK...
alter table FEEDBACK enable constraint FEEDBACK_X_USUAARIO_PK;
prompt Enabling foreign key constraints for HISTORIAL...
alter table HISTORIAL enable constraint HISTORIAL_X_ACTIVIDAD_FK;
alter table HISTORIAL enable constraint HISTORIAL_X_EQUIPO;
prompt Enabling foreign key constraints for SOPORTE_ACT...
alter table SOPORTE_ACT enable constraint SOPORTE_X_ACTIVIDAD_FK;
alter table SOPORTE_ACT enable constraint SOPORTE_X_TIPO_ACT_FK;
alter table SOPORTE_ACT enable constraint SOPORTE_X_USUARIO_FK;
prompt Enabling foreign key constraints for TALLER_ACT...
alter table TALLER_ACT enable constraint TALLER_X_ACTIVIDAD_FK;
alter table TALLER_ACT enable constraint TALLER_X_TIPO_ACT_FK;
alter table TALLER_ACT enable constraint TALLER_X_USUARIO_FK;
prompt Enabling triggers for ESTADOS...
alter table ESTADOS enable all triggers;
prompt Enabling triggers for MONITORES...
alter table MONITORES enable all triggers;
prompt Enabling triggers for OTROS...
alter table OTROS enable all triggers;
prompt Enabling triggers for RATONES...
alter table RATONES enable all triggers;
prompt Enabling triggers for TECLADOS...
alter table TECLADOS enable all triggers;
prompt Enabling triggers for DISCOS...
alter table DISCOS enable all triggers;
prompt Enabling triggers for MEMORIAS...
alter table MEMORIAS enable all triggers;
prompt Enabling triggers for TORRES...
alter table TORRES enable all triggers;
prompt Enabling triggers for EQUIPOS...
alter table EQUIPOS enable all triggers;
prompt Enabling triggers for TIPO_ACT...
alter table TIPO_ACT enable all triggers;
prompt Enabling triggers for GENEROS...
alter table GENEROS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for USUARIOS...
alter table USUARIOS enable all triggers;
prompt Enabling triggers for ACTIVIDADES...
alter table ACTIVIDADES enable all triggers;
prompt Enabling triggers for FEEDBACK...
alter table FEEDBACK enable all triggers;
prompt Enabling triggers for HISTORIAL...
alter table HISTORIAL enable all triggers;
prompt Enabling triggers for SOPORTE_ACT...
alter table SOPORTE_ACT enable all triggers;
prompt Enabling triggers for TALLER_ACT...
alter table TALLER_ACT enable all triggers;

set feedback on
set define on
prompt Done