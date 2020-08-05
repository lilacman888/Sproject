<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/js/jQuery.form.min.js"></script>
<title>Upload Test</title>
</head>
<body>
	<form action="uploadForm" id="form1" method="post" enctype="multipart/form-data">
		<input type="file" name="file" /> <input type="submit" />
	</form>
	SavedFileName : ${savedFileName}
	<hr />
	<form action="uploadForm" id="form2" method="post" enctype="multipart/form-data" target="ifr">
		<input type="hidden" name="type" value="ifr"> 
		<input type="file" name="file" /> <input type="submit" value="iframe으로 제출" />
	</form>
	IFR-SavedFileName :
	<span id="upfile"></span>
	<br> 
	Type : <span id="type"></span>
	<iframe frameborder="0" width="0" height="0" name="ifr"></iframe>
		<hr />
		<div class="fileDrop">Drop Hear!!</div>
		<div class="uploadedList"></div>
		<form action="uploadForm" id="form3" method="post" enctype="multipart/form-data">
			<input type="hidden" name="type" value="ajax"> 
			<input type="file" name="file" /> <input type="submit" value="ajax으로 제출" />
		</form>
		<div id="percent">0 %</div>
		<div id="status">ready</div>
		AJAX-SavedFileName : <span id="jax_upfile"></span>
		<hr />
	
	<script type="text/javascript">
		console.log("00000");
		window.setUploadedFile = (filename) => {
			document.getElementById('upfile').innerHTML = filename;
			document.getElementById('form2').reset();
		};
		
		const $fileDrop = $('div.fileDrop'),
			  $uploadedList = $('div.uploadedList');
		$fileDrop.on('dragover dragenter', (evt) => {
			evt.preventDefault();
		});
		$fileDrop.on('drop', (evt) => {
			evt.preventDefault();
			console.log("drop>>", evt.originalEvent.dataTransfer.files);
		});
		const percent = $('#percent'),
			  	status = $('#status');
		$('#form3').ajaxForm({
			beforeSend: function(){
				status.empty();
				var percentVal;
				percent.html('0%');
			},
			uploadProgress : function(event, position, total, percentComplete){
				status.html('uploading....');
				var percentVal = percentComplete + '%';
				bar.width(percentVal);
				percent.html(percentVal);
			},
			complete : function(xhr){
				status.html(xhr.responseText);
			}
		});
	</script>
	<c:if test="${type eq 'ifr'}">
		<script type="text/javascript">
			console.log("-----------ifr script");
			parent.setUploadedFile('${savedFileName}');
		</script>
	</c:if>
</body>
</html>