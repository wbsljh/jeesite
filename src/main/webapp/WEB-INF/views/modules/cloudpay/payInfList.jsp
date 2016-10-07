<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>支付订单管理</title>
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
		<li class="active"><a href="${ctx}/cloudpay/payInf/">支付订单列表</a></li>
		<shiro:hasPermission name="cloudpay:payInf:edit"><li><a href="${ctx}/cloudpay/payInf/form">支付订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="payInf" action="${ctx}/cloudpay/payInf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>支付订单号：</label>
				<form:input path="payOrdNo" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商户ID：</label>
				<form:input path="custId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>订单状态：</label>
				<form:select path="payStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_pay_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>支付方式：</label>
				<form:select path="payType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_pay_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>支付日期：</label>
				<input name="beginPayDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${payInf.beginPayDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endPayDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${payInf.endPayDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>流水号：</label>
				<form:input path="serialNo" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>提现状态：</label>
				<form:select path="casStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dict_cas_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>支付订单号</th>
				<th>商户ID</th>
				<th>订单状态</th>
				<th>支付方式</th>
				<th>订单金额</th>
				<th>费率</th>
				<th>费率类型</th>
				<th>手续费</th>
				<th>实际金额</th>
				<th>发卡行名称</th>
				<th>卡名称</th>
				<th>支付日期</th>
				<th>流水号</th>
				<th>提现状态</th>
				<shiro:hasPermission name="cloudpay:payInf:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="payInf">
			<tr>
				<td><a href="${ctx}/cloudpay/payInf/form?id=${payInf.id}">
					${payInf.payOrdNo}
				</a></td>
				<td>
					${payInf.custId}
				</td>
				<td>
					${fns:getDictLabel(payInf.payStatus, 'dict_pay_status', '')}
				</td>
				<td>
					${fns:getDictLabel(payInf.payType, 'dict_pay_type', '')}
				</td>
				<td>
					${payInf.txAmt}
				</td>
				<td>
					${payInf.rate}
				</td>
				<td>
					${payInf.rateType}
				</td>
				<td>
					${payInf.fee}
				</td>
				<td>
					${payInf.netrecamt}
				</td>
				<td>
					${payInf.issnam}
				</td>
				<td>
					${payInf.crdnam}
				</td>
				<td>
					<fmt:formatDate value="${payInf.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${payInf.serialNo}
				</td>
				<td>
					${fns:getDictLabel(payInf.casStatus, 'dict_cas_status', '')}
				</td>
				<shiro:hasPermission name="cloudpay:payInf:edit"><td>
    				<a href="${ctx}/cloudpay/payInf/form?id=${payInf.id}">修改</a>
					<a href="${ctx}/cloudpay/payInf/delete?id=${payInf.id}" onclick="return confirmx('确认要删除该支付订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>