/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cloudpay.entity.PayInf;
import com.thinkgem.jeesite.modules.cloudpay.dao.PayInfDao;

/**
 * 支付订单Service
 * @author bread
 * @version 2016-10-07
 */
@Service
@Transactional(readOnly = true)
public class PayInfService extends CrudService<PayInfDao, PayInf> {

	public PayInf get(String id) {
		return super.get(id);
	}
	
	public List<PayInf> findList(PayInf payInf) {
		return super.findList(payInf);
	}
	
	public Page<PayInf> findPage(Page<PayInf> page, PayInf payInf) {
		return super.findPage(page, payInf);
	}
	
	@Transactional(readOnly = false)
	public void save(PayInf payInf) {
		super.save(payInf);
	}
	
	@Transactional(readOnly = false)
	public void delete(PayInf payInf) {
		super.delete(payInf);
	}
	
}