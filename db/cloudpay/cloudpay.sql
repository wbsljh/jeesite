/* Create Tables */

CREATE TABLE sys_area
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	code varchar(100) COMMENT '�������',
	type char(1) COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�����';


CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL COMMENT '���',
	value varchar(100) NOT NULL COMMENT '����ֵ',
	label varchar(100) NOT NULL COMMENT '��ǩ��',
	type varchar(100) NOT NULL COMMENT '����',
	description varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '��������',
	parent_id varchar(64) DEFAULT '0' COMMENT '�������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�ֵ��';