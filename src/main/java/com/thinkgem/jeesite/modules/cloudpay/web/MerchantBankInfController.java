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
import com.thinkgem.jeesite.modules.cloudpay.entity.MerchantBankInf;
import com.thinkgem.jeesite.modules.cloudpay.service.MerchantBankInfService;

/**
 * 商户结算信息Controller
 * @author bread
 * @version 2016-10-06
 */
@Controller
@RequestMapping(value = "${adminPath}/cloudpay/merchantBankInf")
public class MerchantBankInfController extends BaseController {

	@Autowired
	private MerchantBankInfService merchantBankInfService;
	
	@ModelAttribute
	public MerchantBankInf get(@RequestParam(required=false) String id) {
		MerchantBankInf entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = merchantBankInfService.get(id);
		}
		if (entity == null){
			entity = new MerchantBankInf();
		}
		return entity;
	}
	
	@RequiresPermissions("cloudpay:merchantBankInf:view")
	@RequestMapping(value = {"list", ""})
	public String list(MerchantBankInf merchantBankInf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MerchantBankInf> page = merchantBankInfService.findPage(new Page<MerchantBankInf>(request, response), merchantBankInf); 
		model.addAttribute("page", page);
		return "modules/cloudpay/merchantBankInfList";
	}

	@RequiresPermissions("cloudpay:merchantBankInf:view")
	@RequestMapping(value = "form")
	public String form(MerchantBankInf merchantBankInf, Model model) {
		model.addAttribute("merchantBankInf", merchantBankInf);
		return "modules/cloudpay/merchantBankInfForm";
	}

	@RequiresPermissions("cloudpay:merchantBankInf:edit")
	@RequestMapping(value = "save")
	public String save(MerchantBankInf merchantBankInf, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, merchantBankInf)){
			return form(merchantBankInf, model);
		}
		merchantBankInfService.save(merchantBankInf);
		addMessage(redirectAttributes, "保存商户结算信息成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/merchantBankInf/?repage";
	}
	
	@RequiresPermissions("cloudpay:merchantBankInf:edit")
	@RequestMapping(value = "delete")
	public String delete(MerchantBankInf merchantBankInf, RedirectAttributes redirectAttributes) {
		merchantBankInfService.delete(merchantBankInf);
		addMessage(redirectAttributes, "删除商户结算信息成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/merchantBankInf/?repage";
	}

}