/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.statuses.entity.NewsClue;

/**
 * 新闻线索DAO接口
 * @author bread
 * @version 2016-05-05
 */
@MyBatisDao
public interface NewsClueDao extends CrudDao<NewsClue> {
	
}