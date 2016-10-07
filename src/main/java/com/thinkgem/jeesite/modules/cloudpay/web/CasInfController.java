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
import com.thinkgem.jeesite.modules.cloudpay.entity.CasInf;
import com.thinkgem.jeesite.modules.cloudpay.service.CasInfService;

/**
 * 提现订单Controller
 * @author bread
 * @version 2016-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/cloudpay/casInf")
public class CasInfController extends BaseController {

	@Autowired
	private CasInfService casInfService;
	
	@ModelAttribute
	public CasInf get(@RequestParam(required=false) String id) {
		CasInf entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = casInfService.get(id);
		}
		if (entity == null){
			entity = new CasInf();
		}
		return entity;
	}
	
	@RequiresPermissions("cloudpay:casInf:view")
	@RequestMapping(value = {"list", ""})
	public String list(CasInf casInf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CasInf> page = casInfService.findPage(new Page<CasInf>(request, response), casInf); 
		model.addAttribute("page", page);
		return "modules/cloudpay/casInfList";
	}

	@RequiresPermissions("cloudpay:casInf:view")
	@RequestMapping(value = "form")
	public String form(CasInf casInf, Model model) {
		model.addAttribute("casInf", casInf);
		return "modules/cloudpay/casInfForm";
	}

	@RequiresPermissions("cloudpay:casInf:edit")
	@RequestMapping(value = "save")
	public String save(CasInf casInf, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, casInf)){
			return form(casInf, model);
		}
		casInfService.save(casInf);
		addMessage(redirectAttributes, "保存提现订单成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/casInf/?repage";
	}
	
	@RequiresPermissions("cloudpay:casInf:edit")
	@RequestMapping(value = "delete")
	public String delete(CasInf casInf, RedirectAttributes redirectAttributes) {
		casInfService.delete(casInf);
		addMessage(redirectAttributes, "删除提现订单成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/casInf/?repage";
	}

}