<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业资讯分类管理</title>
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
		<li class="active"><a href="${ctx}/statuses/jhiStatuses/">行业资讯分类列表</a></li>
		<shiro:hasPermission name="statuses:jhiStatuses:edit"><li><a href="${ctx}/statuses/jhiStatuses/form">行业资讯分类添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jhiStatuses" action="${ctx}/statuses/jhiStatuses/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>来源：</label>
				<form:input path="source" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			
			<li><label>归属栏目：</label>
				<sys:treeselect id="category" name="category.id" value="${jhiStatuses.category.id}" labelName="category.name" labelValue="${jhiStatuses.category.name}"
					title="栏目" url="/statuses/jhiStatuses/treeData" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required"/>&nbsp;
			</li>
			<li><label>是否头条：</label>
				<form:select path="isHead" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>创建时间</th>
				<th>来源</th>
				<th>类型</th>
				<th>资讯分类</th>
				<!-- <th>发布人</th> -->
				<th>是否头条</th>
				<th>摘要</th>
				<th>置顶</th>
				<th>点赞数</th>
				<th>评论数</th>
				<shiro:hasPermission name="statuses:jhiStatuses:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jhiStatuses">
			<tr>
				<td>
					${jhiStatuses.title}
				</td>
				<td>
					<fmt:formatDate value="${jhiStatuses.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${jhiStatuses.source}
				</td>
				<td>
					${jhiStatuses.type}
				</td>
				<td>
					${fns:getDictLabel(jhiStatuses.categoryId, '', '')}
				</td>
				<%-- <td>
					${jhiStatuses.profileId}
				</td> --%>
				<td>
					${fns:getDictLabel(jhiStatuses.isHead, 'yes_no', '')}
				</td>
				<td>
					${jhiStatuses.summary}
				</td>
				<td>
					${fns:getDictLabel(jhiStatuses.top, 'yes_no', '')}
				</td>
				<td><a href="${ctx}/statuses/jhiStatuses/form?id=${jhiStatuses.id}">
					${jhiStatuses.attitudesCount}
				</a></td>
				<td>
					${jhiStatuses.commentsCount}
				</td>
				<shiro:hasPermission name="statuses:jhiStatuses:edit"><td>
    				<a href="${ctx}/statuses/jhiStatuses/form?id=${jhiStatuses.id}">修改</a>
					<a href="${ctx}/statuses/jhiStatuses/delete?id=${jhiStatuses.id}" onclick="return confirmx('确认要删除该行业资讯分类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>