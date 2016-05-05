<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业资讯分类管理</title>
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
		<li><a href="${ctx}/statuses/jhiStatuses/">行业资讯分类列表</a></li>
		<li class="active"><a href="${ctx}/statuses/jhiStatuses/form?id=${jhiStatuses.id}">行业资讯分类<shiro:hasPermission name="statuses:jhiStatuses:edit">${not empty jhiStatuses.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="statuses:jhiStatuses:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="jhiStatuses" action="${ctx}/statuses/jhiStatuses/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">归属栏目:</label>
			<div class="controls">
                <sys:treeselect id="category" name="category.id" value="${jhiStatuses.category.id}" labelName="category.name" labelValue="${jhiStatuses.category.name}"
					title="栏目" url="/statuses/jhiStatusCategory/treeData" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required"/>&nbsp;
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首图：</label>
			<div class="controls">
				<form:hidden id="originalPic" path="originalPic" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="originalPic" type="images" uploadPath="${ossPath}" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">来源：</label>
			<div class="controls">
				<form:input path="source" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">摘要：</label>
			<div class="controls">
				<form:textarea path="summary" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">正文：</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true" path="content"/>
				<sys:ckeditor replace="content" uploadPath="/statuses/statuses" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="attacment" path="attacment" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="attacment" type="files" uploadPath="${ossPath}" selectMultiple="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">发布日期：</label>
			<div class="controls">
				<form:textarea path="summary" htmlEscape="false" rows="4" class="input-xxlarge "/>
				<input name="publishDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
							value="<fmt:formatDate value="${jhiStatuses.publishDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">是否头条：</label>
			<div class="controls">
				<form:select path="isHead" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键字:</label>
			<div class="controls">
				<form:input path="tags" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<span class="help-inline">多个关键字，用逗号（，）分隔。</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">置顶：</label>
			<div class="controls">
				<form:checkboxes path="top" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="statuses:jhiStatuses:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>