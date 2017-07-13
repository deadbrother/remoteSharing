--20160106
--更新9表sql条件字段

--更新成功标准sql条件字段
alter table clyx_successstandard_info add extralCol clob;
update clyx_successstandard_info set extralCol= success_sql_condition;
alter table clyx_successstandard_info  drop column success_sql_condition ;
alter table clyx_successstandard_info rename column extralCol to success_sql_condition;
comment on column clyx_successstandard_info.success_sql_condition  is '条件回显到用户群标示';
--更新客户经理sql条件字段
alter table CLYX_ACTIVITY_FROLINECHANNEL add extralCol clob;
update CLYX_ACTIVITY_FROLINECHANNEL set extralCol= filter_sql_condition;
alter table CLYX_ACTIVITY_FROLINECHANNEL  drop column filter_sql_condition ;
alter table CLYX_ACTIVITY_FROLINECHANNEL rename column extralCol to filter_sql_condition;
comment on column CLYX_ACTIVITY_FROLINECHANNEL.filter_sql_condition  is '条件回显到用户群标示';
--更新短信sql条件字段
alter table CLYX_ACTIVITY_MSMCHANNEL add extralCol clob;
update CLYX_ACTIVITY_MSMCHANNEL set extralCol= filter_sql_condition;
alter table CLYX_ACTIVITY_MSMCHANNEL  drop column filter_sql_condition ;
alter table CLYX_ACTIVITY_MSMCHANNEL rename column extralCol to filter_sql_condition;
comment on column CLYX_ACTIVITY_MSMCHANNEL.filter_sql_condition  is '条件回显到用户群标示';
--更新弹窗sql条件字段
alter table CLYX_P_CHANNEL_GROUPPOPUP add extralCol clob;
update CLYX_P_CHANNEL_GROUPPOPUP set extralCol= filter_sql_condition;
alter table CLYX_P_CHANNEL_GROUPPOPUP  drop column filter_sql_condition ;
alter table CLYX_P_CHANNEL_GROUPPOPUP rename column extralCol to filter_sql_condition;
comment on column CLYX_P_CHANNEL_GROUPPOPUP.filter_sql_condition  is '条件回显到用户群标示';
--更新手厅sql条件字段
alter table CLYX_P_CHANNEL_HANDOFFICEINFO add extralCol clob;
update CLYX_P_CHANNEL_HANDOFFICEINFO set extralCol= filter_sql_condition;
alter table CLYX_P_CHANNEL_HANDOFFICEINFO  drop column filter_sql_condition ;
alter table CLYX_P_CHANNEL_HANDOFFICEINFO rename column extralCol to filter_sql_condition;
comment on column CLYX_P_CHANNEL_HANDOFFICEINFO.filter_sql_condition  is '条件回显到用户群标示';
--更新微信sql条件字段
alter table CLYX_P_CHANNEL_WEBCHATINFO add extralCol clob;
update CLYX_P_CHANNEL_WEBCHATINFO set extralCol= filter_sql_condition;
alter table CLYX_P_CHANNEL_WEBCHATINFO  drop column filter_sql_condition ;
alter table CLYX_P_CHANNEL_WEBCHATINFO rename column extralCol to filter_sql_condition;
comment on column CLYX_P_CHANNEL_WEBCHATINFO.filter_sql_condition  is '条件回显到用户群标示';
--更新沃视窗sql条件字段
alter table CLYX_P_CHANNEL_WOWINDOWINFO add extralCol clob;
update CLYX_P_CHANNEL_WOWINDOWINFO set extralCol= filter_sql_condition;
alter table CLYX_P_CHANNEL_WOWINDOWINFO  drop column filter_sql_condition ;
alter table CLYX_P_CHANNEL_WOWINDOWINFO rename column extralCol to filter_sql_condition;
comment on column CLYX_P_CHANNEL_WOWINDOWINFO.filter_sql_condition  is '条件回显到用户群标示';
--更新网厅sql条件字段
alter table CLYX_P_CHANNEL_WEBOFFICEINFO add extralCol clob;
update CLYX_P_CHANNEL_WEBOFFICEINFO set extralCol= filter_sql_condition;
alter table CLYX_P_CHANNEL_WEBOFFICEINFO  drop column filter_sql_condition ;
alter table CLYX_P_CHANNEL_WEBOFFICEINFO rename column extralCol to filter_sql_condition;
comment on column CLYX_P_CHANNEL_WEBOFFICEINFO.filter_sql_condition  is '条件回显到用户群标示';
--更新客户细分规则列表sql条件字段
alter table CLYX_ACTIVITY_CHANNELSPECIAL add extralCol clob;
update CLYX_ACTIVITY_CHANNELSPECIAL set extralCol= filter_sql_condition;
alter table CLYX_ACTIVITY_CHANNELSPECIAL  drop column filter_sql_condition ;
alter table CLYX_ACTIVITY_CHANNELSPECIAL rename column extralCol to filter_sql_condition;
comment on column CLYX_ACTIVITY_CHANNELSPECIAL.filter_sql_condition  is '条件回显到用户群标示';

--增加成功标准类型的数据
insert into clyx_successstandard_type values('13','其他标准','uni076','1','13','不需要成功标准判定','','0','');

--客户经理表添加规则适用范围字段
ALTER TABLE clyx_activity_frolinechannel  ADD rule_org_id varchar2(2000);
ALTER TABLE clyx_activity_frolinechannel  ADD rule_org_path varchar2(4000);
ALTER TABLE clyx_activity_frolinechannel  ADD rule_org_name varchar2(4000);
ALTER TABLE clyx_activity_frolinechannel  ADD selling_area varchar2(4000);

--更新错别字，2，3号已执行过
 update clyx_successstandard_type set type_name='承诺低消' where type_id='10'
 --修改字段日志表字段长度，2，3号已执行过
 ALTER TABLE clyx_execute_log modify  remark varchar2(2000);
 
 --增加审批通过状态
 insert into clyx_activity_state_code values('14','审批通过','1',7,'uni076')
 
 --security 用户下操作授权
  grant select on DIM_REF_CITY_ID to clyxv3_hn;
    grant select on org_class to clyxv3_hn;
    grant select on orginfo to clyxv3_hn;
    
--新建系统参数表，2、3号已经同步
create table clyx_system_param(
    sys_param     varchar2(10),
    sys_param_name      varchar2(100),
    sys_param_value     varchar2(200),
    sys_param_desc      varchar2(200),
    tenant_id varchar2(20)
);
comment on table clyx_system_param is '存量营销系统参数表';
comment on column clyx_system_param.sys_param is '参数编码';
comment on column clyx_system_param.sys_param_name is '参数名称';
comment on column clyx_system_param.sys_param_value is '参数值';
comment on column clyx_system_param.sys_param_desc is '参数描述';
comment on column clyx_system_param.tenant_id is '租户id';

--系统参数表新增数据，2、3号已同步
insert into CLYX_SYSTEM_PARAM (sys_param, sys_param_name, sys_param_value, sys_param_desc, tenant_id)
values ('1', '开关', '0', '控制开关关闭的参数：1、开启，0、关闭', 'uni076');
insert into CLYX_SYSTEM_PARAM (sys_param, sys_param_name, sys_param_value, sys_param_desc, tenant_id)
values ('2', '工单账期控制', 'select case when (sysdate - to_date(max_date,''yyyy-mm-dd'') between 1 and 2) then  ''1'' else ''0'' end from Ui_Scheme_Data_Fubu', '控制开关工单是否生成的参数：1、是，0、否', 'uni076');
--文字修改2、3号已经同步
update clyx_activity_state_code set state_desc='创建' where state_code='13'


--成功标准文字修改，3号执行
update clyx_successstandard_type set type_name='换卡' ,condition='基于标签数据每日计算。目标客户当日的“智能卡类型”标签值与前日比较，发生变化的认为营销成功。' where type_id='1';
update clyx_successstandard_type set type_name='换机' ,condition='基于标签数据每日计算。目标客户当日的“终端类型”标签值与前日比较，发生变化的认为营销成功。' where type_id='2';
update clyx_successstandard_type set type_name='办理流量包' ,condition='基于业务受理记录每日计算。目标客户当日订购了成功标准配置时圈定的任意流量包之一，认为营销成功。' where type_id='3';
update clyx_successstandard_type set type_name='办理续约' ,condition='基于业务受理记录每日计算。目标客户当日订购了成功标准配置时圈定的任意合约政策之一，认为营销成功。' where type_id='4';
update clyx_successstandard_type set type_name='换套餐' ,condition='基于业务受理记录每日计算。目标客户当日订购了成功标准配置时圈定的任意套餐之一，认为营销成功。' where type_id='5';
update clyx_successstandard_type set type_name='实名登记' ,condition='基于标签数据每日计算。目标用户“是否实名制”标签值为“是”，认为营销成功。' where type_id='6';
update clyx_successstandard_type set type_name='宽带续签' ,condition='基于标签数据每日计算。目标用户“是否宽带已续签”标签值为“是”，认为营销成功。' where type_id='7';
update clyx_successstandard_type set type_name='办理副卡' ,condition='基于标签数据每日计算。目标用户“是否主副卡”标签值等于主卡或副卡，认为营销成功。' where type_id='8';
update clyx_successstandard_type set type_name='4G登网' ,condition='基于标签数据每日计算。目标用户“业务类型（网络）”标签值为“4G业务”，认为营销成功。' where type_id='9';
update clyx_successstandard_type set type_name='承诺低消' ,condition='基于业务受理记录每日计算。目标客户当日订购了成功标准配置时圈定的任意产品之一，认为营销成功。' where type_id='10';
update clyx_successstandard_type set type_name='欠费催缴' ,condition='基于标签数据每日计算。目标用户“欠费金额(元)”标签值等于0，认为营销成功。' where type_id='11';
update clyx_successstandard_type set type_name='提高稳定度' ,condition='基于标签数据每日计算。目标用户当月的“稳定度”标签值与前月比较，提高了（低->中/高、中->高）的认为营销成功。' where type_id='12';

--修改黑白名单表结构，需要给4号改
create sequence FILTE_USERS_id    
alter table CLYX_ACTIVITY_FILTE_USERS  add area_no varchar2(30); 
alter table CLYX_ACTIVITY_FILTE_USERS_LOG  add area_no varchar2(30);

--本地短信表新加字段,2号已修改,3号已经修改， 4 号未修改
ALTER TABLE clyx_activity_msmchannel ADD order_product_id varchar2(500);

--统一配置短信表增加字段,2号已改,3号已经修改， 4 未改
ALTER TABLE clyx_activity_channelrule ADD MESS_ORDER_CODE VARCHAR2(100);
ALTER TABLE clyx_activity_channelrule ADD MESS_NODISTURB_CODE VARCHAR2(100);
ALTER TABLE clyx_activity_channelrule ADD MESS_EFFECTIVE_TIME VARCHAR2(200);

--本地弹窗表增加发送短信相关字段,2号已改,3 4未改
ALTER TABLE clyx_p_channel_groupPopup ADD is_send_sms VARCHAR2(10);
ALTER TABLE clyx_p_channel_groupPopup ADD sms_send_words VARCHAR2(500);

--成功标准类型表字段值更新,字段添加 , 2号已改  3,4 未改
update clyx_successstandard_type set type_name='资费订购',product_rel='1' where type_id='10'
ALTER TABLE clyx_successstandard_type ADD rst1 VARCHAR2(32);
comment  on column  clyx_successstandard_type.rst1  is  '01,资费;02,服务;03,SP';
update clyx_successstandard_type set rst1='01' where type_id='10'

--工单生成控制系统参数表中字段属性、值修改
alter table clyx_system_param modify(sys_param_value varchar2(4000));
delete from clyx_system_param where sys_param = '2';
insert into CLYX_SYSTEM_PARAM (sys_param, sys_param_name, sys_param_value, sys_param_desc, tenant_id)
values ('2', '工单账期控制', '(t.activity_cycle in (''3'') or' || chr(10) || '       (t.activity_cycle in (''1'', ''2'') and' || chr(10) || '       (trunc(sysdate) - trunc(t.create_date) = 0)) or' || chr(10) || '       (t.activity_cycle = ''1'' and' || chr(10) || '       months_between(sysdate, to_date(max_month, ''yyyy-mm'')) <=1) or' || chr(10) || '       (t.activity_cycle = ''2'' and' || chr(10) || '       sysdate - to_date(max_date, ''yyyy-mm-dd'') between 1 and 2))', '控制开关工单是否生成的参数：1、是，0、否', 'uni076');
--工单生成账期控制修改
delete from clyx_system_param where sys_param = '2';
insert into CLYX_SYSTEM_PARAM (sys_param, sys_param_name, sys_param_value, sys_param_desc, tenant_id)
values ('2', '工单账期控制', '(t.activity_cycle in (''3'') or' || chr(10) || '       (t.activity_cycle in (''1'', ''2'') and' || chr(10) || '       (trunc(sysdate) - trunc(t.create_date) = 0)) or' || chr(10) || '       (t.activity_cycle = ''1'' and' || chr(10) || '       months_between(to_date(to_char(sysdate,''yyyy-mm''),''yyyy-mm''),      to_date(max_month, ''yyyy-mm'')) <=1) or' || chr(10) || '       (t.activity_cycle = ''2'' and' || chr(10) || '       sysdate - to_date(max_date, ''yyyy-mm-dd'') between 1 and 2))', '控制开关工单是否生成的参数：1、是，0、否', 'uni076');

--新增产品排序表  (2,3号已执行)
-- Create table
create table CLYX_ACTIVITY_PRODUCT_ORD
(
  ORD        VARCHAR2(40) not null,
  PRODUCT_ID VARCHAR2(40) not null
)
-- Add comments to the table 
comment on table CLYX_ACTIVITY_PRODUCT_ORD
  is '存量活动定义页面已选择产品的排序表';
-- Add comments to the columns 
comment on column CLYX_ACTIVITY_PRODUCT_ORD.ORD
  is '已选择产品排序依据';
comment on column CLYX_ACTIVITY_PRODUCT_ORD.PRODUCT_ID
  is '已选产品编码'
-- Create/Recreate primary, unique and foreign key constraints 
alter table CLYX_ACTIVITY_PRODUCT_ORD
  add constraint 活动主键 primary key (ORD)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

CREATE SEQUENCE activity_emp_sequence
          INCREMENT BY 1 -- 每次加几个
          START WITH 1 -- 从1开始计数
          NOMAXVALUE -- 不设置最大值
          NOCYCLE -- 一直累加，不循环
          NOCACHE -- 不建缓冲区

CREATE TRIGGER activity_emp_sequence_do BEFORE
          INSERT ON CLYX_ACTIVITY_PRODUCT_ORD FOR EACH ROW WHEN (new.ord is null)
      begin
          select emp_sequence.nextval into:new.ord from dual;
       end;
       
--话术变量表   字段值修改,  新增字段 (2,3号已执行)
ALTER TABLE clyx_huashu_var ADD mysql_name VARCHAR2(100);
update clyx_huashu_var set real_name='W3_PROD_ID_1' where id='9';
update clyx_huashu_var set real_name='AREA_NO' where id='4';
update clyx_huashu_var set mysql_name='u.MB_NET_TYPE' where id='1';
update clyx_huashu_var set mysql_name='u.PRODUCT_CLASS' where id='2';
update clyx_huashu_var set mysql_name='u.PROV_ID' where id='3';
update clyx_huashu_var set mysql_name='u.AREA_ID' where id='4';
update clyx_huashu_var set mysql_name='u.MB_AGREEMENT_TYPE' where id='5';
update clyx_huashu_var set mysql_name = 'DATE_FORMAT(u.MB_AGREEMENT_END_TIME,''%Y-%m-%d'') MB_AGREEMENT_END_TIME'where id = '6';
update clyx_huashu_var set mysql_name='u.MB_ARPU' where id='7';
update clyx_huashu_var set mysql_name='u.WENDING_FLAG' where id='8';
update clyx_huashu_var set mysql_name='u.ELECCHANNEL_FLAG' where id='9';
update clyx_huashu_var set mysql_name='u.CO_B_01' where id='10';
update clyx_huashu_var set mysql_name='u.KD_PACKAGE_ID' where id='11';
update clyx_huashu_var set mysql_name='CONCAT(ROUND(u.N_05_M),''%'') N_05_M' where id='12';
update clyx_huashu_var set mysql_name='CONCAT(ROUND(u.N_03_M),''%'') N_03_M' where id='13';

--本地弹窗表新加字段
ALTER TABLE clyx_p_channel_grouppopup ADD channel_identify VARCHAR2(10);
comment on column clyx_p_channel_grouppopup.channel_identify
  is '营业厅标识,0,自有营业厅;1 社会营业厅';
update clyx_p_channel_grouppopup set channel_identify='0' where channelname='自有营业厅';;
update clyx_p_channel_grouppopup set channel_identify='1' where channelname='社会营业厅';

--异网策划客户经理表
alter table clyx_yw_frolinechannel add SELLING_AREA clob;

create table CLYX_ACTIVITY_TIME_QUANTUM
(
  id      VARCHAR2(10),
  time    VARCHAR2(10),
  ord     VARCHAR2(10),
  expand1 VARCHAR2(32)
);
comment on table CLYX_ACTIVITY_TIME_QUANTUM
  is '活动短信的时间段表';
comment on column CLYX_ACTIVITY_TIME_QUANTUM.id
  is '时间表id';
comment on column CLYX_ACTIVITY_TIME_QUANTUM.time
  is '时间表time';
comment on column CLYX_ACTIVITY_TIME_QUANTUM.ord
  is '排序';
create table CLYX_ACTIVITY_TIME_POINT
(
  id      VARCHAR2(10),
  time    VARCHAR2(32),
  ord     VARCHAR2(10),
  expand1 VARCHAR2(10),
  expand2 VARCHAR2(32)
);
comment on table CLYX_ACTIVITY_TIME_POINT
  is '时间段表';
comment on column CLYX_ACTIVITY_TIME_POINT.id
  is 'id';
comment on column CLYX_ACTIVITY_TIME_POINT.time
  is '时间段';
comment on column CLYX_ACTIVITY_TIME_POINT.ord
  is '排序';
comment on column CLYX_ACTIVITY_TIME_POINT.expand1
  is '扩展字段';
comment on column CLYX_ACTIVITY_TIME_POINT.expand2
  is '传给短信的value';
  
insert into CLYX_ACTIVITY_TIME_POINT (id, time, ord, expand1, expand2)
values ('1', '6:00-9:00', '1', '早晨', '0600-0900');
insert into CLYX_ACTIVITY_TIME_POINT (id, time, ord, expand1, expand2)
values ('2', '9:00-12:00', '2', '上午', '0900-1200');
insert into CLYX_ACTIVITY_TIME_POINT (id, time, ord, expand1, expand2)
values ('3', '12:00-14:00', '3', '中午', '1200-1400');
insert into CLYX_ACTIVITY_TIME_POINT (id, time, ord, expand1, expand2)
values ('4', '14:00-18:00', '4', '下午', '1400-1800');
insert into CLYX_ACTIVITY_TIME_POINT (id, time, ord, expand1, expand2)
values ('5', '18:00-23:00', '5', '晚上', '1800-2300');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('1', '0:00', '1', '0000');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('2', '0:30', '2', '0030');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('3', '1:00', '3', '0100');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('4', '1:30', '4', '0130');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('5', '2:00', '5', '0200');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('6', '2:30', '6', '0230');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('7', '3:00', '7', '0300');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('8', '3:30', '8', '0330');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('9', '4:00', '9', '0400');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('10', '4:30', '10', '0430');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('11', '5:00', '11', '0500');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('12', '5:30', '12', '0530');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('13', '6:00', '13', '0600');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('14', '6:30', '14', '0630');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('15', '7:00', '15', '0700');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('16', '7:30', '16', '0730');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('17', '8:00', '17', '0800');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('18', '8:30', '18', '0830');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('19', '9:00', '19', '0900');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('20', '9:30', '20', '0930');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('21', '10:00', '21', '1000');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('22', '10:30', '22', '1030');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('23', '11:00', '23', '1100');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('24', '11:30', '24', '1130');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('25', '12:00', '25', '1200');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('26', '12:30', '26', '1230');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('27', '13:00', '27', '1300');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('28', '13:30', '28', '1330');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('29', '14:00', '29', '1400');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('30', '14:30', '30', '1430');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('31', '15:00', '31', '1500');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('32', '15:30', '32', '1530');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('33', '16:00', '33', '1600');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('34', '16:30', '34', '1630');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('35', '17:00', '35', '1700');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('36', '17:30', '36', '1730');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('37', '18:00', '37', '1800');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('38', '18:30', '38', '1830');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('39', '19:00', '39', '1900');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('40', '19:30', '40', '1930');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('41', '20:00', '41', '2000');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('42', '20:30', '42', '2030');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('43', '21:00', '43', '2100');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('44', '21:30', '44', '2130');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('45', '22:00', '45', '2200');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('46', '22:30', '46', '2230');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('47', '23:00', '47', '2300');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('48', '23:30', '48', '2400');
insert into CLYX_ACTIVITY_TIME_QUANTUM (id, time, ord, expand1)
values ('49', '0:00', '49', '0000');

alter table clyx_activity_msmchannel modify(MESSAGE_SEND_TIME varchar2(1000));
alter table CLYX_ACTIVITY_CHANNELRULE modify(MESSAGE_SEND_TIME varchar2(1000));

--弹窗优先级表
create table CLYX_ACTIVITY_POP_CONFIG
(
  theme_priority   NUMBER,
  theme_code       VARCHAR2(32),
  theme_ascription VARCHAR2(5),
  tenant_id        VARCHAR2(32)
);
comment on table CLYX_ACTIVITY_POP_CONFIG
  is '弹窗配置表';
comment on column CLYX_ACTIVITY_POP_CONFIG.theme_priority
  is '主题优先级';
comment on column CLYX_ACTIVITY_POP_CONFIG.theme_code
  is '主题编码';
comment on column CLYX_ACTIVITY_POP_CONFIG.theme_ascription
  is '主题归属(1,省份;2,地市)';
comment on column CLYX_ACTIVITY_POP_CONFIG.tenant_id
  is '租户id';
  
  --弹窗活动优先级表
create table CLYX_ACTIVITY_THEME_PRIORITY
(
  activity_id VARCHAR2(32),
  ord         NUMBER,
  theme_code  VARCHAR2(32),
  tenant_id   VARCHAR2(32),
  is_valid    VARCHAR2(32),
  org_level   VARCHAR2(2)
);
comment on column CLYX_ACTIVITY_THEME_PRIORITY.activity_id
  is '活动id';
comment on column CLYX_ACTIVITY_THEME_PRIORITY.ord
  is '活动排序字段';
comment on column CLYX_ACTIVITY_THEME_PRIORITY.theme_code
  is '主题编码';
comment on column CLYX_ACTIVITY_THEME_PRIORITY.tenant_id
  is '租户id';
comment on column CLYX_ACTIVITY_THEME_PRIORITY.is_valid
  is '是否生效';
comment on column CLYX_ACTIVITY_THEME_PRIORITY.org_level
  is '地域等级：1、省份；2、地市及以下';

--增加预留工单百分比字段
alter table CLYX_ACTIVITY add obligate_order varchar2(10);
alter table CLYX_ACTIVITY_CHANNELRULE add OBLIGATE_ORDER varchar2(10);

--话术变量新加
insert into clyx_huashu_var(id,name,remarks,ord,prov_id,city_id,valid,content,tenant_id,real_name,var_type,mysql_name) values('18','2G终端换机拍照用户通用产品','2G终端换机拍照用户通用产品','18','-1','-1','1','${2G终端换机拍照用户通用产品}','uni076','C_0026','01','u.C_0026 C_0026');
insert into clyx_huashu_var(id,name,remarks,ord,prov_id,city_id,valid,content,tenant_id,real_name,var_type,mysql_name) values('19','2G终端换机拍照用户个性化产品','2G终端换机拍照用户个性化产品','19','-1','-1','1','${2G终端换机拍照用户个性化产品}','uni076','C_0027','01','u.C_0027 C_0027');
insert into clyx_huashu_var(id,name,remarks,ord,prov_id,city_id,valid,content,tenant_id,real_name,var_type,mysql_name) values('20','2G终端换机拍照用户对应渠道名称','2G终端换机拍照用户对应渠道名称','20','-1','-1','1','${2G终端换机拍照用户对应渠道名称}','uni076','C_0029','01','u.C_0029 C_0029');
insert into clyx_huashu_var(id,name,remarks,ord,prov_id,city_id,valid,content,tenant_id,real_name,var_type,mysql_name) values('22','终端品牌','终端品牌','22','-1','-1','1','${终端品牌}','uni076','TE_N_02','01','u.MB_TERMINAL_BRAND MB_TERMINAL_BRAND');
insert into clyx_huashu_var(id,name,remarks,ord,prov_id,city_id,valid,content,tenant_id,real_name,var_type,mysql_name) values('21','2G终端换机拍照用户对应渠道地址','2G终端换机拍照用户对应渠道地址','21','-1','-1','1','${2G终端换机拍照用户对应渠道地址}','uni076','C_0030','01','u.C_0030 C_0030');

--审批人表
-- Create table
create table CLYX_P_PROC_PAGE
(
  id    VARCHAR2(20),
  title VARCHAR2(100),
  des   VARCHAR2(500)
);
-- Add comments to the table 
comment on table CLYX_P_PROC_PAGE
  is '审批页面细分';
-- Add comments to the columns 
comment on column CLYX_P_PROC_PAGE.id
  is '页面id';
comment on column CLYX_P_PROC_PAGE.title
  is '页面title';
comment on column CLYX_P_PROC_PAGE.des
  is '描述';
  
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('32', '县部门经理审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('31', '县业务部主管修改', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('33', '县公司领导审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('34', '市公司市场营销部主管审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('35', '市公司市场营销部经理审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('36', '市分公司副总审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('37', '省公司主管审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('38', '省公司客服部审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('21', '市业务部主管修改', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('22', '市部门经理审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('23', '市分公司市场营销部经理审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('24', '省公司市场营销部审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('25', '省公司客服部审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('11', '省业务部主管修改', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('12', '省部门经理审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('13', '省公司市场营销部审批', null);
insert into CLYX_P_PROC_PAGE (id, title, des)
values ('14', '省公司客服部审批', null);

--审批页面元素关联表
-- Create table
create table CLYX_P_PROC_RESOURCE_REL
(
  page_id        VARCHAR2(20),
  resource_id    VARCHAR2(20),
  resource_des   VARCHAR2(100),
  resource_group VARCHAR2(10),
  valid          VARCHAR2(10),
  ord            NUMBER
);
-- Add comments to the table 
comment on table CLYX_P_PROC_RESOURCE_REL
  is '审批页面元素关联';
-- Add comments to the columns 
comment on column CLYX_P_PROC_RESOURCE_REL.page_id
  is '审批页面id';
comment on column CLYX_P_PROC_RESOURCE_REL.resource_id
  is '元素id';
comment on column CLYX_P_PROC_RESOURCE_REL.resource_des
  is '元素描述';
comment on column CLYX_P_PROC_RESOURCE_REL.resource_group
  is '元素分组';
comment on column CLYX_P_PROC_RESOURCE_REL.valid
  is '有效性:1.有效,0.无效';
comment on column CLYX_P_PROC_RESOURCE_REL.ord
  is '排序';

--活动表新加字段：活动对应的流程id  
alter table clyx_activity add process_instance_id varchar2(50);
--指定渠道码表
create table CLYX_ACTIVITY_ORGINFO_REL
(
  code_id   VARCHAR2(10),
  code_name VARCHAR2(32),
  ord       NUMBER,
  is_valid  VARCHAR2(2),
  tenant_id VARCHAR2(32),
  reserve1  VARCHAR2(32),
  reserve2  VARCHAR2(32),
  reserve3  VARCHAR2(32)
);
-- Add comments to the table 
comment on table CLYX_ACTIVITY_ORGINFO_REL
  is '下发规则制定渠道配置渠道码表';
-- Add comments to the columns 
comment on column CLYX_ACTIVITY_ORGINFO_REL.code_id
  is '选择的渠道编码（对应orginfo表中的reserve1字段）';
comment on column CLYX_ACTIVITY_ORGINFO_REL.code_name
  is '渠道名称';
comment on column CLYX_ACTIVITY_ORGINFO_REL.ord
  is '排序';
comment on column CLYX_ACTIVITY_ORGINFO_REL.is_valid
  is '是否生效';
comment on column CLYX_ACTIVITY_ORGINFO_REL.tenant_id
  is '租户id';
comment on column CLYX_ACTIVITY_ORGINFO_REL.reserve1
  is '预留字段1';
comment on column CLYX_ACTIVITY_ORGINFO_REL.reserve2
  is '预留字段2';
comment on column CLYX_ACTIVITY_ORGINFO_REL.reserve3
  is '预留字段3';
  
insert into CLYX_ACTIVITY_ORGINFO_REL (code_id, code_name, ord, is_valid, tenant_id, reserve1, reserve2, reserve3)
values ('G0302', '营业厅', 1, '1', 'uni076', null, null, null);
insert into CLYX_ACTIVITY_ORGINFO_REL (code_id, code_name, ord, is_valid, tenant_id, reserve1, reserve2, reserve3)
values ('G0402', '渠道网格', 2, '1', 'uni076', null, null, null);
insert into CLYX_ACTIVITY_ORGINFO_REL (code_id, code_name, ord, is_valid, tenant_id, reserve1, reserve2, reserve3)
values ('G1602', '电话渠道', 3, '1', 'uni076', null, null, null);
  
--渠道协同配置时间单位码表
-- Create table
create table CLYX_CHANNEL_COORDINATE
(
  UNIT_ID   NUMBER,
  TIME_UNIT VARCHAR2(100),
  IS_VALID  VARCHAR2(10),
  TENANT_ID VARCHAR2(20)
)
-- Add comments to the table 
comment on table CLYX_CHANNEL_COORDINATE
  is '渠道协同配置规则间隔时间单位码表';
-- Add comments to the columns 
comment on column CLYX_CHANNEL_COORDINATE.UNIT_ID
  is '单位id';
comment on column CLYX_CHANNEL_COORDINATE.TIME_UNIT
  is '时间单位';
comment on column CLYX_CHANNEL_COORDINATE.IS_VALID
  is '是否有效';
comment on column CLYX_CHANNEL_COORDINATE.TENANT_ID
  is '租户id';
insert into CLYX_CHANNEL_COORDINATE (UNIT_ID, TIME_UNIT, IS_VALID, TENANT_ID)
values (1, '分', '1', 'uni076');
insert into CLYX_CHANNEL_COORDINATE (UNIT_ID, TIME_UNIT, IS_VALID, TENANT_ID)
values (2, '小时', '1', 'uni076');
insert into CLYX_CHANNEL_COORDINATE (UNIT_ID, TIME_UNIT, IS_VALID, TENANT_ID)
values (3, '日', '1', 'uni076');
insert into CLYX_CHANNEL_COORDINATE (UNIT_ID, TIME_UNIT, IS_VALID, TENANT_ID)
values (4, '月', '1', 'uni076');

-- 特殊渠道表增加字段短信模板字段
alter table clyx_activity_channelspecial add msm_template varchar(2000);

-- 地域查询
ALTER TABLE clyx_activity_orglevel ADD is_valid VARCHAR2(32);
COMMENT ON COLUMN clyx_activity_orglevel.is_valid IS '是否有效';
update clyx_activity_orglevel t set t.org_level_name='省分',t.is_valid='1',t.ord='1' where t.org_level='1';
update clyx_activity_orglevel t set t.org_level_name='地市',t.is_valid='1',t.ord='2' where t.org_level='2';
update clyx_activity_orglevel t set t.org_level_name='区县',t.is_valid='1',t.ord='3' where t.org_level='3';
update clyx_activity_orglevel t set t.is_valid='0' ,t.ord='4'where t.org_level='4';

--产品网别码表
create table product_service_type(
       service_type_id varchar2(10),
       service_type_code varchar2(32),
       service_type_name varchar2(32),
       ord varchar2(10),
       is_valid varchar2(2),
       tenant_id varchar2(32)      
);
comment on table product_service_type is '产品网别码表';
comment on column product_service_type.service_type_id is '产品网别id';
comment on column product_service_type.service_type_code is '产品网别编码： 01:2G, 02:3G, 03:4G, 04:固话, 05:宽带, 06:小灵通, 07:通用, 99:其他';
comment on column product_service_type.service_type_name is '产品网别名称';
comment on column product_service_type.ord is '产品网别排序';
comment on column product_service_type.is_valid is '是否有效';
comment on column product_service_type.tenant_id is '租户id'; 
insert into product_service_type values ('1','01','2G','1','1','uni076');
insert into product_service_type values ('2','02','3G','2','1','uni076');
insert into product_service_type values ('3','03','4G','3','1','uni076');
insert into product_service_type values ('4','04','固话','4','1','uni076');
insert into product_service_type values ('5','05','宽带','5','1','uni076');
insert into product_service_type values ('6','06','小灵通','6','1','uni076');
insert into product_service_type values ('7','07','通用','7','1','uni076');
insert into product_service_type values ('8','99','其他','8','1','uni076');

--付费类型码表
create table product_pay_mode(
       pay_mode_id varchar2(10),
       pay_mode_code varchar2(32),
       pay_mode_name varchar2(32),
       ord varchar2(10),
       is_valid varchar2(2),
       tenant_id varchar2(32) 
);
comment on table product_pay_mode is '产品付费类型码表';
comment on column product_pay_mode.pay_mode_id is '付费类型id';
comment on column product_pay_mode.pay_mode_code is '付费类型编码';
comment on column product_pay_mode.pay_mode_name is '付费类型';
comment on column product_pay_mode.ord is '付费类型排序';
comment on column product_pay_mode.is_valid is '是否有效';
comment on column product_pay_mode.tenant_id is '租户id';
insert into product_pay_mode values('1','01','后付费','1','1','uni076');
insert into product_pay_mode values('2','02','预付费','2','1','uni076');
insert into product_pay_mode values('3','03','通用','3','1','uni076');

--产品数据来源码表
create table product_class_type(
       class_type_id varchar2(10),
       class_type_code varchar2(32),
       class_type_name varchar2(32),
       ord varchar2(10),
       is_valid varchar2(2),
       tenant_id varchar2(32) 
);
comment on table product_class_type is '数据来源码表';
comment on column product_class_type.class_type_id is '数据来源id';
comment on column product_class_type.class_type_code is '数据来源编码';
comment on column product_class_type.class_type_name is '数据来源名称';
comment on column product_class_type.ord is '数据来源排序';
comment on column product_class_type.is_valid is '是否有效';
comment on column product_class_type.tenant_id is '租户id';
insert into product_class_type values('1','01','BSS','1','1','uni076');
insert into product_class_type values('2','02','CBSS','2','1','uni076');
insert into product_class_type values('3','07','通用','3','1','uni076');

--产品分类码表
create table product_successs_type(
       success_type_id varchar2(10),
       success_type_code varchar2(32),
       success_type_name varchar2(32),
       ord varchar2(10),
       is_valid varchar2(2),
       tenant_id varchar2(32) 
);
comment on table product_successs_type is '产品分类码表';
comment on column product_successs_type.success_type_id is '产品分类id';
comment on column product_successs_type.success_type_code is '产品分类编码';
comment on column product_successs_type.success_type_name is '产品分类名称';
comment on column product_successs_type.ord is '数据来源排序';
comment on column product_successs_type.is_valid is '是否有效';
comment on column product_successs_type.tenant_id is '租户id';
insert into product_successs_type values('1','3','流量包','1','1','uni076');
insert into product_successs_type values('2','4','合约','2','1','uni076');
insert into product_successs_type values('3','5','套餐','3','1','uni076');

--活动列表选择渠道码表
create table CLYX_P_CHANNEL_INFO_ACTIVITY
(
  channel_code VARCHAR2(2),
  channel_name VARCHAR2(30),
  is_valid     VARCHAR2(2),
  ord          NUMBER,
  tenant_id    VARCHAR2(32)
);
-- Add comments to the table 
comment on table CLYX_P_CHANNEL_INFO_ACTIVITY
  is '活动列表页面渠道选择码表';
-- Add comments to the columns 
comment on column CLYX_P_CHANNEL_INFO_ACTIVITY.channel_code
  is '渠道编码';
comment on column CLYX_P_CHANNEL_INFO_ACTIVITY.channel_name
  is '渠道名称';
comment on column CLYX_P_CHANNEL_INFO_ACTIVITY.is_valid
  is '是否生效';
comment on column CLYX_P_CHANNEL_INFO_ACTIVITY.ord
  is '排序';
comment on column CLYX_P_CHANNEL_INFO_ACTIVITY.tenant_id
  is '租户id';

insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('5', '客户经理', '1', 1, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('7', '短信', '1', 2, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('11', '微信', '1', 3, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('8', '弹窗', '1', 4, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('1', '手厅', '1', 5, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('2', '网厅', '1', 6, 'uni076');
insert into CLYX_P_CHANNEL_INFO_ACTIVITY (channel_code, channel_name, is_valid, ord, tenant_id)
values ('9', '沃视窗', '1', 7, 'uni076');

--统一配置新增弹窗   四号未执行
ALTER TABLE clyx_activity_channelrule ADD pop_number_limit number;
update clyx_activity_channelrule set pop_number_limit=10;

--系统参数配置表增加审批列表数据是否合并控制
insert into clyx_system_param t values('6','审批列表数据显示范围控制','1','控制审批列表数据显示范围','uni076');
--营销类型码表   四号未执行
create table clyx_sms_marketing_type(
       marketing_type_id varchar2(10),
       marketing_type_name varchar2(50),
       ord varchar2(10),
       is_valid varchar2(10),
       tenant_id varchar2(32)
)
comment on table clyx_sms_marketing_type is '短信端口配置功能营销类型码表';
comment on column clyx_sms_marketing_type.marketing_type_id is '营销类型id';
comment on column clyx_sms_marketing_type.marketing_type_name is '营销类型名称';
comment on column clyx_sms_marketing_type.ord is '营销类型排序';
comment on column clyx_sms_marketing_type.is_valid is '是否有效';
comment on column clyx_sms_marketing_type.tenant_id is '租户id';
insert into clyx_sms_marketing_type values('1','全部','1','1','uni076');
insert into clyx_sms_marketing_type values('2','节日营销','2','1','uni076');
insert into clyx_sms_marketing_type values('3','推广类营销','3','1','uni076');

--活动类型码表
create table clyx_sms_activity_type(
       activity_type_id varchar2(10),
       activity_type_name varchar2(50),
       ord varchar2(10),
       is_valid varchar2(10),
       tenant_id varchar2(32)
)
comment on table clyx_sms_activity_type is '短信端口配置功能活动类型码表';
comment on column clyx_sms_activity_type.activity_type_id is '活动类型id';
comment on column clyx_sms_activity_type.activity_type_name is '活动类型名称';
comment on column clyx_sms_activity_type.ord is '活动类型排序';
comment on column clyx_sms_activity_type.is_valid is '是否有效';
comment on column clyx_sms_activity_type.tenant_id is '租户id';
insert into clyx_sms_activity_type values('1','全部','1','1','uni076');
insert into clyx_sms_activity_type values('2','周期','2','1','uni076');
insert into clyx_sms_activity_type values('3','一次性','3','1','uni076');

--活动分类码表
create table clyx_sms_activity_classify(
       activity_classify_id varchar2(10),
       activity_classify_name varchar2(50),
       ord varchar2(10),
       is_valid varchar2(10),
       tenant_id varchar2(32)
)
comment on table clyx_sms_activity_classify is '短信端口配置功能活动分类码表';
comment on column clyx_sms_activity_classify.activity_classify_id is '活动分类id';
comment on column clyx_sms_activity_classify.activity_classify_name is '活动分类名称';
comment on column clyx_sms_activity_classify.ord is '活动分类排序';
comment on column clyx_sms_activity_classify.is_valid is '是否有效';
comment on column clyx_sms_activity_classify.tenant_id is '租户id';
insert into clyx_sms_activity_classify values('1','营销活动','1','1','uni076');
insert into clyx_sms_activity_classify values('2','场景营销','2','1','uni076');

--创建人机构码表
create table clyx_sms_create_mechanism(
       create_mechanism_id varchar2(10),
       create_mechanism_name varchar2(50),
       ord varchar2(10),
       is_valid varchar2(10),
       tenant_id varchar2(32)
)
comment on table clyx_sms_create_mechanism is '短信端口配置功能创建机构码表';
comment on column clyx_sms_create_mechanism.create_mechanism_id is '创建机构id';
comment on column clyx_sms_create_mechanism.create_mechanism_name is '创建机构名称';
comment on column clyx_sms_create_mechanism.ord is '创建机构排序';
comment on column clyx_sms_create_mechanism.is_valid is '是否有效';
comment on column clyx_sms_create_mechanism.tenant_id is '租户id';
insert into clyx_sms_create_mechanism values('0','全部','1','1','uni076');
insert into clyx_sms_create_mechanism values('1','省分','2','1','uni076');
insert into clyx_sms_create_mechanism values('2','地市','3','1','uni076');
--短信渠道表增加营销类型字段
ALTER TABLE clyx_activity_msmchannel ADD marketing_type_id  varchar2(32);
comment on column clyx_activity_msmchannel.marketing_type_id is '短信营销类型：1,全部;2,节日营销;3,推广类营销';

--电话渠道管理页面数据表   3、4号未执行
create table clyx_telephone_channel_manager(
       telephone_channel_id varchar2(32),
       channel_name varchar2(50),
       ascription_city_id varchar2(10),
       ascription_city_name varchar2(32),
       is_valid varchar2(10),
       ord varchar2(32),
       interface_address varchar2(200),
       tenant_id varchar2(32)
);
comment on table clyx_telephone_channel_manager is '电话渠道配置相关数据表';
comment on column clyx_telephone_channel_manager.telephone_channel_id is '电话渠道id';
comment on column clyx_telephone_channel_manager.channel_name is '电话渠道名称';
comment on column clyx_telephone_channel_manager.ascription_city_id is '归属地市id';
comment on column clyx_telephone_channel_manager.ascription_city_name is '归属地市名称';
comment on column clyx_telephone_channel_manager.is_valid is '是否有效';
comment on column clyx_telephone_channel_manager.ord is '排序';
comment on column clyx_telephone_channel_manager.interface_address is '接口地址';
comment on column clyx_telephone_channel_manager.tenant_id is '租户id';

--四号未执行
insert into clyx_system_param t values('9','电话渠道公司使用ftp/sftp','1','0:ftp;1:sftp','uni076');
alter table clyx_p_channel_telephone add rule_org_path varchar2(4000);