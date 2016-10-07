/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cloudpay.entity.CasInf;

/**
 * 提现订单DAO接口
 * @author bread
 * @version 2016-10-07
 */
@MyBatisDao
public interface CasInfDao extends CrudDao<CasInf> {
	
}