drop table COM_LOG ;
drop table COM_MENU ;
drop table COM_MENU_PERMISSION ;
drop table COM_ROLE ;
drop table COM_ROLE_MENU ;
drop table COM_ROLE_USER ;
drop table COM_USER ;
drop table COM_DICT ;
drop table COM_FILE ;
drop table COM_NATIONCODE ;
drop table TB_USC_HOSPITAL ;
drop table TB_USC_NOTICE ;
drop table TB_USC_ORG ;
drop table TB_USC_WAREHOUSE ;
drop table TB_USC_DOC_TYPE ;
drop table TB_USC_DOC_OP_LOG ;
drop table TB_USC_WAREHOUSE_USER ;
drop table com_business_log;
/*==============================================================*/
/* Table: COM_LOG                                               */
/*==============================================================*/
create table COM_LOG (
   log_id            	VARCHAR2(64)         not null,
   log_type         	VARCHAR2(2),
   title             	VARCHAR2(255),
   remote_addr     	 	VARCHAR2(255),
   user_agent        	VARCHAR2(255),
   request_uri      	VARCHAR2(255),
   method            	VARCHAR2(100),
   params             	CLOB,
   exception          	CLOB,
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   DEL_FLAG             VARCHAR2(1)          default 'N',
   constraint PK_COM_LOG primary key (log_id)
);

comment on table COM_LOG is'日志表';
comment on column COM_LOG.log_id is'编号';
comment on column COM_LOG.log_type is'日志类型';
comment on column COM_LOG.title is'日志标题';
comment on column COM_LOG.remote_addr is'操作IP地址';
comment on column COM_LOG.user_agent is'用户代理';
comment on column COM_LOG.request_uri is'请求URI';
comment on column COM_LOG.method is'操作方式';
comment on column COM_LOG.params is'操作提交的数据';
comment on column COM_LOG.exception is'异常信息';
comment on column COM_LOG.CREATE_BY is'创建人';
comment on column COM_LOG.CREATE_DATE is'创建日期';
comment on column COM_LOG.UPDATE_BY is'更新人';
comment on column COM_LOG.UPDATE_DATE is'更新日期';
comment on column COM_LOG.DEL_FLAG is'删除标识';


create table COM_MENU(
  menu_id     VARCHAR2(10) not null,
  parent_id   VARCHAR2(10) not null,
  parent_ids  VARCHAR2(2000),
  name        VARCHAR2(255),
  sort        NUMBER,
  href        VARCHAR2(2000),
  target      VARCHAR2(255),
  icon        VARCHAR2(500),
  is_show     VARCHAR2(1) default 'Y',
  permission  VARCHAR2(200),
  create_by   VARCHAR2(50),
  create_date DATE,
  update_by   VARCHAR2(50),
  update_date DATE,
  remarks     VARCHAR2(500),
  del_flag    VARCHAR2(1) default 'N'
);
comment on column COM_MENU.menu_id
  is '编号';
comment on column COM_MENU.parent_id
  is '父级编号';
comment on column COM_MENU.parent_ids
  is '所有父级编号';
comment on column COM_MENU.name
  is '名称';
comment on column COM_MENU.sort
  is '排序';
comment on column COM_MENU.href
  is '链接';
comment on column COM_MENU.target
  is '目标';
comment on column COM_MENU.icon
  is '图标';
comment on column COM_MENU.is_show
  is '是否在菜单中显示';
comment on column COM_MENU.permission
  is '权限标识';
alter table COM_MENU
  add primary key (MENU_ID);


create table COM_MENU_PERMISSION(
  menu_permission_id VARCHAR2(10) not null,
  menu_id            VARCHAR2(10),
  permission_code    VARCHAR2(50),
  permission_name    VARCHAR2(255) not null,
  create_by          VARCHAR2(50),
  create_date        DATE,
  update_by          VARCHAR2(50),
  update_date        DATE,
  del_flag           VARCHAR2(1) default 'N'
);
comment on table COM_MENU_PERMISSION
  is '菜单权限表';
comment on column COM_MENU_PERMISSION.menu_permission_id
  is '权限编号';
comment on column COM_MENU_PERMISSION.menu_id
  is '菜单ID';
comment on column COM_MENU_PERMISSION.permission_code
  is '权限编码';
comment on column COM_MENU_PERMISSION.permission_name
  is '权限名称';
comment on column COM_MENU_PERMISSION.create_by
  is '创建人';
comment on column COM_MENU_PERMISSION.create_date
  is '创建日期';
comment on column COM_MENU_PERMISSION.update_by
  is '更新人';
comment on column COM_MENU_PERMISSION.update_date
  is '更新日期';
comment on column COM_MENU_PERMISSION.del_flag
  is '删除标识';
alter table COM_MENU_PERMISSION
  add constraint PK_COM_MENU_PERMISSION primary key (MENU_PERMISSION_ID);
  
  create table COM_ROLE(
  role_id     VARCHAR2(10) not null,
  role_name   VARCHAR2(100) not null,
  role_enname VARCHAR2(100) not null,
  role_type   VARCHAR2(255),
  data_scope  VARCHAR2(1),
  is_sys      VARCHAR2(1),
  remarks     VARCHAR2(255),
  create_by   VARCHAR2(50),
  create_date DATE,
  update_by   VARCHAR2(50),
  update_date DATE,
  del_flag    VARCHAR2(1) default 'N'
);
comment on column COM_ROLE.role_id
  is '编号';
comment on column COM_ROLE.role_name
  is '角色名称';
comment on column COM_ROLE.role_enname
  is '英文名称';
comment on column COM_ROLE.role_type
  is '角色类型';
comment on column COM_ROLE.data_scope
  is '数据范围';
comment on column COM_ROLE.is_sys
  is '是否系统数据';
alter table COM_ROLE
  add primary key (ROLE_ID);


create table COM_ROLE_MENU(
  role_id         VARCHAR2(10) not null,
  menu_id         VARCHAR2(10) not null,
  remarks         VARCHAR2(255),
  create_by       VARCHAR2(50),
  create_date     DATE,
  update_by       VARCHAR2(50),
  update_date     DATE,
  permission_code VARCHAR2(500)
);
comment on table COM_ROLE_MENU
  is '角色菜单分配表';
comment on column COM_ROLE_MENU.role_id
  is '角色编号';
comment on column COM_ROLE_MENU.menu_id
  is '菜单编号';
comment on column COM_ROLE_MENU.remarks
  is '备注';
comment on column COM_ROLE_MENU.create_by
  is '创建人';
comment on column COM_ROLE_MENU.create_date
  is '创建日期';
comment on column COM_ROLE_MENU.update_by
  is '更新人';
comment on column COM_ROLE_MENU.update_date
  is '更新日期';
comment on column COM_ROLE_MENU.permission_code
  is '权限编码,多个PERMISSION_CODE以逗号分隔';
alter table COM_ROLE_MENU
  add constraint PK_COM_ROLE_MENU primary key (ROLE_ID, MENU_ID);


create table COM_ROLE_USER(
  role_id     VARCHAR2(10) not null,
  user_id     VARCHAR2(15) not null,
  remarks     VARCHAR2(255),
  create_by   VARCHAR2(50),
  create_date DATE,
  update_by   VARCHAR2(50),
  update_date DATE,
  del_flag    VARCHAR2(1) default 'N'
);
comment on column COM_ROLE_USER.role_id
  is '角色编号';
comment on column COM_ROLE_USER.user_id
  is '用户编号';


create table COM_USER (
   USER_ID              VARCHAR2(15)         not null,
   OFFICE_ID            VARCHAR2(64),
   LOGIN_NAME           VARCHAR2(64)         not null,
   PASSWORD             VARCHAR2(64)         not null,
   USER_NAME            VARCHAR2(100)        not null,
   EMAIL                VARCHAR2(100),
   PHONE_NO             VARCHAR2(50),
   SEX 			        NUMBER(1),
   POSITION 		    VARCHAR2(1),
   MOBILE_NO            VARCHAR2(50),
   USER_TYPE            VARCHAR2(2),
   LOGIN_IP             VARCHAR2(50),
   LOGIN_DATE           date,
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   DEL_FLAG             VARCHAR2(1)          default 'N',
   LOGIN_FLAG           VARCHAR2(1)          default 'Y',
   REMARKS              VARCHAR2(500),
   EMPLOYEE_ID          VARCHAR2(50),
   ORG_ID               VARCHAR2(64),
   constraint PK_COM_USER primary key (USER_ID),
   AUTHORIZE_OFFICE_IDS   VARCHAR2(100)
);

comment on table COM_USER is
'用户信息表';

comment on column COM_USER.USER_ID is
'用户名';

comment on column COM_USER.OFFICE_ID is
'部门ID';

comment on column COM_USER.LOGIN_NAME is
'登录名';

comment on column COM_USER.PASSWORD is
'登录密码';

comment on column COM_USER.USER_NAME is
'用户姓名';

comment on column COM_USER.EMAIL is
'邮箱';
comment on column COM_USER.SEX
  is '性别1 男 2 女';
comment on column COM_USER.POSITION
  is '人员岗位';
comment on column COM_USER.PHONE_NO is
'座机';

comment on column COM_USER.MOBILE_NO is
'手机';

comment on column COM_USER.USER_TYPE is
'用户分类';

comment on column COM_USER.LOGIN_IP is
'登录IP';

comment on column COM_USER.LOGIN_DATE is
'登录日期';

comment on column COM_USER.CREATE_BY is
'创建人';

comment on column COM_USER.CREATE_DATE is
'创建日期';

comment on column COM_USER.UPDATE_BY is
'更新人';

comment on column COM_USER.UPDATE_DATE is
'更新日期';

comment on column COM_USER.DEL_FLAG is
'删除标识';

comment on column COM_USER.LOGIN_FLAG is
'是否允许登录';

comment on column COM_USER.REMARKS is
'备注';

comment on column COM_USER.EMPLOYEE_ID is
'与SAP同步用户ID时使用';

comment on column COM_USER.ORG_ID is
'公司/医院ID';
comment on column COM_USER.AUTHORIZE_OFFICE_IDS
  is '授权部门，以逗号分隔';  
create table COM_DICT (
   DICT_ID              number(10)           not null,
   CODE                 VARCHAR2(50),
   LABEL                VARCHAR2(100),
   TYPE                 VARCHAR2(30),
   REMARK               VARCHAR2(100),
   SORT                 NUMBER,
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   DEL_FLAG             VARCHAR2(1)          default 'N',
   constraint PK_COM_DICT primary key (DICT_ID)
);

comment on table COM_DICT is
'共同代码表';

comment on column COM_DICT.DICT_ID is
'编码';

comment on column COM_DICT.CODE is
'代码';

comment on column COM_DICT.LABEL is
'标签名';

comment on column COM_DICT.TYPE is
'分类';

comment on column COM_DICT.REMARK is
'描述';

comment on column COM_DICT.SORT is
'排序';

comment on column COM_DICT.CREATE_BY is
'创建人';

comment on column COM_DICT.CREATE_DATE is
'创建日期';

comment on column COM_DICT.UPDATE_BY is
'更新人';

comment on column COM_DICT.UPDATE_DATE is
'更新日期';

comment on column COM_DICT.DEL_FLAG is
'删除标识';

CREATE TABLE COM_FILE  (
  FILE_ID             VARCHAR2(100) NOT NULL ,
  FILE_NAME           VARCHAR2(100),
  FILE_SIZE           VARCHAR2(100),
  FILE_PATH            VARCHAR2(100),
  FILE_DIR            VARCHAR2(100),
  FILE_NAME_ORIG      VARCHAR2(100),
  CREATE_BY           VARCHAR2(10),
  CREATE_DATE         DATE NOT NULL ,
  UPDATE_BY           VARCHAR2(10),
  UPDATE_DATE         DATE,
  CONSTRAINT PK_COM_FILE PRIMARY KEY (FILE_ID)
);
COMMENT ON TABLE COM_FILE IS '附件表';
COMMENT ON COLUMN COM_FILE.FILE_ID IS '文件名id';
COMMENT ON COLUMN COM_FILE.FILE_NAME IS '文件名';
COMMENT ON COLUMN COM_FILE.FILE_SIZE IS '文件大小';
COMMENT ON COLUMN COM_FILE.FILE_PATH IS '文件路径';
COMMENT ON COLUMN COM_FILE.FILE_DIR IS '文件夹路径';
COMMENT ON COLUMN COM_FILE.FILE_NAME_ORIG IS '原始文件名';
COMMENT ON COLUMN COM_FILE.CREATE_BY IS '创建者';
COMMENT ON COLUMN COM_FILE.CREATE_DATE IS '创建日期';
COMMENT ON COLUMN COM_FILE.UPDATE_BY IS '更新者';
COMMENT ON COLUMN COM_FILE.UPDATE_DATE IS '更新日期';

create table TB_USC_HOSPITAL(
   ORG_ID               VARCHAR2(10)         not null,
   ORG_NAME             VARCHAR2(500),
   TEL                  VARCHAR2(50),
   CONTACT              VARCHAR2(50),
   FAX                  VARCHAR2(50),
   ADDRESS              VARCHAR2(500),
   POSTCODE             VARCHAR2(50),
   EMAIL                VARCHAR2(50),
   WEBSITE              VARCHAR2(100),
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   DEL_FLAG             VARCHAR2(1)          default 'N',
   REMARKS              VARCHAR2(500),
   constraint PK_TB_USC_HOSPITAL primary key (ORG_ID)
);

comment on table TB_USC_HOSPITAL is
'医院基本信息';

comment on column TB_USC_HOSPITAL.ORG_ID is
'组织编码（1000）';

comment on column TB_USC_HOSPITAL.ORG_NAME is
'组织名称';

comment on column TB_USC_HOSPITAL.TEL is
'固定电话';

comment on column TB_USC_HOSPITAL.CONTACT is
'委托联系人';

comment on column TB_USC_HOSPITAL.FAX is
'传真';

comment on column TB_USC_HOSPITAL.ADDRESS is
'地址';

comment on column TB_USC_HOSPITAL.POSTCODE is
'邮政编码';

comment on column TB_USC_HOSPITAL.EMAIL is
'邮箱';

comment on column TB_USC_HOSPITAL.WEBSITE is
'网址';

comment on column TB_USC_HOSPITAL.CREATE_BY is
'创建人';

comment on column TB_USC_HOSPITAL.CREATE_DATE is
'创建日期';

comment on column TB_USC_HOSPITAL.UPDATE_BY is
'更新人';

comment on column TB_USC_HOSPITAL.UPDATE_DATE is
'更新日期';

comment on column TB_USC_HOSPITAL.DEL_FLAG is
'删除标识';

comment on column TB_USC_HOSPITAL.REMARKS is
'备注';

create table TB_USC_ORG(
  ORG_ID          VARCHAR2(10) not null,
  ORG_NAME        VARCHAR2(200),
  ORG_CODE        VARCHAR2(50),
  ADDRESS         VARCHAR2(500),
  PHONE           VARCHAR2(20),
  LINKMAN         VARCHAR2(50),
  LINKMAN_PHONE   VARCHAR2(20),
  PARENT_ORG_ID   VARCHAR2(10),
  HOSPITAL_ORG_ID VARCHAR2(10),
  BRANCH_ORG_ID   VARCHAR2(10),
  CREATE_BY       VARCHAR2(50),
  CREATE_DATE     DATE,
  UPDATE_BY       VARCHAR2(50),
  UPDATE_DATE     DATE,
  DEL_FLAG        VARCHAR2(1) default 'N',
  REMARKS         VARCHAR2(500),
  ASSIST_CODE     VARCHAR2(50)
);
-- Add comments to the table 
comment on table TB_USC_ORG
  is '组织结构表';
-- Add comments to the columns 
comment on column TB_USC_ORG.ORG_ID
  is '组织ID，主键自增';
comment on column TB_USC_ORG.ORG_NAME
  is '组织名称';
comment on column TB_USC_ORG.ORG_CODE
  is '编码';
comment on column TB_USC_ORG.ADDRESS
  is '地址';
comment on column TB_USC_ORG.PHONE
  is '电话';
comment on column TB_USC_ORG.LINKMAN
  is '联系人';
comment on column TB_USC_ORG.LINKMAN_PHONE
  is '联系人电话';
comment on column TB_USC_ORG.PARENT_ORG_ID
  is '上级组织ID';
comment on column TB_USC_ORG.HOSPITAL_ORG_ID
  is '医院组织ID，默认1000';
comment on column TB_USC_ORG.BRANCH_ORG_ID
  is '分院编码';
comment on column TB_USC_ORG.CREATE_BY
  is '创建人';
comment on column TB_USC_ORG.CREATE_DATE
  is '创建日期';
comment on column TB_USC_ORG.UPDATE_BY
  is '更新人';
comment on column TB_USC_ORG.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_ORG.DEL_FLAG
  is '删除标识';
comment on column TB_USC_ORG.REMARKS
  is '备注';
comment on column TB_USC_ORG.ASSIST_CODE
  is '组织名称拼音码';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_ORG
  add constraint PK_TB_USC_ORG primary key (ORG_ID);
  
 CREATE TABLE TB_USC_NOTICE  (
  NOTICE_ID           VARCHAR2(10) NOT NULL ,
  NOTICE_TITLE        VARCHAR2(100),
  NOTICE_CONTENT      BLOB,
  START_DATE          DATE,
  END_DATE            DATE,
  CREATE_BY           VARCHAR2(50),
  CREATE_DATE         DATE,
  UPDATE_BY           VARCHAR2(50),
  UPDATE_DATE         DATE,
  PUBLISH_SYS 		  VARCHAR2(2) default 01,
  NOTICE_TYPE		  VARCHAR2(2) default 01,
  NOTICE_CLASSIFY	  VARCHAR2(2),
  NOTICE_PICTURE	  VARCHAR2(100),
  CLICK_NUM		      NUMBER(10) default 0,
  SHOW_NO 	          NUMBER(10),
  DEL_FLAG            VARCHAR2(1),
  CONSTRAINT PK_TB_USC_NOTICE PRIMARY KEY (NOTICE_ID)
);
COMMENT ON TABLE TB_USC_NOTICE IS '公告表';
COMMENT ON COLUMN TB_USC_NOTICE.NOTICE_ID IS '公告ID';
COMMENT ON COLUMN TB_USC_NOTICE.NOTICE_TITLE IS '公告标题';
COMMENT ON COLUMN TB_USC_NOTICE.NOTICE_CONTENT IS '公告内容';
COMMENT ON COLUMN TB_USC_NOTICE.START_DATE IS '开始日期';
COMMENT ON COLUMN TB_USC_NOTICE.END_DATE IS '结束日期';
COMMENT ON COLUMN TB_USC_NOTICE.CREATE_BY IS '创建人';
COMMENT ON COLUMN TB_USC_NOTICE.CREATE_DATE IS '创建日期';
COMMENT ON COLUMN TB_USC_NOTICE.UPDATE_BY IS '更新人';
COMMENT ON COLUMN TB_USC_NOTICE.UPDATE_DATE IS '更新日期';
COMMENT ON COLUMN TB_USC_NOTICE.DEL_FLAG IS '删除标识';
comment on column TB_USC_NOTICE.PUBLISH_SYS  is '系统,公告发布的系统 01:USC,02:UPS';
comment on column TB_USC_NOTICE.NOTICE_TYPE  is '公告类型 01:公告,02:QA,03:特色';
comment on column TB_USC_NOTICE.NOTICE_CLASSIFY  is '公告分类,公共代码noticeClassify';
comment on column TB_USC_NOTICE.NOTICE_PICTURE  is '图片';
comment on column TB_USC_NOTICE.CLICK_NUM  is '点击量';
comment on column TB_USC_NOTICE.SHOW_NO  is '显示顺序';
create table COM_NATIONCODE (
   NATION_CODE          VARCHAR2(50)         not null,
   NATION_NAME          VARCHAR2(500),
   NATION_EN_NAME       VARCHAR2(500),
   constraint PK_COM_NATIONCODE primary key (NATION_CODE)
);
comment on table COM_NATIONCODE is '国家代码表';
comment on column COM_NATIONCODE.NATION_CODE is '代码';
comment on column COM_NATIONCODE.NATION_NAME is '国家';
comment on column COM_NATIONCODE.NATION_EN_NAME is '英文名';

create table TB_USC_WAREHOUSE(
   WH_ID                NUMBER(10)           not null,
   WH_PARENT_ID         NUMBER(10),
   WH_PARENT_IDS        VARCHAR2(400),
   ORG_ID               VARCHAR2(10),
   OFFICE_ID            VARCHAR2(10),
   AUTHORIZE_OFFICE_ID  VARCHAR2(100),
   WH_NAME              VARCHAR2(100),
   WH_CODE              VARCHAR2(50),
   WH_TYPE              VARCHAR2(50),
   WH_ADDRESS           VARCHAR2(500),
   WH_ADMIN             VARCHAR2(50),
   USE_FLAG             VARCHAR2(2)          default 'Y',
   REMARKS              VARCHAR2(500),
   DEL_FLAG             VARCHAR2(2)          default 'N',
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   constraint PK_TB_USC_WAREHOUSE primary key (WH_ID),
   ACCOUNT_UNIT         VARCHAR2(200)
);

comment on table TB_USC_WAREHOUSE is'仓库表';

comment on column TB_USC_WAREHOUSE.WH_ID is'仓库编号';

comment on column TB_USC_WAREHOUSE.WH_PARENT_ID is'父级仓库编号';

comment on column TB_USC_WAREHOUSE.WH_PARENT_IDS is'所有父级仓库编号，逗号连接';

comment on column TB_USC_WAREHOUSE.ORG_ID is'医院ID';

comment on column TB_USC_WAREHOUSE.OFFICE_ID is'所属科室';

comment on column TB_USC_WAREHOUSE.AUTHORIZE_OFFICE_ID is'授权部门，以逗号分隔';

comment on column TB_USC_WAREHOUSE.WH_NAME is'仓库名称';

comment on column TB_USC_WAREHOUSE.WH_CODE is'仓库编码';

comment on column TB_USC_WAREHOUSE.WH_TYPE is'仓库类型编码';

comment on column TB_USC_WAREHOUSE.WH_ADDRESS is'仓库地址';

comment on column TB_USC_WAREHOUSE.WH_ADMIN IS '仓库管理员';

comment on column TB_USC_WAREHOUSE.USE_FLAG is'是否使用';

comment on column TB_USC_WAREHOUSE.REMARKS is'备注';

comment on column TB_USC_WAREHOUSE.DEL_FLAG is'删除标识';

comment on column TB_USC_WAREHOUSE.CREATE_BY is'创建人';

comment on column TB_USC_WAREHOUSE.CREATE_DATE is'创建日期';

comment on column TB_USC_WAREHOUSE.UPDATE_BY is'更新人';

comment on column TB_USC_WAREHOUSE.UPDATE_DATE is'更新日期';

comment on column TB_USC_WAREHOUSE.ACCOUNT_UNIT is '核算单元';

CREATE TABLE TB_USC_DOC_TYPE  (
  DOC_TYPE_ID         NUMBER(10) NOT NULL ,
  ORG_ID              VARCHAR2(10),
  DOC_TYPE_CODE       VARCHAR2(20) NOT NULL ,
  DOC_TYPE_NAME       VARCHAR2(50),
  TRANSACTION_TYPE_CODE VARCHAR2(20),
  TRANSACTION_TYPE_NAME VARCHAR2(50),
  CREATE_BY           VARCHAR2(50),
  CREATE_DATE         DATE,
  UPDATE_BY           VARCHAR2(50),
  UPDATE_DATE         DATE,
  DEL_FLAG            VARCHAR2(1),
  REMARKS             VARCHAR2(500),
  CONSTRAINT PK_TB_USC_DOC_TYPE PRIMARY KEY (DOC_TYPE_ID)
)
;


COMMENT ON TABLE TB_USC_DOC_TYPE IS '单据类型表';
COMMENT ON COLUMN TB_USC_DOC_TYPE.DOC_TYPE_ID IS '主键，序列';
COMMENT ON COLUMN TB_USC_DOC_TYPE.ORG_ID IS '组织ID，默认为医院ID';
COMMENT ON COLUMN TB_USC_DOC_TYPE.DOC_TYPE_CODE IS '单据类型ID';
COMMENT ON COLUMN TB_USC_DOC_TYPE.DOC_TYPE_NAME IS '单据类型名称';
COMMENT ON COLUMN TB_USC_DOC_TYPE.TRANSACTION_TYPE_CODE IS '事务处理类型CODE';
COMMENT ON COLUMN TB_USC_DOC_TYPE.TRANSACTION_TYPE_NAME IS '事务处理类型名称';
COMMENT ON COLUMN TB_USC_DOC_TYPE.CREATE_BY IS '创建人';
COMMENT ON COLUMN TB_USC_DOC_TYPE.CREATE_DATE IS '创建日期';
COMMENT ON COLUMN TB_USC_DOC_TYPE.UPDATE_BY IS '更新人';
COMMENT ON COLUMN TB_USC_DOC_TYPE.UPDATE_DATE IS '更新日期';
COMMENT ON COLUMN TB_USC_DOC_TYPE.DEL_FLAG IS '删除标识';
COMMENT ON COLUMN TB_USC_DOC_TYPE.REMARKS IS '备注';


CREATE TABLE TB_USC_DOC_OP_LOG  (
  OP_LOG_ID           NUMBER(12) NOT NULL ,
  ORG_ID              VARCHAR2(10),
  DOC_TYPE_CODE       VARCHAR2(20),
  DOC_TYPE_NAME       VARCHAR2(50),
  TRANSACTION_TYPE_CODE VARCHAR2(20),
  DOC_ID              VARCHAR2(20) NOT NULL ,
  STATE               VARCHAR2(20),
  CODE_TYPE           VARCHAR2(100),
  OP_USER_ID          VARCHAR2(15) NOT NULL ,
  OFFICE_ID           VARCHAR2(64),
  CREATE_BY           VARCHAR2(50),
  CREATE_DATE         DATE,
  REMARKS             VARCHAR2(500),
  UPDATE_BY           VARCHAR2(50),
  UPDATE_DATE         DATE,
  CONSTRAINT PK_TB_USC_DOC_OP_LOG PRIMARY KEY (OP_LOG_ID)
);
COMMENT ON TABLE TB_USC_DOC_OP_LOG IS '单据操作记录表';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.OP_LOG_ID IS '主键，自增';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.ORG_ID IS '组织ID，默认为医院ID';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.DOC_TYPE_CODE IS '单据类型ID';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.DOC_TYPE_NAME IS '单据类型名称';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.TRANSACTION_TYPE_CODE IS '事务处理类型CODE';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.DOC_ID IS '单据ID';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.STATE IS '状态';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.CODE_TYPE IS '状态码分类';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.OP_USER_ID IS '操作人ID';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.OFFICE_ID IS '部门ID';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.CREATE_BY IS '创建人';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.CREATE_DATE IS '创建日期';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.REMARKS IS '备注';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.CREATE_BY IS '更新人';
COMMENT ON COLUMN TB_USC_DOC_OP_LOG.CREATE_DATE IS '更新日期';

CREATE TABLE TB_USC_WAREHOUSE_USER(
  WH_ID		NUMBER(10) NOT NULL,
  USER_ID    VARCHAR2(50) NOT NULL,
  REMARKS     VARCHAR2(255),
  DEFAULT_WH  VARCHAR2(1) default 'N',
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(50),
  UPDATE_DATE DATE,
  DEL_FLAG    VARCHAR2(1) DEFAULT 'N'
);
-- ADD COMMENTS TO THE COLUMNS 
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.WH_ID
  IS '仓库编号';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.USER_ID
  IS '用户编号';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.CREATE_BY
  IS '创建人';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.CREATE_DATE
  IS '创建日期';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.UPDATE_BY
  IS '更新人';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.UPDATE_DATE
  IS '更新日期';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.DEL_FLAG
  IS '删除标识';
COMMENT ON COLUMN TB_USC_WAREHOUSE_USER.REMARKS
  IS '备注';
  comment on column TB_USC_WAREHOUSE_USER.DEFAULT_WH
  is '是否为默认仓库 ''Y''为默认仓库';
-- Create table
create table com_business_log
(
  business_log_id varchar2(15),
  LOG_TYPE        VARCHAR2(2),
  TITLE           VARCHAR2(255),
  REMOTE_ADDR     VARCHAR2(255),
  USER_AGENT      VARCHAR2(255),
  REQUEST_URI     VARCHAR2(255),
  METHOD          VARCHAR2(100),
  PARAMS          CLOB,
  EXCEPTION       CLOB,
  CREATE_BY       VARCHAR2(50),
  CREATE_DATE     DATE,
  UPDATE_BY       VARCHAR2(50),
  UPDATE_DATE     DATE,
  DEL_FLAG        VARCHAR2(1) default 'N'
)
;
-- Add comments to the table 
comment on table com_business_log
  is '业务日志表';
-- Add comments to the columns 
comment on column com_business_log.business_log_id
  is '业务日志id';
comment on column com_business_log.LOG_TYPE
  is '日志类型';
comment on column com_business_log.TITLE
  is '日志标题';
comment on column com_business_log.REMOTE_ADDR
  is '操作IP地址';
comment on column com_business_log.USER_AGENT
  is '用户代理';
comment on column com_business_log.REQUEST_URI
  is '请求URI';
comment on column com_business_log.METHOD
  is '操作方式';
comment on column com_business_log.PARAMS
  is '操作提交的数据';
comment on column com_business_log.EXCEPTION
  is '异常信息';
comment on column com_business_log.CREATE_BY
  is '创建人';
comment on column com_business_log.CREATE_DATE
  is '创建日期';
comment on column com_business_log.UPDATE_BY
  is '更新人';
comment on column com_business_log.UPDATE_DATE
  is '更新日期';
comment on column com_business_log.DEL_FLAG
  is '删除标识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table com_business_log
  add constraint pk_blogId primary key (BUSINESS_LOG_ID);
drop table TB_USC_MATERIAL_CATEGORY;
drop table TB_USC_VENDOR_CATEGORY;
drop table TB_USC_UNITS;
drop table TB_USC_MANUFACTURE;
drop table TB_USC_MATERIAL_UNITS_MAPPING;
drop table TB_USC_MATERIAL;
drop table TB_USC_STORAGE;
drop table TB_USC_WH_MATERIAL_MAPPING;
drop table TB_USC_LOCATION;
drop table TB_USC_LOCATION_MATERIAL;
drop table TB_USC_CHARGING_STANDARD;

drop table TB_USC_APPROVE_DETAIL;
drop table TB_USC_APPROVE_MANAGEMENT;
drop table TB_USC_APPROVE_MASTER;
drop table TB_USC_AUTHORIZATION;
drop table TB_USC_VENDOR;
drop table TB_USC_VENDOR_APPROVE;
drop table TB_USC_VENDOR_HISTORY;
drop table TB_USC_VENDOR_CERTIFICATE;
drop table TB_USC_VENDOR_CERT_APPROVE;
drop table TB_USC_VENDOR_CERT_HISTORY;
drop table TB_USC_VENDOR_FINANCE;
drop table TB_USC_VENDOR_FINANCE_APPROVE;
drop table TB_USC_VENDOR_FINANCE_HISTORY;

drop table TB_USC_VENDOR_MATERIAL;
drop table TB_USC_VENDOR_MATERIAL_APPLY;
drop table TB_USC_VENDOR_MATERIAL_HIS;
drop table TB_USC_MY_MENU;
drop table TB_USC_FUNCTION_LOCATION;
drop table IF_USER;
drop table IF_ORG;
drop table TB_USC_MATERIAL_CATEGORY10;
drop table TB_USC_BILLS_MST;
drop table TB_USC_BILLS_DTL;
drop table TB_USC_PICKING;
drop table TB_USC_MATERIAL_APPROVE_RECORD;
drop table TB_USC_CHECK_MASTER;
drop table TB_USC_CHECK_DETAIL;
drop table TB_USC_CHECK_STOCK;
drop table TB_USC_UNPACK_MST;
drop table TB_USC_UNPACK_DTL;
drop table TB_USC_APPROVE_LINE_MST;
drop table TB_USC_APPROVE_LINE_DTL;

create table TB_USC_MATERIAL_CATEGORY(
   MATERIAL_CATEGORY_CODE        VARCHAR2(50) not null,
   MATERIAL_CATEGORY_PARENT_CODE VARCHAR2(50),
   MATERIAL_CATEGORY_PATH        VARCHAR2(1000),
   CREATE_BY                     VARCHAR2(50),
   CREATE_DATE                   DATE,
   UPDATE_BY                     VARCHAR2(50),
   UPDATE_DATE                   DATE,
   DEL_FLAG                      VARCHAR2(2) default 'N',
   REMARKS                       VARCHAR2(500),
   MATERIAL_CATEGORY_NAME        VARCHAR2(500),
   MANAGE_LEVEL                  VARCHAR2(50),
   constraint PK_TB_USC_MATERIAL_CATEGORY primary key (MATERIAL_CATEGORY_CODE)
);

comment on table TB_USC_MATERIAL_CATEGORY
  is 'USC物资分类';
comment on column TB_USC_MATERIAL_CATEGORY.MATERIAL_CATEGORY_CODE
  is '物资分类编号';
comment on column TB_USC_MATERIAL_CATEGORY.MATERIAL_CATEGORY_PARENT_CODE
  is '物资分类父编号';
comment on column TB_USC_MATERIAL_CATEGORY.MATERIAL_CATEGORY_PATH
  is '物资分类层级';
comment on column TB_USC_MATERIAL_CATEGORY.CREATE_BY
  is '创建人';
comment on column TB_USC_MATERIAL_CATEGORY.CREATE_DATE
  is '创建日期';
comment on column TB_USC_MATERIAL_CATEGORY.UPDATE_BY
  is '更新人';
comment on column TB_USC_MATERIAL_CATEGORY.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_MATERIAL_CATEGORY.DEL_FLAG
  is '删除标识';
comment on column TB_USC_MATERIAL_CATEGORY.REMARKS
  is '备注';
comment on column TB_USC_MATERIAL_CATEGORY.MANAGE_LEVEL
  is '管理类别：Ⅰ类：通过常规管理足以保证其安全性、有效性的医疗器械；(必须通过临床验证)
Ⅱ类：对其安全性、有效性应当加以控制的医疗器械；(必须通过临床验证)
Ⅲ类：植入人体；用于支持、维持生命；对人体具有潜在危险，对其安全性、有效性必须严格控制的医疗器械。(由国务院药品监督管理部门审查批准，并发给产品生产注册证书)';



create table TB_USC_VENDOR_CATEGORY 
(
   VENDOR_CATEGORY_ID   VARCHAR2(10)         not null,
   VENDOR_CATEGORY_CODE VARCHAR2(10)         not null,
   VENDOR_CATEGORY_NAME VARCHAR2(50)         not null,
   DEL_FLAG                      VARCHAR2(2) default 'N',
   CREATE_BY            VARCHAR2(50),
   CREATE_DATE          date,
   UPDATE_BY            VARCHAR2(50),
   UPDATE_DATE          date,
   REMARKS              VARCHAR2(500),
   constraint PK_TB_USC_VENDOR_CATEGORY primary key (VENDOR_CATEGORY_ID)
);

comment on table TB_USC_VENDOR_CATEGORY is
'供应商分类信息表';

comment on column TB_USC_VENDOR_CATEGORY.VENDOR_CATEGORY_ID is
'主键，自增';

comment on column TB_USC_VENDOR_CATEGORY.VENDOR_CATEGORY_CODE is
'分类编码';

comment on column TB_USC_VENDOR_CATEGORY.VENDOR_CATEGORY_NAME is
'分类名称';

comment on column TB_USC_VENDOR_CATEGORY.CREATE_BY is
'创建人';

comment on column TB_USC_VENDOR_CATEGORY.CREATE_DATE is
'创建日期';

comment on column TB_USC_VENDOR_CATEGORY.UPDATE_BY is
'更新人';

comment on column TB_USC_VENDOR_CATEGORY.UPDATE_DATE is
'更新日期';

comment on column TB_USC_VENDOR_CATEGORY.REMARKS is
'备注';

create table TB_USC_MANUFACTURE(
  MANUFACTURE_ID         VARCHAR2(10) not null,
  MANUFACTURE_CODE       VARCHAR2(50) not null,
  MANUFACTURE_CH_NAME    VARCHAR2(500) not null,
  MANUFACTURE_SHORT_NAME VARCHAR2(200),
  MANUFACTURE_EN_NAME    VARCHAR2(500),
  ASSIST_CODE            VARCHAR2(50),
  NATION                 VARCHAR2(10),
  ADDRESS                VARCHAR2(500),
  DEL_FLAG             VARCHAR2(2) default 'N',
  REMARKS                VARCHAR2(500),
  CREATE_DATE            DATE not null,
  CREATE_BY              VARCHAR2(50) not null,
  UPDATE_DATE            DATE,
  UPDATE_BY              VARCHAR2(50)
);
-- Add comments to the table 
comment on table TB_USC_MANUFACTURE
  is '生产厂家表';
-- Add comments to the columns 
comment on column TB_USC_MANUFACTURE.MANUFACTURE_ID
  is '生产厂家ID，系统自动生成';
comment on column TB_USC_MANUFACTURE.MANUFACTURE_CODE
  is '生产厂家编码，系统获取厂家名称汉字首字母自动生成';
comment on column TB_USC_MANUFACTURE.MANUFACTURE_CH_NAME
  is '生产厂家名称';
comment on column TB_USC_MANUFACTURE.MANUFACTURE_SHORT_NAME
  is '生产厂家简称';
comment on column TB_USC_MANUFACTURE.MANUFACTURE_EN_NAME
  is '生产厂家英文名称';
comment on column TB_USC_MANUFACTURE.ASSIST_CODE
  is '助记码';
comment on column TB_USC_MANUFACTURE.NATION
  is '国家编码';
comment on column TB_USC_MANUFACTURE.ADDRESS
  is '地址';
comment on column TB_USC_MANUFACTURE.DEL_FLAG
  is '使用标志';
comment on column TB_USC_MANUFACTURE.REMARKS
  is '备注';
comment on column TB_USC_MANUFACTURE.CREATE_DATE
  is '创建日期';
comment on column TB_USC_MANUFACTURE.CREATE_BY
  is '创建人';
comment on column TB_USC_MANUFACTURE.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_MANUFACTURE.UPDATE_BY
  is '更新人';
alter table TB_USC_MANUFACTURE add primary key (MANUFACTURE_ID);
  
create table TB_USC_STORAGE(
  STORAGE_ID   NUMBER(10) not null,
  STORAGE_NAME VARCHAR2(200) not null,
  OFFICE_ID    NUMBER(15),
  WH_TYPE      VARCHAR2(50),
  WH_ID        NUMBER(10),
  CREATE_BY    VARCHAR2(50),
  CREATE_DATE  DATE,
  UPDATE_BY    VARCHAR2(50),
  UPDATE_DATE  DATE,
  DEL_FLAG     VARCHAR2(2) default 'N',
  REMARKS      VARCHAR2(500)
);
-- Add comments to the table 
comment on table TB_USC_STORAGE
  is '库存区域表';
-- Add comments to the columns 
comment on column TB_USC_STORAGE.STORAGE_ID
  is '主键,序列';
comment on column TB_USC_STORAGE.STORAGE_NAME
  is '区域名称';
comment on column TB_USC_STORAGE.OFFICE_ID
  is '所属部门';
comment on column TB_USC_STORAGE.WH_TYPE
  is '仓库级别';
comment on column TB_USC_STORAGE.WH_ID
  is '所属仓库';
comment on column TB_USC_STORAGE.CREATE_BY
  is '创建人';
comment on column TB_USC_STORAGE.CREATE_DATE
  is '创建日期';
comment on column TB_USC_STORAGE.UPDATE_BY
  is '更新人';
comment on column TB_USC_STORAGE.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_STORAGE.DEL_FLAG
  is '删除标识';
comment on column TB_USC_STORAGE.REMARKS
  is '备注';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_STORAGE
  add constraint PK_TB_USC_STORAGE primary key (STORAGE_ID);
  
 create table TB_USC_LOCATION_MATERIAL(
  LOCATION_MATERIAL_ID VARCHAR2(10) not null,
  LOCATION_ID          VARCHAR2(10) not null,
  MATERIAL_ID          VARCHAR2(18),
  WH_ID                NUMBER(10) not null,
  STORAGE_ID           NUMBER(10)  null,
  APPLY_FLAG		   VARCHAR2(2) default 'Y',
  CREATE_BY            VARCHAR2(50) not null,
  CREATE_DATE          DATE not null,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE,
  REMARKS              VARCHAR2(50),
  DEL_FLAG             VARCHAR2(2) default 'N'
);
-- Add comments to the table 
comment on table TB_USC_LOCATION_MATERIAL
  is '货位物资表';
-- Add comments to the columns 
comment on column TB_USC_LOCATION_MATERIAL.LOCATION_MATERIAL_ID
  is '货位物资ID';
comment on column TB_USC_LOCATION_MATERIAL.LOCATION_ID
  is '货位号';
comment on column TB_USC_LOCATION_MATERIAL.MATERIAL_ID
  is '物资ID';
comment on column TB_USC_LOCATION_MATERIAL.WH_ID
  is '所属仓库';
comment on column TB_USC_LOCATION_MATERIAL.STORAGE_ID
  is '区域ID';
comment on column TB_USC_LOCATION_MATERIAL.CREATE_BY
  is '创建人';
comment on column TB_USC_LOCATION_MATERIAL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_LOCATION_MATERIAL.UPDATE_BY
  is '更新人';
comment on column TB_USC_LOCATION_MATERIAL.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_LOCATION_MATERIAL.REMARKS
  is '备注';
comment on column TB_USC_LOCATION_MATERIAL.DEL_FLAG
  is '删除标志';
comment on column TB_USC_LOCATION_MATERIAL.APPLY_FLAG
  is 'Y自动，N手动';
alter table TB_USC_LOCATION_MATERIAL
  add constraint TB_USC_LOCATION_MATERIAL primary key (LOCATION_MATERIAL_ID );
  
  

-- Create table
create table TB_USC_LOCATION(
  LOCATION_ID   VARCHAR2(10) not null,
  LOCATION_NAME VARCHAR2(500) not null,
  STORAGE_ID    NUMBER(10) ,
  LOCATION_CODE NUMBER(20) ,
  OFFICE_ID     VARCHAR2(15) ,
  WH_TYPE       VARCHAR2(50) not null,
  WH_ID         NUMBER(10) not null,
  REMARKS       VARCHAR2(500),
  DEL_FLAG      VARCHAR2(2)   default 'N',
  CREATE_BY     VARCHAR2(50) not null,
  CREATE_DATE   DATE not null,
  UPDATE_BY     VARCHAR2(50),
  UPDATE_DATE   DATE);
-- Add comments to the table 
comment on table TB_USC_LOCATION
  is '货位表';
-- Add comments to the columns 
comment on column TB_USC_LOCATION.LOCATION_ID
  is '货位ID';
comment on column TB_USC_LOCATION.LOCATION_NAME
  is '货位名称';
comment on column TB_USC_LOCATION.STORAGE_ID
  is '区域ID';
comment on column TB_USC_LOCATION.LOCATION_CODE
  is '货位号';
comment on column TB_USC_LOCATION.OFFICE_ID
  is '部门ID';
comment on column TB_USC_LOCATION.WH_TYPE
  is '仓库级别';
comment on column TB_USC_LOCATION.WH_ID
  is '所属仓库';
comment on column TB_USC_LOCATION.REMARKS
  is '备注';
comment on column TB_USC_LOCATION.DEL_FLAG
  is '删除标志';
comment on column TB_USC_LOCATION.CREATE_BY
  is '创建人';
comment on column TB_USC_LOCATION.CREATE_DATE
  is '创建日期';
comment on column TB_USC_LOCATION.UPDATE_BY
  is '更新人';
comment on column TB_USC_LOCATION.UPDATE_DATE
  is '更新日期';
  alter table TB_USC_LOCATION
  add constraint PK_TB_USC_LOCATION primary key (LOCATION_ID );
  -- Create table

create table  TB_USC_WH_MATERIAL_MAPPING  (
  MATERIAL_MAPPING_ID VARCHAR2(10) NOT NULL ,
  WH_ID               NUMBER(10) NOT NULL ,
  MATERIAL_ID         VARCHAR(18),
  MATERIAL_NAME       VARCHAR2(500),
  MATERIAL_CATEGORY_MAIN VARCHAR2(50),
  MATERIAL_CATEGORY_MIN VARCHAR2(50),
  CREATE_BY           VARCHAR2(50),
  CREATE_DATE         DATE,
  UPDATE_BY           VARCHAR2(50),
  UPDATE_DATE         DATE,
  DEL_FLAG            VARCHAR2(1),
  APPLY_TYPE          VARCHAR2(2),
  REMARKS             VARCHAR2(500),
  CONSTRAINT PK_TB_USC_WH_MATERIAL_MAPPING PRIMARY KEY (MATERIAL_MAPPING_ID)
);
COMMENT ON TABLE TB_USC_WH_MATERIAL_MAPPING IS '仓库物资对照表';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.MATERIAL_MAPPING_ID IS '主键，自增';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.WH_ID IS '仓库编号';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.MATERIAL_ID IS '物资序号';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.MATERIAL_NAME IS '物资名称';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.MATERIAL_CATEGORY_MAIN IS '物资大类（低值、高值、设备）';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.MATERIAL_CATEGORY_MIN IS '物资分类(最小一级分类)';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.CREATE_BY IS '创建人';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.CREATE_DATE IS '创建日期';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.UPDATE_BY IS '更新人';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.UPDATE_DATE IS '更新日期';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.DEL_FLAG IS '删除标识';
COMMENT ON COLUMN TB_USC_WH_MATERIAL_MAPPING.REMARKS IS '备注';
comment on column TB_USC_WH_MATERIAL_MAPPING.APPLY_TYPE  is '申领类型';

create table TB_USC_MATERIAL(
  MATERIAL_ID            VARCHAR2(18) not null,
  ORG_ID                 VARCHAR2(10) not null,
  MATERIAL_CODE          VARCHAR2(50) not null,
  MATERIAL_NAME          VARCHAR2(80),
  MATERIAL_EN_NAME       VARCHAR2(250),
  MATERIAL_COMM_NAME     VARCHAR2(100),
  ASSIST_CODE1           VARCHAR2(50),
  ASSIST_CODE2           VARCHAR2(50),
  ASSIST_CODE3           VARCHAR2(50),
  ASSIST_CODE4           VARCHAR2(50),
  MATERIAL_CATEGORY_MAIN VARCHAR2(9) not null,
  MATERIAL_CATEGORY_MIN  VARCHAR2(10) not null,
  ALIAS5 				 VARCHAR2(100),
  MANUFACTURE_CODE       VARCHAR2(10) not null,
  MANUFACTURE_NAME       VARCHAR2(60),
  MATERIAL_UNITS_CODE    VARCHAR2(3) not null,
  MATERIAL_UNITS_NAME    VARCHAR2(50),
  UNIT_PRICE             NUMBER(13,4),
  MATERIAL_SPEC          VARCHAR2(40),
  MATERIAL_MODEL         VARCHAR2(100),
  AMOUNT_PER_PACKAGE     NUMBER(5),
  PACKAGE_SPEC           VARCHAR2(200),
  PACKAGE_UNITS_CODE     VARCHAR2(3),
  PACKAGE_UNITS_NAME     VARCHAR2(50),
  TRADE_PRICE            NUMBER(13,4),
  SALE_PRICE             NUMBER(13,4),
  CERTIFICATE_ID 		 NUMBER(10),
  MATERIAL_DESC          VARCHAR2(1000),
  USE_DESC               VARCHAR2(1000),
  MEDICAL_IDENTIFICATION VARCHAR2(100),
  STORAGE_CONDITION      VARCHAR2(200),
  USE_FLAG               VARCHAR2(1) default 'N',
  REMARKS                VARCHAR2(500),
  VENDOR_NAME            VARCHAR2(100),
  VENDOR_ID 			 NUMBER(10),
  MATERIAL_PICTURE1      VARCHAR2(100),
  MATERIAL_PICTURE2      VARCHAR2(100),
  MATERIAL_PICTURE3      VARCHAR2(100),
  MATERIAL_PICTURE4      VARCHAR2(100),
  MATERIAL_PICTURE5      VARCHAR2(100),
  PURCHASE_UNITS_CODE    VARCHAR2(3),
  PURCHASE_UNITS_NAME    VARCHAR2(50),
  PURCHASE_UNITS_RATE    NUMBER(5),
  COMM_REG_NO            VARCHAR2(100),
  USE_DEPARTMENT 		 VARCHAR2(1) default 'N',
  ALIAS1 				 VARCHAR2(100),
  ALIAS2				 VARCHAR2(100),
  ALIAS3				 VARCHAR2(100),
  ALIAS4				 VARCHAR2(100),
  BRAND					 VARCHAR2(60),
  MEDICAL_IDENTIFICATION_TYPE varchar2(1),
  CHARGE_TYPE			 VARCHAR2(2) default '01',
  CHARGE_CODE			 VARCHAR2(10),
  USE_DEPARTMENT_CODE	 VARCHAR2(100),
  STANDARD				 VARCHAR2(500),
  USE_TYPE				 VARCHAR2(2) default '01',
  IMPORT_TYPE			 VARCHAR2(2) default 'N',
  INSTRUMENT_TYPE		 VARCHAR2(2) default '01',
  COMM_REG_START_DATE    DATE,
  COMM_REG_CLOSE_DATE    DATE,
  COMM_REG_SPEC          VARCHAR2(200),
  COMM_REG_ATTACH_ID     VARCHAR2(100),
  DEL_FLAG               VARCHAR2(1) default 'N',
  CREATE_BY              VARCHAR2(50),  
  CREATE_DATE            DATE,
  UPDATE_BY              VARCHAR2(50),
  UPDATE_DATE            DATE,
  UNPACK_YN              VARCHAR2(1) default 'N',
  UDI_CODE               VARCHAR2(25),
  CONSUME_ATTR1          VARCHAR2(25),
  CONSUME_ATTR2          VARCHAR2(25),
  PURCHASE_BOX_YN VARCHAR2(1) default 'N'
);
-- Add comments to the table 
comment on table TB_USC_MATERIAL
  is '物资字典表';
comment on column TB_USC_MATERIAL.ORG_ID
  is '组织ID';
comment on column TB_USC_MATERIAL.MATERIAL_CODE
  is '物资编码';
comment on column TB_USC_MATERIAL.MATERIAL_NAME
  is '物资中文名称';
comment on column TB_USC_MATERIAL.MATERIAL_EN_NAME
  is '物资英文名称';
comment on column TB_USC_MATERIAL.MATERIAL_COMM_NAME
  is '物资通用名';
comment on column TB_USC_MATERIAL.ASSIST_CODE1
  is '助记码1';
comment on column TB_USC_MATERIAL.ASSIST_CODE2
  is '助记码2';
comment on column TB_USC_MATERIAL.ASSIST_CODE3
  is '助记码3';
comment on column TB_USC_MATERIAL.ASSIST_CODE4
  is '助记码4';
comment on column TB_USC_MATERIAL.MATERIAL_CATEGORY_MAIN
  is '物资大类';
comment on column TB_USC_MATERIAL.ALIAS5
  is '用于存放供应商物资名称以作参考';
comment on column TB_USC_MATERIAL.MATERIAL_CATEGORY_MIN
  is '物资分类(最小一级分类)';
comment on column TB_USC_MATERIAL.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_MATERIAL.MANUFACTURE_NAME
  is '生产厂家名称';
COMMENT ON COLUMN TB_USC_MATERIAL.CERTIFICATE_ID
  IS '资质ID';
comment on column TB_USC_MATERIAL.MATERIAL_UNITS_CODE
  is '最小单位编号';
comment on column TB_USC_MATERIAL.MATERIAL_UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_MATERIAL.UNIT_PRICE
  is '单价';
comment on column TB_USC_MATERIAL.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_MATERIAL.MATERIAL_MODEL
  is '型号';
comment on column TB_USC_MATERIAL.AMOUNT_PER_PACKAGE
  is '定数包包含最小单位数';
comment on column TB_USC_MATERIAL.VENDOR_ID
  is '供应商Id';
comment on column TB_USC_MATERIAL.PURCHASE_UNITS_CODE
  is '大包单位编号';
comment on column TB_USC_MATERIAL.PURCHASE_UNITS_NAME
  is '大包单位名称';
comment on column TB_USC_MATERIAL.PURCHASE_UNITS_RATE
  is '大包单位包含最小单位数';
comment on column TB_USC_MATERIAL.USE_DEPARTMENT
  is '科室使用，表示某几个科室专用，不通用';
comment on column TB_USC_MATERIAL.ALIAS1
  is '别名1';
comment on column TB_USC_MATERIAL.ALIAS2
  is '别名2';
comment on column TB_USC_MATERIAL.ALIAS3
  is '别名3';
comment on column TB_USC_MATERIAL.ALIAS4
  is '别名4';
comment on column TB_USC_MATERIAL.BRAND
  is '品牌';
comment on column TB_USC_MATERIAL.MEDICAL_IDENTIFICATION_TYPE
  is '是否医保物资';
comment on column TB_USC_MATERIAL.CHARGE_TYPE
  is '是否收费，01：不收费，02：单独计费，03：打包收费';
comment on column TB_USC_MATERIAL.CHARGE_CODE
  is '收费代码';
comment on column TB_USC_MATERIAL.USE_DEPARTMENT_CODE
  is '使用科室代码';
comment on column TB_USC_MATERIAL.STANDARD
  is '物资标准';
comment on column TB_USC_MATERIAL.USE_TYPE
  is '耗材用后区分：01：不选，02：植入，03：毁型';
comment on column TB_USC_MATERIAL.IMPORT_TYPE
  is '是否进口：Y：进口，N：国产';
comment on column TB_USC_MATERIAL.INSTRUMENT_TYPE
  is '器械分类等级：01：不分类，02：Ⅰ类，02：Ⅱ类，03：Ⅲ类';  
comment on column TB_USC_MATERIAL.PACKAGE_SPEC
  is '包装规格';
comment on column TB_USC_MATERIAL.PACKAGE_UNITS_CODE
  is '定数包单位编号';
comment on column TB_USC_MATERIAL.PACKAGE_UNITS_NAME
  is '定数包单位名称';
comment on column TB_USC_MATERIAL.TRADE_PRICE
  is '采购价格';
comment on column TB_USC_MATERIAL.SALE_PRICE
  is '销售价格';
comment on column TB_USC_MATERIAL.MATERIAL_DESC
  is '物资描述';
comment on column TB_USC_MATERIAL.USE_DESC
  is '使用说明';
comment on column TB_USC_MATERIAL.MEDICAL_IDENTIFICATION
  is '医保标识';
comment on column TB_USC_MATERIAL.STORAGE_CONDITION
  is '存储条件';
comment on column TB_USC_MATERIAL.USE_FLAG
  is '使用状态';
comment on column TB_USC_MATERIAL.REMARKS
  is '备注';
comment on column TB_USC_MATERIAL.VENDOR_NAME
  is '供应商名称';
comment on column TB_USC_MATERIAL.MATERIAL_PICTURE1
  is '物资图片1';
comment on column TB_USC_MATERIAL.MATERIAL_PICTURE2
  is '物资图片2';
comment on column TB_USC_MATERIAL.MATERIAL_PICTURE3
  is '物资图片3';
comment on column TB_USC_MATERIAL.MATERIAL_PICTURE4
  is '物资图片4';
comment on column TB_USC_MATERIAL.MATERIAL_PICTURE5
  is '物资图片5';
comment on column TB_USC_MATERIAL.COMM_REG_NO
  is '产品注册证编号';
comment on column TB_USC_MATERIAL.COMM_REG_START_DATE
  is '产品注册证生效日期';
comment on column TB_USC_MATERIAL.COMM_REG_CLOSE_DATE
  is '产品注册证失效日期';
comment on column TB_USC_MATERIAL.COMM_REG_SPEC
  is '产品注册证物资规格';
comment on column TB_USC_MATERIAL.COMM_REG_ATTACH_ID
  is '产品注册证扫描件附件ID';
comment on column TB_USC_MATERIAL.DEL_FLAG
  is '删除标志，N未删除，Y代表删除';
comment on column TB_USC_MATERIAL.CREATE_BY
  is '创建人';
comment on column TB_USC_MATERIAL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_MATERIAL.UPDATE_BY
  is '更新人';
comment on column TB_USC_MATERIAL.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_MATERIAL.UNPACK_YN
  is '拆零标识，Y按照最小单位申领，N按照定数包申领';
comment on column TB_USC_MATERIAL.UDI_CODE
  is 'UDI编码';
comment on column TB_USC_MATERIAL.CONSUME_ATTR1
  is '耗材属性1';
comment on column TB_USC_MATERIAL.CONSUME_ATTR2
  is '耗材属性2';
comment on column TB_USC_MATERIAL.PURCHASE_BOX_YN
  is '按箱采购 ：Y代表按箱采购，N代表不按箱采购';
alter table TB_USC_MATERIAL
  add constraint PK_TB_USC_MATERIAL primary key (MATERIAL_ID);

  
create table TB_USC_UNITS(
  UNITS_ID    VARCHAR2(10) not null,
  UNITS_CODE  VARCHAR2(10) not null,
  UNITS_NAME  VARCHAR2(50),
  DEL_FLAG VARCHAR2(2) default 'N',
  REMARKS     VARCHAR2(500),
  CREATE_DATE DATE default SYSDATE not null,
  CREATE_BY   VARCHAR2(50) default 'SYSTEM' not null,
  UPDATE_DATE DATE,
  UPDATE_BY   VARCHAR2(50)
);
 -- Add comments to the table 
comment on table TB_USC_UNITS
  is '单位表';
comment on column TB_USC_UNITS.UNITS_ID
  is '单位ID';
comment on column TB_USC_UNITS.UNITS_CODE
  is '单位编码';
comment on column TB_USC_UNITS.UNITS_NAME
  is '单位名称';
comment on column TB_USC_UNITS.DEL_FLAG
  is '删除标志，‘N’未删除，''Y''代表删除';
comment on column TB_USC_UNITS.REMARKS
  is '备注';
comment on column TB_USC_UNITS.CREATE_DATE
  is '创建时间';
comment on column TB_USC_UNITS.CREATE_BY
  is '创建人';
comment on column TB_USC_UNITS.UPDATE_DATE
  is '更新时间';
comment on column TB_USC_UNITS.UPDATE_BY
  is '更新人';
alter table TB_USC_UNITS
  add primary key (UNITS_ID);
  
create table TB_USC_MATERIAL_UNITS_MAPPING(
  MATERIAL_UNITS_ID   VARCHAR2(10) not null,
  MATERIAL_ID         VARCHAR2(50) not null,
  UNITS_MIN_CODE      VARCHAR2(10) not null,
  MATERIAL_UNITS_CODE VARCHAR2(10),
  PACKAGE_RATE        NUMBER(10,2),
  CREATE_DATE         DATE,
  CREATE_BY           VARCHAR2(50),
  UPDATE_DATE         DATE,
  UPDATE_BY           VARCHAR2(50),
  DEL_FLAG         VARCHAR2(2) default 'N',
  REMARKS             VARCHAR2(500)
);
-- Add comments to the table 
comment on table TB_USC_MATERIAL_UNITS_MAPPING
  is '物资单位关系转换表';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.MATERIAL_UNITS_ID
  is '主键，序列';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.MATERIAL_ID
  is '物资ID';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.UNITS_MIN_CODE
  is '最小单位编码';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.MATERIAL_UNITS_CODE
  is '物资单位编码';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.PACKAGE_RATE
  is '换算转换比';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.CREATE_DATE
  is '创建时间';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.CREATE_BY
  is '创建者';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.UPDATE_DATE
  is '更新时间';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.UPDATE_BY
  is '更新者';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.DEL_FLAG
  is '删除标志 ’N‘代表未删除，’Y‘代表已删除';
comment on column TB_USC_MATERIAL_UNITS_MAPPING.REMARKS
  is '描述';
  
-- Create table
create table TB_USC_CHARGING_STANDARD
(
  CHARGE_CODE VARCHAR2(10) not null,
  CHARGE_NAME VARCHAR2(100) not null,
  PRICE1      NUMBER(10,4) not null,
  PRICE2      NUMBER(10,4),
  START_DATE  DATE,
  END_DATE    DATE,
  REMARKS     VARCHAR2(500),
  DEL_FLAG    VARCHAR2(1) default 'N',
  CREATE_BY   VARCHAR2(50) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(50) not null,
  UPDATE_DATE DATE not null
);
-- Add comments to the table 
comment on table TB_USC_CHARGING_STANDARD
  is '收费物资标准表';
-- Add comments to the columns 
comment on column TB_USC_CHARGING_STANDARD.CHARGE_CODE
  is '收费物资编码';
comment on column TB_USC_CHARGING_STANDARD.CHARGE_NAME
  is '收费物资名称';
comment on column TB_USC_CHARGING_STANDARD.PRICE1
  is '价格1';
comment on column TB_USC_CHARGING_STANDARD.PRICE2
  is '价格2';
comment on column TB_USC_CHARGING_STANDARD.START_DATE
  is '开始日期';
comment on column TB_USC_CHARGING_STANDARD.END_DATE
  is '截止日期';
comment on column TB_USC_CHARGING_STANDARD.REMARKS
  is '备注';
comment on column TB_USC_CHARGING_STANDARD.DEL_FLAG
  is '删除标识';
comment on column TB_USC_CHARGING_STANDARD.CREATE_BY
  is '创建人';
comment on column TB_USC_CHARGING_STANDARD.CREATE_DATE
  is '创建日期';
comment on column TB_USC_CHARGING_STANDARD.UPDATE_BY
  is '更新人';
comment on column TB_USC_CHARGING_STANDARD.UPDATE_DATE
  is '更新日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_CHARGING_STANDARD
  add constraint PK_USC_CHARGING_STANDARD primary key (CHARGE_CODE);
  
create table TB_USC_APPROVE_DETAIL(
  APPROVE_DOCUMENTS_ID  NUMBER(10) not null,
  APPROVE_LINE_ID       NUMBER(10),
  ORG_ID                VARCHAR2(10) ,
  APPROVE_PERSON_NO     VARCHAR2(15),
  APPROVE_PERSON_NAME   VARCHAR2(100),
  APPROVE_PERSON_TYPE   VARCHAR2(2),
  APPROVE_PERSON_EMAIL  VARCHAR2(100),
  APPROVE_PERSON_MOBILE VARCHAR2(15),
  APPROVE_ORDER         NUMBER(3),
  SPECIAL_APPROVE_SPEC  VARCHAR2(100),
  SPECIAL_APPROVE_DESC  VARCHAR2(500),
  APPROVE_PERSON_TIME   DATE,
  APPROVE_STATUS        VARCHAR2(50),
  APPROVE_DESC          VARCHAR2(500),
  CREATE_BY             VARCHAR2(50),
  CREATE_DATE           DATE,
  UPDATE_BY             VARCHAR2(50),
  UPDATE_DATE           DATE
);
comment on table TB_USC_APPROVE_DETAIL
  is '审批明细表';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_DOCUMENTS_ID
  is '待审批文档流水号 ,待审批文档编号,在需要审批的文件或数据对应表中关联该字段';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_LINE_ID
  is '待审批文档审批线明细ID,待审批文档流水号下面具体审批先上的明细ID';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_NO
  is '审批人编号';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_NAME
  is '审批人姓名';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_TYPE
  is '审批人类型,"例如：A：审批人,可调整；F：固定审批人，不可调整；C：CC对象，将审批结果CC给相关人"';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_EMAIL
  is '审批人邮件';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_MOBILE
  is '审批人手机';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_ORDER
  is '审批顺序';
comment on column TB_USC_APPROVE_DETAIL.SPECIAL_APPROVE_SPEC
  is '特殊审批功能 ，比如定义供应商审批时，按顺序指定审批内容，填写审批内容自定义编码或者是页面Tab页签ID等';
comment on column TB_USC_APPROVE_DETAIL.SPECIAL_APPROVE_DESC
  is '特殊审批功能说明，对特殊审批功能的说明';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_PERSON_TIME
  is '审批时间';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_STATUS
  is '审批状态';
comment on column TB_USC_APPROVE_DETAIL.APPROVE_DESC
  is '审批说明';
comment on column TB_USC_APPROVE_DETAIL.CREATE_BY
  is '创建人';
comment on column TB_USC_APPROVE_DETAIL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_APPROVE_DETAIL.UPDATE_BY
  is '更新人';
comment on column TB_USC_APPROVE_DETAIL.UPDATE_DATE
  is '更新日期';


create table TB_USC_APPROVE_MANAGEMENT
(
  MANAGEMENT_ID         NUMBER(10) not null,
  ORG_ID               VARCHAR2(10) not null,
  APPROVE_TYPE_CODE    VARCHAR2(30) not null,
  APPROVE_ORDER        NUMBER(3) not null,
  APPROVE_PERSON_NO    VARCHAR2(15) not null,
  APPROVE_PERSON_NAME  VARCHAR2(100),
  SPECIAL_APPROVE_SPEC VARCHAR2(100),
  SPECIAL_APPROVE_DESC VARCHAR2(500),
  USE_FLAG             VARCHAR2(2) default 'Y' not null,
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE
);
comment on table TB_USC_APPROVE_MANAGEMENT
  is '审批线管理表';
comment on column TB_USC_APPROVE_MANAGEMENT.ORG_ID
  is '组织ID 医院编码';
comment on column TB_USC_APPROVE_MANAGEMENT.APPROVE_TYPE_CODE
  is '审批线代码  、例：供应商审批、物资审批。信息在公共代码表维护';
comment on column TB_USC_APPROVE_MANAGEMENT.APPROVE_ORDER
  is '审批顺序';
comment on column TB_USC_APPROVE_MANAGEMENT.APPROVE_PERSON_NO
  is '审批人员工号';
comment on column TB_USC_APPROVE_MANAGEMENT.APPROVE_PERSON_NAME
  is '审批人姓名';
comment on column TB_USC_APPROVE_MANAGEMENT.SPECIAL_APPROVE_SPEC
  is '特殊审批功能 比如定义供应商审批时，按顺序指定审批内容，填写审批内容自定义编码或者是页面Tab页签ID等';
comment on column TB_USC_APPROVE_MANAGEMENT.SPECIAL_APPROVE_DESC
  is '特殊审批功能说明 、对特殊审批功能的说明';
comment on column TB_USC_APPROVE_MANAGEMENT.USE_FLAG
  is '启用与否';
comment on column TB_USC_APPROVE_MANAGEMENT.CREATE_BY
  is '创建人';
comment on column TB_USC_APPROVE_MANAGEMENT.CREATE_DATE
  is '创建日期';
comment on column TB_USC_APPROVE_MANAGEMENT.UPDATE_BY
  is '更新人';
comment on column TB_USC_APPROVE_MANAGEMENT.UPDATE_DATE
  is '更新日期';
alter table TB_USC_APPROVE_MANAGEMENT
  add constraint PK_MANAGEMENT_ID primary key (MANAGEMENT_ID);

create table TB_USC_APPROVE_MASTER(
  APPROVE_DOCUMENTS_ID NUMBER(10) not null,
  ORG_ID               VARCHAR2(10) not null,
  APPROVE_PERSON_NEXT  VARCHAR2(15),
  APPROVE_PERSON_LAST  VARCHAR2(15),
  APPROVE_TIME_LAST    DATE,
  APPROVE_STATUS       VARCHAR2(50),
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE
);
comment on table TB_USC_APPROVE_MASTER
  is '审批主表';
comment on column TB_USC_APPROVE_MASTER.APPROVE_DOCUMENTS_ID
  is '待审批文档流水号 、待审批文档编号，在需要审批的文件或数据对应表中关联该字段';
comment on column TB_USC_APPROVE_MASTER.ORG_ID
  is '组织ID 、医院编码';
comment on column TB_USC_APPROVE_MASTER.APPROVE_PERSON_NEXT
  is '下一审批人编号';
comment on column TB_USC_APPROVE_MASTER.APPROVE_PERSON_LAST
  is '已审批的最后一个审批人编号';
comment on column TB_USC_APPROVE_MASTER.APPROVE_TIME_LAST
  is '已审批的最后审批时间';
comment on column TB_USC_APPROVE_MASTER.APPROVE_STATUS
  is '审批状态';
comment on column TB_USC_APPROVE_MASTER.CREATE_BY
  is '创建人';
comment on column TB_USC_APPROVE_MASTER.CREATE_DATE
  is '创建日期';
comment on column TB_USC_APPROVE_MASTER.UPDATE_BY
  is '更新人';
comment on column TB_USC_APPROVE_MASTER.UPDATE_DATE
  is '更新日期';

create table TB_USC_AUTHORIZATION(
  AUTHORIZATION_ID   VARCHAR2(10) not null,
  VENDOR_NAME        VARCHAR2(500),
  AUTHORIZATION_CODE VARCHAR2(20),
  VENDOR_CODE        VARCHAR2(10),
  IS_USE             VARCHAR2(2),
  EMAIL				 VARCHAR2(50),
  CREATE_BY          VARCHAR2(50),
  CREATE_DATE        DATE,
  UPDATE_BY          VARCHAR2(50),
  UPDATE_DATE        DATE,
  SYNC_TIME          DATE,
  REMARKS            VARCHAR2(500),
  DEL_FLAG           VARCHAR2(1) default 'N'
);
comment on table TB_USC_AUTHORIZATION
  is '供应商注册授权码';
comment on column TB_USC_AUTHORIZATION.AUTHORIZATION_ID
  is '主键';
comment on column TB_USC_AUTHORIZATION.VENDOR_NAME
  is '供应商名称';
comment on column TB_USC_AUTHORIZATION.AUTHORIZATION_CODE
  is '授权码';
comment on column TB_USC_AUTHORIZATION.VENDOR_CODE
  is '供应商代码,使用后，写入注册的编码';
comment on column TB_USC_AUTHORIZATION.IS_USE
  is '授权码状态：Y:已使用; N:未使用; O:已过期';
comment on column TB_USC_AUTHORIZATION.EMAIL
  is '接收授权码电子邮箱';
comment on column TB_USC_AUTHORIZATION.CREATE_BY
  is '创建人';
comment on column TB_USC_AUTHORIZATION.CREATE_DATE
  is '创建日期';
comment on column TB_USC_AUTHORIZATION.UPDATE_BY
  is '更新人';
comment on column TB_USC_AUTHORIZATION.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_AUTHORIZATION.REMARKS
  is '备注';
comment on column TB_USC_AUTHORIZATION.DEL_FLAG
  is '删除标识';
comment on column TB_USC_AUTHORIZATION.SYNC_TIME 
is '同步时间';

alter table TB_USC_AUTHORIZATION
  add constraint PK_TB_USC_AUTHORIZATION primary key (AUTHORIZATION_ID);


create table TB_USC_VENDOR(
  vendor_id                   NUMBER(10) not null,
  org_id                      VARCHAR2(10) default '1000' not null,
  vendor_code                 VARCHAR2(50),
  vendor_ch_name              VARCHAR2(500),
  vendor_ch_short_name        VARCHAR2(500),
  vendor_en_name              VARCHAR2(500),
  vendor_en_short_name        VARCHAR2(500),
  assist_code1                VARCHAR2(50),
  assist_code2                VARCHAR2(50),
  assist_code3                VARCHAR2(50),
  vendor_category             VARCHAR2(50),
  nation                      VARCHAR2(3),
  office_address              VARCHAR2(500),
  office_postcode             VARCHAR2(50),
  contact1                    VARCHAR2(25),
  tel1                        VARCHAR2(15),
  fax                         VARCHAR2(50),
  email1                      VARCHAR2(50),
  website                     VARCHAR2(100),
  mobile_phone1               VARCHAR2(20),
  status                      VARCHAR2(2),
  remarks                     VARCHAR2(500),
  corporation                 VARCHAR2(50),
  company_type                VARCHAR2(100),
  create_by                   VARCHAR2(50),
  create_date                 DATE,
  update_by                   VARCHAR2(50),
  update_date                 DATE,
  del_flag                    VARCHAR2(1) default 'N',
  approve_option              VARCHAR2(500),
  introduction                VARCHAR2(500),
  tax_id                      VARCHAR2(50),
  currency                    VARCHAR2(10),
  bank_name                   VARCHAR2(100),
  bank_branch                 VARCHAR2(200),
  bank_account                VARCHAR2(50),
  invoice_name                VARCHAR2(100),
  invoice_type                VARCHAR2(50),
  qq1                         VARCHAR2(15),
  we_chat1                    VARCHAR2(50),
  contact2                    VARCHAR2(25),
  tel2                        VARCHAR2(15),
  qq2                         VARCHAR2(15),
  mobile_phone2               VARCHAR2(20),
  email2                      VARCHAR2(50),
  we_chat2                    VARCHAR2(50),
  city                        VARCHAR2(80),
  area                        VARCHAR2(6),
  registered_address          VARCHAR2(120),
  tolerance_range             VARCHAR2(2000),
  payment_mode_code           VARCHAR2(10),
  payment_mode_name           VARCHAR2(50),
  reconciliation_account      VARCHAR2(10),
  payment_clause_code         VARCHAR2(10),
  payment_clause_name         VARCHAR2(50),
  registered_fund             VARCHAR2(15)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR
  is '供应商基础信息';
-- Add comments to the columns 
comment on column TB_USC_VENDOR.vendor_id
  is '主键，系统序号';
comment on column TB_USC_VENDOR.org_id
  is '组织ID';
comment on column TB_USC_VENDOR.vendor_code
  is '供应商代码';
comment on column TB_USC_VENDOR.vendor_ch_name
  is '供应商中文名称';
comment on column TB_USC_VENDOR.vendor_ch_short_name
  is '供应商中文简称';
comment on column TB_USC_VENDOR.vendor_en_name
  is '供应商英文名称';
comment on column TB_USC_VENDOR.vendor_en_short_name
  is '供应商英文简称';
comment on column TB_USC_VENDOR.assist_code1
  is '助记码1';
comment on column TB_USC_VENDOR.assist_code2
  is '助记码2';
comment on column TB_USC_VENDOR.assist_code3
  is '助记码3';
comment on column TB_USC_VENDOR.vendor_category
  is '供应商分类';
comment on column TB_USC_VENDOR.nation
  is '国家编码';
comment on column TB_USC_VENDOR.office_address
  is '办公地址';
comment on column TB_USC_VENDOR.office_postcode
  is '邮政编码';
comment on column TB_USC_VENDOR.contact1
  is '委托联系人1';
comment on column TB_USC_VENDOR.tel1
  is '固定电话1';
comment on column TB_USC_VENDOR.fax
  is '传真';
comment on column TB_USC_VENDOR.email1
  is '联系人邮箱1';
comment on column TB_USC_VENDOR.website
  is '网址';
comment on column TB_USC_VENDOR.mobile_phone1
  is '移动电话1';
comment on column TB_USC_VENDOR.status
  is '供应商审批状态,00:待审核;01:审核通过;02:审核拒绝'';';
comment on column TB_USC_VENDOR.remarks
  is '备注';
comment on column TB_USC_VENDOR.corporation
  is '法人代表';
comment on column TB_USC_VENDOR.company_type
  is '公司类型';
comment on column TB_USC_VENDOR.create_by
  is '创建人';
comment on column TB_USC_VENDOR.create_date
  is '创建日期';
comment on column TB_USC_VENDOR.update_by
  is '更新人';
comment on column TB_USC_VENDOR.update_date
  is '更新日期';
comment on column TB_USC_VENDOR.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR.approve_option
  is '审批意见';
comment on column TB_USC_VENDOR.introduction
  is '公司简介';
comment on column TB_USC_VENDOR.tax_id
  is '供应商税号';
comment on column TB_USC_VENDOR.currency
  is '币种';
comment on column TB_USC_VENDOR.bank_name
  is '开户银行';
comment on column TB_USC_VENDOR.bank_branch
  is '开户网点';
comment on column TB_USC_VENDOR.bank_account
  is '银行账号';
comment on column TB_USC_VENDOR.invoice_name
  is '开票单位名称';
comment on column TB_USC_VENDOR.invoice_type
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR.qq1
  is 'QQ1';
comment on column TB_USC_VENDOR.we_chat1
  is '微信1';
comment on column TB_USC_VENDOR.contact2
  is '委托联系人2';
comment on column TB_USC_VENDOR.tel2
  is '固定电话2';
comment on column TB_USC_VENDOR.qq2
  is 'QQ2';
comment on column TB_USC_VENDOR.mobile_phone2
  is '移动电话2';
comment on column TB_USC_VENDOR.email2
  is '联系人邮箱2';
comment on column TB_USC_VENDOR.we_chat2
  is '微信2';
comment on column TB_USC_VENDOR.city
  is '城市名称';
comment on column TB_USC_VENDOR.area
  is '地区，省/直辖市,参考码表地区编码';
comment on column TB_USC_VENDOR.registered_address
  is '注册地址';
comment on column TB_USC_VENDOR.tolerance_range
  is '经营许可范围';
comment on column TB_USC_VENDOR.payment_mode_code
  is '支付方式编码';
comment on column TB_USC_VENDOR.payment_mode_name
  is '支付方式名称，现金/银行汇票/银行转账 等，';
comment on column TB_USC_VENDOR.reconciliation_account
  is '统驭科目';
comment on column TB_USC_VENDOR.payment_clause_code
  is '付款条件编码';
comment on column TB_USC_VENDOR.payment_clause_name
  is '付款条件名称，如：账期';
comment on column TB_USC_VENDOR.registered_fund
  is '注册资金，万元';


-- 供应商基本信息审核表
create table TB_USC_VENDOR_APPROVE(
  vendor_approve_id           VARCHAR2(10) not null,
  org_id                      VARCHAR2(10) default '1000' not null,
  VENDOR_ID 				  varchar2(10),
  vendor_code                 VARCHAR2(50),
  vendor_ch_name              VARCHAR2(500),
  vendor_ch_short_name        VARCHAR2(500),
  vendor_en_name              VARCHAR2(500),
  vendor_en_short_name        VARCHAR2(500),
  assist_code1                VARCHAR2(50),
  assist_code2                VARCHAR2(50),
  assist_code3                VARCHAR2(50),
  vendor_category             VARCHAR2(50),
  nation                      VARCHAR2(3),
  office_address              VARCHAR2(500),
  office_postcode             VARCHAR2(50),
  contact1                    VARCHAR2(25),
  tel1                        VARCHAR2(15),
  fax                         VARCHAR2(50),
  email1                      VARCHAR2(50),
  website                     VARCHAR2(100),
  mobile_phone1               VARCHAR2(20),
  status                      VARCHAR2(2),
  remarks                     VARCHAR2(500),
  corporation                 VARCHAR2(50),
  company_type                VARCHAR2(100),
  create_by                   VARCHAR2(50),
  create_date                 DATE,
  update_by                   VARCHAR2(50),
  update_date                 DATE,
  del_flag                    VARCHAR2(1) default 'N',
  approve_option              VARCHAR2(500),
  introduction                VARCHAR2(500),
  tax_id                      VARCHAR2(50),
  currency                    VARCHAR2(10),
  bank_name                   VARCHAR2(100),
  bank_branch                 VARCHAR2(200),
  bank_account                VARCHAR2(50),
  invoice_name                VARCHAR2(100),
  invoice_type                VARCHAR2(50),
  qq1                         VARCHAR2(15),
  we_chat1                    VARCHAR2(50),
  contact2                    VARCHAR2(25),
  tel2                        VARCHAR2(15),
  qq2                         VARCHAR2(15),
  mobile_phone2               VARCHAR2(20),
  email2                      VARCHAR2(50),
  we_chat2                    VARCHAR2(50),
  city                        VARCHAR2(80),
  area                        VARCHAR2(6),
  registered_address          VARCHAR2(120),
  tolerance_range             VARCHAR2(2000),
  payment_mode_code           VARCHAR2(10),
  payment_mode_name           VARCHAR2(50),
  vendor_documents_id 		  NUMBER(10),
  reconciliation_account      VARCHAR2(10),
  payment_clause_code         VARCHAR2(10),
  payment_clause_name         VARCHAR2(50),
  registered_fund             VARCHAR2(15)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR_APPROVE
  is '供应商基础信息审批表';
-- Add comments to the columns 
comment on column TB_USC_VENDOR_APPROVE.vendor_approve_id
  is '主键，系统序号';
comment on column TB_USC_VENDOR_APPROVE.org_id
  is '组织ID';
comment on column TB_USC_VENDOR_APPROVE.vendor_code
  is '供应商代码';
comment on column TB_USC_VENDOR_APPROVE.vendor_ch_name
  is '供应商中文名称';
comment on column TB_USC_VENDOR_APPROVE.vendor_ch_short_name
  is '供应商中文简称';
comment on column TB_USC_VENDOR_APPROVE.vendor_en_name
  is '供应商英文名称';
comment on column TB_USC_VENDOR_APPROVE.vendor_en_short_name
  is '供应商英文简称';
comment on column TB_USC_VENDOR_APPROVE.assist_code1
  is '助记码1';
comment on column TB_USC_VENDOR_APPROVE.assist_code2
  is '助记码2';
comment on column TB_USC_VENDOR_APPROVE.assist_code3
  is '助记码3';
comment on column TB_USC_VENDOR_APPROVE.vendor_category
  is '供应商分类';
comment on column tb_usc_vendor_approve.VENDOR_ID is '供应商ID';
comment on column TB_USC_VENDOR_APPROVE.nation
  is '国家编码';
comment on column TB_USC_VENDOR_APPROVE.office_address
  is '办公地址';
comment on column TB_USC_VENDOR_APPROVE.office_postcode
  is '邮政编码';
comment on column TB_USC_VENDOR_APPROVE.contact1
  is '委托联系人1';
comment on column TB_USC_VENDOR_APPROVE.tel1
  is '固定电话1';
comment on column TB_USC_VENDOR_APPROVE.vendor_documents_id
  is '审批ID';
comment on column TB_USC_VENDOR_APPROVE.fax
  is '传真';
comment on column TB_USC_VENDOR_APPROVE.email1
  is '联系人邮箱1';
comment on column TB_USC_VENDOR_APPROVE.website
  is '网址';
comment on column TB_USC_VENDOR_APPROVE.mobile_phone1
  is '移动电话1';
comment on column TB_USC_VENDOR_APPROVE.status
  is '供应商审批状态,00:待审核;01:审核通过;02:审核拒绝';
comment on column TB_USC_VENDOR_APPROVE.remarks
  is '备注';
comment on column TB_USC_VENDOR_APPROVE.corporation
  is '法人代表';
comment on column TB_USC_VENDOR_APPROVE.company_type
  is '公司类型';
comment on column TB_USC_VENDOR_APPROVE.create_by
  is '创建人';
comment on column TB_USC_VENDOR_APPROVE.create_date
  is '创建日期';
comment on column TB_USC_VENDOR_APPROVE.update_by
  is '更新人';
comment on column TB_USC_VENDOR_APPROVE.update_date
  is '更新日期';
comment on column TB_USC_VENDOR_APPROVE.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR_APPROVE.approve_option
  is '审批意见';
comment on column TB_USC_VENDOR_APPROVE.introduction
  is '公司简介';
comment on column TB_USC_VENDOR_APPROVE.tax_id
  is '供应商税号';
comment on column TB_USC_VENDOR_APPROVE.currency
  is '币种';
comment on column TB_USC_VENDOR_APPROVE.bank_name
  is '开户银行';
comment on column TB_USC_VENDOR_APPROVE.bank_branch
  is '开户网点';
comment on column TB_USC_VENDOR_APPROVE.bank_account
  is '银行账号';
comment on column TB_USC_VENDOR_APPROVE.invoice_name
  is '开票单位名称';
comment on column TB_USC_VENDOR_APPROVE.invoice_type
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR_APPROVE.qq1
  is 'QQ1';
comment on column TB_USC_VENDOR_APPROVE.we_chat1
  is '微信1';
comment on column TB_USC_VENDOR_APPROVE.contact2
  is '委托联系人2';
comment on column TB_USC_VENDOR_APPROVE.tel2
  is '固定电话2';
comment on column TB_USC_VENDOR_APPROVE.qq2
  is 'QQ2';
comment on column TB_USC_VENDOR_APPROVE.mobile_phone2
  is '移动电话2';
comment on column TB_USC_VENDOR_APPROVE.email2
  is '联系人邮箱2';
comment on column TB_USC_VENDOR_APPROVE.we_chat2
  is '微信2';
comment on column TB_USC_VENDOR_APPROVE.city
  is '城市名称';
comment on column TB_USC_VENDOR_APPROVE.area
  is '地区，省/直辖市,参考码表地区编码';
comment on column TB_USC_VENDOR_APPROVE.registered_address
  is '注册地址';
comment on column TB_USC_VENDOR_APPROVE.tolerance_range
  is '经营许可范围';
comment on column TB_USC_VENDOR_APPROVE.payment_mode_code
  is '支付方式编码';
comment on column TB_USC_VENDOR_APPROVE.payment_mode_name
  is '支付方式名称，现金/银行汇票/银行转账 等，';
comment on column TB_USC_VENDOR_APPROVE.reconciliation_account
  is '统驭科目';
comment on column TB_USC_VENDOR_APPROVE.payment_clause_code
  is '付款条件编码';
comment on column TB_USC_VENDOR_APPROVE.payment_clause_name
  is '付款条件名称，如：账期';
comment on column TB_USC_VENDOR_APPROVE.registered_fund
  is '注册资金，万元';

create table TB_USC_VENDOR_CERT_APPROVE(
  cert_approve_id  NUMBER(10) not null,
  certificate_id   NUMBER(10) not null,
  org_id           VARCHAR2(10) default '1000',
  vendor_id        VARCHAR2(10),
  certificate_type VARCHAR2(30),
  certificate_name VARCHAR2(100),
  certificate_no   VARCHAR2(100),
  start_date       DATE,
  close_date       DATE,
  issue_dept       VARCHAR2(500),
  attach_id        VARCHAR2(100),
  create_by        VARCHAR2(50),
  create_date      DATE,
  update_by        VARCHAR2(50),
  update_date      DATE,
  del_flag         VARCHAR2(1) default 'N',
  remarks          VARCHAR2(500),
  manufacture_name VARCHAR2(100),
  manufacture_code VARCHAR2(100),
  agency_order     VARCHAR2(50),
  vendor_name      VARCHAR2(80),
  certificate_code VARCHAR2(20)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR_CERT_APPROVE
  is '供应商资质证审批表';
-- Add comments to the columns 
comment on column TB_USC_VENDOR_CERT_APPROVE.cert_approve_id
  is '资质审核主键';
comment on column TB_USC_VENDOR_CERT_APPROVE.certificate_id
  is 'UPS资质申请表主键';
comment on column TB_USC_VENDOR_CERT_APPROVE.org_id
  is '组织ID';
comment on column TB_USC_VENDOR_CERT_APPROVE.vendor_id
  is '供应商ID';
comment on column TB_USC_VENDOR_CERT_APPROVE.certificate_type
  is '资质证类型：供应商资质、生产商资质、授权资质';
comment on column TB_USC_VENDOR_CERT_APPROVE.certificate_name
  is '资质证名称';
comment on column TB_USC_VENDOR_CERT_APPROVE.certificate_no
  is '证书编号';
comment on column TB_USC_VENDOR_CERT_APPROVE.start_date
  is '生效日期';
comment on column TB_USC_VENDOR_CERT_APPROVE.close_date
  is '失效日期';
comment on column TB_USC_VENDOR_CERT_APPROVE.issue_dept
  is '发证机关';
comment on column TB_USC_VENDOR_CERT_APPROVE.attach_id
  is '附件ID';
comment on column TB_USC_VENDOR_CERT_APPROVE.create_by
  is '创建人';
comment on column TB_USC_VENDOR_CERT_APPROVE.create_date
  is '创建日期';
comment on column TB_USC_VENDOR_CERT_APPROVE.update_by
  is '更新人';
comment on column TB_USC_VENDOR_CERT_APPROVE.update_date
  is '更新日期';
comment on column TB_USC_VENDOR_CERT_APPROVE.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR_CERT_APPROVE.remarks
  is '备注';
comment on column TB_USC_VENDOR_CERT_APPROVE.manufacture_name
  is '生产厂商名称';
comment on column TB_USC_VENDOR_CERT_APPROVE.manufacture_code
  is '生产厂商代码';
comment on column TB_USC_VENDOR_CERT_APPROVE.agency_order
  is '代理顺序';
comment on column TB_USC_VENDOR_CERT_APPROVE.vendor_name
  is '代理商中文名称';
comment on column TB_USC_VENDOR_CERT_APPROVE.certificate_code
  is '资质证名称code';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_VENDOR_CERT_APPROVE
  add constraint PK_TB_USC_VENDOR_CERT_APPROVE primary key (CERTIFICATE_ID);


create table TB_USC_VENDOR_CERTIFICATE(
  certificate_id   NUMBER(10) not null,
  org_id           VARCHAR2(10) default '1000',
  vendor_id        VARCHAR2(10),
  certificate_type VARCHAR2(30),
  certificate_name VARCHAR2(100),
  certificate_no   VARCHAR2(100),
  start_date       DATE,
  close_date       DATE,
  issue_dept       VARCHAR2(500),
  attach_id        VARCHAR2(100),
  create_by        VARCHAR2(50),
  create_date      DATE,
  update_by        VARCHAR2(50),
  update_date      DATE,
  del_flag         VARCHAR2(1) default 'N',
  remarks          VARCHAR2(500),
  manufacture_name VARCHAR2(100),
  manufacture_code VARCHAR2(100),
  agency_order     VARCHAR2(50),
  vendor_name      VARCHAR2(80),
  certificate_code VARCHAR2(20),
  CERT_VALIDITY_TYPE  varchar2(50)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR_CERTIFICATE
  is '供应商资质证';
-- Add comments to the columns 
comment on column TB_USC_VENDOR_CERTIFICATE.certificate_id
  is '主键';
comment on column TB_USC_VENDOR_CERTIFICATE.org_id
  is '组织ID';
comment on column TB_USC_VENDOR_CERTIFICATE.vendor_id
  is '供应商ID';
comment on column TB_USC_VENDOR_CERTIFICATE.certificate_type
  is '资质证类型：供应商资质、生产商资质、授权资质';
comment on column TB_USC_VENDOR_CERTIFICATE.certificate_name
  is '资质证名称';
comment on column TB_USC_VENDOR_CERTIFICATE.certificate_no
  is '证书编号';
comment on column TB_USC_VENDOR_CERTIFICATE.start_date
  is '生效日期';
comment on column TB_USC_VENDOR_CERTIFICATE.close_date
  is '失效日期';
comment on column TB_USC_VENDOR_CERTIFICATE.issue_dept
  is '发证机关';
comment on column TB_USC_VENDOR_CERTIFICATE.attach_id
  is '附件ID';
comment on column TB_USC_VENDOR_CERTIFICATE.create_by
  is '创建人';
comment on column TB_USC_VENDOR_CERTIFICATE.create_date
  is '创建日期';
comment on column TB_USC_VENDOR_CERTIFICATE.update_by
  is '更新人';
comment on column TB_USC_VENDOR_CERTIFICATE.update_date
  is '更新日期';
comment on column TB_USC_VENDOR_CERTIFICATE.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR_CERTIFICATE.remarks
  is '备注';
comment on column TB_USC_VENDOR_CERTIFICATE.manufacture_name
  is '生产厂商名称';
comment on column TB_USC_VENDOR_CERTIFICATE.manufacture_code
  is '生产厂商代码';
comment on column TB_USC_VENDOR_CERTIFICATE.agency_order
  is '代理顺序';
comment on column TB_USC_VENDOR_CERTIFICATE.vendor_name
  is '代理商中文名称';
comment on column TB_USC_VENDOR_CERTIFICATE.certificate_code
  is '资质证名称code';
comment on column TB_USC_VENDOR_CERTIFICATE.CERT_VALIDITY_TYPE
  is '资质有效类型';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_VENDOR_CERTIFICATE
  add constraint PK_TB_USC_VENDOR_CERTIFICATE primary key (CERTIFICATE_ID);

create table TB_USC_VENDOR_CERT_HISTORY(
  cert_history_id  NUMBER(10) not null,
  VENDOR_HISTORY_ID   NUMBER(10) not null,
  org_id           VARCHAR2(10) default '1000',
  vendor_id        VARCHAR2(10),
  certificate_type VARCHAR2(30),
  certificate_name VARCHAR2(100),
  certificate_no   VARCHAR2(100),
  start_date       DATE,
  close_date       DATE,
  issue_dept       VARCHAR2(500),
  attach_id        VARCHAR2(100),
  create_by        VARCHAR2(50),
  create_date      DATE,
  update_by        VARCHAR2(50),
  update_date      DATE,
  del_flag         VARCHAR2(1) default 'N',
  remarks          VARCHAR2(500),
  manufacture_name VARCHAR2(100),
  manufacture_code VARCHAR2(100),
  agency_order     VARCHAR2(50),
  vendor_name      VARCHAR2(80),
  certificate_code VARCHAR2(20)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR_CERT_HISTORY
  is '供应商资质证审批表';
-- Add comments to the columns 
comment on column TB_USC_VENDOR_CERT_HISTORY.cert_history_id
  is '主键';
comment on column TB_USC_VENDOR_CERT_HISTORY.VENDOR_HISTORY_ID
  is 'UPS资质申请表主键';
comment on column TB_USC_VENDOR_CERT_HISTORY.org_id
  is '组织ID';
comment on column TB_USC_VENDOR_CERT_HISTORY.vendor_id
  is '供应商ID';
comment on column TB_USC_VENDOR_CERT_HISTORY.certificate_type
  is '资质证类型：供应商资质、生产商资质、授权资质';
comment on column TB_USC_VENDOR_CERT_HISTORY.certificate_name
  is '资质证名称';
comment on column TB_USC_VENDOR_CERT_HISTORY.certificate_no
  is '证书编号';
comment on column TB_USC_VENDOR_CERT_HISTORY.start_date
  is '生效日期';
comment on column TB_USC_VENDOR_CERT_HISTORY.close_date
  is '失效日期';
comment on column TB_USC_VENDOR_CERT_HISTORY.issue_dept
  is '发证机关';
comment on column TB_USC_VENDOR_CERT_HISTORY.attach_id
  is '附件ID';
comment on column TB_USC_VENDOR_CERT_HISTORY.create_by
  is '创建人';
comment on column TB_USC_VENDOR_CERT_HISTORY.create_date
  is '创建日期';
comment on column TB_USC_VENDOR_CERT_HISTORY.update_by
  is '更新人';
comment on column TB_USC_VENDOR_CERT_HISTORY.update_date
  is '更新日期';
comment on column TB_USC_VENDOR_CERT_HISTORY.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR_CERT_HISTORY.remarks
  is '备注';
comment on column TB_USC_VENDOR_CERT_HISTORY.manufacture_name
  is '生产厂商名称';
comment on column TB_USC_VENDOR_CERT_HISTORY.manufacture_code
  is '生产厂商代码';
comment on column TB_USC_VENDOR_CERT_HISTORY.agency_order
  is '代理顺序';
comment on column TB_USC_VENDOR_CERT_HISTORY.vendor_name
  is '代理商中文名称';
comment on column TB_USC_VENDOR_CERT_HISTORY.certificate_code
  is '资质证名称code';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_VENDOR_CERT_HISTORY
  add constraint PK_TB_USC_VENDOR_CERT_HISTORY primary key (CERT_HISTORY_ID);
  
create table TB_USC_VENDOR_FINANCE(
  FINANCE_ID      NUMBER(10) not null,
  ORG_ID          VARCHAR2(10) default '1000',
  VENDOR_CODE     VARCHAR2(10),
  TAX_ID          VARCHAR2(50),
  CURRENCY        VARCHAR2(10),
  BANK_NAME       VARCHAR2(100),
  BANK_BRANCH     VARCHAR2(200),
  BANK_ACCOUNT_NO VARCHAR2(50),
  INVOICE_NAME    VARCHAR2(100),
  PAYMENT_TYPE    VARCHAR2(100),
  INVOICE_TYPE    VARCHAR2(50),
  CREATE_BY       VARCHAR2(50),
  CREATE_DATE     DATE,
  UPDATE_BY       VARCHAR2(50),
  UPDATE_DATE     DATE,
  DEL_FLAG        VARCHAR2(2) default 'N',
  REMARKS         VARCHAR2(500)
);
comment on table TB_USC_VENDOR_FINANCE
  is '供应商财务相关信息';
comment on column TB_USC_VENDOR_FINANCE.FINANCE_ID
  is '主键';
comment on column TB_USC_VENDOR_FINANCE.ORG_ID
  is '组织ID';
comment on column TB_USC_VENDOR_FINANCE.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_FINANCE.TAX_ID
  is '供应商税号';
comment on column TB_USC_VENDOR_FINANCE.CURRENCY
  is '币种';
comment on column TB_USC_VENDOR_FINANCE.BANK_NAME
  is '开户银行';
comment on column TB_USC_VENDOR_FINANCE.BANK_BRANCH
  is '开户网点';
comment on column TB_USC_VENDOR_FINANCE.BANK_ACCOUNT_NO
  is '银行帐号';
comment on column TB_USC_VENDOR_FINANCE.INVOICE_NAME
  is '单位开票名称';
comment on column TB_USC_VENDOR_FINANCE.PAYMENT_TYPE
  is '支付方式：现金、银行汇票、银行转账';
comment on column TB_USC_VENDOR_FINANCE.INVOICE_TYPE
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR_FINANCE.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_FINANCE.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_FINANCE.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_FINANCE.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_FINANCE.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_FINANCE.REMARKS
  is '备注';
alter table TB_USC_VENDOR_FINANCE
  add constraint PK_TB_USC_VENDOR_FINANCE primary key (FINANCE_ID);


create table TB_USC_VENDOR_FINANCE_APPROVE(
  FINANCE_APPROVE_ID NUMBER(10) not null,
  FINANCE_ID         NUMBER(10),
  ORG_ID             VARCHAR2(10) default '1000',
  VENDOR_CODE        VARCHAR2(10),
  TAX_ID             VARCHAR2(50),
  CURRENCY           VARCHAR2(10),
  BANK_NAME          VARCHAR2(100),
  BANK_BRANCH        VARCHAR2(200),
  BANK_ACCOUNT_NO    VARCHAR2(50),
  INVOICE_NAME       VARCHAR2(100),
  PAYMENT_TYPE       VARCHAR2(100),
  INVOICE_TYPE       VARCHAR2(50),
  CREATE_BY          VARCHAR2(50),
  CREATE_DATE        DATE,
  UPDATE_BY          VARCHAR2(50),
  UPDATE_DATE        DATE,
  DEL_FLAG           VARCHAR2(2) default 'N',
  REMARKS            VARCHAR2(500)
);
comment on table TB_USC_VENDOR_FINANCE_APPROVE
  is '供应商财务相关信息审批表';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.FINANCE_APPROVE_ID
  is '主键';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.ORG_ID
  is '组织ID';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.TAX_ID
  is '供应商税号';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.CURRENCY
  is '币种';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.BANK_NAME
  is '开户银行';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.BANK_BRANCH
  is '开户网点';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.BANK_ACCOUNT_NO
  is '银行帐号';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.INVOICE_NAME
  is '单位开票名称';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.PAYMENT_TYPE
  is '支付方式：现金、银行汇票、银行转账';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.INVOICE_TYPE
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_FINANCE_APPROVE.REMARKS
  is '备注';
alter table TB_USC_VENDOR_FINANCE_APPROVE
  add constraint PK_TB_USC_VENDOR_FINANCE_APPLY primary key (FINANCE_APPROVE_ID);


create table TB_USC_VENDOR_FINANCE_HISTORY(
  FINANCE_HISTORY_ID NUMBER(10) not null,
  FINANCE_ID         NUMBER(10),
  ORG_ID             VARCHAR2(10) default '1000',
  VENDOR_CODE        VARCHAR2(10),
  TAX_ID             VARCHAR2(50),
  CURRENCY           VARCHAR2(10),
  BANK_NAME          VARCHAR2(100),
  BANK_BRANCH        VARCHAR2(200),
  BANK_ACCOUNT_NO    VARCHAR2(50),
  INVOICE_NAME       VARCHAR2(100),
  PAYMENT_TYPE       VARCHAR2(100),
  INVOICE_TYPE       VARCHAR2(50),
  CREATE_BY          VARCHAR2(50),
  CREATE_DATE        DATE,
  UPDATE_BY          VARCHAR2(50),
  UPDATE_DATE        DATE,
  DEL_FLAG           VARCHAR2(1) default 'N',
  REMARKS            VARCHAR2(500)
);
comment on table TB_USC_VENDOR_FINANCE_HISTORY
  is '供应商财务相关信息历史表';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.FINANCE_HISTORY_ID
  is '主键';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.ORG_ID
  is '组织ID';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.TAX_ID
  is '供应商税号';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.CURRENCY
  is '币种';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.BANK_NAME
  is '开户银行';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.BANK_BRANCH
  is '开户网点';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.BANK_ACCOUNT_NO
  is '银行帐号';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.INVOICE_NAME
  is '单位开票名称';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.PAYMENT_TYPE
  is '支付方式：现金、银行汇票、银行转账';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.INVOICE_TYPE
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_FINANCE_HISTORY.REMARKS
  is '备注';
alter table TB_USC_VENDOR_FINANCE_HISTORY
  add constraint PK_TB_USC_VENDOR_FINANCE_HISTO primary key (FINANCE_HISTORY_ID);

create table TB_USC_VENDOR_HISTORY(
  vendor_history_id      NUMBER(10) not null,
  org_id                 VARCHAR2(10) default '1000' not null,
  vendor_code            VARCHAR2(50),
  vendor_ch_name         VARCHAR2(500),
  vendor_ch_short_name   VARCHAR2(500),
  vendor_en_name         VARCHAR2(500),
  vendor_en_short_name   VARCHAR2(500),
  assist_code1           VARCHAR2(50),
  assist_code2           VARCHAR2(50),
  assist_code3           VARCHAR2(50),
  vendor_category        VARCHAR2(50),
  nation                 VARCHAR2(3),
  office_address         VARCHAR2(500),
  office_postcode        VARCHAR2(50),
  contact1               VARCHAR2(25),
  tel1                   VARCHAR2(15),
  fax                    VARCHAR2(50),
  email1                 VARCHAR2(50),
  website                VARCHAR2(100),
  mobile_phone1          VARCHAR2(20),
  status                 VARCHAR2(2),
  remarks                VARCHAR2(500),
  corporation            VARCHAR2(50),
  company_type           VARCHAR2(100),
  create_by              VARCHAR2(50),
  create_date            DATE,
  update_by              VARCHAR2(50),
  update_date            DATE,
  del_flag               VARCHAR2(1) default 'N',
  approve_option         VARCHAR2(500),
  introduction           VARCHAR2(500),
  tax_id                 VARCHAR2(50),
  currency               VARCHAR2(10),
  bank_name              VARCHAR2(100),
  bank_branch            VARCHAR2(200),
  bank_account           VARCHAR2(50),
  invoice_name           VARCHAR2(100),
  invoice_type           VARCHAR2(50),
  qq1                    VARCHAR2(15),
  we_chat1               VARCHAR2(50),
  contact2               VARCHAR2(25),
  tel2                   VARCHAR2(15),
  qq2                    VARCHAR2(15),
  mobile_phone2          VARCHAR2(20),
  email2                 VARCHAR2(50),
  we_chat2               VARCHAR2(50),
  city                   VARCHAR2(80),
  area                   VARCHAR2(6),
  registered_address     VARCHAR2(120),
  tolerance_range        VARCHAR2(2000),
  payment_mode_code      VARCHAR2(10),
  payment_mode_name      VARCHAR2(50),
  reconciliation_account VARCHAR2(10),
  payment_clause_code    VARCHAR2(10),
  payment_clause_name    VARCHAR2(50),
  registered_fund        VARCHAR2(15),
  vendor_id              VARCHAR2(10)
);
-- Add comments to the table 
comment on table TB_USC_VENDOR_HISTORY
  is '供应商基础信息审批表';
-- Add comments to the columns 
comment on column TB_USC_VENDOR_HISTORY.vendor_history_id
  is '主键，系统序号';
comment on column TB_USC_VENDOR_HISTORY.org_id
  is '组织ID';
comment on column TB_USC_VENDOR_HISTORY.vendor_code
  is '供应商代码';
comment on column TB_USC_VENDOR_HISTORY.vendor_ch_name
  is '供应商中文名称';
comment on column TB_USC_VENDOR_HISTORY.vendor_ch_short_name
  is '供应商中文简称';
comment on column TB_USC_VENDOR_HISTORY.vendor_en_name
  is '供应商英文名称';
comment on column TB_USC_VENDOR_HISTORY.vendor_en_short_name
  is '供应商英文简称';
comment on column TB_USC_VENDOR_HISTORY.assist_code1
  is '助记码1';
comment on column TB_USC_VENDOR_HISTORY.assist_code2
  is '助记码2';
comment on column TB_USC_VENDOR_HISTORY.assist_code3
  is '助记码3';
comment on column TB_USC_VENDOR_HISTORY.vendor_category
  is '供应商分类';
comment on column TB_USC_VENDOR_HISTORY.nation
  is '国家编码';
comment on column TB_USC_VENDOR_HISTORY.office_address
  is '办公地址';
comment on column TB_USC_VENDOR_HISTORY.office_postcode
  is '邮政编码';
comment on column TB_USC_VENDOR_HISTORY.contact1
  is '委托联系人1';
comment on column TB_USC_VENDOR_HISTORY.tel1
  is '固定电话1';
comment on column TB_USC_VENDOR_HISTORY.fax
  is '传真';
comment on column TB_USC_VENDOR_HISTORY.email1
  is '联系人邮箱1';
comment on column TB_USC_VENDOR_HISTORY.website
  is '网址';
comment on column TB_USC_VENDOR_HISTORY.mobile_phone1
  is '移动电话1';
comment on column TB_USC_VENDOR_HISTORY.status
  is '供应商审批状态,00:待审核;01:审核通过;02:审核拒绝';
comment on column TB_USC_VENDOR_HISTORY.remarks
  is '备注';
comment on column TB_USC_VENDOR_HISTORY.corporation
  is '法人代表';
comment on column TB_USC_VENDOR_HISTORY.company_type
  is '公司类型';
comment on column TB_USC_VENDOR_HISTORY.create_by
  is '创建人';
comment on column TB_USC_VENDOR_HISTORY.create_date
  is '创建日期';
comment on column TB_USC_VENDOR_HISTORY.update_by
  is '更新人';
comment on column TB_USC_VENDOR_HISTORY.update_date
  is '更新日期';
comment on column TB_USC_VENDOR_HISTORY.del_flag
  is '删除标识';
comment on column TB_USC_VENDOR_HISTORY.approve_option
  is '审批意见';
comment on column TB_USC_VENDOR_HISTORY.introduction
  is '公司简介';
comment on column TB_USC_VENDOR_HISTORY.tax_id
  is '供应商税号';
comment on column TB_USC_VENDOR_HISTORY.currency
  is '币种';
comment on column TB_USC_VENDOR_HISTORY.bank_name
  is '开户银行';
comment on column TB_USC_VENDOR_HISTORY.bank_branch
  is '开户网点';
comment on column TB_USC_VENDOR_HISTORY.bank_account
  is '银行账号';
comment on column TB_USC_VENDOR_HISTORY.invoice_name
  is '开票单位名称';
comment on column TB_USC_VENDOR_HISTORY.invoice_type
  is '发票类型：增值税、普通、增值税普通';
comment on column TB_USC_VENDOR_HISTORY.qq1
  is 'QQ1';
comment on column TB_USC_VENDOR_HISTORY.we_chat1
  is '微信1';
comment on column TB_USC_VENDOR_HISTORY.contact2
  is '委托联系人2';
comment on column TB_USC_VENDOR_HISTORY.tel2
  is '固定电话2';
comment on column TB_USC_VENDOR_HISTORY.qq2
  is 'QQ2';
comment on column TB_USC_VENDOR_HISTORY.mobile_phone2
  is '移动电话2';
comment on column TB_USC_VENDOR_HISTORY.email2
  is '联系人邮箱2';
comment on column TB_USC_VENDOR_HISTORY.we_chat2
  is '微信2';
comment on column TB_USC_VENDOR_HISTORY.city
  is '城市名称';
comment on column TB_USC_VENDOR_HISTORY.area
  is '地区，省/直辖市,参考码表地区编码';
comment on column TB_USC_VENDOR_HISTORY.registered_address
  is '注册地址';
comment on column TB_USC_VENDOR_HISTORY.tolerance_range
  is '经营许可范围';
comment on column TB_USC_VENDOR_HISTORY.payment_mode_code
  is '支付方式编码';
comment on column TB_USC_VENDOR_HISTORY.payment_mode_name
  is '支付方式名称，现金/银行汇票/银行转账 等，';
comment on column TB_USC_VENDOR_HISTORY.reconciliation_account
  is '统驭科目';
comment on column TB_USC_VENDOR_HISTORY.payment_clause_code
  is '付款条件编码';
comment on column TB_USC_VENDOR_HISTORY.payment_clause_name
  is '付款条件名称，如：账期';
comment on column TB_USC_VENDOR_HISTORY.registered_fund
  is '注册资金，万元';
comment on column TB_USC_VENDOR_HISTORY.vendor_id
  is '供应商ID';
  
  alter table TB_USC_VENDOR_HISTORY
  add constraint PK_TB_USC_VENDOR_HISTORY primary key (VENDOR_HISTORY_ID);
 
  
  
create table TB_USC_VENDOR_MATERIAL(
  VENDOR_MATERIAL_ID   VARCHAR2(18) not null,
  VENDOR_ID            NUMBER(10),
  VENDOR_CODE          VARCHAR2(10) ,
  VENDOR_MATERIAL_CODE VARCHAR2(18),
  MATERIAL_ID          VARCHAR2(18),
  ORG_ID               VARCHAR2(10),	
  MATERIAL_CH_NAME     VARCHAR2(80),
  MATERIAL_EN_NAME     VARCHAR2(250),
  TRADE_PRICE          NUMBER(10,4),
  MATERIAL_DESC        VARCHAR2(1000),
  USE_DESC             VARCHAR2(1000),
  MANUFACTURE_CODE     VARCHAR2(50),
  MANUFACTURE_NAME     VARCHAR2(500),
  MATERIAL_UNITS_CODE  VARCHAR2(3),
  MATERIAL_UNITS_NAME  VARCHAR2(50),
  UNIT_PRICE           NUMBER(10,4),
  MATERIAL_SPEC        VARCHAR2(200),
  MATERIAL_MODEL       VARCHAR2(200),
  PACKAGE_UNITS_CODE   VARCHAR2(3),
  PACKAGE_UNITS_NAME   VARCHAR2(50),
  AMOUNT_PER_PACKAGE   NUMBER(5),
  CERTIFICATE_ID       NUMBER(10),
  PACKAGE_SPEC         VARCHAR2(200),
  MATERIAL_PICTURE1    VARCHAR2(100),
  MATERIAL_PICTURE2    VARCHAR2(100),
  MATERIAL_PICTURE3    VARCHAR2(100),
  MATERIAL_PICTURE4    VARCHAR2(100),
  MATERIAL_PICTURE5    VARCHAR2(100),
  PURCHASE_UNITS_CODE  VARCHAR2(3),
  PURCHASE_UNITS_NAME  VARCHAR2(50),
  PURCHASE_UNITS_RATE  NUMBER(5),
  STANDARD 			   VARCHAR2(500),
  USE_TYPE			   VARCHAR2(2) default '01',
  IMPORT_TYPE		   VARCHAR2(2) default 'N',
  INSTRUMENT_TYPE      VARCHAR2(2) default '01',
  ALIAS5               VARCHAR2(100),
  ALIAS1 			   VARCHAR2(100),
  ALIAS2 			   VARCHAR2(100),
  ASSIST_CODE1		   VARCHAR2(50),
  ASSIST_CODE2		   VARCHAR2(50),
  BRAND                VARCHAR2(60),
  COMM_REG_NO          VARCHAR2(100),
  COMM_REG_START_DATE  DATE,
  COMM_REG_CLOSE_DATE  DATE,
  COMM_REG_ATTACH_ID   VARCHAR2(100),
  COMM_REG_SPEC        VARCHAR2(200),
  STORAGE_CONDITION    VARCHAR2(200),
  APPROVE_FLAG         VARCHAR2(2),
  REMARKS              VARCHAR2(500),
  DEL_FLAG             VARCHAR2(1) default 'N',  
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE,
  UDI_CODE             VARCHAR2(25),
  CONSUME_ATTR1        VARCHAR2(25),
  CONSUME_ATTR2        VARCHAR2(25),
  MATERIAL_CATEGORY_MAIN VARCHAR2(9),
  STERILE_YN             VARCHAR2(1)
  );
comment on table TB_USC_VENDOR_MATERIAL
  is '供应商物资字典';
comment on column TB_USC_VENDOR_MATERIAL.VENDOR_MATERIAL_ID
  is '主键，自增';
comment on column TB_USC_VENDOR_MATERIAL.VENDOR_ID
  is '供应商主键';
comment on column TB_USC_VENDOR_MATERIAL.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_MATERIAL.VENDOR_MATERIAL_CODE
  is '供应商产品编码';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_VENDOR_MATERIAL.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_EN_NAME
  is '物资英文名称';
comment on column TB_USC_VENDOR_MATERIAL.REMARKS
  is '备注'; 
comment on column TB_USC_VENDOR_MATERIAL.TRADE_PRICE
  is '价格';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_DESC
  is '物资描述';
comment on column TB_USC_VENDOR_MATERIAL.USE_DESC
  is '使用说明';
comment on column TB_USC_VENDOR_MATERIAL.ALIAS5
  is '用于存放供应商物资名称以作参考';
comment on column TB_USC_VENDOR_MATERIAL.ALIAS1
  is '别名1';
comment on column TB_USC_VENDOR_MATERIAL.ALIAS2
  is '别名2';
comment on column TB_USC_VENDOR_MATERIAL.ASSIST_CODE1
  is '助记码1';
comment on column TB_USC_VENDOR_MATERIAL.ASSIST_CODE2
  is '助记码2';
comment on column TB_USC_VENDOR_MATERIAL.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_VENDOR_MATERIAL.MANUFACTURE_NAME
  is '生产厂家名称';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_UNITS_CODE
  is '最小单位编号';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_VENDOR_MATERIAL.UNIT_PRICE
  is '单价';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_MODEL
  is '型号';
comment on column TB_USC_VENDOR_MATERIAL.PACKAGE_UNITS_CODE
  is '定数包单位编号';
comment on column TB_USC_VENDOR_MATERIAL.PACKAGE_UNITS_NAME
  is '定数包单位名称';
comment on column TB_USC_VENDOR_MATERIAL.AMOUNT_PER_PACKAGE
  is '定数包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL.PACKAGE_SPEC
  is '包装规格';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_PICTURE1
  is '物资图片1：物资主图片';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_PICTURE2
  is '物资各角度图片';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_PICTURE3
  is '物资图片3';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_PICTURE4
  is '物资图片4';
comment on column TB_USC_VENDOR_MATERIAL.PURCHASE_UNITS_CODE
  is '大包单位编号';
comment on column TB_USC_VENDOR_MATERIAL.PURCHASE_UNITS_NAME
  is '大包单位名称';
comment on column TB_USC_VENDOR_MATERIAL.PURCHASE_UNITS_RATE
  is '大包包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL.STANDARD
  is '物资标准';
comment on column TB_USC_VENDOR_MATERIAL.USE_TYPE
  is '耗材用后区分：01：不选，02：植入，03：毁型';
comment on column TB_USC_VENDOR_MATERIAL.IMPORT_TYPE
  is '是否进口：Y：进口，N：国产';
comment on column TB_USC_VENDOR_MATERIAL.INSTRUMENT_TYPE
  is '器械分类等级：01：Ⅰ类，02：Ⅱ类，03：Ⅲ类';
comment on column TB_USC_VENDOR_MATERIAL.BRAND
  is '品牌';
comment on column TB_USC_VENDOR_MATERIAL.COMM_REG_NO
  is '产品注册证编号';
comment on column TB_USC_VENDOR_MATERIAL.COMM_REG_START_DATE
  is '产品注册证生效日期';
comment on column TB_USC_VENDOR_MATERIAL.COMM_REG_CLOSE_DATE
  is '产品注册证失效效期';
comment on column TB_USC_VENDOR_MATERIAL.COMM_REG_ATTACH_ID
  is '产品注册证扫描件附件ID';
comment on column TB_USC_VENDOR_MATERIAL.COMM_REG_SPEC
  is '产品注册证物资规格';
comment on column TB_USC_VENDOR_MATERIAL.CERTIFICATE_ID
  is '资质id';
comment on column TB_USC_VENDOR_MATERIAL.STORAGE_CONDITION
  is '存储条件';
comment on column TB_USC_VENDOR_MATERIAL.APPROVE_FLAG
  is '审批状态';
comment on column TB_USC_VENDOR_MATERIAL.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_MATERIAL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_MATERIAL.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_MATERIAL.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_MATERIAL.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_MATERIAL.UDI_CODE
  is 'UDI编码';
comment on column TB_USC_VENDOR_MATERIAL.CONSUME_ATTR1
  is '耗材属性1';
comment on column TB_USC_VENDOR_MATERIAL.CONSUME_ATTR2
  is '耗材属性2';
comment on column TB_USC_VENDOR_MATERIAL.MATERIAL_CATEGORY_MAIN
  is '物资大类(高值、低值等)';
comment on column TB_USC_VENDOR_MATERIAL.STERILE_YN
  is '是否无菌';
create table TB_USC_VENDOR_MATERIAL_APPLY(
  MATERIAL_APPLY_ID    NUMBER(10) not null,
  VENDOR_ID            NUMBER(10),
  VENDOR_CODE          VARCHAR2(10),
  VENDOR_MATERIAL_CODE VARCHAR2(18),
  MATERIAL_ID          VARCHAR2(18),
  ORG_ID               VARCHAR2(10),
  VENDOR_MATERIAL_ID   VARCHAR2(18),
  MATERIAL_CH_NAME     VARCHAR2(80),
  MATERIAL_EN_NAME     VARCHAR2(250),
  TRADE_PRICE          NUMBER(10,4),
  MATERIAL_DESC        VARCHAR2(1000),
  USE_DESC             VARCHAR2(1000),
  ALIAS5               VARCHAR2(100),
  MANUFACTURE_CODE     VARCHAR2(50),
  MANUFACTURE_NAME     VARCHAR2(500),
  MATERIAL_UNITS_CODE  VARCHAR2(3),
  MATERIAL_UNITS_NAME  VARCHAR2(50),
  UNIT_PRICE           NUMBER(10,4),
  MATERIAL_SPEC        VARCHAR2(200),
  MATERIAL_MODEL       VARCHAR2(200),
  PACKAGE_UNITS_CODE   VARCHAR2(3),
  PACKAGE_UNITS_NAME   VARCHAR2(50),
  AMOUNT_PER_PACKAGE   NUMBER(5),
  PACKAGE_SPEC         VARCHAR2(200),
  MATERIAL_PICTURE1    VARCHAR2(100),
  MATERIAL_PICTURE2    VARCHAR2(100),
  MATERIAL_PICTURE3    VARCHAR2(100),
  MATERIAL_PICTURE4    VARCHAR2(100),
  MATERIAL_PICTURE5    VARCHAR2(100),
  PURCHASE_UNITS_CODE  VARCHAR2(3),
  PURCHASE_UNITS_NAME  VARCHAR2(50),
  PURCHASE_UNITS_RATE  NUMBER(5),
  STANDARD 			   VARCHAR2(500),
  USE_TYPE			   VARCHAR2(2) default '01',
  IMPORT_TYPE		   VARCHAR2(2) default 'N',
  INSTRUMENT_TYPE      VARCHAR2(2) default '01',
  BRAND                VARCHAR2(60),
  COMM_REG_NO          VARCHAR2(100),
  COMM_REG_START_DATE  DATE,
  COMM_REG_CLOSE_DATE  DATE,  
  SYNC_TIME            DATE,
  COMM_REG_ATTACH_ID   VARCHAR2(100),
  COMM_REG_SPEC        VARCHAR2(200),
  STORAGE_CONDITION    VARCHAR2(200),
  APPROVE_FLAG         VARCHAR2(2),
  alias1               VARCHAR2(100),
  alias2               VARCHAR2(100),
  assist_code1         VARCHAR2(50),
  assist_code2         VARCHAR2(50),
  CERTIFICATE_ID       NUMBER(10),
  APPROVE_DOCUMENTS_ID NUMBER(10),
  REMARKS              VARCHAR2(500),
  DEL_FLAG             VARCHAR2(2) default 'N',
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE ,
  MATERIAL_CATEGORY_MAIN  VARCHAR2(9),
  UDI_CODE             VARCHAR2(25),
  CONSUME_ATTR1        VARCHAR2(25),
  CONSUME_ATTR2        VARCHAR2(25),
  STERILE_YN 		   VARCHAR2(1)
);
comment on table TB_USC_VENDOR_MATERIAL_APPLY
  is '供应关系审批表';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_APPLY_ID
  is '主键自增';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.VENDOR_ID
  is '供应商主键';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.VENDOR_MATERIAL_CODE
  is '供应商产品编码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.VENDOR_MATERIAL_ID
  is '主键，自增';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_EN_NAME
  is '物资英文名称';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.TRADE_PRICE
  is '价格';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_DESC
  is '物资描述';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.USE_DESC
  is '使用说明';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MANUFACTURE_NAME
  is '生产厂家名称';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.ALIAS5
  is '用于存放供应商物资名称以作参考';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_UNITS_CODE
  is '最小单位编号';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.UNIT_PRICE
  is '单价';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_MODEL
  is '型号';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PACKAGE_UNITS_CODE
  is '定数包单位编号';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PACKAGE_UNITS_NAME
  is '定数包单位名称';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.AMOUNT_PER_PACKAGE
  is '定数包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PACKAGE_SPEC
  is '包装规格';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_PICTURE1
  is '物资图片1：物资主图片';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_PICTURE2
  is '物资各角度图片';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_PICTURE3
  is '物资图片3';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_PICTURE4
  is '物资图片4';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PURCHASE_UNITS_CODE
  is '大包单位编号';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PURCHASE_UNITS_NAME
  is '大包单位名称';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.PURCHASE_UNITS_RATE
  is '大包包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.STANDARD
  is '物资标准';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.CERTIFICATE_ID
  is '资质id';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.USE_TYPE
  is '耗材用后区分：01：不选，02：植入，03：毁型';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.IMPORT_TYPE
  is '是否进口：Y：进口，N：国产';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.INSTRUMENT_TYPE
  is '器械分类等级：01：Ⅰ类，02：Ⅱ类，03：Ⅲ类';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.BRAND
  is '品牌';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.COMM_REG_NO
  is '产品注册证编号';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.COMM_REG_START_DATE
  is '产品注册证生效日期';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.COMM_REG_CLOSE_DATE
  is '产品注册证失效效期';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.COMM_REG_ATTACH_ID
  is '产品注册证扫描件附件ID';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.COMM_REG_SPEC
  is '产品注册证物资规格';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.STORAGE_CONDITION
  is '存储条件';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.APPROVE_FLAG
  is '审批状态';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.APPROVE_DOCUMENTS_ID
  is '审批表流水号ID';
comment on column tb_usc_vendor_material_apply.SYNC_TIME 
  is '同步时间';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.alias1
  is '别名1';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.alias2
  is '别名2';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.assist_code1
  is '助记码1';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.assist_code2
  is '助记码2';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.REMARKS
  is '备注';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.MATERIAL_CATEGORY_MAIN
  is '物资大类(高值、低值等)';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.UDI_CODE
  is 'UDI编码';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.CONSUME_ATTR1
  is '耗材属性1';
comment on column TB_USC_VENDOR_MATERIAL_APPLY.CONSUME_ATTR2
  is '耗材属性2'; 
comment on column TB_USC_VENDOR_MATERIAL_APPLY.STERILE_YN
  is '是否无菌';
create table TB_USC_VENDOR_MATERIAL_HIS(
  MATERIAL_HISTORY_ID  VARCHAR2(18) not null,
  VENDOR_ID            NUMBER(10),
  VENDOR_CODE          VARCHAR2(10) ,
  VENDOR_MATERIAL_CODE VARCHAR2(18),
  MATERIAL_ID          VARCHAR2(18),
  ORG_ID               VARCHAR2(10),
  VENDOR_MATERIAL_ID   VARCHAR2(18),
  MATERIAL_CH_NAME     VARCHAR2(80),
  MATERIAL_EN_NAME     VARCHAR2(250),
  TRADE_PRICE          NUMBER(10,4),
  MATERIAL_DESC        VARCHAR2(1000),
  USE_DESC             VARCHAR2(1000),
  ALIAS5               VARCHAR2(100),
  ALIAS1 			   VARCHAR2(100),
  ALIAS2 			   VARCHAR2(100),
  ASSIST_CODE1		   VARCHAR2(50),
  ASSIST_CODE2		   VARCHAR2(50),
  MANUFACTURE_CODE     VARCHAR2(50),
  MANUFACTURE_NAME     VARCHAR2(500),
  MATERIAL_UNITS_CODE  VARCHAR2(10),
  MATERIAL_UNITS_NAME  VARCHAR2(50),
  UNIT_PRICE           NUMBER(10,4),
  MATERIAL_SPEC        VARCHAR2(200),
  MATERIAL_MODEL       VARCHAR2(200),
  PACKAGE_UNITS_CODE   VARCHAR2(10),
  PACKAGE_UNITS_NAME   VARCHAR2(50),
  AMOUNT_PER_PACKAGE   NUMBER(10),
  PACKAGE_SPEC         VARCHAR2(200),
  MATERIAL_PICTURE1    VARCHAR2(100),
  MATERIAL_PICTURE2    VARCHAR2(100),
  MATERIAL_PICTURE3    VARCHAR2(100),
  MATERIAL_PICTURE4    VARCHAR2(100),
  MATERIAL_PICTURE5    VARCHAR2(100),
  PURCHASE_UNITS_CODE  VARCHAR2(10),
  PURCHASE_UNITS_NAME  VARCHAR2(50),
  PURCHASE_UNITS_RATE  NUMBER(5),
  CERTIFICATE_ID       NUMBER(10),
  STANDARD 			   VARCHAR2(500),
  USE_TYPE			   VARCHAR2(2) default '01',
  IMPORT_TYPE		   VARCHAR2(2) default 'N',
  INSTRUMENT_TYPE      VARCHAR2(2) default '01',
  BRAND                VARCHAR2(60),
  COMM_REG_NO          VARCHAR2(100),
  COMM_REG_START_DATE  DATE,
  COMM_REG_CLOSE_DATE  DATE,
  COMM_REG_ATTACH_ID   VARCHAR2(100),
  COMM_REG_SPEC        VARCHAR2(200),
  STORAGE_CONDITION    VARCHAR2(200),
  APPROVE_FLAG         VARCHAR2(2),
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE,
  DEL_FLAG             VARCHAR2(1) default 'N',
  REMARKS              VARCHAR2(500),
  APPROVE_DOCUMENTS_ID NUMBER(10),
  UDI_CODE             VARCHAR2(25),
  CONSUME_ATTR1        VARCHAR2(25),
  CONSUME_ATTR2        VARCHAR2(25),
  MATERIAL_CATEGORY_MAIN VARCHAR2(9),
  STERILE_YN             VARCHAR2(1)
);
comment on table TB_USC_VENDOR_MATERIAL_HIS
  is '供应商物资字典历史表';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_HISTORY_ID
  is '主键，自增';
comment on column TB_USC_VENDOR_MATERIAL_HIS.VENDOR_ID
  is '供应商主键';
comment on column TB_USC_VENDOR_MATERIAL_HIS.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.VENDOR_MATERIAL_CODE
  is '供应商产品编码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.VENDOR_MATERIAL_ID
  is '主键，自增';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_EN_NAME
  is '物资英文名称';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ALIAS5
  is '用于存放供应商物资名称以作参考';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ALIAS1
  is '别名1';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ALIAS2
  is '别名2';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ASSIST_CODE1
  is '助记码1';
comment on column TB_USC_VENDOR_MATERIAL_HIS.ASSIST_CODE2
  is '助记码2';
comment on column TB_USC_VENDOR_MATERIAL_HIS.TRADE_PRICE
  is '价格';
comment on column TB_USC_VENDOR_MATERIAL_HIS.CERTIFICATE_ID
  is '资质id';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_DESC
  is '物资描述';
comment on column TB_USC_VENDOR_MATERIAL_HIS.USE_DESC
  is '使用说明';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MANUFACTURE_NAME
  is '生产厂家名称';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_UNITS_CODE
  is '最小单位编号';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_VENDOR_MATERIAL_HIS.UNIT_PRICE
  is '单价';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_MODEL
  is '型号';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PACKAGE_UNITS_CODE
  is '定数包单位编号';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PACKAGE_UNITS_NAME
  is '定数包单位名称';
comment on column TB_USC_VENDOR_MATERIAL_HIS.AMOUNT_PER_PACKAGE
  is '定数包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PACKAGE_SPEC
  is '包装规格';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_PICTURE1
  is '物资图片1：物资主图片';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_PICTURE2
  is '物资各角度图片';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_PICTURE3
  is '物资图片3';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_PICTURE4
  is '物资图片4';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PURCHASE_UNITS_CODE
  is '大包单位编号';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PURCHASE_UNITS_NAME
  is '大包单位名称';
comment on column TB_USC_VENDOR_MATERIAL_HIS.PURCHASE_UNITS_RATE
  is '大包包含最小单位数';
comment on column TB_USC_VENDOR_MATERIAL_HIS.STANDARD
  is '物资标准';
comment on column TB_USC_VENDOR_MATERIAL_HIS.USE_TYPE
  is '耗材用后区分：01：不选，02：植入，03：毁型';
comment on column TB_USC_VENDOR_MATERIAL_HIS.IMPORT_TYPE
  is '是否进口：Y：进口，N：国产';
comment on column TB_USC_VENDOR_MATERIAL_HIS.INSTRUMENT_TYPE
  is '器械分类等级：01：Ⅰ类，02：Ⅱ类，03：Ⅲ类';
comment on column TB_USC_VENDOR_MATERIAL_HIS.BRAND
  is '品牌';
comment on column TB_USC_VENDOR_MATERIAL_HIS.COMM_REG_NO
  is '产品注册证编号';
comment on column TB_USC_VENDOR_MATERIAL_HIS.COMM_REG_START_DATE
  is '产品注册证生效日期';
comment on column TB_USC_VENDOR_MATERIAL_HIS.COMM_REG_CLOSE_DATE
  is '产品注册证失效效期';
comment on column TB_USC_VENDOR_MATERIAL_HIS.COMM_REG_ATTACH_ID
  is '产品注册证扫描件附件ID';
comment on column TB_USC_VENDOR_MATERIAL_HIS.REMARKS
  is '备注';
comment on column TB_USC_VENDOR_MATERIAL_HIS.COMM_REG_SPEC
  is '产品注册证物资规格';
comment on column TB_USC_VENDOR_MATERIAL_HIS.STORAGE_CONDITION
  is '存储条件';
comment on column TB_USC_VENDOR_MATERIAL_HIS.APPROVE_FLAG
  is '审批状态';
comment on column TB_USC_VENDOR_MATERIAL_HIS.CREATE_BY
  is '创建人';
comment on column TB_USC_VENDOR_MATERIAL_HIS.CREATE_DATE
  is '创建日期';
comment on column TB_USC_VENDOR_MATERIAL_HIS.UPDATE_BY
  is '更新人';
comment on column TB_USC_VENDOR_MATERIAL_HIS.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_VENDOR_MATERIAL_HIS.DEL_FLAG
  is '删除标识';
comment on column TB_USC_VENDOR_MATERIAL_HIS.APPROVE_DOCUMENTS_ID
  is '审批表流水号ID';
comment on column TB_USC_VENDOR_MATERIAL_HIS.UDI_CODE
  is 'UDI编码';
comment on column TB_USC_VENDOR_MATERIAL_HIS.CONSUME_ATTR1
  is '耗材属性1';
comment on column TB_USC_VENDOR_MATERIAL_HIS.CONSUME_ATTR2
  is '耗材属性2';
comment on column TB_USC_VENDOR_MATERIAL_HIS.MATERIAL_CATEGORY_MAIN
  is '物资大类(高值、低值等)';
comment on column TB_USC_VENDOR_MATERIAL_HIS.STERILE_YN
  is '是否无菌';  
create table TB_USC_MY_MENU
(
  MY_MENU_ID  NUMBER(10),
  MENU_ID     VARCHAR2(10),
  USER_ID     VARCHAR2(15) not null,
  MENU_NAME   VARCHAR2(255),
  SORT        NUMBER,
  REMARKS     VARCHAR2(500),
  DEL_FLAG    VARCHAR2(1) default 'N',
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(50),
  UPDATE_DATE DATE 
);
comment on table TB_USC_MY_MENU
  is '快捷菜单表';
comment on column TB_USC_MY_MENU.MY_MENU_ID
  is '主键自增';
comment on column TB_USC_MY_MENU.MENU_ID
  is '菜单ID';
comment on column TB_USC_MY_MENU.USER_ID
  is '用户名';
comment on column TB_USC_MY_MENU.MENU_NAME
  is '菜单名称';
comment on column TB_USC_MY_MENU.SORT
  is '排序';
alter table TB_USC_MY_MENU
  add constraint 主键 primary key (MY_MENU_ID);
  
commit;

-- Create table
create table TB_USC_FUNCTION_LOCATION
(
  LOCATION_CODE VARCHAR2(50) not null,
  LOCATION_NAME VARCHAR2(100),
  ROOM_NO       VARCHAR2(50),
  REMARKS       VARCHAR2(200),
  DEL_FLAG      VARCHAR2(1) default 'N',
  CREATE_BY     VARCHAR2(50) default 'SYSTEM',
  CREATE_DATE   DATE default SYSDATE,
  UPDATE_BY     VARCHAR2(50) default 'SYSTEM',
  UPDATE_DATE   DATE default SYSDATE
);
-- Add comments to the columns 
comment on column TB_USC_FUNCTION_LOCATION.LOCATION_CODE
  is '功能位置编码';
comment on column TB_USC_FUNCTION_LOCATION.LOCATION_NAME
  is '功能位置名';
comment on column TB_USC_FUNCTION_LOCATION.ROOM_NO
  is '房间号';
comment on column TB_USC_FUNCTION_LOCATION.REMARKS
  is '备注';
comment on column TB_USC_FUNCTION_LOCATION.DEL_FLAG
  is '删除标识';
comment on column TB_USC_FUNCTION_LOCATION.CREATE_BY
  is '创建人';
comment on column TB_USC_FUNCTION_LOCATION.CREATE_DATE
  is '创建日期';
comment on column TB_USC_FUNCTION_LOCATION.UPDATE_BY
  is '更新人';
comment on column TB_USC_FUNCTION_LOCATION.UPDATE_DATE
  is '更新日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_FUNCTION_LOCATION
  add constraint PK_TB_USC_FUNCTION_LOCATION primary key (LOCATION_CODE);
create table IF_USER(
  INTERFACE_ID                NUMBER(10) not null,
  EMPLOYEE_ID                 VARCHAR2(8),
  ORG_ID                      VARCHAR2(64),
  LOGIN_NAME                  VARCHAR2(40),
  USER_NAME                   VARCHAR2(40),
  EMAIL                       VARCHAR2(30),
  PHONE_NO                    VARCHAR2(30),
  MOBILE_NO                   VARCHAR2(30),
  SEX                         VARCHAR2(1),
  USER_TYPE                   VARCHAR2(1),
  ADMINISTRATION_TITLES       VARCHAR2(40),
  PROFESSIONAL_QUALIFICATIONS VARCHAR2(10),
  TECHNICAL_TITLES            VARCHAR2(40),
  POST                        VARCHAR2(1),
  OFFICE_ID                   VARCHAR2(8),
  LICENSE                     VARCHAR2(30),
  QUALIFICATION_CERTIFICATE   VARCHAR2(30),
  PRESCRIPTION_AUTHORITY      VARCHAR2(1),
  ANESTHESIA_AUTHORITY        VARCHAR2(1),
  ANTIBIOTICS1_AUTHORITY      VARCHAR2(1),
  ANTIBIOTICS2_AUTHORITY      VARCHAR2(1),
  ANTIBIOTICS3_AUTHORITY      VARCHAR2(1),
  ANTIBIOTICS4_AUTHORITY      VARCHAR2(1),
  DATA_TYPE                   VARCHAR2(1),
  INTERFACE_STATUS            VARCHAR2(30),
  INTERFACE_MSG               VARCHAR2(200),
  ATTRIBUTE1                  VARCHAR2(30),
  ATTRIBUTE2                  VARCHAR2(30),
  ATTRIBUTE3                  VARCHAR2(30),
  ATTRIBUTE4                  VARCHAR2(30),
  ATTRIBUTE5                  VARCHAR2(30),
  DEL_FLAG                  VARCHAR2(1) default 'N',
  CREATE_DATE               DATE default SYSDATE not null,
  CREATE_BY                 VARCHAR2(50) default 'SYSTEM' not null,
  UPDATE_DATE               DATE default SYSDATE,
  UPDATE_BY                 VARCHAR2(50) default 'SYSTEM'  
);
-- Add comments to the table 
comment on table IF_USER
  is '人员信息接口表';
-- Add comments to the columns 
comment on column IF_USER.EMPLOYEE_ID
  is '员工编码';
comment on column IF_USER.ORG_ID
  is '公司/医院ID';
comment on column IF_USER.LOGIN_NAME
  is '工号';
comment on column IF_USER.USER_NAME
  is '员工姓名';
comment on column IF_USER.EMAIL
  is '电子邮件';
comment on column IF_USER.PHONE_NO
  is '办公电话';
comment on column IF_USER.MOBILE_NO
  is '移动电话';
comment on column IF_USER.SEX
  is '性别1 男 2 女';
comment on column IF_USER.USER_TYPE
  is '人员类别';
comment on column IF_USER.ADMINISTRATION_TITLES
  is '行政职称';
comment on column IF_USER.PROFESSIONAL_QUALIFICATIONS
  is '技术职称级别';
comment on column IF_USER.TECHNICAL_TITLES
  is '技术职称';
comment on column IF_USER.POST
  is '人员岗位';
comment on column IF_USER.OFFICE_ID
  is '直属机构编码';
comment on column IF_USER.LICENSE
  is '医生执业证';
comment on column IF_USER.QUALIFICATION_CERTIFICATE
  is '医生资格证';
comment on column IF_USER.PRESCRIPTION_AUTHORITY
  is '处方权限';
comment on column IF_USER.ANESTHESIA_AUTHORITY
  is '麻醉权限';
comment on column IF_USER.ANTIBIOTICS1_AUTHORITY
  is '特殊使用级抗菌药物处方权限 ';
comment on column IF_USER.ANTIBIOTICS2_AUTHORITY
  is '限制使用级抗菌药物处方权限 ';
comment on column IF_USER.ANTIBIOTICS3_AUTHORITY
  is '非限制使用级抗菌药物处方权限';
comment on column IF_USER.ANTIBIOTICS4_AUTHORITY
  is '抗菌药物处方调剂资格';
comment on column IF_USER.CREATE_BY
  is '创建人';
comment on column IF_USER.CREATE_DATE
  is '创建日期';
comment on column IF_USER.UPDATE_BY
  is '更新人';
comment on column IF_USER.UPDATE_DATE
  is '更新日期';
comment on column IF_USER.DEL_FLAG
  is '删除标识';
comment on column IF_USER.DATA_TYPE
  is '‘C’，创建|‘U’，更新|‘D’，删除';
comment on column IF_USER.INTERFACE_STATUS
  is '接口状态';
comment on column IF_USER.INTERFACE_MSG
  is '接口消息';

-- Create table
create table IF_ORG(
  INTERFACE_ID              NUMBER(10) not null,
  IF_ORG_NAME               VARCHAR2(40),
  IF_ORG_CODE               NUMBER(10),
  IF_TOP_ORG_CODE           NUMBER(10),
  IF_PRINCIPAL_NO           NUMBER(8),
  IF_LEADERSHIP_NO          NUMBER(8),
  IF_ORIGINAL_PRINCIPAL_NO  VARCHAR2(40),
  IF_ORIGINAL_LEADERSHIP_NO VARCHAR2(40),
  DATA_TYPE                 VARCHAR2(1),
  INTERFACE_STATUS          VARCHAR2(30),
  INTERFACE_MSG             VARCHAR2(200),
  ATTRIBUTE1                VARCHAR2(30),
  ATTRIBUTE2                VARCHAR2(30),
  ATTRIBUTE3                VARCHAR2(30),
  ATTRIBUTE4                VARCHAR2(30),
  ATTRIBUTE5                VARCHAR2(30),  
  CREATE_DATE               DATE default SYSDATE not null,
  CREATE_BY                 VARCHAR2(50) default 'SYSTEM' not null,
  UPDATE_DATE               DATE default SYSDATE,
  UPDATE_BY                 VARCHAR2(50) default 'SYSTEM',
  DEL_FLAG                  VARCHAR2(1) default 'N'
);
-- Add comments to the columns 
comment on column IF_ORG.IF_ORG_NAME
  is '部门名称';
comment on column IF_ORG.IF_ORG_CODE
  is '编码';
comment on column IF_ORG.IF_TOP_ORG_CODE
  is '上级部门编码';
comment on column IF_ORG.IF_PRINCIPAL_NO
  is '负责人工号';
comment on column IF_ORG.IF_LEADERSHIP_NO
  is '分管领导工号';
comment on column IF_ORG.IF_ORIGINAL_PRINCIPAL_NO
  is '负责人工号';
comment on column IF_ORG.IF_ORIGINAL_LEADERSHIP_NO
  is '分管领导工号';
comment on column IF_ORG.DATA_TYPE
  is '‘C’，创建|‘U’，更新|‘D’，删除';
comment on column IF_ORG.INTERFACE_STATUS
  is '接口状态';
comment on column IF_ORG.INTERFACE_MSG
  is '接口消息';
comment on column IF_ORG.DEL_FLAG
  is '删除标志，‘N’未删除，''Y''代表删除';
comment on column IF_ORG.CREATE_DATE
  is '创建时间';
comment on column IF_ORG.CREATE_BY
  is '创建人';
comment on column IF_ORG.UPDATE_DATE
  is '更新时间';
comment on column IF_ORG.UPDATE_BY
  is '更新人';
  
-- Create table
create table TB_USC_MATERIAL_CATEGORY10
(
  MATERIAL_CATEGORY_CODE        VARCHAR2(10) not null,
  MATERIAL_CATEGORY_PARENT_CODE VARCHAR2(10),
  MATERIAL_CATEGORY_FULL_CODE   VARCHAR2(10),
  MATERIAL_CATEGORY_NAME        VARCHAR2(100),
  MATERIAL_CATEGORY_PATH        VARCHAR2(500),
  MANAGE_LEVEL                  VARCHAR2(50),
  REMARKS                       VARCHAR2(200),
  DEL_FLAG                      VARCHAR2(1) default 'N',
  CREATE_BY                     VARCHAR2(20),
  CREATE_DATE                   DATE,
  UPDATE_BY                     VARCHAR2(20),
  UPDATE_DATE                   DATE
);
-- Add comments to the table 
comment on table TB_USC_MATERIAL_CATEGORY10
  is '10码分类';
-- Add comments to the columns 
comment on column TB_USC_MATERIAL_CATEGORY10.MATERIAL_CATEGORY_CODE
  is '分类编号';
comment on column TB_USC_MATERIAL_CATEGORY10.MATERIAL_CATEGORY_PARENT_CODE
  is '分类父编号';
comment on column TB_USC_MATERIAL_CATEGORY10.MATERIAL_CATEGORY_FULL_CODE
  is '7位完整的10码';
comment on column TB_USC_MATERIAL_CATEGORY10.MATERIAL_CATEGORY_NAME
  is '10码名称';
comment on column TB_USC_MATERIAL_CATEGORY10.MATERIAL_CATEGORY_PATH
  is '分类层级';
comment on column TB_USC_MATERIAL_CATEGORY10.REMARKS
  is '备注';
comment on column TB_USC_MATERIAL_CATEGORY10.DEL_FLAG
  is '删除标识';
comment on column TB_USC_MATERIAL_CATEGORY10.CREATE_BY
  is '创建人';
comment on column TB_USC_MATERIAL_CATEGORY10.CREATE_DATE
  is '创建日期';
comment on column TB_USC_MATERIAL_CATEGORY10.UPDATE_BY
  is '更新人';
comment on column TB_USC_MATERIAL_CATEGORY10.UPDATE_DATE
  is '更新日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_MATERIAL_CATEGORY10
  add constraint PK_TB_USC_MATERIAL_CATEGORY10 primary key (MATERIAL_CATEGORY_CODE);

create table TB_USC_BILLS_MST
(
  BILLS_ID    NUMBER(20) not null,
  WH_ID       VARCHAR2(50),
  PAY_DATE    DATE,
  DEL_FLAG    VARCHAR2(1) default 'N',
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(50),
  UPDATE_DATE DATE,
  TOTAL_MONEY VARCHAR2(50)
);
-- Add comments to the table 
comment on table TB_USC_BILLS_MST
  is '报账单主表';
-- Add comments to the columns 
comment on column TB_USC_BILLS_MST.BILLS_ID
  is '报账单号';
comment on column TB_USC_BILLS_MST.WH_ID
  is '报账仓库ID';
comment on column TB_USC_BILLS_MST.PAY_DATE
  is '报账开始日期';
comment on column TB_USC_BILLS_MST.DEL_FLAG
  is '删除标识';
comment on column TB_USC_BILLS_MST.CREATE_BY
  is '创建人';
comment on column TB_USC_BILLS_MST.CREATE_DATE
  is '创建日期';
comment on column TB_USC_BILLS_MST.UPDATE_BY
  is '更新人';
comment on column TB_USC_BILLS_MST.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_BILLS_MST.TOTAL_MONEY
  is '总金额';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_BILLS_MST
  add constraint BILLSMST_PRI primary key (BILLS_ID);

create table TB_USC_BILLS_DTL
(
  BILLS_DTL_ID NUMBER not null,
  VENDOR_ID    VARCHAR2(50),
  BILLS_PAY    VARCHAR2(50),
  CREATE_BY    VARCHAR2(50),
  CREATE_DATE  DATE,
  UPDATE_BY    VARCHAR2(50),
  UPDATE_DATE  DATE,
  DEL_FLAG     VARCHAR2(1),
  BILLS_ID     NUMBER(20) not null
);
-- Add comments to the table 
comment on table TB_USC_BILLS_DTL
  is '报账单子表';
-- Add comments to the columns 
comment on column TB_USC_BILLS_DTL.BILLS_DTL_ID
  is '主键，自增id';
comment on column TB_USC_BILLS_DTL.VENDOR_ID
  is '供应商id';
comment on column TB_USC_BILLS_DTL.BILLS_PAY
  is '应付金额';
comment on column TB_USC_BILLS_DTL.CREATE_BY
  is '创建人';
comment on column TB_USC_BILLS_DTL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_BILLS_DTL.UPDATE_BY
  is '更新人';
comment on column TB_USC_BILLS_DTL.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_BILLS_DTL.DEL_FLAG
  is '删除标识';
comment on column TB_USC_BILLS_DTL.BILLS_ID
  is '报账单号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_BILLS_DTL
  add constraint BILLSDTL_PRI_KEY primary key (BILLS_DTL_ID);
  
create table TB_USC_PICKING
(
  PICKING_ID         NUMBER(10) not null,
  STOCK_TRANSFER_ID  VARCHAR2(20) not null,
  ORG_ID             VARCHAR2(10),
  WH_FROM_ID         NUMBER(10) not null,
  WH_TO_ID         	 NUMBER(10) not null,
  MATERIAL_ID        VARCHAR2(18) not null,
  MATERIAL_NAME      VARCHAR2(500) not null,
  PACKAGE_UNITS_CODE VARCHAR2(10),
  PACKAGE_UNITS_NAME VARCHAR2(50),
  MATERIAL_SPEC      VARCHAR2(200),
  MANUFACTURE_NAME   VARCHAR2(500),
  MANUFACTURE_CODE   VARCHAR2(50),
  BATCH_NO           VARCHAR2(50),
  VALID_DATE         DATE,
  LOCATION_FROM      VARCHAR2(20),
  LOCATION_TO      	 VARCHAR2(20),
  APPLY_QUANTITY     NUMBER(10),
  EXPORT_QUANTITY    NUMBER(10),
  PICKING_QUANTITY   NUMBER(10) not null,
  STATUS             VARCHAR2(1) default 'N',
  REMARKS            VARCHAR2(500),
  DEL_FLAG           VARCHAR2(1) default 'N',
  CREATE_BY          VARCHAR2(50),
  CREATE_DATE        DATE,
  UPDATE_BY          VARCHAR2(50),
  UPDATE_DATE        DATE
);
-- Add comments to the table 
comment on table TB_USC_PICKING
  is '拣货单表';
-- Add comments to the columns 
comment on column TB_USC_PICKING.PICKING_ID
  is '主键';
comment on column TB_USC_PICKING.STOCK_TRANSFER_ID
  is '主键，库存转移单号';
comment on column TB_USC_PICKING.ORG_ID
  is '组织ID。默认医院ID';
comment on column TB_USC_PICKING.WH_FROM_ID
  is '来源仓库';
comment on column TB_USC_PICKING.WH_TO_ID
  is '目标仓库';
comment on column TB_USC_PICKING.MATERIAL_ID
  is '物资ID';
comment on column TB_USC_PICKING.MATERIAL_NAME
  is '物料名称';
comment on column TB_USC_PICKING.PACKAGE_UNITS_CODE
  is '包装单位编号';
comment on column TB_USC_PICKING.PACKAGE_UNITS_NAME
  is '包装单位名称';
comment on column TB_USC_PICKING.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_PICKING.MANUFACTURE_NAME
  is '生产厂家';
comment on column TB_USC_PICKING.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_PICKING.BATCH_NO
  is '批号';
comment on column TB_USC_PICKING.VALID_DATE
  is '效期';
comment on column TB_USC_PICKING.LOCATION_FROM
  is '出库货位';
comment on column TB_USC_PICKING.LOCATION_TO
  is '入库货位';
comment on column TB_USC_PICKING.APPLY_QUANTITY
  is '申领数量';
comment on column TB_USC_PICKING.EXPORT_QUANTITY
  is '处理数量';
comment on column TB_USC_PICKING.PICKING_QUANTITY
  is '需求数量';
comment on column TB_USC_PICKING.STATUS
  is '拣货单是否处理，N未处理，Y已处理';
comment on column TB_USC_PICKING.REMARKS
  is '备注';
comment on column TB_USC_PICKING.DEL_FLAG
  is '删除标识';
comment on column TB_USC_PICKING.CREATE_BY
  is '创建人';
comment on column TB_USC_PICKING.CREATE_DATE
  is '创建日期';
comment on column TB_USC_PICKING.UPDATE_BY
  is '更新人';
comment on column TB_USC_PICKING.UPDATE_DATE
  is '更新日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_PICKING
  add constraint PK_TB_USC_PICKING primary key (PICKING_ID);

  -- Create table
create table TB_USC_MATERIAL_APPROVE_RECORD
(
  MATERIAL_APPLY_ID    NUMBER(10) not null,
  VENDOR_ID            NUMBER(10),
  VENDOR_CODE          VARCHAR2(10),
  VENDOR_MATERIAL_CODE VARCHAR2(18),
  MATERIAL_ID          VARCHAR2(18),
  ORG_ID               VARCHAR2(10),
  VENDOR_MATERIAL_ID   VARCHAR2(18),
  MATERIAL_CH_NAME     VARCHAR2(80),
  MATERIAL_EN_NAME     VARCHAR2(250),
  TRADE_PRICE          NUMBER(10,4),
  MATERIAL_DESC        VARCHAR2(1000),
  USE_DESC             VARCHAR2(1000),
  ALIAS5               VARCHAR2(100),
  MANUFACTURE_CODE     VARCHAR2(50),
  MANUFACTURE_NAME     VARCHAR2(500),
  MATERIAL_UNITS_CODE  VARCHAR2(3),
  MATERIAL_UNITS_NAME  VARCHAR2(50),
  UNIT_PRICE           NUMBER(10,4),
  MATERIAL_SPEC        VARCHAR2(200),
  MATERIAL_MODEL       VARCHAR2(200),
  PACKAGE_UNITS_CODE   VARCHAR2(3),
  PACKAGE_UNITS_NAME   VARCHAR2(50),
  AMOUNT_PER_PACKAGE   NUMBER(5),
  PACKAGE_SPEC         VARCHAR2(200),
  MATERIAL_PICTURE1    VARCHAR2(100),
  MATERIAL_PICTURE2    VARCHAR2(100),
  MATERIAL_PICTURE3    VARCHAR2(100),
  MATERIAL_PICTURE4    VARCHAR2(100),
  MATERIAL_PICTURE5    VARCHAR2(100),
  PURCHASE_UNITS_CODE  VARCHAR2(3),
  PURCHASE_UNITS_NAME  VARCHAR2(50),
  PURCHASE_UNITS_RATE  NUMBER(5),
  STANDARD             VARCHAR2(500),
  USE_TYPE             VARCHAR2(2) default '01',
  IMPORT_TYPE          VARCHAR2(2) default 'N',
  INSTRUMENT_TYPE      VARCHAR2(2) default '01',
  BRAND                VARCHAR2(60),
  COMM_REG_NO          VARCHAR2(100),
  COMM_REG_START_DATE  DATE,
  COMM_REG_CLOSE_DATE  DATE,
  REMARKS              VARCHAR2(500),
  SYNC_TIME            DATE,
  COMM_REG_ATTACH_ID   VARCHAR2(100),
  COMM_REG_SPEC        VARCHAR2(200),
  STORAGE_CONDITION    VARCHAR2(200),
  APPROVE_MSG          VARCHAR2(500),
  APPROVE_FLAG         VARCHAR2(2),
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE,
  DEL_FLAG             VARCHAR2(1) default 'N',
  APPROVE_DOCUMENTS_ID NUMBER(10),
  ALIAS1               VARCHAR2(100),
  ALIAS2               VARCHAR2(100),
  ASSIST_CODE1         VARCHAR2(50),
  ASSIST_CODE2         VARCHAR2(50),
  CERTIFICATE_ID       NUMBER(10),
  STERILE_YN           VARCHAR2(1),
  APPROVE_BY           VARCHAR2(50),
  APPROVE_DATE         DATE
);
-- Add comments to the columns 
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_APPLY_ID
  is '主键自增';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.VENDOR_ID
  is '供应商主键';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.VENDOR_CODE
  is '供应商代码';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.VENDOR_MATERIAL_CODE
  is '供应商产品编码';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.VENDOR_MATERIAL_ID
  is '主键，自增';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_EN_NAME
  is '物资英文名称';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.TRADE_PRICE
  is '价格';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_DESC
  is '物资描述';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.USE_DESC
  is '使用说明';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ALIAS5
  is '用于存放供应商物资名称以作参考';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MANUFACTURE_NAME
  is '生产厂家名称';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_UNITS_CODE
  is '最小单位编号';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.UNIT_PRICE
  is '单价';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_MODEL
  is '型号';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PACKAGE_UNITS_CODE
  is '定数包单位编号';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PACKAGE_UNITS_NAME
  is '定数包单位名称';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.AMOUNT_PER_PACKAGE
  is '定数包含最小单位数';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PACKAGE_SPEC
  is '包装规格';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_PICTURE1
  is '物资图片1：物资主图片';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_PICTURE2
  is '物资各角度图片';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_PICTURE3
  is '物资图片3';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.MATERIAL_PICTURE4
  is '物资图片4';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PURCHASE_UNITS_CODE
  is '大包单位编号';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PURCHASE_UNITS_NAME
  is '大包单位名称';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.PURCHASE_UNITS_RATE
  is '大包包含最小单位数';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.STANDARD
  is '物资标准';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.USE_TYPE
  is '耗材用后区分：01：不选，02：植入，03：毁型';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.IMPORT_TYPE
  is '是否进口：Y：进口，N：国产';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.INSTRUMENT_TYPE
  is '器械分类等级：01：Ⅰ类，02：Ⅱ类，03：Ⅲ类';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.BRAND
  is '品牌';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.COMM_REG_NO
  is '产品注册证编号';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.COMM_REG_START_DATE
  is '产品注册证生效日期';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.COMM_REG_CLOSE_DATE
  is '产品注册证失效效期';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.REMARKS
  is '备注';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.SYNC_TIME
  is '同步时间';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.COMM_REG_ATTACH_ID
  is '产品注册证扫描件附件ID';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.COMM_REG_SPEC
  is '产品注册证物资规格';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.STORAGE_CONDITION
  is '存储条件';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.APPROVE_MSG
  is '审批意见';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.APPROVE_FLAG
  is '审批状态';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.UPDATE_BY
  is '更新人';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.DEL_FLAG
  is '删除标识';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.APPROVE_DOCUMENTS_ID
  is '审批表流水号ID';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ALIAS1
  is '别名1';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ALIAS2
  is '别名2';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ASSIST_CODE1
  is '助记码1';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.ASSIST_CODE2
  is '助记码2';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.CERTIFICATE_ID
  is '资质id';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.STERILE_YN
  is '是否无菌';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.APPROVE_BY
  is '审批人';
comment on column TB_USC_MATERIAL_APPROVE_RECORD.APPROVE_DATE
  is '审批日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_MATERIAL_APPROVE_RECORD
  add constraint PK_USC_MATERIAL_APPROVE_RECORD primary key (MATERIAL_APPLY_ID);
  
-- Create table
create table TB_USC_CHECK_MASTER
(
  CHECK_ID             VARCHAR2(20) not null,
  ORG_ID               VARCHAR2(20),
  WH_ID                NUMBER(10),
  CHECK_DATE           DATE,
  CHECK_EMPLOYEE       VARCHAR2(15),
  APPROVAL_EMPLOYEE    VARCHAR2(15),
  APPROVAL_DATE        DATE,
  STATUS               VARCHAR2(2),
  CREATE_BY            VARCHAR2(50),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(50),
  UPDATE_DATE          DATE,
  DEL_FLAG             VARCHAR2(1) default 'N',
  REMARKS              VARCHAR2(500),
  SUPERVISOR           VARCHAR2(15),
  APPROVE_DOCUMENTS_ID NUMBER(10)
);
-- Add comments to the table 
comment on table TB_USC_CHECK_MASTER
  is '清点主数据表';
-- Add comments to the columns 
comment on column TB_USC_CHECK_MASTER.CHECK_ID
  is '主键';
comment on column TB_USC_CHECK_MASTER.ORG_ID
  is '组织ID';
comment on column TB_USC_CHECK_MASTER.WH_ID
  is '库房';
comment on column TB_USC_CHECK_MASTER.CHECK_DATE
  is '清点日期（创建日期）';
comment on column TB_USC_CHECK_MASTER.CHECK_EMPLOYEE
  is '创建人';
comment on column TB_USC_CHECK_MASTER.APPROVAL_EMPLOYEE
  is '清点完成确认人';
comment on column TB_USC_CHECK_MASTER.APPROVAL_DATE
  is '清点完成日期';
comment on column TB_USC_CHECK_MASTER.STATUS
  is '状态';
comment on column TB_USC_CHECK_MASTER.CREATE_BY
  is '创建人';
comment on column TB_USC_CHECK_MASTER.CREATE_DATE
  is '创建日期';
comment on column TB_USC_CHECK_MASTER.UPDATE_BY
  is '更新人';
comment on column TB_USC_CHECK_MASTER.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_CHECK_MASTER.DEL_FLAG
  is '删除标识';
comment on column TB_USC_CHECK_MASTER.REMARKS
  is '备注';
comment on column TB_USC_CHECK_MASTER.SUPERVISOR
  is '监清人';
comment on column TB_USC_CHECK_MASTER.APPROVE_DOCUMENTS_ID
  is '审批ID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_CHECK_MASTER
  add constraint PK_TB_USC_CHECK_MASTER primary key (CHECK_ID);
  
   -- Create table
create table TB_USC_CHECK_DETAIL
(
  MATERIAL_ID            VARCHAR2(18),
  MATERIAL_NAME          VARCHAR2(500),
  PACKAGE_UNITS_CODE     VARCHAR2(10),
  PACKAGE_UNITS_NAME     VARCHAR2(50),
  MATERIAL_SPEC          VARCHAR2(200),
  MANUFACTURE_NAME       VARCHAR2(500),
  MANUFACTURE_CODE       VARCHAR2(50),
  STOCK_QUANTITY         NUMBER(10),
  CHECK_QUANTITY_PACKAGE NUMBER(10),
  UNITS_CODE             VARCHAR2(10),
  UNITS_NAME             VARCHAR2(50),
  AMOUNT_PER_PACKAGE     NUMBER(10),
  CHECK_QUANTITY_UNITS   NUMBER(10),
  CHECK_STATUS           VARCHAR2(1),
  CHECK_EMPLOYEE         VARCHAR2(15),
  CREATE_BY              VARCHAR2(50),
  CREATE_DATE            DATE,
  UPDATE_BY              VARCHAR2(50),
  UPDATE_DATE            DATE,
  CHECK_DETAIL_ID        VARCHAR2(10) not null,
  CHECK_ID               VARCHAR2(20),
  ORG_ID                 VARCHAR2(10),
  WH_ID                  NUMBER(10),
  LOCATION_ID            VARCHAR2(10)
);
-- Add comments to the table 
comment on table TB_USC_CHECK_DETAIL
  is '清点详细表';
-- Add comments to the columns 
comment on column TB_USC_CHECK_DETAIL.MATERIAL_ID
  is '物料ID';
comment on column TB_USC_CHECK_DETAIL.MATERIAL_NAME
  is '物料名称';
comment on column TB_USC_CHECK_DETAIL.PACKAGE_UNITS_CODE
  is '包装单位编号';
comment on column TB_USC_CHECK_DETAIL.PACKAGE_UNITS_NAME
  is '包装单位名称';
comment on column TB_USC_CHECK_DETAIL.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_CHECK_DETAIL.MANUFACTURE_NAME
  is '生产厂家';
comment on column TB_USC_CHECK_DETAIL.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_CHECK_DETAIL.STOCK_QUANTITY
  is '库存数量';
comment on column TB_USC_CHECK_DETAIL.CHECK_QUANTITY_PACKAGE
  is '清点数量';
comment on column TB_USC_CHECK_DETAIL.UNITS_CODE
  is '最小单位';
comment on column TB_USC_CHECK_DETAIL.UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_CHECK_DETAIL.AMOUNT_PER_PACKAGE
  is '包装数';
comment on column TB_USC_CHECK_DETAIL.CHECK_QUANTITY_UNITS
  is '最小单位盘点数量';
comment on column TB_USC_CHECK_DETAIL.CHECK_STATUS
  is '行信息盘点状态0未盘1已盘';
comment on column TB_USC_CHECK_DETAIL.CHECK_EMPLOYEE
  is '创建人（清点人）';
comment on column TB_USC_CHECK_DETAIL.CREATE_BY
  is '创建人';
comment on column TB_USC_CHECK_DETAIL.CREATE_DATE
  is '创建日期';
comment on column TB_USC_CHECK_DETAIL.UPDATE_BY
  is '更新人';
comment on column TB_USC_CHECK_DETAIL.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_CHECK_DETAIL.CHECK_DETAIL_ID
  is '明细表主键';
comment on column TB_USC_CHECK_DETAIL.CHECK_ID
  is '清点单号';
comment on column TB_USC_CHECK_DETAIL.ORG_ID
  is '组织ID';
comment on column TB_USC_CHECK_DETAIL.WH_ID
  is '库房';
comment on column TB_USC_CHECK_DETAIL.LOCATION_ID
  is '货位ID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_CHECK_DETAIL
  add constraint PK_TB_USC_CHECK_DETAIL primary key (CHECK_DETAIL_ID);
  
 -- Create table
create table TB_USC_CHECK_STOCK
(
  CHECK_STOCK_ID          NUMBER(10) not null,
  CHECK_ID                VARCHAR2(20) not null,
  CHECK_DATE              DATE,
  STOCK_ID                NUMBER(10),
  ORG_ID                  VARCHAR2(10),
  WH_ID                   NUMBER(10),
  MATERIAL_ID             VARCHAR2(18),
  MATERIAL_NAME           VARCHAR2(500),
  PACKAGE_UNITS_CODE      VARCHAR2(10),
  PACKAGE_UNITS_NAME      VARCHAR2(50),
  MATERIAL_SPEC           VARCHAR2(200),
  MANUFACTURE_NAME        VARCHAR2(500),
  MANUFACTURE_CODE        VARCHAR2(50),
  UNITS_CODE              VARCHAR2(10),
  UNITS_NAME              VARCHAR2(50),
  AMOUNT_PER_PACKAGE      NUMBER(10),
  BATCH_NO                VARCHAR2(50),
  VALID_DATE              DATE,
  BARCODE                 VARCHAR2(100),
  XBARCODE                VARCHAR2(30),
  JIT_STOCK_SUM_QTY       NUMBER(10),
  PICKING_QTY             NUMBER(10),
  JIT_STOCK_AVAILABLE_QTY NUMBER(10),
  UNITE_PRICE             NUMBER(10,4),
  STOCK_PRICE             NUMBER(18,8),
  LOCATION_ID             VARCHAR2(10),
  CHECK_QUANTITY_PACKAGE  NUMBER(10),
  CHECK_QUANTITY_UNITS    NUMBER(10),
  CHECK_STATUS            VARCHAR2(1),
  CHECK_EMPLOYEE          VARCHAR2(15),
  CREATE_BY               VARCHAR2(50) not null,
  CREATE_DATE             DATE,
  UPDATE_BY               VARCHAR2(50),
  UPDATE_DATE             DATE,
  REMARKS                 VARCHAR2(500)
);
-- Add comments to the table 
comment on table TB_USC_CHECK_STOCK
  is '库存快照';
-- Add comments to the columns 
comment on column TB_USC_CHECK_STOCK.CHECK_ID
  is '清点单号';
comment on column TB_USC_CHECK_STOCK.CHECK_DATE
  is '库存快照日期';
comment on column TB_USC_CHECK_STOCK.STOCK_ID
  is '主键';
comment on column TB_USC_CHECK_STOCK.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_CHECK_STOCK.WH_ID
  is '仓库编号';
comment on column TB_USC_CHECK_STOCK.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_CHECK_STOCK.MATERIAL_NAME
  is '物料名称';
comment on column TB_USC_CHECK_STOCK.PACKAGE_UNITS_CODE
  is '包装单位编号';
comment on column TB_USC_CHECK_STOCK.PACKAGE_UNITS_NAME
  is '包装单位名称';
comment on column TB_USC_CHECK_STOCK.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_CHECK_STOCK.MANUFACTURE_NAME
  is '生成厂家';
comment on column TB_USC_CHECK_STOCK.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_CHECK_STOCK.UNITS_CODE
  is '最小单位';
comment on column TB_USC_CHECK_STOCK.UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_CHECK_STOCK.AMOUNT_PER_PACKAGE
  is '包装数';
comment on column TB_USC_CHECK_STOCK.BATCH_NO
  is '批次号';
comment on column TB_USC_CHECK_STOCK.VALID_DATE
  is '效期';
comment on column TB_USC_CHECK_STOCK.BARCODE
  is '定数标签号';
comment on column TB_USC_CHECK_STOCK.XBARCODE
  is '箱标签';
comment on column TB_USC_CHECK_STOCK.JIT_STOCK_SUM_QTY
  is '当前库存量';
comment on column TB_USC_CHECK_STOCK.PICKING_QTY
  is '占用量';
comment on column TB_USC_CHECK_STOCK.JIT_STOCK_AVAILABLE_QTY
  is '当前可用量';
comment on column TB_USC_CHECK_STOCK.UNITE_PRICE
  is '入库采购单价';
comment on column TB_USC_CHECK_STOCK.STOCK_PRICE
  is '库存单价';
comment on column TB_USC_CHECK_STOCK.LOCATION_ID
  is '货位号';
comment on column TB_USC_CHECK_STOCK.CHECK_QUANTITY_PACKAGE
  is '清点数量';
comment on column TB_USC_CHECK_STOCK.CHECK_QUANTITY_UNITS
  is '最小单位清点数量';
comment on column TB_USC_CHECK_STOCK.CHECK_STATUS
  is '行信息清点状态0未清点1已清点';
comment on column TB_USC_CHECK_STOCK.CHECK_EMPLOYEE
  is '创建人（清点人）';
comment on column TB_USC_CHECK_STOCK.CREATE_BY
  is '创建人';
comment on column TB_USC_CHECK_STOCK.CREATE_DATE
  is '创建日期';
comment on column TB_USC_CHECK_STOCK.UPDATE_BY
  is '更新人';
comment on column TB_USC_CHECK_STOCK.UPDATE_DATE
  is '更新日期';
comment on column TB_USC_CHECK_STOCK.REMARKS
  is '备注';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_CHECK_STOCK
  add constraint PK_TB_USC_CHECK_STOCK primary key (CHECK_STOCK_ID, CHECK_ID);

  -- Create table
create table TB_USC_UNPACK_MST
(
  UNPACK_MST_ID VARCHAR2(20) not null,
  UNPACK_DATE   DATE default SYSDATE,
  UNPACK_PERSON VARCHAR2(50),
  REMARK        VARCHAR2(500),
  DEL_FLAG      VARCHAR2(1) default 'N',
  CREATE_DATE   DATE default SYSDATE,
  CREATE_BY     VARCHAR2(50) default 'SYSTEM',
  UPDATE_DATE   DATE default SYSDATE,
  UPDATE_BY     VARCHAR2(50) default 'SYSTEM'
);
-- Add comments to the table 
comment on table TB_USC_UNPACK_MST
  is '拆零主表';
-- Add comments to the columns 
comment on column TB_USC_UNPACK_MST.UNPACK_MST_ID
  is '拆零单号（主键）';
comment on column TB_USC_UNPACK_MST.UNPACK_DATE
  is '拆零时间';
comment on column TB_USC_UNPACK_MST.UNPACK_PERSON
  is '拆零人';
comment on column TB_USC_UNPACK_MST.REMARK
  is '备注';
comment on column TB_USC_UNPACK_MST.DEL_FLAG
  is '删除标志';
comment on column TB_USC_UNPACK_MST.CREATE_DATE
  is '创建时间';
comment on column TB_USC_UNPACK_MST.CREATE_BY
  is '创建人';
comment on column TB_USC_UNPACK_MST.UPDATE_DATE
  is '更新时间';
comment on column TB_USC_UNPACK_MST.UPDATE_BY
  is '更新人';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_UNPACK_MST
  add constraint PK_TB_USC_UNPACK_MST primary key (UNPACK_MST_ID);
  
-- Create table
create table TB_USC_UNPACK_DTL
(
  UNPACK_DTL_ID           VARCHAR2(20) not null,
  UNPACK_MST_ID           VARCHAR2(20) not null,
  STOCK_ID                NUMBER(10) not null,
  ORG_ID                  VARCHAR2(10),
  WH_ID                   NUMBER(10),
  MATERIAL_ID             VARCHAR2(18),
  MATERIAL_NAME           VARCHAR2(500),
  PACKAGE_UNITS_CODE      VARCHAR2(10),
  PACKAGE_UNITS_NAME      VARCHAR2(50),
  MATERIAL_SPEC           VARCHAR2(200),
  MANUFACTURE_NAME        VARCHAR2(500),
  MANUFACTURE_CODE        VARCHAR2(50),
  UNITS_CODE              VARCHAR2(10),
  UNITS_NAME              VARCHAR2(50),
  AMOUNT_PER_PACKAGE      NUMBER(10),
  BATCH_NO                VARCHAR2(50),
  VALID_DATE              DATE,
  BARCODE                 VARCHAR2(100),
  XBARCODE                VARCHAR2(30),
  JIT_STOCK_SUM_QTY       NUMBER(10),
  PICKING_QTY             NUMBER(10),
  JIT_STOCK_AVAILABLE_QTY NUMBER(10),
  UNITE_PRICE             NUMBER(13,4),
  STOCK_PRICE             NUMBER(18,8),
  LOCATION_ID             VARCHAR2(10),
  STERILIZED_DATE         DATE,
  REMARK                  VARCHAR2(500),
  DEL_FLAG                VARCHAR2(1) default 'N',
  CREATE_DATE             DATE default SYSDATE,
  CREATE_BY               VARCHAR2(50) default 'SYSTEM',
  UPDATE_DATE             DATE default SYSDATE,
  UPDATE_BY               VARCHAR2(50) default 'SYSTEM'
);
-- Add comments to the table 
comment on table TB_USC_UNPACK_DTL
  is '拆零子表';
-- Add comments to the columns 
comment on column TB_USC_UNPACK_DTL.UNPACK_DTL_ID
  is '拆零主键';
comment on column TB_USC_UNPACK_DTL.UNPACK_MST_ID
  is '拆零单号';
comment on column TB_USC_UNPACK_DTL.STOCK_ID
  is '库存主键';
comment on column TB_USC_UNPACK_DTL.ORG_ID
  is '组织ID，医院编码';
comment on column TB_USC_UNPACK_DTL.WH_ID
  is '仓库编号';
comment on column TB_USC_UNPACK_DTL.MATERIAL_ID
  is '医院物资编码';
comment on column TB_USC_UNPACK_DTL.MATERIAL_NAME
  is '物料名称';
comment on column TB_USC_UNPACK_DTL.PACKAGE_UNITS_CODE
  is '包装单位编号';
comment on column TB_USC_UNPACK_DTL.PACKAGE_UNITS_NAME
  is '包装单位名称';
comment on column TB_USC_UNPACK_DTL.MATERIAL_SPEC
  is '规格';
comment on column TB_USC_UNPACK_DTL.MANUFACTURE_NAME
  is '生产厂家';
comment on column TB_USC_UNPACK_DTL.MANUFACTURE_CODE
  is '生产厂家编码';
comment on column TB_USC_UNPACK_DTL.UNITS_CODE
  is '最小单位';
comment on column TB_USC_UNPACK_DTL.UNITS_NAME
  is '最小单位名称';
comment on column TB_USC_UNPACK_DTL.AMOUNT_PER_PACKAGE
  is '包装数';
comment on column TB_USC_UNPACK_DTL.BATCH_NO
  is '批次号';
comment on column TB_USC_UNPACK_DTL.VALID_DATE
  is '效期';
comment on column TB_USC_UNPACK_DTL.BARCODE
  is '定数标签号';
comment on column TB_USC_UNPACK_DTL.XBARCODE
  is '箱标签';
comment on column TB_USC_UNPACK_DTL.JIT_STOCK_SUM_QTY
  is '当前库存量';
comment on column TB_USC_UNPACK_DTL.PICKING_QTY
  is '占用量';
comment on column TB_USC_UNPACK_DTL.JIT_STOCK_AVAILABLE_QTY
  is '当前可用量';
comment on column TB_USC_UNPACK_DTL.UNITE_PRICE
  is '入库采购单价';
comment on column TB_USC_UNPACK_DTL.STOCK_PRICE
  is '库存单价';
comment on column TB_USC_UNPACK_DTL.LOCATION_ID
  is '货位号';
comment on column TB_USC_UNPACK_DTL.STERILIZED_DATE
  is '灭菌日期';
comment on column TB_USC_UNPACK_DTL.REMARK
  is '备注';
comment on column TB_USC_UNPACK_DTL.DEL_FLAG
  is '删除标志';
comment on column TB_USC_UNPACK_DTL.CREATE_DATE
  is '创建时间';
comment on column TB_USC_UNPACK_DTL.CREATE_BY
  is '创建人';
comment on column TB_USC_UNPACK_DTL.UPDATE_DATE
  is '更新时间';
comment on column TB_USC_UNPACK_DTL.UPDATE_BY
  is '更新人';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_UNPACK_DTL
  add constraint PK_TB_USC_UNPACK_DTL primary key (UNPACK_DTL_ID);
 
-- Create table
create table TB_USC_APPROVE_LINE_MST
(
  APPROVE_LINE_MST_ID VARCHAR2(25) not null,
  APPROVE_TYPE_CODE   VARCHAR2(30) not null,
  APPROVE_TYPE_NAME   VARCHAR2(50),
  APPROVE_SUB_TYPE    VARCHAR2(100) not null,
  USE_FLAG            VARCHAR2(1) default 'N',
  REMARK              VARCHAR2(500),
  DEL_FLAG            VARCHAR2(1) default 'N',
  CREATE_BY           VARCHAR2(50) default 'SYSTEM',
  CREATE_DATE         DATE default SYSDATE,
  UPDATE_BY           VARCHAR2(50) default 'SYSTEM',
  UPDATE_DATE         DATE default SYSDATE
);
-- Add comments to the columns 
comment on column TB_USC_APPROVE_LINE_MST.APPROVE_LINE_MST_ID
  is '主键,审批Id';
comment on column TB_USC_APPROVE_LINE_MST.APPROVE_TYPE_CODE
  is '审批线代码';
comment on column TB_USC_APPROVE_LINE_MST.APPROVE_TYPE_NAME
  is '审批类型，例：供应商审批、物资审批。信息在公共代码表维护';
comment on column TB_USC_APPROVE_LINE_MST.APPROVE_SUB_TYPE
  is '审批类别';
comment on column TB_USC_APPROVE_LINE_MST.USE_FLAG
  is '启用与否';
comment on column TB_USC_APPROVE_LINE_MST.REMARK
  is '备注';
comment on column TB_USC_APPROVE_LINE_MST.DEL_FLAG
  is '删除标志';
comment on column TB_USC_APPROVE_LINE_MST.CREATE_BY
  is '创建人';
comment on column TB_USC_APPROVE_LINE_MST.CREATE_DATE
  is '创建时间';
comment on column TB_USC_APPROVE_LINE_MST.UPDATE_BY
  is '更新人';
comment on column TB_USC_APPROVE_LINE_MST.UPDATE_DATE
  is '更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_APPROVE_LINE_MST
  add constraint PK_TB_USC_APPROVE_LINE_MST primary key (APPROVE_LINE_MST_ID);

-- Create table
create table TB_USC_APPROVE_LINE_DTL
(
  APPROVE_LINE_DTL_ID  VARCHAR2(25) not null,
  APPROVE_LINE_MST_ID  VARCHAR2(25) not null,
  APPROVE_PERSON_NO    VARCHAR2(15) not null,
  APPROVE_PERSON_NAME  VARCHAR2(100),
  SPECIAL_APPROVE_SPEC VARCHAR2(100),
  SPECIAL_APPROVE_DESC VARCHAR2(500),
  APPROVE_ORDER        VARCHAR2(25) not null,
  ORG_ID               VARCHAR2(25),
  ORG_NAME             VARCHAR2(100),
  USE_FLAG             VARCHAR2(1) default 'N',
  REMARK               VARCHAR2(500),
  DEL_FLAG             VARCHAR2(1) default 'N',
  CREATE_BY            VARCHAR2(50) default 'SYSTEM',
  CREATE_DATE          DATE default SYSDATE,
  UPDATE_BY            VARCHAR2(50) default 'SYSTEM',
  UPDATE_DATE          DATE default SYSDATE
);
-- Add comments to the columns 
comment on column TB_USC_APPROVE_LINE_DTL.APPROVE_LINE_DTL_ID
  is '主键';
comment on column TB_USC_APPROVE_LINE_DTL.APPROVE_LINE_MST_ID
  is '审批id';
comment on column TB_USC_APPROVE_LINE_DTL.APPROVE_PERSON_NO
  is '审批人员工号';
comment on column TB_USC_APPROVE_LINE_DTL.APPROVE_PERSON_NAME
  is '审批人姓名';
comment on column TB_USC_APPROVE_LINE_DTL.SPECIAL_APPROVE_SPEC
  is '特殊审批功能 比如定义供应商审批时，按顺序指定审批内容，填写审批内容自定义编码或者是页面tab页签id等';
comment on column TB_USC_APPROVE_LINE_DTL.SPECIAL_APPROVE_DESC
  is '特殊审批功能说明 、对特殊审批功能的说明';
comment on column TB_USC_APPROVE_LINE_DTL.APPROVE_ORDER
  is '审批顺序';
comment on column TB_USC_APPROVE_LINE_DTL.ORG_ID
  is '组织Id';
comment on column TB_USC_APPROVE_LINE_DTL.ORG_NAME
  is '组织名称';
comment on column TB_USC_APPROVE_LINE_DTL.USE_FLAG
  is '使用标记';
comment on column TB_USC_APPROVE_LINE_DTL.REMARK
  is '备注';
comment on column TB_USC_APPROVE_LINE_DTL.DEL_FLAG
  is '删除标志';
comment on column TB_USC_APPROVE_LINE_DTL.CREATE_BY
  is '创建人';
comment on column TB_USC_APPROVE_LINE_DTL.CREATE_DATE
  is '创建时间';
comment on column TB_USC_APPROVE_LINE_DTL.UPDATE_BY
  is '更新人';
comment on column TB_USC_APPROVE_LINE_DTL.UPDATE_DATE
  is '更新时间';

-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USC_APPROVE_LINE_DTL
  add constraint PK_TB_USC_APPROVE_LINE_DTL primary key (APPROVE_LINE_DTL_ID);
  