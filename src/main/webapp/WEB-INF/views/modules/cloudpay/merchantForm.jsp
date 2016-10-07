<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户实名认证管理</title>
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
		<li><a href="${ctx}/cloudpay/merchant/">商户实名认证列表</a></li>
		<li class="active"><a href="${ctx}/cloudpay/merchant/form?id=${merchant.id}">商户实名认证<shiro:hasPermission name="cloudpay:merchant:edit">${not empty merchant.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cloudpay:merchant:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="merchant" action="${ctx}/cloudpay/merchant/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">用户ID：</label>
			<div class="controls">
				<sys:treeselect id="login" name="login.id" value="${merchant.login.id}" labelName="login.name" labelValue="${merchant.login.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户姓名：</label>
			<div class="controls">
				<form:input path="custName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户类型：</label>
			<div class="controls">
				<form:select path="custType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_cust_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件类型：</label>
			<div class="controls">
				<form:select path="certificateType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_certificate_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码：</label>
			<div class="controls">
				<form:input path="certificateNo" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手持身份证照片：</label>
			<div class="controls">
				<form:hidden id="idcardHandheld" path="idcardHandheld" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="idcardHandheld" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证正面：</label>
			<div class="controls">
				<form:hidden id="idcardFront" path="idcardFront" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<sys:ckfinder input="idcardFront" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证反面：</label>
			<div class="controls">
				<form:hidden id="idcardBack" path="idcardBack" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<sys:ckfinder input="idcardBack" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人姓名：</label>
			<div class="controls">
				<form:input path="legalName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人营业执照号：</label>
			<div class="controls">
				<form:input path="licNo" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">认证状态：</label>
			<div class="controls">
				<form:select path="auditStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">认证时间：</label>
			<div class="controls">
				<input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${merchant.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税务登记号：</label>
			<div class="controls">
				<form:input path="taxNo" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">认证审核意见：</label>
			<div class="controls">
				<form:textarea path="auditIdea" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge "/>
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
			<label class="control-label">认证人：</label>
			<div class="controls">
				<form:input path="auditor.id" htmlEscape="false" maxlength="20" class="input-xlarge "/>
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
			<label class="control-label">注册时间：</label>
			<div class="controls">
				<input name="regDatetime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${merchant.regDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">城市：</label>
			<div class="controls">
				<sys:treeselect id="city" name="city.id" value="${merchant.city.id}" labelName="city.name" labelValue="${merchant.city.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">省份：</label>
			<div class="controls">
				<sys:treeselect id="province" name="province.id" value="${merchant.province.id}" labelName="province.name" labelValue="${merchant.province.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">秘钥：</label>
			<div class="controls">
				<form:input path="secretKey" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系人：</label>
			<div class="controls">
				<form:input path="techContact" htmlEscape="false" maxlength="30" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理商：</label>
			<div class="controls">
				<sys:treeselect id="agent" name="agent.id" value="${merchant.agent.id}" labelName="agent.name" labelValue="${merchant.agent.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">费率%：</label>
			<div class="controls">
				<form:input path="rate" htmlEscape="false" maxlength="14" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系邮箱：</label>
			<div class="controls">
				<form:input path="techEmail" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分润比例：</label>
			<div class="controls">
				<form:input path="agentRate" htmlEscape="false" maxlength="14" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术联系手机：</label>
			<div class="controls">
				<form:input path="techMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
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
				<form:input path="bizMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算联系人：</label>
			<div class="controls">
				<form:input path="servContact" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算联系手机：</label>
			<div class="controls">
				<form:input path="servMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">oem图片：</label>
			<div class="controls">
				<form:hidden id="oemPic" path="oemPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="oemPic" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户许可证：</label>
			<div class="controls">
				<form:hidden id="openLicPic" path="openLicPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="openLicPic" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业执照：</label>
			<div class="controls">
				<form:hidden id="busiLicPic" path="busiLicPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="busiLicPic" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人身份证：</label>
			<div class="controls">
				<form:hidden id="legalIdPic" path="legalIdPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="legalIdPic" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税务登记证：</label>
			<div class="controls">
				<form:hidden id="taxNoPic" path="taxNoPic" htmlEscape="false" maxlength="25" class="input-xlarge"/>
				<sys:ckfinder input="taxNoPic" type="files" uploadPath="/cloudpay/merchant" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cloudpay:merchant:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>