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
import com.thinkgem.jeesite.modules.cloudpay.entity.PayInf;
import com.thinkgem.jeesite.modules.cloudpay.service.PayInfService;

/**
 * 支付订单Controller
 * @author bread
 * @version 2016-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/cloudpay/payInf")
public class PayInfController extends BaseController {

	@Autowired
	private PayInfService payInfService;
	
	@ModelAttribute
	public PayInf get(@RequestParam(required=false) String id) {
		PayInf entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = payInfService.get(id);
		}
		if (entity == null){
			entity = new PayInf();
		}
		return entity;
	}
	
	@RequiresPermissions("cloudpay:payInf:view")
	@RequestMapping(value = {"list", ""})
	public String list(PayInf payInf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PayInf> page = payInfService.findPage(new Page<PayInf>(request, response), payInf); 
		model.addAttribute("page", page);
		return "modules/cloudpay/payInfList";
	}

	@RequiresPermissions("cloudpay:payInf:view")
	@RequestMapping(value = "form")
	public String form(PayInf payInf, Model model) {
		model.addAttribute("payInf", payInf);
		return "modules/cloudpay/payInfForm";
	}

	@RequiresPermissions("cloudpay:payInf:edit")
	@RequestMapping(value = "save")
	public String save(PayInf payInf, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, payInf)){
			return form(payInf, model);
		}
		payInfService.save(payInf);
		addMessage(redirectAttributes, "保存支付订单成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/payInf/?repage";
	}
	
	@RequiresPermissions("cloudpay:payInf:edit")
	@RequestMapping(value = "delete")
	public String delete(PayInf payInf, RedirectAttributes redirectAttributes) {
		payInfService.delete(payInf);
		addMessage(redirectAttributes, "删除支付订单成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/payInf/?repage";
	}

}