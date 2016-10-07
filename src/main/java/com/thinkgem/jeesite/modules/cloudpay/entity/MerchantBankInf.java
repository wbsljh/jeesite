/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商户结算信息Entity
 * @author bread
 * @version 2016-10-06
 */
public class MerchantBankInf extends DataEntity<MerchantBankInf> {
	
	private static final long serialVersionUID = 1L;
	private String custId;		// 商户编号
	private String issno;		// 发卡行代码
	private String issnam;		// 发卡行名称
	private Area province;		// 开户省份
	private Area city;		// 开户城市
	private String cnapsCode;		// 联行号
	private String cardType;		// 卡种
	private String cardState;		// 卡片状态
	private String cardNo;		// 银行卡号
	private String mobileNo;		// 银行预留手机号
	private Date bindingTime;		// 绑定时间
	private Date unbundlingTime;		// 解绑时间
	private String bankcardFront;		// 银行卡正面照
	private String bankcardBack;		// 银行卡反面照
	private Date beginBindingTime;		// 开始 绑定时间
	private Date endBindingTime;		// 结束 绑定时间
	
	public MerchantBankInf() {
		super();
	}

	public MerchantBankInf(String id){
		super(id);
	}

	@Length(min=0, max=64, message="商户编号长度必须介于 0 和 64 之间")
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
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
	
	public Area getProvince() {
		return province;
	}

	public void setProvince(Area province) {
		this.province = province;
	}
	
	public Area getCity() {
		return city;
	}

	public void setCity(Area city) {
		this.city = city;
	}
	
	@Length(min=0, max=20, message="联行号长度必须介于 0 和 20 之间")
	public String getCnapsCode() {
		return cnapsCode;
	}

	public void setCnapsCode(String cnapsCode) {
		this.cnapsCode = cnapsCode;
	}
	
	@Length(min=0, max=10, message="卡种长度必须介于 0 和 10 之间")
	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	@Length(min=0, max=2, message="卡片状态长度必须介于 0 和 2 之间")
	public String getCardState() {
		return cardState;
	}

	public void setCardState(String cardState) {
		this.cardState = cardState;
	}
	
	@Length(min=0, max=50, message="银行卡号长度必须介于 0 和 50 之间")
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
	@Length(min=0, max=20, message="银行预留手机号长度必须介于 0 和 20 之间")
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBindingTime() {
		return bindingTime;
	}

	public void setBindingTime(Date bindingTime) {
		this.bindingTime = bindingTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUnbundlingTime() {
		return unbundlingTime;
	}

	public void setUnbundlingTime(Date unbundlingTime) {
		this.unbundlingTime = unbundlingTime;
	}
	
	@Length(min=0, max=255, message="银行卡正面照长度必须介于 0 和 255 之间")
	public String getBankcardFront() {
		return bankcardFront;
	}

	public void setBankcardFront(String bankcardFront) {
		this.bankcardFront = bankcardFront;
	}
	
	@Length(min=0, max=255, message="银行卡反面照长度必须介于 0 和 255 之间")
	public String getBankcardBack() {
		return bankcardBack;
	}

	public void setBankcardBack(String bankcardBack) {
		this.bankcardBack = bankcardBack;
	}
	
	public Date getBeginBindingTime() {
		return beginBindingTime;
	}

	public void setBeginBindingTime(Date beginBindingTime) {
		this.beginBindingTime = beginBindingTime;
	}
	
	public Date getEndBindingTime() {
		return endBindingTime;
	}

	public void setEndBindingTime(Date endBindingTime) {
		this.endBindingTime = endBindingTime;
	}
		
}