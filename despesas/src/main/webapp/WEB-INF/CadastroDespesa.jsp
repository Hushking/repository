<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<head>
	<meta charset="UTF-8"/>
	<title>Cadastro de Despesa</title>
	<link rel="stylesheet" type="text/css" href="${context}/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${context}/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${context}/css/bootstrap-datepicker.standalone.min.css"/>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-static-top"></nav>

	<spring:form class="form-horizontal" method="post" action="${context}/despesas" modelAttribute="despesa">
		<c:if test="${!empty mensagem}">
			<div class="alert alert-success">
				<span>${mensagem}</span>
			</div>
		</c:if>
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="clearfix">
					<h1 class="panel-title impacta-titulo-panel">Nova Despesa</h1>
					<a class="btn btn-link impacta-link-panel" href="${context}/despesas">Listagem de Despesa</a>
				</div>
			</div>
		</div>
			<div class="panel-body">

				<div class="form-group">
				<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
					<label for="descricao" class="col-sm-2 control-label">Descrição</label>
					<div class="col-sm-2">
						<spring:input type="text" class="form-control" id="descricao" name="descricao" path="descricao"/>
						<spring:errors path="descricao" cssClass="error"/>
					</div>
				</div>

				<div class="form-group">
				<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					<label for="categoria" class="col-sm-2 control-label">Categoria</label>
					<div class="col-sm-2">
						<select class="form-control" name="categoria">
							<c:forEach items="${todasCategorias}" var="categoria">
								<option value="${categoria}">${categoria.nome}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="form-group">
				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
			<label for="data" class="col-sm-2 control-label">Data</label>
			<div class="col-sm-2">
				<!-- Coloca o calendário -->
				<spring:input type="text" class="form-control" id="data" name="data" path="data"
						  data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-language="pt-BR"   
						  data-date-autoclose="true" data-date-todayHighlight="true" data-date-orientation="bottom"/>
				<spring:errors path="data" cssClass="error"/>
			</div>
		</div>

				<div class="form-group">
				<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
					<label for="valor" class="col-sm-2 control-label">Valor</label>
					<div class="col-sm-2">
						<spring:input type="text" class="form-control javascript-moeda " id="valor" name="valor" path="valor"/>
						<spring:errors path="valor" cssClass="error"/>
					</div>
				</div>

				<div class="form-group">
				<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
					<label for="observacoes" class="col-sm-2 control-label">Observações</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="observacoes" name="observacoes"/>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Salvar</button>
					</div>
				</div>
			</div>
		
	</spring:form>
	<script src="${context}/js/jquery-3.2.0.min.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
	<script src="${context}/js/bootstrap-datepicker.min.js"></script>
	<script src="${context}/js/bootstrap-datepicker.pt-BR.min.js"></script>
	<script src="${context}/js/despesa.js"></script>
	<script src="${context}/js/jquery.maskMoney.min.js"></script>
</body>
</html>