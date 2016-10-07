/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cloudpay.entity.CasInf;
import com.thinkgem.jeesite.modules.cloudpay.dao.CasInfDao;

/**
 * 提现订单Service
 * @author bread
 * @version 2016-10-07
 */
@Service
@Transactional(readOnly = true)
public class CasInfService extends CrudService<CasInfDao, CasInf> {

	public CasInf get(String id) {
		return super.get(id);
	}
	
	public List<CasInf> findList(CasInf casInf) {
		return super.findList(casInf);
	}
	
	public Page<CasInf> findPage(Page<CasInf> page, CasInf casInf) {
		return super.findPage(page, casInf);
	}
	
	@Transactional(readOnly = false)
	public void save(CasInf casInf) {
		super.save(casInf);
	}
	
	@Transactional(readOnly = false)
	public void delete(CasInf casInf) {
		super.delete(casInf);
	}
	
}