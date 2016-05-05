<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页条幅管理</title>
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
		<li class="active"><a href="${ctx}/statuses/banner/">首页条幅列表</a></li>
		<shiro:hasPermission name="statuses:banner:edit"><li><a href="${ctx}/statuses/banner/form">首页条幅添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="banner" action="${ctx}/statuses/banner/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>title：</label>
				<form:input path="title" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>href</th>
				<th>image</th>
				<th>sort</th>
				<th>title</th>
				<shiro:hasPermission name="statuses:banner:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="banner">
			<tr>
				<td><a href="${ctx}/statuses/banner/form?id=${banner.id}">
					${banner.href}
				</a></td>
				<td>
					${banner.image}
				</td>
				<td>
					${banner.sort}
				</td>
				<td>
					${banner.title}
				</td>
				<shiro:hasPermission name="statuses:banner:edit"><td>
    				<a href="${ctx}/statuses/banner/form?id=${banner.id}">修改</a>
					<a href="${ctx}/statuses/banner/delete?id=${banner.id}" onclick="return confirmx('确认要删除该首页条幅吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>