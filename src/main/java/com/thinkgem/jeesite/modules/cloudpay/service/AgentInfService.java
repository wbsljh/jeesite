/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cloudpay.entity.AgentInf;
import com.thinkgem.jeesite.modules.cloudpay.dao.AgentInfDao;

/**
 * 代理商信息Service
 * @author bread
 * @version 2016-10-07
 */
@Service
@Transactional(readOnly = true)
public class AgentInfService extends CrudService<AgentInfDao, AgentInf> {

	public AgentInf get(String id) {
		return super.get(id);
	}
	
	public List<AgentInf> findList(AgentInf agentInf) {
		return super.findList(agentInf);
	}
	
	public Page<AgentInf> findPage(Page<AgentInf> page, AgentInf agentInf) {
		return super.findPage(page, agentInf);
	}
	
	@Transactional(readOnly = false)
	public void save(AgentInf agentInf) {
		super.save(agentInf);
	}
	
	@Transactional(readOnly = false)
	public void delete(AgentInf agentInf) {
		super.delete(agentInf);
	}
	
}