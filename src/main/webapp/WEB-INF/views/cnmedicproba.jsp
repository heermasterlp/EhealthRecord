<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<style type="text/css">
		#description {
			position: relative;
			text-align:left;
			vertical-align:middle;
			border-radius: 0px;
		  	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		  	border-bottom: 1px solid #aaa;
		  	
		  	padding: 40px;
			width: 274px;
			background-color: #F7F7F7;
			margin: 20px auto 10px;
			border-radius: 0px;
			box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			overflow: hidden;
			text-align:center;
		}
		#qdescription {
			
			position: relative;
			background-color:#f5f5f5;
			text-align:left;
			vertical-align:middle;
			height:80%;
			width:100%;
			border-radius: 0px;
		  	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		}
		body {
		margin:0;
		padding:0;
		font:12px/15px "Helvetica Neue",Arial, Helvetica, sans-serif;
		color: #555;
		border: 1px solid #aaa;
		height:800px;
	}
	table, caption, tbody, tfoot, thead, tr, th, td {
		margin:0;
		padding:0;
		border:0;
		outline:0;
		font-size:100%;
		vertical-align:baseline;
		background:transparent;
	}
	
	</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div >
		<div id="description">
			<form action="medicineProba" method="get">
				<p>
	    				年度：
	    				<select name="batch">  
        					<c:forEach items="${batchList }" var="item">  
            					<option value="${item }" <c:if test="${item == '2012'}">selected</c:if>>${item == 'null'? '全部' : item }</option>  
        					</c:forEach>  
    					</select>  
	    		</p>
	    		<br>
			 	请输入中药：（空格分隔）
			 	<br>
			 	
			 	<input type="text" name="medicines" />
			 	<input type="submit" class="btn btn-success btn-xs" value="查询" />	
			</form>
			<hr>
			<p>
				<div>
					<h3>输入中药：</h3> ${medicines }
				</div>
			</p>
		</div>
	</div>
	<div>
		<table class="table table-striped " border="0px">
			<c:if test="${results.size() == 1 }">
				<c:if test="${medicines.trim().contains(' ') }">
					<thead>
						<tr class="info">
							<th>序号</th>
							<th>名称</th>
							<th>并集数量</th>
							<th>并集百分百</th>
							<th>交集数量</th>
							<th>交集百分百</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${results}" varStatus="status">
								<c:if test="${item.value.size() > 2 }">
								<tr>
									<td>${status.index + 1 }</td>
									<td> ${item.key.replace("|",",") }</td>
									<td>${item.value.get(0) }</td>
									<td>
										<fmt:formatNumber type="percent" maxFractionDigits="3" value="${item.value.get(1) }"	/>
									</td>
									<td>${item.value.get(2) }</td>
									<td>
										<fmt:formatNumber type="percent" maxFractionDigits="3" value="${item.value.get(3) }"	/>
									</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
				</c:if>
				<c:if test="${!medicines.trim().contains(' ') }">
					<thead>
						<tr class="info">
							<th>序号</th>
							<th>名称</th>
							<th>数量</th>
							<th>百分比</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${results}" varStatus="status">
						<tr>
							<td>${status.index + 1 }</td>
							<td>${item.key }</td>
							<td>${item.value.get(0) }</td>
							<td>
								<fmt:formatNumber type="percent" maxFractionDigits="3" value="${item.value.get(1) }"	/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
					
				</c:if>
			</c:if>
			<c:if test="${results.size() > 1}">
				<thead>
					<tr class="info">
						<th>序号</th>
						<th>名称</th>
						<th>并集数量</th>
						<th>并集百分百</th>
						<th>交集数量</th>
						<th>交集百分百</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${results}" varStatus="status">
						<tr>
							<td>${status.index + 1 }</td>
							<td>${item.key.replace("|",",") }</td>
							<td>${item.value.get(0) }</td>
							<td>
								<fmt:formatNumber type="percent" maxFractionDigits="3" value="${item.value.get(1) }"	/>
							</td>
							<td>${item.value.get(2) }</td>
							<td>
								<fmt:formatNumber type="percent" maxFractionDigits="3" value="${item.value.get(3) }"	/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
			<c:forEach var="item" items="${descriptionlist}" varStatus="status">
				${item }
			</c:forEach>
		</div>
</body>
</html>