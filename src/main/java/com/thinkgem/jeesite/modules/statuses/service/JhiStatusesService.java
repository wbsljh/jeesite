/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.statuses.entity.JhiStatuses;
import com.thinkgem.jeesite.modules.statuses.dao.JhiStatusesDao;

/**
 * 行业资讯Service
 * @author bread
 * @version 2016-04-29
 */
@Service
@Transactional(readOnly = true)
public class JhiStatusesService extends CrudService<JhiStatusesDao, JhiStatuses> {

	public JhiStatuses get(String id) {
		return super.get(id);
	}
	
	public List<JhiStatuses> findList(JhiStatuses jhiStatuses) {
		return super.findList(jhiStatuses);
	}
	
	public Page<JhiStatuses> findPage(Page<JhiStatuses> page, JhiStatuses jhiStatuses) {
		return super.findPage(page, jhiStatuses);
	}
	
	@Transactional(readOnly = false)
	public void save(JhiStatuses jhiStatuses) {
		if (jhiStatuses.getContent()!=null){
			jhiStatuses.setContent(StringEscapeUtils.unescapeHtml4(
					jhiStatuses.getContent()));
		}
		super.save(jhiStatuses);
	}
	
	@Transactional(readOnly = false)
	public void delete(JhiStatuses jhiStatuses) {
		super.delete(jhiStatuses);
	}
	
}