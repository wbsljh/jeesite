/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 行业资讯分类Entity
 * @author bread
 * @version 2016-04-29
 */
public class JhiStatusCategory extends DataEntity<JhiStatusCategory> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	private String icon;		// icon
	
	public JhiStatusCategory() {
		super();
	}

	public JhiStatusCategory(String id){
		super(id);
	}

	@Length(min=0, max=255, message="name长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="icon长度必须介于 0 和 255 之间")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
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