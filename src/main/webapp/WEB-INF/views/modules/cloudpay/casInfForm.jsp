<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提现订单管理</title>
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
		<li><a href="${ctx}/cloudpay/casInf/">提现订单列表</a></li>
		<li class="active"><a href="${ctx}/cloudpay/casInf/form?id=${casInf.id}">提现订单<shiro:hasPermission name="cloudpay:casInf:edit">${not empty casInf.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cloudpay:casInf:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="casInf" action="${ctx}/cloudpay/casInf/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">提现订单号：</label>
			<div class="controls">
				<form:input path="casOrdNo" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对应商品订单号：</label>
			<div class="controls">
				<form:input path="payOrdNo" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现类型：</label>
			<div class="controls">
				<form:select path="casType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_cas_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单创建时间：</label>
			<div class="controls">
				<input name="casDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${casInf.casDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最后操作时间：</label>
			<div class="controls">
				<input name="modifyDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${casInf.modifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单完成时间：</label>
			<div class="controls">
				<input name="sucDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${casInf.sucDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单状态：</label>
			<div class="controls">
				<form:select path="ordStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('ord_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">货币类型：</label>
			<div class="controls">
				<form:input path="txCcy" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属商户编号：</label>
			<div class="controls">
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现商户户名：</label>
			<div class="controls">
				<form:input path="custName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单金额：</label>
			<div class="controls">
				<form:input path="txAmt" htmlEscape="false" maxlength="12" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">费率：</label>
			<div class="controls">
				<form:input path="rate" htmlEscape="false" maxlength="10" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手续费：</label>
			<div class="controls">
				<form:input path="fee" htmlEscape="false" maxlength="12" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">服务费：</label>
			<div class="controls">
				<form:input path="serviceFee" htmlEscape="false" maxlength="12" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实际到账金额：</label>
			<div class="controls">
				<form:input path="netrecamt" htmlEscape="false" maxlength="12" class="input-xlarge  number"/>
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
			<label class="control-label">提现银行卡号：</label>
			<div class="controls">
				<form:input path="cardNo" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">省份：</label>
			<div class="controls">
				<sys:treeselect id="province" name="province.id" value="${casInf.province.id}" labelName="province.name" labelValue="${casInf.province.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现描述：</label>
			<div class="controls">
				<form:input path="casDesc" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现审核状态：</label>
			<div class="controls">
				<form:select path="auditStatus" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核描述：</label>
			<div class="controls">
				<form:input path="auditDesc" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核人：</label>
			<div class="controls">
				<sys:treeselect id="auditor" name="auditor.id" value="${casInf.auditor.id}" labelName="auditor.name" labelValue="${casInf.auditor.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核时间：</label>
			<div class="controls">
				<input name="auditDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${casInf.auditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提现渠道：</label>
			<div class="controls">
				<form:input path="casChannel" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cloudpay:casInf:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>