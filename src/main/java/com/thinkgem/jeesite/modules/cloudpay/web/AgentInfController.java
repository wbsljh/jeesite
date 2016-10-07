/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cloudpay.web;

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
import com.thinkgem.jeesite.modules.cloudpay.entity.AgentInf;
import com.thinkgem.jeesite.modules.cloudpay.service.AgentInfService;

/**
 * 代理商信息Controller
 * @author bread
 * @version 2016-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/cloudpay/agentInf")
public class AgentInfController extends BaseController {

	@Autowired
	private AgentInfService agentInfService;
	
	@ModelAttribute
	public AgentInf get(@RequestParam(required=false) String id) {
		AgentInf entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = agentInfService.get(id);
		}
		if (entity == null){
			entity = new AgentInf();
		}
		return entity;
	}
	
	@RequiresPermissions("cloudpay:agentInf:view")
	@RequestMapping(value = {"list", ""})
	public String list(AgentInf agentInf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AgentInf> page = agentInfService.findPage(new Page<AgentInf>(request, response), agentInf); 
		model.addAttribute("page", page);
		return "modules/cloudpay/agentInfList";
	}

	@RequiresPermissions("cloudpay:agentInf:view")
	@RequestMapping(value = "form")
	public String form(AgentInf agentInf, Model model) {
		model.addAttribute("agentInf", agentInf);
		return "modules/cloudpay/agentInfForm";
	}

	@RequiresPermissions("cloudpay:agentInf:edit")
	@RequestMapping(value = "save")
	public String save(AgentInf agentInf, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, agentInf)){
			return form(agentInf, model);
		}
		agentInfService.save(agentInf);
		addMessage(redirectAttributes, "保存代理商信息成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/agentInf/?repage";
	}
	
	@RequiresPermissions("cloudpay:agentInf:edit")
	@RequestMapping(value = "delete")
	public String delete(AgentInf agentInf, RedirectAttributes redirectAttributes) {
		agentInfService.delete(agentInf);
		addMessage(redirectAttributes, "删除代理商信息成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/agentInf/?repage";
	}

}