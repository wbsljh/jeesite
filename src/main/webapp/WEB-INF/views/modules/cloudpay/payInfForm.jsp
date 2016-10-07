<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>支付订单管理</title>
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
		<li><a href="${ctx}/cloudpay/payInf/">支付订单列表</a></li>
		<li class="active"><a href="${ctx}/cloudpay/payInf/form?id=${payInf.id}">支付订单<shiro:hasPermission name="cloudpay:payInf:edit">${not empty payInf.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cloudpay:payInf:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="payInf" action="${ctx}/cloudpay/payInf/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">支付订单号：</label>
			<div class="controls">
				<form:input path="payOrdNo" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户ID：</label>
			<div class="controls">
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单状态：</label>
			<div class="controls">
				<form:select path="payStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_pay_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付方式：</label>
			<div class="controls">
				<form:select path="payType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_pay_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付终端号：</label>
			<div class="controls">
				<form:input path="terNo" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单金额：</label>
			<div class="controls">
				<form:input path="txAmt" htmlEscape="false" maxlength="12" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">费率：</label>
			<div class="controls">
				<form:input path="rate" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">费率类型：</label>
			<div class="controls">
				<form:input path="rateType" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手续费：</label>
			<div class="controls">
				<form:input path="fee" htmlEscape="false" maxlength="12" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实际金额：</label>
			<div class="controls">
				<form:input path="netrecamt" htmlEscape="false" maxlength="12" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付渠道编号：</label>
			<div class="controls">
				<form:input path="payChannel" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付银行卡号：</label>
			<div class="controls">
				<form:input path="payCardNo" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发卡行名称：</label>
			<div class="controls">
				<form:input path="issnam" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">卡名称：</label>
			<div class="controls">
				<form:input path="crdnam" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">签名照片：</label>
			<div class="controls">
				<form:input path="paySignPic" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付日期：</label>
			<div class="controls">
				<input name="payDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${payInf.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付时间：</label>
			<div class="controls">
				<input name="payOrdTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${payInf.payOrdTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最后更新时间：</label>
			<div class="controls">
				<input name="modifyTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${payInf.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行卡介质：</label>
			<div class="controls">
				<form:input path="cardMedia" htmlEscape="false" maxlength="2" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">流水号：</label>
			<div class="controls">
				<form:input path="serialNo" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现状态：</label>
			<div class="controls">
				<form:select path="casStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_cas_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cloudpay:payInf:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>