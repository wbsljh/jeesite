/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Area;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商户实名认证Entity
 * @author bread
 * @version 2016-10-07
 */
public class Merchant extends DataEntity<Merchant> {
	
	private static final long serialVersionUID = 1L;
	private User login;		// 用户ID
	private String custName;		// 商户姓名
	private String custType;		// 商户类型
	private String certificateType;		// 证件类型
	private String certificateNo;		// 证件号码
	private String idcardHandheld;		// 手持身份证照片
	private String idcardFront;		// 身份证正面
	private String idcardBack;		// 身份证反面
	private String legalName;		// 法人姓名
	private String licNo;		// 法人营业执照号
	private String auditStatus;		// 认证状态
	private Date auditTime;		// 认证时间
	private String taxNo;		// 税务登记号
	private String auditIdea;		// 认证审核意见
	private String address;		// 联系地址
	private String tel;		// 联系电话
	private User auditor;		// 认证人
	private String moblieNo;		// 手机号码
	private String email;		// 邮箱
	private Date regDatetime;		// 注册时间
	private Area city;		// 城市
	private Area province;		// 省份
	private String secretKey;		// 秘钥
	private String techContact;		// 技术联系人
	private User agent;		// 代理商
	private Double rate;		// 费率%
	private String techEmail;		// 技术联系邮箱
	private Double agentRate;		// 分润比例
	private String techMobile;		// 技术联系手机
	private String bizContact;		// 业务联系人
	private String bizMobile;		// 业务联系手机
	private String servContact;		// 结算联系人
	private String servMobile;		// 结算联系手机
	private String oemPic;		// oem图片
	private String openLicPic;		// 开户许可证
	private String busiLicPic;		// 营业执照
	private String legalIdPic;		// 法人身份证
	private String taxNoPic;		// 税务登记证
	private Date beginAuditTime;		// 开始 认证时间
	private Date endAuditTime;		// 结束 认证时间
	
	public Merchant() {
		super();
	}

	public Merchant(String id){
		super(id);
	}

	@NotNull(message="用户ID不能为空")
	public User getLogin() {
		return login;
	}

	public void setLogin(User login) {
		this.login = login;
	}
	
	@Length(min=0, max=50, message="商户姓名长度必须介于 0 和 50 之间")
	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	@Length(min=0, max=2, message="商户类型长度必须介于 0 和 2 之间")
	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}
	
	@Length(min=0, max=2, message="证件类型长度必须介于 0 和 2 之间")
	public String getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}
	
	@Length(min=0, max=50, message="证件号码长度必须介于 0 和 50 之间")
	public String getCertificateNo() {
		return certificateNo;
	}

	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}
	
	@Length(min=0, max=255, message="手持身份证照片长度必须介于 0 和 255 之间")
	public String getIdcardHandheld() {
		return idcardHandheld;
	}

	public void setIdcardHandheld(String idcardHandheld) {
		this.idcardHandheld = idcardHandheld;
	}
	
	@Length(min=0, max=200, message="身份证正面长度必须介于 0 和 200 之间")
	public String getIdcardFront() {
		return idcardFront;
	}

	public void setIdcardFront(String idcardFront) {
		this.idcardFront = idcardFront;
	}
	
	@Length(min=0, max=200, message="身份证反面长度必须介于 0 和 200 之间")
	public String getIdcardBack() {
		return idcardBack;
	}

	public void setIdcardBack(String idcardBack) {
		this.idcardBack = idcardBack;
	}
	
	@Length(min=0, max=60, message="法人姓名长度必须介于 0 和 60 之间")
	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}
	
	@Length(min=0, max=40, message="法人营业执照号长度必须介于 0 和 40 之间")
	public String getLicNo() {
		return licNo;
	}

	public void setLicNo(String licNo) {
		this.licNo = licNo;
	}
	
	@Length(min=0, max=2, message="认证状态长度必须介于 0 和 2 之间")
	public String getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	
	@Length(min=0, max=40, message="税务登记号长度必须介于 0 和 40 之间")
	public String getTaxNo() {
		return taxNo;
	}

	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	
	@Length(min=0, max=500, message="认证审核意见长度必须介于 0 和 500 之间")
	public String getAuditIdea() {
		return auditIdea;
	}

	public void setAuditIdea(String auditIdea) {
		this.auditIdea = auditIdea;
	}
	
	@Length(min=0, max=100, message="联系地址长度必须介于 0 和 100 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public User getAuditor() {
		return auditor;
	}

	public void setAuditor(User auditor) {
		this.auditor = auditor;
	}
	
	@Length(min=0, max=20, message="手机号码长度必须介于 0 和 20 之间")
	public String getMoblieNo() {
		return moblieNo;
	}

	public void setMoblieNo(String moblieNo) {
		this.moblieNo = moblieNo;
	}
	
	@Length(min=0, max=60, message="邮箱长度必须介于 0 和 60 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRegDatetime() {
		return regDatetime;
	}

	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
	
	public Area getCity() {
		return city;
	}

	public void setCity(Area city) {
		this.city = city;
	}
	
	public Area getProvince() {
		return province;
	}

	public void setProvince(Area province) {
		this.province = province;
	}
	
	@Length(min=0, max=50, message="秘钥长度必须介于 0 和 50 之间")
	public String getSecretKey() {
		return secretKey;
	}

	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	
	@Length(min=0, max=30, message="技术联系人长度必须介于 0 和 30 之间")
	public String getTechContact() {
		return techContact;
	}

	public void setTechContact(String techContact) {
		this.techContact = techContact;
	}
	
	public User getAgent() {
		return agent;
	}

	public void setAgent(User agent) {
		this.agent = agent;
	}
	
	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}
	
	@Length(min=0, max=60, message="技术联系邮箱长度必须介于 0 和 60 之间")
	public String getTechEmail() {
		return techEmail;
	}

	public void setTechEmail(String techEmail) {
		this.techEmail = techEmail;
	}
	
	public Double getAgentRate() {
		return agentRate;
	}

	public void setAgentRate(Double agentRate) {
		this.agentRate = agentRate;
	}
	
	@Length(min=0, max=20, message="技术联系手机长度必须介于 0 和 20 之间")
	public String getTechMobile() {
		return techMobile;
	}

	public void setTechMobile(String techMobile) {
		this.techMobile = techMobile;
	}
	
	@Length(min=0, max=60, message="业务联系人长度必须介于 0 和 60 之间")
	public String getBizContact() {
		return bizContact;
	}

	public void setBizContact(String bizContact) {
		this.bizContact = bizContact;
	}
	
	@Length(min=0, max=20, message="业务联系手机长度必须介于 0 和 20 之间")
	public String getBizMobile() {
		return bizMobile;
	}

	public void setBizMobile(String bizMobile) {
		this.bizMobile = bizMobile;
	}
	
	@Length(min=0, max=60, message="结算联系人长度必须介于 0 和 60 之间")
	public String getServContact() {
		return servContact;
	}

	public void setServContact(String servContact) {
		this.servContact = servContact;
	}
	
	@Length(min=0, max=20, message="结算联系手机长度必须介于 0 和 20 之间")
	public String getServMobile() {
		return servMobile;
	}

	public void setServMobile(String servMobile) {
		this.servMobile = servMobile;
	}
	
	@Length(min=0, max=25, message="oem图片长度必须介于 0 和 25 之间")
	public String getOemPic() {
		return oemPic;
	}

	public void setOemPic(String oemPic) {
		this.oemPic = oemPic;
	}
	
	@Length(min=0, max=25, message="开户许可证长度必须介于 0 和 25 之间")
	public String getOpenLicPic() {
		return openLicPic;
	}

	public void setOpenLicPic(String openLicPic) {
		this.openLicPic = openLicPic;
	}
	
	@Length(min=0, max=25, message="营业执照长度必须介于 0 和 25 之间")
	public String getBusiLicPic() {
		return busiLicPic;
	}

	public void setBusiLicPic(String busiLicPic) {
		this.busiLicPic = busiLicPic;
	}
	
	@Length(min=0, max=25, message="法人身份证长度必须介于 0 和 25 之间")
	public String getLegalIdPic() {
		return legalIdPic;
	}

	public void setLegalIdPic(String legalIdPic) {
		this.legalIdPic = legalIdPic;
	}
	
	@Length(min=0, max=25, message="税务登记证长度必须介于 0 和 25 之间")
	public String getTaxNoPic() {
		return taxNoPic;
	}

	public void setTaxNoPic(String taxNoPic) {
		this.taxNoPic = taxNoPic;
	}
	
	public Date getBeginAuditTime() {
		return beginAuditTime;
	}

	public void setBeginAuditTime(Date beginAuditTime) {
		this.beginAuditTime = beginAuditTime;
	}
	
	public Date getEndAuditTime() {
		return endAuditTime;
	}

	public void setEndAuditTime(Date endAuditTime) {
		this.endAuditTime = endAuditTime;
	}
		
}