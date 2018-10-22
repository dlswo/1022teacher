<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Modify/Delete</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify/Delete</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/modify" method="post">

					<input type='hidden' name='bno' value='${board.bno}'> <input
						type='hidden' name='page' id='page' value='${pageObj.page}'>
					<input type='hidden' name='type' value='${pageObj.type}'> <input
						type='hidden' name='keyword' value='${pageObj.keyword}'>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${board.title}"/>'>
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer}"/>'>
						<p class="help-block">Example block-level help text here.</p>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" name='content' rows="3"><c:out
								value="${board.content}" /></textarea>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default goModify">Modify</button>
						<button type="submit" class="btn btn-default goList">Go
							List</button>
						<button type="submit" class="btn btn-danger goRemove">Remove</button>
					</div>
				</form>

				<form id='actionForm'>
					<input type='hidden' name='page' id='page' value='${pageObj.page}'>
					<input type='hidden' name='type' value='${pageObj.type}'> <input
						type='hidden' name='keyword' value='${pageObj.keyword}'>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->



</div>
<!-- /.row -->



<%@include file="../includes/footer.jsp"%>

<script>
	$(document)
			.ready(
					function() {

						var actionForm = $("#actionForm");
						var bno = '<c:out value="${board.bno}"/>';

						$(".goList").on(
								"click",
								function(e) {
									e.preventDefault();
									actionForm.attr("action", "/board/list")
											.attr("method", "get").submit();
								});

						$(".goRemove")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"+bno+"'>");
											actionForm.attr("action",
													"/board/remove").attr(
													"method", "post").submit();
										});

					});
</script>

</body>

</html>







