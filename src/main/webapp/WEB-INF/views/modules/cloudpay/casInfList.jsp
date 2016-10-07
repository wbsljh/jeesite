<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提现订单管理</title>
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
		<li class="active"><a href="${ctx}/cloudpay/casInf/">提现订单列表</a></li>
		<shiro:hasPermission name="cloudpay:casInf:edit"><li><a href="${ctx}/cloudpay/casInf/form">提现订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="casInf" action="${ctx}/cloudpay/casInf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>提现订单号：</label>
				<form:input path="casOrdNo" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>对应商品订单号：</label>
				<form:input path="payOrdNo" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>所属商户编号：</label>
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>提现商户户名：</label>
				<form:input path="custName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>提现订单号</th>
				<th>对应商品订单号</th>
				<th>提现类型</th>
				<th>订单创建时间</th>
				<th>订单状态</th>
				<th>货币类型</th>
				<th>所属商户编号</th>
				<th>提现商户户名</th>
				<th>订单金额</th>
				<th>费率</th>
				<th>手续费</th>
				<th>服务费</th>
				<th>实际到账金额</th>
				<th>发卡行代码</th>
				<th>发卡行名称</th>
				<th>提现银行卡号</th>
				<th>提现审核状态</th>
				<th>审核人</th>
				<th>审核时间</th>
				<shiro:hasPermission name="cloudpay:casInf:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="casInf">
			<tr>
				<td><a href="${ctx}/cloudpay/casInf/form?id=${casInf.id}">
					${casInf.casOrdNo}
				</a></td>
				<td>
					${casInf.payOrdNo}
				</td>
				<td>
					${fns:getDictLabel(casInf.casType, 'dict_cas_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${casInf.casDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(casInf.ordStatus, 'ord_status', '')}
				</td>
				<td>
					${casInf.txCcy}
				</td>
				<td>
					${casInf.custId}
				</td>
				<td>
					${casInf.custName}
				</td>
				<td>
					${casInf.txAmt}
				</td>
				<td>
					${casInf.rate}
				</td>
				<td>
					${casInf.fee}
				</td>
				<td>
					${casInf.serviceFee}
				</td>
				<td>
					${casInf.netrecamt}
				</td>
				<td>
					${casInf.issno}
				</td>
				<td>
					${casInf.issnam}
				</td>
				<td>
					${casInf.cardNo}
				</td>
				<td>
					${fns:getDictLabel(casInf.auditStatus, 'dict_audit_status', '')}
				</td>
				<td>
					${casInf.auditor.name}
				</td>
				<td>
					<fmt:formatDate value="${casInf.auditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cloudpay:casInf:edit"><td>
    				<a href="${ctx}/cloudpay/casInf/form?id=${casInf.id}">修改</a>
					<a href="${ctx}/cloudpay/casInf/delete?id=${casInf.id}" onclick="return confirmx('确认要删除该提现订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>