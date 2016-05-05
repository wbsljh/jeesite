/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 新闻线索Entity
 * @author bread
 * @version 2016-05-05
 */
public class NewsClue extends DataEntity<NewsClue> {
	
	private static final long serialVersionUID = 1L;
	private String content;		// content
	private String tel;		// tel
	private String title;		// title
	
	public NewsClue() {
		super();
	}

	public NewsClue(String id){
		super(id);
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=20, message="tel长度必须介于 0 和 20 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Length(min=0, max=255, message="title长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public void preInsert() {
		// TODO Auto-generated method stub
		this.setIsNewRecord(true);
		super.preInsert();
	}

	@Override
	public void preUpdate() {
		// TODO Auto-generated method stub
		super.preUpdate();
	}
}