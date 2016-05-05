<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻线索管理</title>
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
		<li class="active"><a href="${ctx}/statuses/newsClue/">新闻线索列表</a></li>
		<shiro:hasPermission name="statuses:newsClue:edit"><li><a href="${ctx}/statuses/newsClue/form">新闻线索添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="newsClue" action="${ctx}/statuses/newsClue/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>title：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>content</th>
				<th>tel</th>
				<th>title</th>
				<shiro:hasPermission name="statuses:newsClue:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="newsClue">
			<tr>
				<td><a href="${ctx}/statuses/newsClue/form?id=${newsClue.id}">
					${newsClue.content}
				</a></td>
				<td>
					${newsClue.tel}
				</td>
				<td>
					${newsClue.title}
				</td>
				<shiro:hasPermission name="statuses:newsClue:edit"><td>
    				<a href="${ctx}/statuses/newsClue/form?id=${newsClue.id}">修改</a>
					<a href="${ctx}/statuses/newsClue/delete?id=${newsClue.id}" onclick="return confirmx('确认要删除该新闻线索吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>