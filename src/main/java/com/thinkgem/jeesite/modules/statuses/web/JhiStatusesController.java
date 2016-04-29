/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.statuses.entity.JhiStatuses;
import com.thinkgem.jeesite.modules.statuses.service.JhiStatusesService;

/**
 * 行业资讯Controller
 * @author bread
 * @version 2016-04-29
 */
@Controller
@RequestMapping(value = "${adminPath}/statuses/jhiStatuses")
public class JhiStatusesController extends BaseController {

	@Autowired
	private JhiStatusesService jhiStatusesService;
	
	@ModelAttribute
	public JhiStatuses get(@RequestParam(required=false) String id) {
		JhiStatuses entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jhiStatusesService.get(id);
		}
		if (entity == null){
			entity = new JhiStatuses();
		}
		return entity;
	}
	
	@RequiresPermissions("statuses:jhiStatuses:view")
	@RequestMapping(value = {"list", ""})
	public String list(JhiStatuses jhiStatuses, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JhiStatuses> page = jhiStatusesService.findPage(new Page<JhiStatuses>(request, response), jhiStatuses); 
		model.addAttribute("page", page);
		return "modules/statuses/jhiStatusesList";
	}

	@RequiresPermissions("statuses:jhiStatuses:view")
	@RequestMapping(value = "form")
	public String form(JhiStatuses jhiStatuses, Model model) {
		model.addAttribute("jhiStatuses", jhiStatuses);
		return "modules/statuses/jhiStatusesForm";
	}

	@RequiresPermissions("statuses:jhiStatuses:edit")
	@RequestMapping(value = "save")
	public String save(JhiStatuses jhiStatuses, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jhiStatuses)){
			return form(jhiStatuses, model);
		}
		jhiStatusesService.save(jhiStatuses);
		addMessage(redirectAttributes, "保存行业资讯分类成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/jhiStatuses/?repage";
	}
	
	@RequiresPermissions("statuses:jhiStatuses:edit")
	@RequestMapping(value = "delete")
	public String delete(JhiStatuses jhiStatuses, RedirectAttributes redirectAttributes) {
		jhiStatusesService.delete(jhiStatuses);
		addMessage(redirectAttributes, "删除行业资讯分类成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/jhiStatuses/?repage";
	}

}