/*
Navicat MySQL Data Transfer

Source Server         : ipay.xsft.cn
Source Server Version : 50505
Source Host           : ipay.xsft.cn:9606
Source Database       : mobpay

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-10-05 23:08:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mpomng_cas_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_cas_inf`;
CREATE TABLE `mpomng_cas_inf` (
  `CAS_ORD_NO` varchar(25) NOT NULL COMMENT '提现订单号',
  `CAS_TYPE` varchar(10) NOT NULL DEFAULT '' COMMENT '提现类型，00：T0，01：T1,02:混合',
  `CAS_DATE` varchar(20) NOT NULL COMMENT '订单创建时间',
  `MODIFY_DATE` varchar(20) DEFAULT NULL COMMENT '最后操作时间',
  `SUC_DATE` varchar(20) DEFAULT NULL COMMENT '订单完成时间',
  `ORDSTATUS` varchar(10) DEFAULT NULL COMMENT '订单状态 00:未处理 01:成功 02:失败 03:可疑 04:处理中 05:已取消 ',
  `TXCCY` varchar(10) DEFAULT '156' COMMENT '货币类型',
  `CUST_ID` varchar(50) DEFAULT NULL COMMENT '所属商户编号',
  `CUST_NAME` varchar(100) DEFAULT NULL COMMENT '提现商户户名',
  `TXAMT` varchar(12) DEFAULT NULL COMMENT '订单金额',
  `RATE` varchar(10) DEFAULT NULL COMMENT '费率',
  `FEE` varchar(12) DEFAULT NULL COMMENT '手续费,单位：分',
  `SERVICE_FEE` varchar(12) DEFAULT NULL COMMENT '服务费 如提现成本费 2 元',
  `NETRECAMT` varchar(12) DEFAULT NULL COMMENT '实际到账金额，单位：分',
  `ISSNO` varchar(10) DEFAULT NULL COMMENT '发卡行代码',
  `ISSNAM` varchar(100) DEFAULT NULL COMMENT '发卡行名称',
  `CARD_NO` varchar(50) DEFAULT NULL COMMENT '提现银行卡号',
  `PROVINCE_ID` varchar(7) DEFAULT NULL,
  `CAS_DESC` varchar(100) DEFAULT NULL COMMENT '提现描述，如提现成功，或通道返回的错误信息等可以存入该字段',
  `CAS_AUDIT` varchar(10) NOT NULL DEFAULT '0' COMMENT '提现审核状态，0：未审核，1：审核通过 2：审核不通过',
  `AUDIT_DESC` varchar(100) DEFAULT NULL COMMENT '审核描述',
  `CAS_REL` varchar(255) DEFAULT NULL COMMENT '提现参照其他表中的关联字段，如T+0可能需要关联充值订单，此处可存放充值订单号',
  `FILED1` varchar(255) DEFAULT NULL,
  `FILED2` varchar(255) DEFAULT NULL,
  `FILED3` varchar(255) DEFAULT NULL,
  `T0_AMT` varchar(20) DEFAULT NULL COMMENT 't0部分',
  `T1_AMT` varchar(20) DEFAULT NULL COMMENT 't1模式',
  `PRDORDNO` varchar(25) NOT NULL COMMENT '对应商品订单号',
  `REFUSE_REASON` varchar(255) DEFAULT NULL,
  `AUDIT_NAME` varchar(50) DEFAULT NULL,
  `CAS_CHANNEL` varchar(255) DEFAULT NULL COMMENT '提现渠道',
  PRIMARY KEY (`CAS_DATE`,`PRDORDNO`,`CAS_AUDIT`),
  KEY `CAS_CAS_TYPE_INDEX` (`CAS_TYPE`) USING BTREE,
  KEY `CAS_CAS_DATE_INDEX` (`CAS_DATE`) USING BTREE,
  KEY `CAS_ORDSTATUS_INDEX` (`ORDSTATUS`) USING BTREE,
  KEY `CAS_CUST_ID_INDEX` (`CUST_ID`) USING BTREE,
  KEY `CAS_CUST_NAME_INDEX` (`CUST_NAME`) USING BTREE,
  KEY `CAS_CAS_AUDIT_INDEX` (`CAS_AUDIT`) USING BTREE,
  KEY `CAS_FILED1_INDEX` (`FILED1`) USING BTREE,
  KEY `CAS_PRDORDNO_INDEX` (`PRDORDNO`) USING BTREE,
  KEY `CAS_CAS_CHANNEL_INDEX` (`CAS_CHANNEL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现订单表';

-- ----------------------------
-- Table structure for mpomng_cust_account_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_cust_account_inf`;
CREATE TABLE `mpomng_cust_account_inf` (
  `CUST_ID` varchar(20) NOT NULL COMMENT '商户号',
  `ACCOUNT` varchar(100) DEFAULT NULL COMMENT '账户编号',
  `AC_TYPE` varchar(2) DEFAULT '01' COMMENT '账户类型  01 余额账户',
  `CCY` varchar(6) DEFAULT 'CNY' COMMENT '货币类型',
  `AC_BAL` varchar(12) DEFAULT NULL COMMENT '总余额',
  `AC_T0` varchar(12) DEFAULT NULL COMMENT 'T+0',
  `AC_T1` varchar(12) DEFAULT NULL COMMENT 'T+1',
  `AC_T1_Y` varchar(12) DEFAULT NULL COMMENT 'T+1未提',
  `FROZ_BALANCE` varchar(12) DEFAULT NULL COMMENT '冻结金额',
  `LST_TX_DATETIME` varchar(14) DEFAULT NULL COMMENT '最后交易时间',
  `RES_FIELD1` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `RES_FIELD2` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `RES_FIELD3` varchar(12) DEFAULT NULL COMMENT '预留字段1',
  `ACCOUNT_STATUS` varchar(1) DEFAULT NULL COMMENT '是否冻结：0正常 1冻结',
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户账户信息表';

-- ----------------------------
-- Table structure for mpomng_cust_bank_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_cust_bank_inf`;
CREATE TABLE `mpomng_cust_bank_inf` (
  `BANK_CARD_ID` varchar(20) NOT NULL COMMENT '银行卡记录ID',
  `CUST_ID` varchar(14) DEFAULT NULL COMMENT '商户编号',
  `ISSNO` varchar(10) DEFAULT NULL COMMENT '发卡行代码',
  `ISSNAM` varchar(100) DEFAULT NULL COMMENT '发卡行名称',
  `PROVINCE_ID` varchar(7) DEFAULT NULL COMMENT '开户省份ID',
  `CITY_ID` varchar(7) DEFAULT NULL COMMENT '开户城市ID',
  `CNAPS_CODE` varchar(20) DEFAULT NULL COMMENT '联行号',
  `CARD_TYPE` varchar(10) DEFAULT NULL COMMENT '卡种 01 借记卡 02 贷记卡 03 准贷记卡 04 预付卡',
  `CARD_STATE` varchar(2) DEFAULT '0' COMMENT '卡片状态：1-默认使用；0-正常；-1：不可使用；2 审核不通过',
  `CARD_NO` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `MOBILE_NO` varchar(20) DEFAULT NULL COMMENT '银行预留手机号',
  `BINDING_TIME` varchar(50) DEFAULT NULL COMMENT '  绑定时间',
  `UNBUNDLING_TIME` varchar(50) DEFAULT NULL COMMENT '解绑时间',
  `BANKCARD_FRONT` varchar(255) DEFAULT NULL COMMENT '银行卡正面照',
  `BANKCARD_BACK` varchar(255) DEFAULT NULL COMMENT '银行卡反面照',
  KEY `CUST_ID` (`CUST_ID`,`CNAPS_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户结算信息表';

-- ----------------------------
-- Table structure for mpomng_meridentify_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_meridentify_inf`;
CREATE TABLE `mpomng_meridentify_inf` (
  `CUST_ID` char(14) NOT NULL COMMENT '商户编号(主键)',
  `CUST_NAME` varchar(50) DEFAULT NULL COMMENT '商户姓名',
  `CERTIFICATE_TYPE` varchar(2) DEFAULT NULL COMMENT '证件类型:1-身份证',
  `CERTIFICATE_NO` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `IDCARD_HANDHELD` varchar(255) DEFAULT NULL COMMENT '手持身份证照片',
  `IDCARD_FRONT` varchar(200) DEFAULT NULL COMMENT '身份证正面',
  `IDCARD_BACK` varchar(200) DEFAULT NULL COMMENT '身份证反面',
  `CUST_STATUS` char(1) DEFAULT '0' COMMENT '认证状态（0未认证，1审核中，2审核通过，3审核不通过）',
  `IDENTIFY_TIME` varchar(14) DEFAULT NULL COMMENT '认证时间',
  `AUDIT_IDEA` varchar(200) DEFAULT NULL COMMENT '认证审核意见',
  `IDENTIFY_USER` varchar(20) DEFAULT NULL COMMENT '审核人',
  `POLICE_IDENTIFYSTATUS` varchar(2) DEFAULT '0' COMMENT '公安部身份认证状态:0-未认证；1-认证通过；2-认证不通过',
  `POLICE_IDENTIFYPIC` varchar(200) DEFAULT NULL COMMENT '公安部身份认证图片',
  `RES_FIELD1` varchar(50) DEFAULT NULL COMMENT '预留字段1',
  `RES_FIELD2` varchar(50) DEFAULT NULL COMMENT '预留字段2',
  `RES_FIELD3` varchar(50) DEFAULT NULL COMMENT '预留字段3',
  `CUST_REG_DATETIME` varchar(255) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`CUST_ID`),
  KEY `custId` (`CUST_ID`),
  KEY `custStatus` (`CUST_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户实名认证信息表';

-- ----------------------------
-- Table structure for mpomng_pay_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_pay_inf`;
CREATE TABLE `mpomng_pay_inf` (
  `PAYORDNO` varchar(50) NOT NULL COMMENT '支付订单号',
  `CUST_ID` varchar(50) DEFAULT NULL COMMENT '商户ID',
  `PAY_STATUS` varchar(10) DEFAULT '00' COMMENT '订单状态，00:未支付  01:支付成功  02:支付失败  03:退款审核中 04:退款处理中 05:退款成功 06:退款失败 07:撤销审核中 08：同意撤销  09：撤销成功 10:撤销失败 11：订单作废  21：支付处理中 99:超时',
  --`PAY_ORD_TYPE` varchar(10) DEFAULT NULL COMMENT '支付订单类型',
  `PAY_TYPE` varchar(10) DEFAULT NULL COMMENT '支付方式：01 支付账户   02 终端   03 快捷支付',
  `TER_NO` varchar(100) DEFAULT NULL COMMENT '支付终端号',
  `TX_AMT` varchar(12) DEFAULT NULL COMMENT '订单金额，单位：分',
  `RATE` varchar(10) DEFAULT NULL COMMENT '费率',
  `RATE_TYPE` varchar(50) DEFAULT NULL COMMENT '费率类型',
  `FEE` varchar(12) DEFAULT NULL COMMENT '手续费，单位：分',
  `NETRECAMT` varchar(12) DEFAULT NULL COMMENT '实际金额，单位：分',
  `PAY_CHANNEL` varchar(100) DEFAULT NULL COMMENT '支付渠道编号',
  `PAY_CARDNO` varchar(50) DEFAULT NULL COMMENT '支付银行卡号',
  `ISSNAM` varchar(255) DEFAULT NULL COMMENT '发卡行名称',
  `CRDNAM` varchar(255) DEFAULT NULL COMMENT '卡名称',
  `PAY_SIGN_PIC` varchar(255) DEFAULT NULL COMMENT '签名照片',
  `PAY_DATE` varchar(12) DEFAULT NULL COMMENT '支付日期',
  `PAY_TIME` varchar(12) DEFAULT NULL COMMENT '支付时间',
  `PAY_ORD_TIME` varchar(20) DEFAULT NULL COMMENT '支付完整时间（年月日时分秒）',
  `MODIFY_TIME` varchar(20) DEFAULT NULL COMMENT '最后更新时间',
  `CARD_ MEDIA` varchar(2) DEFAULT NULL COMMENT '银行卡介质 0 磁卡 1IC卡 2 其它',
  `serial_no` varchar(255) DEFAULT NULL COMMENT '流水号',
  `CAS_STATUS` varchar(10) DEFAULT '00' COMMENT '提现状态 00:未T0提现 01:T0提现中 02:T0提现完成 03:T0提现拒绝  10:T1提现中  10:T1提现完成',
  PRIMARY KEY (`PAYORDNO`),
  KEY `PAYORDNO` (`PAYORDNO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单表';

-- ----------------------------
-- Table structure for mpomng_pay_rate_inf
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_rate_inf`;
CREATE TABLE `tb_pay_rate_inf` (
  `ID` varchar(20) NOT NULL COMMENT '费率编号',
  `FEE_NAME` varchar(50) DEFAULT NULL COMMENT '费率名称',
  `FEE_TYPE` varchar(4) DEFAULT NULL COMMENT '费率类型  CH01 一般类 , CH02 民生类, CH03 批发类封顶手续费 CH04 餐娱类费率',
  `PRICING` varchar(12) DEFAULT NULL COMMENT '定额',
  `PERCENT` varchar(12) DEFAULT NULL COMMENT '比例',
  `FEE_LOW` varchar(12) DEFAULT NULL COMMENT '最低',
  `FEE_TOP` varchar(12) DEFAULT NULL COMMENT '封顶',
  `FEE_STATUS` varchar(2) DEFAULT NULL COMMENT '费率状态 00 正常 01 处理中(或审核中) 02 历史',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费率表';

-- ----------------------------
-- Table structure for mpomng_prd_inf
-- ----------------------------
DROP TABLE IF EXISTS `mpomng_prd_inf`;
CREATE TABLE `mpomng_prd_inf` (
  `PRDORDNO` varchar(25) NOT NULL COMMENT '商品订单号',
  `PRDORDTYPE` varchar(2) DEFAULT NULL COMMENT '订单类型 01收款 02商品',
  `BIZTYPE` varchar(10) DEFAULT NULL COMMENT '子业务类型，01：手机充值 02 彩票',
  `ORDSTATUS` varchar(10) DEFAULT '00' COMMENT '订单状态 00:未交易 01:成功 02:失败 03:可疑 04:处理中 05:已取消 06:未支付 07:已退货 08:退货中 09:部分退货',
  `ORDAMT` varchar(12) DEFAULT NULL COMMENT '订单金额，单位：分',
  `PAYORDNO` varchar(25) DEFAULT NULL COMMENT '支付订单号(最后一次发起的支付订单)',
  `PRICE` varchar(12) DEFAULT NULL COMMENT '商品单价，单位：分',
  `GOODS_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `GOODS_NAME_SHORT` varchar(255) DEFAULT NULL COMMENT '商品简称',
  `CUST_ID` varchar(25) DEFAULT NULL COMMENT '发起商户ID',
  `PRDDATE` varchar(20) DEFAULT NULL COMMENT '订单日期',
  `PRDTIME` varchar(20) DEFAULT NULL COMMENT '订单时间',
  `ORDTIME` varchar(20) DEFAULT NULL COMMENT '订单时间（年月日时分秒）',
  `MODIFY_TIME` varchar(20) DEFAULT NULL COMMENT '最后更新时间',
  `REQ_MSG` text COMMENT '请求参数',
  `RSP_MSG` text COMMENT '响应参数',
  `CASSTATUS` varchar(10) DEFAULT '00' COMMENT '提现状态 00:未T0提现 01:T0提现中 02:T0提现完成 03:T0提现拒绝  10:T1提现中  10:T1提现完成',
  PRIMARY KEY (`PRDORDNO`),
  UNIQUE KEY `PRDORDNO` (`PRDORDNO`) USING HASH,
  KEY `CUST_ID` (`CUST_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品订单表';
