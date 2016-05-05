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
import com.thinkgem.jeesite.modules.statuses.entity.NewsClue;
import com.thinkgem.jeesite.modules.statuses.service.NewsClueService;

/**
 * 新闻线索Controller
 * @author bread
 * @version 2016-05-05
 */
@Controller
@RequestMapping(value = "${adminPath}/statuses/newsClue")
public class NewsClueController extends BaseController {

	@Autowired
	private NewsClueService newsClueService;
	
	@ModelAttribute
	public NewsClue get(@RequestParam(required=false) String id) {
		NewsClue entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = newsClueService.get(id);
		}
		if (entity == null){
			entity = new NewsClue();
		}
		return entity;
	}
	
	@RequiresPermissions("statuses:newsClue:view")
	@RequestMapping(value = {"list", ""})
	public String list(NewsClue newsClue, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<NewsClue> page = newsClueService.findPage(new Page<NewsClue>(request, response), newsClue); 
		model.addAttribute("page", page);
		return "modules/statuses/newsClueList";
	}

	@RequiresPermissions("statuses:newsClue:view")
	@RequestMapping(value = "form")
	public String form(NewsClue newsClue, Model model) {
		model.addAttribute("newsClue", newsClue);
		return "modules/statuses/newsClueForm";
	}

	@RequiresPermissions("statuses:newsClue:edit")
	@RequestMapping(value = "save")
	public String save(NewsClue newsClue, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, newsClue)){
			return form(newsClue, model);
		}
		newsClueService.save(newsClue);
		addMessage(redirectAttributes, "保存新闻线索成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/newsClue/?repage";
	}
	
	@RequiresPermissions("statuses:newsClue:edit")
	@RequestMapping(value = "delete")
	public String delete(NewsClue newsClue, RedirectAttributes redirectAttributes) {
		newsClueService.delete(newsClue);
		addMessage(redirectAttributes, "删除新闻线索成功");
		return "redirect:"+Global.getAdminPath()+"/statuses/newsClue/?repage";
	}

}