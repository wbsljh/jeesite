<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>代理商信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cloudpay/agentInf/">代理商信息列表</a></li>
		<li class="active"><a href="${ctx}/cloudpay/agentInf/form?id=${agentInf.id}">代理商信息<shiro:hasPermission name="cloudpay:agentInf:edit">${not empty agentInf.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cloudpay:agentInf:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="agentInf" action="${ctx}/cloudpay/agentInf/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">代理商名称：</label>
			<div class="controls">
				<form:input path="agentName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人姓名：</label>
			<div class="controls">
				<form:input path="legalName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人身份证号码：</label>
			<div class="controls">
				<form:input path="legalIdentityNo" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人营业执照号：</label>
			<div class="controls">
				<form:input path="licNo" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税务登记号：</label>
			<div class="controls">
				<form:input path="taxNo" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="tel" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
				<form:input path="moblieNo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否冻结：</label>
			<div class="controls">
				<form:select path="frozState" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">保证金：</label>
			<div class="controls">
				<form:input path="margin" htmlEscape="false" maxlength="15" class="input-xlarge required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同开始日期：</label>
			<div class="controls">
				<input name="contractStrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentInf.contractStrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同结束日期：</label>
			<div class="controls">
				<input name="contractEndDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentInf.contractEndDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理商禁用：</label>
			<div class="controls">
				<form:select path="ageStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理商说明信息：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系人：</label>
			<div class="controls">
				<form:input path="techContact" htmlEscape="false" maxlength="30" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系电话：</label>
			<div class="controls">
				<form:input path="techTelNo" htmlEscape="false" maxlength="15" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系邮箱：</label>
			<div class="controls">
				<form:input path="techEmail" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系手机：</label>
			<div class="controls">
				<form:input path="techMobno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">城市：</label>
			<div class="controls">
				<sys:treeselect id="city" name="city.id" value="${agentInf.city.id}" labelName="city.name" labelValue="${agentInf.city.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">省份：</label>
			<div class="controls">
				<sys:treeselect id="province" name="province.id" value="${agentInf.province.id}" labelName="province.name" labelValue="${agentInf.province.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务联系人：</label>
			<div class="controls">
				<form:input path="bizContact" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务联系手机：</label>
			<div class="controls">
				<form:input path="bizMobno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客服联系人：</label>
			<div class="controls">
				<form:input path="servContact" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客服联系手机：</label>
			<div class="controls">
				<form:input path="servMobno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">OEM标识：</label>
			<div class="controls">
				<form:select path="oemState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算方式：</label>
			<div class="controls">
				<form:select path="settleType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_settle_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理商结算银行账号：</label>
			<div class="controls">
				<form:input path="bankPayAcno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理商结算账户名：</label>
			<div class="controls">
				<form:input path="bankPayUsernm" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户行：</label>
			<div class="controls">
				<form:input path="bankCode" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分润比例：</label>
			<div class="controls">
				<form:input path="profitRatio" htmlEscape="false" maxlength="4" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">oem图片：</label>
			<div class="controls">
				<form:hidden id="oemPic" path="oemPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="oemPic" type="files" uploadPath="/cloudpay/agentInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户许可证：</label>
			<div class="controls">
				<form:hidden id="openingLicensePic" path="openingLicensePic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="openingLicensePic" type="files" uploadPath="/cloudpay/agentInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业执照：</label>
			<div class="controls">
				<form:hidden id="businessLicensePic" path="businessLicensePic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="businessLicensePic" type="files" uploadPath="/cloudpay/agentInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人身份证：</label>
			<div class="controls">
				<form:hidden id="legalIdentityPic" path="legalIdentityPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="legalIdentityPic" type="files" uploadPath="/cloudpay/agentInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税务登记证：</label>
			<div class="controls">
				<form:hidden id="taxNoPic" path="taxNoPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="taxNoPic" type="files" uploadPath="/cloudpay/agentInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cloudpay:agentInf:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>