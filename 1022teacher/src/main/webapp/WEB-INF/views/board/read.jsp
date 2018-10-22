<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" name='content' rows="3"><c:out value="${board.content}"/></textarea>
					</div>

					<button  class="btn btn-default goList">Go List</button>
					
					<button  class="btn btn-default goModify">Modify</button>
					

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->



</div>
<!-- /.row -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<form id='actionForm'>
  <input type='hidden' name='page' id='page' value='${pageObj.page}'>
  <input type='hidden' name='type' value='${pageObj.type}'>
  <input type='hidden' name='keyword' value='${pageObj.keyword}'>
</form>

<%@include file="../includes/footer.jsp"%>

<script>
$(document).ready(function(){
	
	var msg = $("#myModal");
	var result = '<c:out value="${result }"/>';
	
	var bno = '<c:out value="${board.bno}"/>';
	
	if (result === 'SUCCESS') {
		$(".modal-body").html("작업 성공");
		msg.modal("show");
	}
	
	var actionForm = $("#actionForm");
	
	$(".goList").on("click", function(e){
		
		actionForm.attr("action","/board/list").attr("method","get").submit();
		
		
	});
	
	$(".goModify").on("click", function(e){
		
		actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");
		actionForm.attr("action","/board/modify").attr("method","get").submit();
		
		
	});	
	
});
</script>
</body>

</html>







