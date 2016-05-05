/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 首页条幅Entity
 * @author bread
 * @version 2016-05-05
 */
public class Banner extends DataEntity<Banner> {
	
	private static final long serialVersionUID = 1L;
	private String href;		// href
	private String image;		// image
	private String sort;		// sort
	private String title;		// title
	
	public Banner() {
		super();
	}

	public Banner(String id){
		super(id);
	}

	@Length(min=0, max=250, message="href长度必须介于 0 和 250 之间")
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
	
	@Length(min=0, max=250, message="image长度必须介于 0 和 250 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Length(min=0, max=11, message="sort长度必须介于 0 和 11 之间")
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	@Length(min=0, max=200, message="title长度必须介于 0 和 200 之间")
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