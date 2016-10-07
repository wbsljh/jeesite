<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户结算信息管理</title>
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
		<li><a href="${ctx}/cloudpay/merchantBankInf/">商户结算信息列表</a></li>
		<li class="active"><a href="${ctx}/cloudpay/merchantBankInf/form?id=${merchantBankInf.id}">商户结算信息<shiro:hasPermission name="cloudpay:merchantBankInf:edit">${not empty merchantBankInf.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cloudpay:merchantBankInf:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="merchantBankInf" action="${ctx}/cloudpay/merchantBankInf/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">商户编号：</label>
			<div class="controls">
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发卡行代码：</label>
			<div class="controls">
				<form:input path="issno" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发卡行名称：</label>
			<div class="controls">
				<form:input path="issnam" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户省份：</label>
			<div class="controls">
				<sys:treeselect id="province" name="province.id" value="${merchantBankInf.province.id}" labelName="province.name" labelValue="${merchantBankInf.province.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户城市：</label>
			<div class="controls">
				<sys:treeselect id="city" name="city.id" value="${merchantBankInf.city.id}" labelName="city.name" labelValue="${merchantBankInf.city.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联行号：</label>
			<div class="controls">
				<form:input path="cnapsCode" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">卡种：</label>
			<div class="controls">
				<form:select path="cardType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_card_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">卡片状态：</label>
			<div class="controls">
				<form:select path="cardState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_card_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行卡号：</label>
			<div class="controls">
				<form:input path="cardNo" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行预留手机号：</label>
			<div class="controls">
				<form:input path="mobileNo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">绑定时间：</label>
			<div class="controls">
				<input name="bindingTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${merchantBankInf.bindingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">解绑时间：</label>
			<div class="controls">
				<input name="unbundlingTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${merchantBankInf.unbundlingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行卡正面照：</label>
			<div class="controls">
				<form:hidden id="bankcardFront" path="bankcardFront" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="bankcardFront" type="files" uploadPath="/cloudpay/merchantBankInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行卡反面照：</label>
			<div class="controls">
				<form:hidden id="bankcardBack" path="bankcardBack" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="bankcardBack" type="files" uploadPath="/cloudpay/merchantBankInf" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cloudpay:merchantBankInf:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>