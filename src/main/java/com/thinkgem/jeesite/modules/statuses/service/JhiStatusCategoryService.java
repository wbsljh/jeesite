/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.statuses.entity.JhiStatusCategory;
import com.thinkgem.jeesite.modules.statuses.dao.JhiStatusCategoryDao;

/**
 * 行业资讯分类Service
 * @author bread
 * @version 2016-04-29
 */
@Service
@Transactional(readOnly = true)
public class JhiStatusCategoryService extends CrudService<JhiStatusCategoryDao, JhiStatusCategory> {

	public JhiStatusCategory get(String id) {
		return super.get(id);
	}
	
	public List<JhiStatusCategory> findList(JhiStatusCategory jhiStatusCategory) {
		return super.findList(jhiStatusCategory);
	}
	
	public Page<JhiStatusCategory> findPage(Page<JhiStatusCategory> page, JhiStatusCategory jhiStatusCategory) {
		return super.findPage(page, jhiStatusCategory);
	}
	
	@Transactional(readOnly = false)
	public void save(JhiStatusCategory jhiStatusCategory) {
		super.save(jhiStatusCategory);
	}
	
	@Transactional(readOnly = false)
	public void delete(JhiStatusCategory jhiStatusCategory) {
		super.delete(jhiStatusCategory);
	}
	
}