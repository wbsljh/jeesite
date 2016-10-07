/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 提现订单Entity
 * @author bread
 * @version 2016-10-07
 */
public class CasInf extends DataEntity<CasInf> {
	
	private static final long serialVersionUID = 1L;
	private String casOrdNo;		// 提现订单号
	private String payOrdNo;		// 对应商品订单号
	private String casType;		// 提现类型
	private Date casDate;		// 订单创建时间
	private Date modifyDate;		// 最后操作时间
	private Date sucDate;		// 订单完成时间
	private String ordStatus;		// 订单状态
	private String txCcy;		// 货币类型
	private String custId;		// 所属商户编号
	private String custName;		// 提现商户户名
	private Double txAmt;		// 订单金额
	private Double rate;		// 费率
	private Double fee;		// 手续费
	private Double serviceFee;		// 服务费
	private Double netrecamt;		// 实际到账金额
	private String issno;		// 发卡行代码
	private String issnam;		// 发卡行名称
	private String cardNo;		// 提现银行卡号
	private Area province;		// 省份
	private String casDesc;		// 提现描述
	private String auditStatus;		// 提现审核状态
	private String auditDesc;		// 审核描述
	private User auditor;		// 审核人
	private Date auditDate;		// 审核时间
	private String casChannel;		// 提现渠道
	
	public CasInf() {
		super();
	}

	public CasInf(String id){
		super(id);
	}

	@Length(min=1, max=64, message="提现订单号长度必须介于 1 和 64 之间")
	public String getCasOrdNo() {
		return casOrdNo;
	}

	public void setCasOrdNo(String casOrdNo) {
		this.casOrdNo = casOrdNo;
	}
	
	@Length(min=1, max=64, message="对应商品订单号长度必须介于 1 和 64 之间")
	public String getPayOrdNo() {
		return payOrdNo;
	}

	public void setPayOrdNo(String payOrdNo) {
		this.payOrdNo = payOrdNo;
	}
	
	@Length(min=1, max=2, message="提现类型长度必须介于 1 和 2 之间")
	public String getCasType() {
		return casType;
	}

	public void setCasType(String casType) {
		this.casType = casType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="订单创建时间不能为空")
	public Date getCasDate() {
		return casDate;
	}

	public void setCasDate(Date casDate) {
		this.casDate = casDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSucDate() {
		return sucDate;
	}

	public void setSucDate(Date sucDate) {
		this.sucDate = sucDate;
	}
	
	@Length(min=0, max=2, message="订单状态长度必须介于 0 和 2 之间")
	public String getOrdStatus() {
		return ordStatus;
	}

	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}
	
	@Length(min=0, max=10, message="货币类型长度必须介于 0 和 10 之间")
	public String getTxCcy() {
		return txCcy;
	}

	public void setTxCcy(String txCcy) {
		this.txCcy = txCcy;
	}
	
	@Length(min=0, max=64, message="所属商户编号长度必须介于 0 和 64 之间")
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	@Length(min=0, max=100, message="提现商户户名长度必须介于 0 和 100 之间")
	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	public Double getTxAmt() {
		return txAmt;
	}

	public void setTxAmt(Double txAmt) {
		this.txAmt = txAmt;
	}
	
	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}
	
	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}
	
	public Double getServiceFee() {
		return serviceFee;
	}

	public void setServiceFee(Double serviceFee) {
		this.serviceFee = serviceFee;
	}
	
	public Double getNetrecamt() {
		return netrecamt;
	}

	public void setNetrecamt(Double netrecamt) {
		this.netrecamt = netrecamt;
	}
	
	@Length(min=0, max=10, message="发卡行代码长度必须介于 0 和 10 之间")
	public String getIssno() {
		return issno;
	}

	public void setIssno(String issno) {
		this.issno = issno;
	}
	
	@Length(min=0, max=100, message="发卡行名称长度必须介于 0 和 100 之间")
	public String getIssnam() {
		return issnam;
	}

	public void setIssnam(String issnam) {
		this.issnam = issnam;
	}
	
	@Length(min=0, max=50, message="提现银行卡号长度必须介于 0 和 50 之间")
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
	public Area getProvince() {
		return province;
	}

	public void setProvince(Area province) {
		this.province = province;
	}
	
	@Length(min=0, max=100, message="提现描述长度必须介于 0 和 100 之间")
	public String getCasDesc() {
		return casDesc;
	}

	public void setCasDesc(String casDesc) {
		this.casDesc = casDesc;
	}
	
	@Length(min=1, max=10, message="提现审核状态长度必须介于 1 和 10 之间")
	public String getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}
	
	@Length(min=0, max=100, message="审核描述长度必须介于 0 和 100 之间")
	public String getAuditDesc() {
		return auditDesc;
	}

	public void setAuditDesc(String auditDesc) {
		this.auditDesc = auditDesc;
	}
	
	public User getAuditor() {
		return auditor;
	}

	public void setAuditor(User auditor) {
		this.auditor = auditor;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAuditDate() {
		return auditDate;
	}

	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}
	
	@Length(min=0, max=255, message="提现渠道长度必须介于 0 和 255 之间")
	public String getCasChannel() {
		return casChannel;
	}

	public void setCasChannel(String casChannel) {
		this.casChannel = casChannel;
	}
	
}