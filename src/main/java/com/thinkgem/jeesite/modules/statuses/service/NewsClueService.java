/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.statuses.entity.NewsClue;
import com.thinkgem.jeesite.modules.statuses.dao.NewsClueDao;

/**
 * 新闻线索Service
 * @author bread
 * @version 2016-05-05
 */
@Service
@Transactional(readOnly = true)
public class NewsClueService extends CrudService<NewsClueDao, NewsClue> {

	public NewsClue get(String id) {
		return super.get(id);
	}
	
	public List<NewsClue> findList(NewsClue newsClue) {
		return super.findList(newsClue);
	}
	
	public Page<NewsClue> findPage(Page<NewsClue> page, NewsClue newsClue) {
		return super.findPage(page, newsClue);
	}
	
	@Transactional(readOnly = false)
	public void save(NewsClue newsClue) {
		super.save(newsClue);
	}
	
	@Transactional(readOnly = false)
	public void delete(NewsClue newsClue) {
		super.delete(newsClue);
	}
	
}