<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>代理商信息管理</title>
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
		<li class="active"><a href="${ctx}/cloudpay/agentInf/">代理商信息列表</a></li>
		<shiro:hasPermission name="cloudpay:agentInf:edit"><li><a href="${ctx}/cloudpay/agentInf/form">代理商信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="agentInf" action="${ctx}/cloudpay/agentInf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>代理商ID：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="14" class="input-medium"/>
			</li>
			<li><label>代理商名称：</label>
				<form:input path="agentName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>法人姓名：</label>
				<form:input path="legalName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>代理商ID</th>
				<th>代理商名称</th>
				<th>法人姓名</th>
				<th>法人身份证号码</th>
				<th>法人营业执照号</th>
				<th>税务登记号</th>
				<th>联系地址</th>
				<th>联系电话</th>
				<th>手机号码</th>
				<th>城市</th>
				<th>省份</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cloudpay:agentInf:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentInf">
			<tr>
				<td><a href="${ctx}/cloudpay/agentInf/form?id=${agentInf.id}">
					${agentInf.agentId}
				</a></td>
				<td>
					${agentInf.agentName}
				</td>
				<td>
					${agentInf.legalName}
				</td>
				<td>
					${agentInf.legalIdentityNo}
				</td>
				<td>
					${agentInf.licNo}
				</td>
				<td>
					${agentInf.taxNo}
				</td>
				<td>
					${agentInf.address}
				</td>
				<td>
					${agentInf.tel}
				</td>
				<td>
					${agentInf.moblieNo}
				</td>
				<td>
					${agentInf.city.name}
				</td>
				<td>
					${agentInf.province.name}
				</td>
				<td>
					<fmt:formatDate value="${agentInf.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cloudpay:agentInf:edit"><td>
    				<a href="${ctx}/cloudpay/agentInf/form?id=${agentInf.id}">修改</a>
					<a href="${ctx}/cloudpay/agentInf/delete?id=${agentInf.id}" onclick="return confirmx('确认要删除该代理商信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>