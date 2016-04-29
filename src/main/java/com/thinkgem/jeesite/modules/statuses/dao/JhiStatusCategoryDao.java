/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.statuses.entity.JhiStatusCategory;

/**
 * 行业资讯分类DAO接口
 * @author bread
 * @version 2016-04-29
 */
@MyBatisDao
public interface JhiStatusCategoryDao extends CrudDao<JhiStatusCategory> {
	
}