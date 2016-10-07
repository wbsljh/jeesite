/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 支付订单Entity
 * @author bread
 * @version 2016-10-07
 */
public class PayInf extends DataEntity<PayInf> {
	
	private static final long serialVersionUID = 1L;
	private String payOrdNo;		// 支付订单号
	private String custId;		// 商户ID
	private String payStatus;		// 订单状态
	private String payType;		// 支付方式
	private String terNo;		// 支付终端号
	private String txAmt;		// 订单金额
	private String rate;		// 费率
	private String rateType;		// 费率类型
	private String fee;		// 手续费
	private String netrecamt;		// 实际金额
	private String payChannel;		// 支付渠道编号
	private String payCardNo;		// 支付银行卡号
	private String issnam;		// 发卡行名称
	private String crdnam;		// 卡名称
	private String paySignPic;		// 签名照片
	private Date payDate;		// 支付日期
	private Date payOrdTime;		// 支付时间
	private Date modifyTime;		// 最后更新时间
	private String cardMedia;		// 银行卡介质
	private String serialNo;		// 流水号
	private String casStatus;		// 提现状态
	private Date beginPayDate;		// 开始 支付日期
	private Date endPayDate;		// 结束 支付日期
	
	public PayInf() {
		super();
	}

	public PayInf(String id){
		super(id);
	}

	@Length(min=1, max=64, message="支付订单号长度必须介于 1 和 64 之间")
	public String getPayOrdNo() {
		return payOrdNo;
	}

	public void setPayOrdNo(String payOrdNo) {
		this.payOrdNo = payOrdNo;
	}
	
	@Length(min=0, max=64, message="商户ID长度必须介于 0 和 64 之间")
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	@Length(min=0, max=10, message="订单状态长度必须介于 0 和 10 之间")
	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	
	@Length(min=0, max=10, message="支付方式长度必须介于 0 和 10 之间")
	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}
	
	@Length(min=0, max=100, message="支付终端号长度必须介于 0 和 100 之间")
	public String getTerNo() {
		return terNo;
	}

	public void setTerNo(String terNo) {
		this.terNo = terNo;
	}
	
	@Length(min=0, max=12, message="订单金额长度必须介于 0 和 12 之间")
	public String getTxAmt() {
		return txAmt;
	}

	public void setTxAmt(String txAmt) {
		this.txAmt = txAmt;
	}
	
	@Length(min=0, max=10, message="费率长度必须介于 0 和 10 之间")
	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}
	
	@Length(min=0, max=50, message="费率类型长度必须介于 0 和 50 之间")
	public String getRateType() {
		return rateType;
	}

	public void setRateType(String rateType) {
		this.rateType = rateType;
	}
	
	@Length(min=0, max=12, message="手续费长度必须介于 0 和 12 之间")
	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}
	
	@Length(min=0, max=12, message="实际金额长度必须介于 0 和 12 之间")
	public String getNetrecamt() {
		return netrecamt;
	}

	public void setNetrecamt(String netrecamt) {
		this.netrecamt = netrecamt;
	}
	
	@Length(min=0, max=100, message="支付渠道编号长度必须介于 0 和 100 之间")
	public String getPayChannel() {
		return payChannel;
	}

	public void setPayChannel(String payChannel) {
		this.payChannel = payChannel;
	}
	
	@Length(min=0, max=50, message="支付银行卡号长度必须介于 0 和 50 之间")
	public String getPayCardNo() {
		return payCardNo;
	}

	public void setPayCardNo(String payCardNo) {
		this.payCardNo = payCardNo;
	}
	
	@Length(min=0, max=255, message="发卡行名称长度必须介于 0 和 255 之间")
	public String getIssnam() {
		return issnam;
	}

	public void setIssnam(String issnam) {
		this.issnam = issnam;
	}
	
	@Length(min=0, max=255, message="卡名称长度必须介于 0 和 255 之间")
	public String getCrdnam() {
		return crdnam;
	}

	public void setCrdnam(String crdnam) {
		this.crdnam = crdnam;
	}
	
	@Length(min=0, max=255, message="签名照片长度必须介于 0 和 255 之间")
	public String getPaySignPic() {
		return paySignPic;
	}

	public void setPaySignPic(String paySignPic) {
		this.paySignPic = paySignPic;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPayOrdTime() {
		return payOrdTime;
	}

	public void setPayOrdTime(Date payOrdTime) {
		this.payOrdTime = payOrdTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	@Length(min=0, max=2, message="银行卡介质长度必须介于 0 和 2 之间")
	public String getCardMedia() {
		return cardMedia;
	}

	public void setCardMedia(String cardMedia) {
		this.cardMedia = cardMedia;
	}
	
	@Length(min=0, max=255, message="流水号长度必须介于 0 和 255 之间")
	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	
	@Length(min=0, max=2, message="提现状态长度必须介于 0 和 2 之间")
	public String getCasStatus() {
		return casStatus;
	}

	public void setCasStatus(String casStatus) {
		this.casStatus = casStatus;
	}
	
	public Date getBeginPayDate() {
		return beginPayDate;
	}

	public void setBeginPayDate(Date beginPayDate) {
		this.beginPayDate = beginPayDate;
	}
	
	public Date getEndPayDate() {
		return endPayDate;
	}

	public void setEndPayDate(Date endPayDate) {
		this.endPayDate = endPayDate;
	}
		
}