/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cloudpay.entity.AgentInf;

/**
 * 代理商信息DAO接口
 * @author bread
 * @version 2016-10-07
 */
@MyBatisDao
public interface AgentInfDao extends CrudDao<AgentInf> {
	
}