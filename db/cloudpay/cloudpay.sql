-- ----------------------------
-- Table structure for mpomng_meridentify_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_merchant`;
CREATE TABLE `tb_merchant` (
  `ID` varchar(64) NOT NULL COMMENT '商户编号(主键)',
  `LOGIN` varchar(64) NOT NULL COMMENT '用户ID',
  `CUST_NAME` varchar(50) DEFAULT NULL COMMENT '商户姓名',
  `CUST_TYPE` varchar(2) DEFAULT NULL COMMENT '商户类型：1-普通商户；2-营业执照认证商户',
  `CERTIFICATE_TYPE` varchar(2) DEFAULT NULL COMMENT '证件类型:1-身份证',
  `CERTIFICATE_NO` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `IDCARD_HANDHELD` varchar(255) DEFAULT NULL COMMENT '手持身份证照片',
  `IDCARD_FRONT` varchar(200) DEFAULT NULL COMMENT '身份证正面',
  `IDCARD_BACK` varchar(200) DEFAULT NULL COMMENT '身份证反面',
  
  `LEGAL_NAME` varchar(60) DEFAULT NULL COMMENT '法人姓名',
  `LIC_NO` varchar(40) DEFAULT NULL COMMENT '法人营业执照号',
  `TAX_NO` varchar(40) DEFAULT NULL COMMENT '税务登记号',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `TEL` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `MOBLIE_NO` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `EMAIL` varchar(60) DEFAULT NULL COMMENT '邮箱',
  
  `CITY_ID` varchar(64) DEFAULT NULL COMMENT '城市',
  `PROVINCE_ID` varchar(64) DEFAULT NULL COMMENT '省份',
  
  `TECH_CONTACT` varchar(30) DEFAULT NULL COMMENT '技术联系人',
  `TECH_EMAIL` varchar(60) DEFAULT NULL COMMENT '技术联系邮箱',
  `TECH_MOBILE` varchar(20) DEFAULT NULL COMMENT '技术联系手机',
  `BIZ_CONTACT` varchar(60) DEFAULT NULL COMMENT '业务联系人',
  `BIZ_MOBILE` varchar(20) DEFAULT NULL COMMENT '业务联系手机',
  `SERV_CONTACT` varchar(60) DEFAULT NULL COMMENT '结算联系人',
  `SERV_MOBILE` varchar(20) DEFAULT NULL COMMENT '结算联系手机',
  
  `OEM_PIC` varchar(25) DEFAULT NULL COMMENT 'oem图片',
  `OPEN_LIC_PIC` varchar(25) DEFAULT NULL COMMENT '开户许可证',
  `BUSI_LIC_PIC` varchar(25) DEFAULT NULL COMMENT '营业执照',
  `LEGAL_ID_PIC` varchar(25) DEFAULT NULL COMMENT '法人身份证',
  `TAX_NO_PIC` varchar(25) DEFAULT NULL COMMENT ' 税务登记证',
  
  `AUDIT_STATUS` varchar(2) DEFAULT '0' COMMENT '认证状态（0未认证，1审核中，2审核通过，3审核不通过）',
  `AUDIT_TIME` datetime DEFAULT NULL COMMENT '认证时间',
  `AUDIT_IDEA` varchar(500) DEFAULT NULL COMMENT '认证审核意见',
  `AUDIT_ID` varchar(20) DEFAULT NULL COMMENT '认证人',
  -- `POLICE_AUDIT_STATUS` varchar(2) DEFAULT '0' COMMENT '公安部身份认证状态:0-未认证；1-认证通过；2-认证不通过',
  -- `POLICE_AUDIT_PIC` varchar(200) DEFAULT NULL COMMENT '公安部身份认证图片',
  `REG_DATETIME` datetime DEFAULT NULL COMMENT '注册时间',
  `SECRET_KEY` varchar(50) DEFAULT NULL COMMENT '秘钥',
  `AGENT_ID` varchar(64) DEFAULT NULL COMMENT '代理商',
  `RATE` varchar(14) DEFAULT NULL COMMENT '费率%',
  `AGENT_RATE` varchar(14) DEFAULT NULL COMMENT '代理分润比例',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户实名认证信息表';

-- ----------------------------
-- Table structure for tb_merchant_bank_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_merchant_bank_inf`;
CREATE TABLE `tb_merchant_bank_inf` (
  `ID` varchar(64) NOT NULL COMMENT '银行卡记录ID',
  `CUST_ID` varchar(64) DEFAULT NULL COMMENT '商户编号',
  `ISSNO` varchar(10) DEFAULT NULL COMMENT '发卡行代码',
  `ISSNAM` varchar(100) DEFAULT NULL COMMENT '发卡行名称',
  `PROVINCE_ID` varchar(64) DEFAULT NULL COMMENT '开户省份ID',
  `CITY_ID` varchar(64) DEFAULT NULL COMMENT '开户城市ID',
  `CNAPS_CODE` varchar(20) DEFAULT NULL COMMENT '联行号',
  `CARD_TYPE` varchar(10) DEFAULT NULL COMMENT '卡种 01 借记卡 02 贷记卡 03 准贷记卡 04 预付卡',
  `CARD_STATE` varchar(2) DEFAULT '0' COMMENT '卡片状态：1-默认使用；0-正常；-1：不可使用；2 审核不通过',
  `CARD_NO` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `MOBILE_NO` varchar(20) DEFAULT NULL COMMENT '银行预留手机号',
  `BINDING_TIME` datetime DEFAULT NULL COMMENT '  绑定时间',
  `UNBUNDLING_TIME` datetime DEFAULT NULL COMMENT '解绑时间',
  `BANKCARD_FRONT` varchar(255) DEFAULT NULL COMMENT '银行卡正面照',
  `BANKCARD_BACK` varchar(255) DEFAULT NULL COMMENT '银行卡反面照',
	PRIMARY KEY (`ID`),
  	KEY `CUST_ID` (`CUST_ID`,`CNAPS_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户结算信息表';


-- ----------------------------
-- Table structure for tb_merchant_account_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_merchant_account_inf`;
CREATE TABLE `tb_merchant_account_inf` (
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `CUST_ID` varchar(64) NOT NULL COMMENT '商户号',
  `ACCOUNT` varchar(100) DEFAULT NULL COMMENT '账户编号',
  `AC_TYPE` varchar(2) DEFAULT '01' COMMENT '账户类型  01 余额账户',
  `CCY` varchar(6) DEFAULT 'CNY' COMMENT '货币类型',
  `AC_BAL` varchar(12) DEFAULT NULL COMMENT '总余额',
  `AC_T0` varchar(12) DEFAULT NULL COMMENT 'T+0',
  `AC_T1` varchar(12) DEFAULT NULL COMMENT 'T+1',
  `AC_T1_Y` varchar(12) DEFAULT NULL COMMENT 'T+1未提',
  `FROZ_BALANCE` varchar(12) DEFAULT NULL COMMENT '冻结金额',
  `LST_TX_DATETIME` datetime DEFAULT NULL COMMENT '最后交易时间',
  `RES_FIELD1` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `RES_FIELD2` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `RES_FIELD3` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `ACCOUNT_STATUS` varchar(1) DEFAULT NULL COMMENT '是否冻结：0正常 1冻结',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户账户信息表';

-- ----------------------------
-- Table structure for mpomng_cas_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_cas_inf`;
CREATE TABLE `tb_cas_inf` (
  `CAS_ORD_NO` varchar(64) NOT NULL COMMENT '提现订单号',
  `PAY_ORD_NO` varchar(64) NOT NULL COMMENT '对应商品订单号',
  `CAS_TYPE` varchar(2) NOT NULL DEFAULT '' COMMENT '提现类型，00：T0，01：T1,02:混合',
  `CAS_DATE` datetime NOT NULL COMMENT '订单创建时间',
  `MODIFY_DATE` datetime DEFAULT NULL COMMENT '最后操作时间',
  `SUC_DATE` datetime DEFAULT NULL COMMENT '订单完成时间',
  `ORD_STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态 00:未处理 01:成功 02:失败 03:可疑 04:处理中 05:已取消 ',
  `TX_CCY` varchar(10) DEFAULT NULL COMMENT '货币类型',
  `CUST_ID` varchar(64) DEFAULT NULL COMMENT '所属商户编号',
  `CUST_NAME` varchar(100) DEFAULT NULL COMMENT '提现商户户名',
  `TX_AMT` varchar(12) DEFAULT NULL COMMENT '订单金额',
  `RATE` varchar(10) DEFAULT NULL COMMENT '费率',
  `FEE` varchar(12) DEFAULT NULL COMMENT '手续费,单位：分',
  `SERVICE_FEE` varchar(12) DEFAULT NULL COMMENT '服务费 如提现成本费 2 元',
  `NETRECAMT` varchar(12) DEFAULT NULL COMMENT '实际到账金额，单位：分',
  `ISSNO` varchar(10) DEFAULT NULL COMMENT '发卡行代码',
  `ISSNAM` varchar(100) DEFAULT NULL COMMENT '发卡行名称',
  `CARD_NO` varchar(50) DEFAULT NULL COMMENT '提现银行卡号',
  `PROVINCE_ID` varchar(64) DEFAULT NULL COMMENT '省份',
  `CAS_DESC` varchar(100) DEFAULT NULL COMMENT '提现描述，如提现成功，或通道返回的错误信息等可以存入该字段',
  `AUDIT_STATUS` varchar(10) NOT NULL DEFAULT '0' COMMENT '提现审核状态，0：未审核，1：审核通过 2：审核不通过',
  `AUDIT_DESC` varchar(100) DEFAULT NULL COMMENT '审核描述',
  `AUDIT_ID` varchar(64) DEFAULT NULL COMMENT '审核人',
  `AUDIT_DATE` datetime DEFAULT NULL COMMENT '审核时间',
  `CAS_CHANNEL` varchar(255) DEFAULT NULL COMMENT '提现渠道',
  PRIMARY KEY (CAS_ORD_NO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现订单表';


-- ----------------------------
-- Table structure for mpomng_pay_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_inf`;
CREATE TABLE `tb_pay_inf` (
  `PAY_ORD_NO` varchar(64) NOT NULL COMMENT '支付订单号',
  `CUST_ID` varchar(64) DEFAULT NULL COMMENT '商户ID',
  `PAY_STATUS` varchar(10) DEFAULT '00' COMMENT '订单状态，00:未支付  01:支付成功  02:支付失败  03:退款审核中 04:退款处理中 05:退款成功 06:退款失败 07:撤销审核中 08：同意撤销  09：撤销成功 10:撤销失败 11：订单作废  21：支付处理中 99:超时',
  `PAY_TYPE` varchar(10) DEFAULT NULL COMMENT '支付方式：01 支付账户   02 终端   03 快捷支付',
  `TER_NO` varchar(100) DEFAULT NULL COMMENT '支付终端号',
  `TX_AMT` varchar(12) DEFAULT NULL COMMENT '订单金额，单位：分',
  `RATE` varchar(10) DEFAULT NULL COMMENT '费率',
  `RATE_TYPE` varchar(50) DEFAULT NULL COMMENT '费率类型',
  `FEE` varchar(12) DEFAULT NULL COMMENT '手续费，单位：分',
  `NETRECAMT` varchar(12) DEFAULT NULL COMMENT '实际金额，单位：分',
  `PAY_CHANNEL` varchar(100) DEFAULT NULL COMMENT '支付渠道编号',
  `PAY_CARD_NO` varchar(50) DEFAULT NULL COMMENT '支付银行卡号',
  `ISSNAM` varchar(255) DEFAULT NULL COMMENT '发卡行名称',
  `CRDNAM` varchar(255) DEFAULT NULL COMMENT '卡名称',
  `PAY_SIGN_PIC` varchar(255) DEFAULT NULL COMMENT '签名照片',
  `PAY_DATE` datetime DEFAULT NULL COMMENT '支付日期',
  `PAY_ORD_TIME` datetime DEFAULT NULL COMMENT '支付时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后更新时间',
  `CARD_MEDIA` varchar(2) DEFAULT NULL COMMENT '银行卡介质 0 磁卡 1IC卡 2 其它',
  `SERIAL_NO` varchar(255) DEFAULT NULL COMMENT '流水号',
  `CAS_STATUS` varchar(2) DEFAULT '00' COMMENT '提现状态 00:未T0提现 01:T0提现中 02:T0提现完成 03:T0提现拒绝  10:T1提现中  10:T1提现完成',
  PRIMARY KEY (`PAY_ORD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单表';

-- ----------------------------
-- Table structure for mpamng_agent_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_inf`;
CREATE TABLE `tb_agent_inf` (
  `AGENT_ID` varchar(14) NOT NULL COMMENT '代理商ID',
  `LOGIN` varchar(64) NOT NULL COMMENT '登陆账户',
  `AGENT_DGR` varchar(2) DEFAULT '1' COMMENT '代理商等级',
  `FATH_AGENT_ID` varchar(14) DEFAULT NULL COMMENT '父代理商用户ID',
  `FIRST_AGENT_ID` varchar(14) DEFAULT NULL COMMENT '一级代理商用户ID',
  `AGENT_NAME` varchar(60) NOT NULL COMMENT '代理商名称',
  `LEGAL_NAME` varchar(60) NOT NULL COMMENT '法人姓名',
  `LEGAL_IDENTITY_NO` varchar(20) NOT NULL COMMENT '法人身份证号码',
  `LIC_NO` varchar(40) DEFAULT NULL COMMENT '法人营业执照号',
  `TAX_NO` varchar(40) DEFAULT NULL COMMENT '税务登记号',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `TEL` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `MOBLIE_NO` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `EMAIL` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `FROZ_STATE` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否冻结 0：否；1：是；',
  `MARGIN` varchar(15) DEFAULT '0'  COMMENT '保证金',
  `CONTRACT_STR_DATE` datetime DEFAULT NULL COMMENT '合同开始日期',
  `CONTRACT_END_DATE` datetime DEFAULT NULL COMMENT '合同结束日期',
  `AGE_STATUS` varchar(1) DEFAULT '0' COMMENT '代理商禁用： 0否 1是',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '代理商说明信息',
  `TECH_CONTACT` varchar(30) DEFAULT NULL COMMENT '技术联系人',
  `TECH_TEL_NO` varchar(15) DEFAULT NULL COMMENT '技术联系电话',
  `TECH_EMAIL` varchar(60) DEFAULT NULL COMMENT '技术联系邮箱',
  `TECH_MOBNO` varchar(20) DEFAULT NULL COMMENT '技术联系手机',
  `CITY` varchar(50) DEFAULT NULL COMMENT '城市',
  `PROVINCE` varchar(10) DEFAULT NULL COMMENT '省份',
  `BIZ_CONTACT` varchar(60) DEFAULT NULL COMMENT '业务联系人',
  `BIZ_MOBNO` varchar(20) DEFAULT NULL COMMENT '业务联系手机',
  `SERV_CONTACT` varchar(60) DEFAULT NULL COMMENT '客服联系人',
  `SERV_MOBNO` varchar(20) DEFAULT NULL COMMENT '客服联系手机',
  `OEM_STATE` char(1) DEFAULT '0' COMMENT 'OEM标识 0：否  1：是',
  `settle_type` char(1) DEFAULT '0' COMMENT '结算方式： 0日结 1月结',
  -- `EFFTIM` datetime DEFAULT '20140701' COMMENT '日结月结的时间',
  -- `TIFLG` char(1) DEFAULT '0' COMMENT 'T+0提现标志，0 否  1是',
  `BANK_PAY_ACNO` varchar(20) DEFAULT NULL COMMENT '代理商结算银行账号',
  `BANK_PAY_USERNM` varchar(40) DEFAULT NULL COMMENT '代理商结算账户名',
  `BANK_CODE` varchar(50) DEFAULT NULL COMMENT '开户行',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `PROFIT_RATIO` varchar(4) DEFAULT NULL COMMENT '分润比例',
  `OEM_PIC_ID` varchar(25) DEFAULT NULL COMMENT 'oem图片(图片id)',
  `OPENING_LICENSE_PIC_ID` varchar(25) DEFAULT NULL COMMENT '开户许可证(图片id)',
  `BUSINESS_LICENSE_PIC_ID` varchar(25) DEFAULT NULL COMMENT '营业执照(图片id)',
  `LEGAL_IDENTITY_PIC_ID` varchar(25) DEFAULT NULL COMMENT '法人身份证(图片id)',
  `TAX_NO_PIC_ID` varchar(25) DEFAULT NULL COMMENT ' 税务登记证(图片id)',
  `AGENT_TYPE` varchar(2) DEFAULT '0',
  KEY `AgentId` (`AGENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商信息表';


insert into sys_area(id, parent_id, parent_ids, name, code, type, del_flag,sort, create_by,create_date,update_by,update_date)
select province_id, 1, CONCAT('1,',province_id), province_name, province_id, 2, 0,0,1,NOW(),1,NOW() from province;

insert into sys_area(id,parent_id,parent_ids,name,code,type,del_flag,sort,create_by,create_date,update_by,update_date)
select city_id, province_id, CONCAT('1,',province_id,',',city_id), city_name, city_id, 3, 0,0,1,NOW(),1,NOW() 
from city;
--dict_cust_type  商户类型 ：1-普通商户；2-营业执照认证商户
--证件类型:1-身份证  dict_certificate_type
--认证状态（0未认证，1审核中，2审核通过，3审核不通过）dict_audit_status 
--公安部身份认证状态:0-未认证；1-认证通过；2-认证不通过
--卡种 01 借记卡 02 贷记卡 03 准贷记卡 04 预付卡 dict_card_type 
--卡片状态：1-默认使用；0-正常；-1：不可使用；2 审核不通过 dict_card_state
--
--订单状态，00:未支付  01:支付成功  02:支付失败  03:退款审核中 04:退款处理中 05:退款成功 06:退款失败 07:撤销审核中 08：同意撤销  09：撤销成功 10:撤销失败 11：订单作废  21：支付处理中 99:超时
--dict_pay_status
--支付方式：01 支付账户   02 终端   03 快捷支付 dict_pay_type
--银行卡介质 0 磁卡 1IC卡 2 其它 dict_card_ media
--提现状态 00:未T0提现 01:T0提现中 02:T0提现完成 03:T0提现拒绝  10:T1提现中  10:T1提现完成
--dict_cas_status
结算方式： 0日结 1月结
提现类型，00：T0，01：T1,02:混合  dict_cas_type
订单状态 00:未处理 01:成功 02:失败 03:可疑 04:处理中 05:已取消 