/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cloudpay.entity.MerchantBankInf;
import com.thinkgem.jeesite.modules.cloudpay.dao.MerchantBankInfDao;

/**
 * 商户结算信息Service
 * @author bread
 * @version 2016-10-06
 */
@Service
@Transactional(readOnly = true)
public class MerchantBankInfService extends CrudService<MerchantBankInfDao, MerchantBankInf> {

	public MerchantBankInf get(String id) {
		return super.get(id);
	}
	
	public List<MerchantBankInf> findList(MerchantBankInf merchantBankInf) {
		return super.findList(merchantBankInf);
	}
	
	public Page<MerchantBankInf> findPage(Page<MerchantBankInf> page, MerchantBankInf merchantBankInf) {
		return super.findPage(page, merchantBankInf);
	}
	
	@Transactional(readOnly = false)
	public void save(MerchantBankInf merchantBankInf) {
		super.save(merchantBankInf);
	}
	
	@Transactional(readOnly = false)
	public void delete(MerchantBankInf merchantBankInf) {
		super.delete(merchantBankInf);
	}
	
}