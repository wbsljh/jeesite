/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.statuses.entity.JhiStatusCategory;
import com.thinkgem.jeesite.modules.statuses.service.JhiStatusCategoryService;

/**
 * 行业资讯分类Controller
 * @author bread
 * @version 2016-04-29
 */
@Controller
@RequestMapping(value = "${adminPath}/statuses/jhiStatusCategory")
public class JhiStatusCategoryController extends BaseController {

	@Autowired
	private JhiStatusCategoryService jhiStatusCategoryService;
	
	@ModelAttribute
	public JhiStatusCategory get(@RequestParam(required=false) String id) {
		JhiStatusCategory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jhiStatusCategoryService.get(id);
		}
		if (entity == null){
			entity = new JhiStatusCategory();
		}
		return entity;
	}
	
	@RequiresPermissions("statuses:jhiStatusCategory:view")
	@RequestMapping(value = {"list", ""})
	public String list(JhiStatusCategory jhiStatusCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JhiStatusCategory> page = jhiStatusCategoryService.findPage(new Page<JhiStatusCategory>(request, response), jhiStatusCategory); 
		model.addAttribute("page", page);
		return "modules/statuses/jhiStatusCategoryList";
	}

	@RequiresPermissions("statuses:jhiStatusCategory:view")
	@RequestMapping(value = "form")
	public String form(JhiStatusCategory jhiStatusCategory, Model model) {
		model.addAttribute("jhiStatusCategory", jhiStatusCategory);
		return "modules/statuses/jhiStatusCategoryForm";
	}

	@RequiresPermissions("statuses:jhiStatusCategory:edit")
	@RequestMapping(value = "save")
	public String save(JhiStatusCategory jhiStatusCategory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jhiStatusCategory)){
			return form(jhiStatusCategory, model);
		}
		jhiStatusCategoryService.save(jhiStatusCategory);
		addMessage(redirectAttributes, "保存行业资讯分类成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/jhiStatusCategory/?repage";
	}
	
	@RequiresPermissions("statuses:jhiStatusCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(JhiStatusCategory jhiStatusCategory, RedirectAttributes redirectAttributes) {
		jhiStatusCategoryService.delete(jhiStatusCategory);
		addMessage(redirectAttributes, "删除行业资讯分类成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/jhiStatusCategory/?repage";
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(JhiStatusCategory jhiStatusCategory, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<JhiStatusCategory> list = jhiStatusCategoryService.findList(jhiStatusCategory);
		for (int i=0; i<list.size(); i++){
			JhiStatusCategory e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getName());
			mapList.add(map);
		}
		return mapList;
	}

}