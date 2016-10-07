<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户实名认证管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cloudpay/merchant/">商户实名认证列表</a></li>
		<shiro:hasPermission name="cloudpay:merchant:edit"><li><a href="${ctx}/cloudpay/merchant/form">商户实名认证添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="merchant" action="${ctx}/cloudpay/merchant/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商户编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商户姓名：</label>
				<form:input path="custName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>商户类型：</label>
				<form:select path="custType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_cust_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>法人姓名：</label>
				<form:input path="legalName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>认证状态：</label>
				<form:select path="auditStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>认证时间：</label>
				<input name="beginAuditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${merchant.beginAuditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endAuditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${merchant.endAuditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>代理商：</label>
				<sys:treeselect id="agent" name="agent.id" value="${merchant.agent.id}" labelName="agent.name" labelValue="${merchant.agent.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商户编号</th>
				<th>商户姓名</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<th>法人姓名</th>
				<th>认证状态</th>
				<th>认证时间</th>
				<th>税务登记号</th>
				<th>认证人</th>
				<th>注册时间</th>
				<th>代理商</th>
				<th>费率%</th>
				<th>分润比例</th>
				<shiro:hasPermission name="cloudpay:merchant:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="merchant">
			<tr>
				<td><a href="${ctx}/cloudpay/merchant/form?id=${merchant.id}">
					${merchant.id}
				</a></td>
				<td>
					${merchant.custName}
				</td>
				<td>
					${fns:getDictLabel(merchant.certificateType, 'dict_certificate_type', '')}
				</td>
				<td>
					${merchant.certificateNo}
				</td>
				<td>
					${merchant.legalName}
				</td>
				<td>
					${fns:getDictLabel(merchant.auditStatus, 'dict_audit_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${merchant.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${merchant.taxNo}
				</td>
				<td>
					${merchant.auditor.id}
				</td>
				<td>
					<fmt:formatDate value="${merchant.regDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${merchant.agent.name}
				</td>
				<td>
					${merchant.rate}
				</td>
				<td>
					${merchant.agentRate}
				</td>
				<shiro:hasPermission name="cloudpay:merchant:edit"><td>
    				<a href="${ctx}/cloudpay/merchant/form?id=${merchant.id}">修改</a>
					<a href="${ctx}/cloudpay/merchant/delete?id=${merchant.id}" onclick="return confirmx('确认要删除该商户实名认证吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>