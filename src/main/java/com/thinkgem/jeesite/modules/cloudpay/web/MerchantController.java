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
import com.thinkgem.jeesite.modules.cloudpay.entity.Merchant;
import com.thinkgem.jeesite.modules.cloudpay.service.MerchantService;

/**
 * 商户实名认证Controller
 * @author bread
 * @version 2016-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/cloudpay/merchant")
public class MerchantController extends BaseController {

	@Autowired
	private MerchantService merchantService;
	
	@ModelAttribute
	public Merchant get(@RequestParam(required=false) String id) {
		Merchant entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = merchantService.get(id);
		}
		if (entity == null){
			entity = new Merchant();
		}
		return entity;
	}
	
	@RequiresPermissions("cloudpay:merchant:view")
	@RequestMapping(value = {"list", ""})
	public String list(Merchant merchant, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Merchant> page = merchantService.findPage(new Page<Merchant>(request, response), merchant); 
		model.addAttribute("page", page);
		return "modules/cloudpay/merchantList";
	}

	@RequiresPermissions("cloudpay:merchant:view")
	@RequestMapping(value = "form")
	public String form(Merchant merchant, Model model) {
		model.addAttribute("merchant", merchant);
		return "modules/cloudpay/merchantForm";
	}

	@RequiresPermissions("cloudpay:merchant:edit")
	@RequestMapping(value = "save")
	public String save(Merchant merchant, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, merchant)){
			return form(merchant, model);
		}
		merchantService.save(merchant);
		addMessage(redirectAttributes, "保存商户实名认证成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/merchant/?repage";
	}
	
	@RequiresPermissions("cloudpay:merchant:edit")
	@RequestMapping(value = "delete")
	public String delete(Merchant merchant, RedirectAttributes redirectAttributes) {
		merchantService.delete(merchant);
		addMessage(redirectAttributes, "删除商户实名认证成功");
		return "redirect:"+Global.getAdminPath()+"/cloudpay/merchant/?repage";
	}

}