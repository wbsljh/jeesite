<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户结算信息管理</title>
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
		<li class="active"><a href="${ctx}/cloudpay/merchantBankInf/">商户结算信息列表</a></li>
		<shiro:hasPermission name="cloudpay:merchantBankInf:edit"><li><a href="${ctx}/cloudpay/merchantBankInf/form">商户结算信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="merchantBankInf" action="${ctx}/cloudpay/merchantBankInf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商户编号：</label>
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>绑定时间：</label>
				<input name="beginBindingTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${merchantBankInf.beginBindingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endBindingTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${merchantBankInf.endBindingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th>发卡行代码</th>
				<th>发卡行名称</th>
				<th>开户省份</th>
				<th>开户城市</th>
				<th>联行号</th>
				<th>卡种</th>
				<th>卡片状态</th>
				<th>银行卡号</th>
				<th>银行预留手机号</th>
				<th>绑定时间</th>
				<th>解绑时间</th>
				<shiro:hasPermission name="cloudpay:merchantBankInf:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="merchantBankInf">
			<tr>
				<td><a href="${ctx}/cloudpay/merchantBankInf/form?id=${merchantBankInf.id}">
					${merchantBankInf.custId}
				</a></td>
				<td>
					${merchantBankInf.issno}
				</td>
				<td>
					${merchantBankInf.issnam}
				</td>
				<td>
					${merchantBankInf.province.name}
				</td>
				<td>
					${merchantBankInf.city.name}
				</td>
				<td>
					${merchantBankInf.cnapsCode}
				</td>
				<td>
					${fns:getDictLabel(merchantBankInf.cardType, 'dict_card_type', '')}
				</td>
				<td>
					${fns:getDictLabel(merchantBankInf.cardState, 'dict_card_state', '')}
				</td>
				<td>
					${merchantBankInf.cardNo}
				</td>
				<td>
					${merchantBankInf.mobileNo}
				</td>
				<td>
					<fmt:formatDate value="${merchantBankInf.bindingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${merchantBankInf.unbundlingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cloudpay:merchantBankInf:edit"><td>
    				<a href="${ctx}/cloudpay/merchantBankInf/form?id=${merchantBankInf.id}">修改</a>
					<a href="${ctx}/cloudpay/merchantBankInf/delete?id=${merchantBankInf.id}" onclick="return confirmx('确认要删除该商户结算信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>