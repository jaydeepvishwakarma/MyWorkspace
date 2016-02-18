CREATE TABLE FUNCS (
  FUNC_ID NUMBER NOT NULL,
  CLASS_NAME VARCHAR2(4000),
  CREATE_TIME NUMBER(10) NOT NULL,
  DB_ID NUMBER,
  FUNC_NAME VARCHAR2(128),
  FUNC_TYPE NUMBER(10) NOT NULL,
  OWNER_NAME VARCHAR2(128),
  OWNER_TYPE VARCHAR2(10)
);

ALTER TABLE FUNCS ADD CONSTRAINT FUNCS_PK PRIMARY KEY (FUNC_ID);
ALTER TABLE FUNCS ADD CONSTRAINT FUNCS_FK1 FOREIGN KEY (DB_ID) REFERENCES DBS (DB_ID) INITIALLY DEFERRED;
CREATE UNIQUE INDEX UNIQUEFUNCTION ON FUNCS (FUNC_NAME, DB_ID);
CREATE INDEX FUNCS_N49 ON FUNCS (DB_ID);

CREATE TABLE FUNC_RU (
  FUNC_ID NUMBER NOT NULL,
  RESOURCE_TYPE NUMBER(10) NOT NULL,
  RESOURCE_URI VARCHAR2(4000),
  INTEGER_IDX NUMBER(10) NOT NULL
);

ALTER TABLE FUNC_RU ADD CONSTRAINT FUNC_RU_PK PRIMARY KEY (FUNC_ID, INTEGER_IDX);
ALTER TABLE FUNC_RU ADD CONSTRAINT FUNC_RU_FK1 FOREIGN KEY (FUNC_ID) REFERENCES FUNCS (FUNC_ID) INITIALLY DEFERRED;
CREATE INDEX FUNC_RU_N49 ON FUNC_RU (FUNC_ID);
