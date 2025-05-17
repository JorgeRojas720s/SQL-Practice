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
prompt Table is empty
prompt Loading MONITORES...
prompt Table is empty
prompt Loading OTROS...
prompt Table is empty
prompt Loading RATONES...
prompt Table is empty
prompt Loading TECLADOS...
prompt Table is empty
prompt Loading DISCOS...
prompt Table is empty
prompt Loading MEMORIAS...
prompt Table is empty
prompt Loading TORRES...
prompt Table is empty
prompt Loading EQUIPOS...
prompt Table is empty
prompt Loading TIPO_ACT...
prompt Table is empty
prompt Loading GENEROS...
prompt Table is empty
prompt Loading ROLES...
prompt Table is empty
prompt Loading USUARIOS...
prompt Table is empty
prompt Loading ACTIVIDADES...
prompt Table is empty
prompt Loading FEEDBACK...
prompt Table is empty
prompt Loading HISTORIAL...
prompt Table is empty
prompt Loading SOPORTE_ACT...
prompt Table is empty
prompt Loading TALLER_ACT...
prompt Table is empty
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
