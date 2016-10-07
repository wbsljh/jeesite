/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Area;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 代理商信息Entity
 * @author bread
 * @version 2016-10-07
 */
public class AgentInf extends DataEntity<AgentInf> {
	
	private static final long serialVersionUID = 1L;
	private String agentId;		// 代理商ID
	private User login;		// 登陆账户
	private String agentDgr;		// 代理商等级
	private String fathAgentId;		// 父代理商
	private String firstAgentId;		// 一级代理商
	private String agentName;		// 代理商名称
	private String legalName;		// 法人姓名
	private String legalIdentityNo;		// 法人身份证号码
	private String licNo;		// 法人营业执照号
	private String taxNo;		// 税务登记号
	private String address;		// 联系地址
	private String tel;		// 联系电话
	private String moblieNo;		// 手机号码
	private String email;		// 邮箱
	private String frozState;		// 是否冻结
	private Double margin;		// 保证金
	private Date contractStrDate;		// 合同开始日期
	private Date contractEndDate;		// 合同结束日期
	private String ageStatus;		// 代理商禁用
	private String remark;		// 代理商说明信息
	private String techContact;		// 技术联系人
	private String techTelNo;		// 技术联系电话
	private String techEmail;		// 技术联系邮箱
	private String techMobno;		// 技术联系手机
	private Area city;		// 城市
	private Area province;		// 省份
	private String bizContact;		// 业务联系人
	private String bizMobno;		// 业务联系手机
	private String servContact;		// 客服联系人
	private String servMobno;		// 客服联系手机
	private String oemState;		// OEM标识
	private String settleType;		// 结算方式
	private String bankPayAcno;		// 代理商结算银行账号
	private String bankPayUsernm;		// 代理商结算账户名
	private String bankCode;		// 开户行
	private Double profitRatio;		// 分润比例
	private String oemPic;		// oem图片
	private String openingLicensePic;		// 开户许可证
	private String businessLicensePic;		// 营业执照
	private String legalIdentityPic;		// 法人身份证
	private String taxNoPic;		// 税务登记证
	private String agentType;		// agent_type
	
	public AgentInf() {
		super();
	}

	public AgentInf(String id){
		super(id);
	}

	@Length(min=1, max=14, message="代理商ID长度必须介于 1 和 14 之间")
	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	
	@NotNull(message="登陆账户不能为空")
	public User getLogin() {
		return login;
	}

	public void setLogin(User login) {
		this.login = login;
	}
	
	@Length(min=0, max=2, message="代理商等级长度必须介于 0 和 2 之间")
	public String getAgentDgr() {
		return agentDgr;
	}

	public void setAgentDgr(String agentDgr) {
		this.agentDgr = agentDgr;
	}
	
	@Length(min=0, max=14, message="父代理商长度必须介于 0 和 14 之间")
	public String getFathAgentId() {
		return fathAgentId;
	}

	public void setFathAgentId(String fathAgentId) {
		this.fathAgentId = fathAgentId;
	}
	
	@Length(min=0, max=14, message="一级代理商长度必须介于 0 和 14 之间")
	public String getFirstAgentId() {
		return firstAgentId;
	}

	public void setFirstAgentId(String firstAgentId) {
		this.firstAgentId = firstAgentId;
	}
	
	@Length(min=0, max=60, message="代理商名称长度必须介于 0 和 60 之间")
	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	
	@Length(min=0, max=60, message="法人姓名长度必须介于 0 和 60 之间")
	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}
	
	@Length(min=1, max=20, message="法人身份证号码长度必须介于 1 和 20 之间")
	public String getLegalIdentityNo() {
		return legalIdentityNo;
	}

	public void setLegalIdentityNo(String legalIdentityNo) {
		this.legalIdentityNo = legalIdentityNo;
	}
	
	@Length(min=0, max=40, message="法人营业执照号长度必须介于 0 和 40 之间")
	public String getLicNo() {
		return licNo;
	}

	public void setLicNo(String licNo) {
		this.licNo = licNo;
	}
	
	@Length(min=0, max=40, message="税务登记号长度必须介于 0 和 40 之间")
	public String getTaxNo() {
		return taxNo;
	}

	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
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
	
	@Length(min=1, max=1, message="是否冻结长度必须介于 1 和 1 之间")
	public String getFrozState() {
		return frozState;
	}

	public void setFrozState(String frozState) {
		this.frozState = frozState;
	}
	
	@NotNull(message="保证金不能为空")
	public Double getMargin() {
		return margin;
	}

	public void setMargin(Double margin) {
		this.margin = margin;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getContractStrDate() {
		return contractStrDate;
	}

	public void setContractStrDate(Date contractStrDate) {
		this.contractStrDate = contractStrDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getContractEndDate() {
		return contractEndDate;
	}

	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
	}
	
	@Length(min=0, max=1, message="代理商禁用长度必须介于 0 和 1 之间")
	public String getAgeStatus() {
		return ageStatus;
	}

	public void setAgeStatus(String ageStatus) {
		this.ageStatus = ageStatus;
	}
	
	@Length(min=0, max=200, message="代理商说明信息长度必须介于 0 和 200 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=30, message="技术联系人长度必须介于 0 和 30 之间")
	public String getTechContact() {
		return techContact;
	}

	public void setTechContact(String techContact) {
		this.techContact = techContact;
	}
	
	@Length(min=0, max=15, message="技术联系电话长度必须介于 0 和 15 之间")
	public String getTechTelNo() {
		return techTelNo;
	}

	public void setTechTelNo(String techTelNo) {
		this.techTelNo = techTelNo;
	}
	
	@Length(min=0, max=60, message="技术联系邮箱长度必须介于 0 和 60 之间")
	public String getTechEmail() {
		return techEmail;
	}

	public void setTechEmail(String techEmail) {
		this.techEmail = techEmail;
	}
	
	@Length(min=0, max=20, message="技术联系手机长度必须介于 0 和 20 之间")
	public String getTechMobno() {
		return techMobno;
	}

	public void setTechMobno(String techMobno) {
		this.techMobno = techMobno;
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
	
	@Length(min=0, max=60, message="业务联系人长度必须介于 0 和 60 之间")
	public String getBizContact() {
		return bizContact;
	}

	public void setBizContact(String bizContact) {
		this.bizContact = bizContact;
	}
	
	@Length(min=0, max=20, message="业务联系手机长度必须介于 0 和 20 之间")
	public String getBizMobno() {
		return bizMobno;
	}

	public void setBizMobno(String bizMobno) {
		this.bizMobno = bizMobno;
	}
	
	@Length(min=0, max=60, message="客服联系人长度必须介于 0 和 60 之间")
	public String getServContact() {
		return servContact;
	}

	public void setServContact(String servContact) {
		this.servContact = servContact;
	}
	
	@Length(min=0, max=20, message="客服联系手机长度必须介于 0 和 20 之间")
	public String getServMobno() {
		return servMobno;
	}

	public void setServMobno(String servMobno) {
		this.servMobno = servMobno;
	}
	
	@Length(min=0, max=1, message="OEM标识长度必须介于 0 和 1 之间")
	public String getOemState() {
		return oemState;
	}

	public void setOemState(String oemState) {
		this.oemState = oemState;
	}
	
	@Length(min=0, max=1, message="结算方式长度必须介于 0 和 1 之间")
	public String getSettleType() {
		return settleType;
	}

	public void setSettleType(String settleType) {
		this.settleType = settleType;
	}
	
	@Length(min=0, max=20, message="代理商结算银行账号长度必须介于 0 和 20 之间")
	public String getBankPayAcno() {
		return bankPayAcno;
	}

	public void setBankPayAcno(String bankPayAcno) {
		this.bankPayAcno = bankPayAcno;
	}
	
	@Length(min=0, max=40, message="代理商结算账户名长度必须介于 0 和 40 之间")
	public String getBankPayUsernm() {
		return bankPayUsernm;
	}

	public void setBankPayUsernm(String bankPayUsernm) {
		this.bankPayUsernm = bankPayUsernm;
	}
	
	@Length(min=0, max=50, message="开户行长度必须介于 0 和 50 之间")
	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	
	public Double getProfitRatio() {
		return profitRatio;
	}

	public void setProfitRatio(Double profitRatio) {
		this.profitRatio = profitRatio;
	}
	
	@Length(min=0, max=25, message="oem图片长度必须介于 0 和 25 之间")
	public String getOemPic() {
		return oemPic;
	}

	public void setOemPic(String oemPic) {
		this.oemPic = oemPic;
	}
	
	@Length(min=0, max=25, message="开户许可证长度必须介于 0 和 25 之间")
	public String getOpeningLicensePic() {
		return openingLicensePic;
	}

	public void setOpeningLicensePic(String openingLicensePic) {
		this.openingLicensePic = openingLicensePic;
	}
	
	@Length(min=0, max=25, message="营业执照长度必须介于 0 和 25 之间")
	public String getBusinessLicensePic() {
		return businessLicensePic;
	}

	public void setBusinessLicensePic(String businessLicensePic) {
		this.businessLicensePic = businessLicensePic;
	}
	
	@Length(min=0, max=25, message="法人身份证长度必须介于 0 和 25 之间")
	public String getLegalIdentityPic() {
		return legalIdentityPic;
	}

	public void setLegalIdentityPic(String legalIdentityPic) {
		this.legalIdentityPic = legalIdentityPic;
	}
	
	@Length(min=0, max=25, message="税务登记证长度必须介于 0 和 25 之间")
	public String getTaxNoPic() {
		return taxNoPic;
	}

	public void setTaxNoPic(String taxNoPic) {
		this.taxNoPic = taxNoPic;
	}
	
	@Length(min=0, max=2, message="agent_type长度必须介于 0 和 2 之间")
	public String getAgentType() {
		return agentType;
	}

	public void setAgentType(String agentType) {
		this.agentType = agentType;
	}
	
}