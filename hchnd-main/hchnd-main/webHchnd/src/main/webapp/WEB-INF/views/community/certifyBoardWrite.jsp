<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/community/css/certifyBaordWriteStyle.css" type="text/css"/>
	<script src="<%=request.getContextPath()%>/resources/main/account.js"></script>
	<script>
		function imgUpLoad(){
			let imgUpload = document.getElementById("upload");
			let imgPreview = document.getElementById("preview");

			let file = imgUpload.files[0];
			if(file){
				let reader = new FileReader();
				reader.onload = function (e){
					imgPreview.src = e.target.result;
				};
				reader.readAsDataURL(file);
			} else {
				imgPreview.src="";
			}
		}

		let height;
		$(window).on('load', function(){
			ClassicEditor
				.create(document.querySelector('#content'))
				.then(editor => {
					// 에디터 인스턴스를 사용하여 에디터 내용의 높이를 설정
					editor.ui.view.editable.style.height = height + 'px';
				})
				.catch(error => {console.error( error );});

		});

		$(document).ready(function () {
			height = $('#lside').innerHeight() - 138;
			$('.ck-editor__editable').css('height',height);
		});
		$(function () {
			$(document).click(function () {
				height = $('#lside').innerHeight()-138;
				$('.ck-editor__editable').css('height',height);
			});
			$(window).resize(function(){
				height = $('#lside').innerHeight()-138;
				$('.ck-editor__editable').css('height',height);
			});
		})
	</script>
</head>
<section id="container" onclick="hideAccount('${logStatus}')">
	<header id="MainHeader">
		<h2>인증 게시판</h2>
		<span></span>
	</header>
	<article id="mainArticle">
		<form method="post" action="<%=request.getContextPath()%>/community/certifyOk"
			  id="writeForm" enctype="multipart/form-data">
			<label id="lside">
				<h3>인증 사진</h3>
				<img src="" alt="" id="preview">
				<!--<input type="hidden" name="profileImgName" value="">-->
				<input type="file" name="certifyImg" id="upload" hidden
					   accept="image/jpeg, image/png" onchange="imgUpLoad()" required>
				<div>
					사진을 변경하려면 클릭하세요
				</div>
			</label>

			<div id="rside">
				<div id="rTopSide">
					<select name="category" id="categorySelect">
						<option value="C1">몸짱 인증</option>
						
					</select>
					<input type="submit" value="글쓰기">
				</div>
				<input type="text" name="subject" placeholder ="글 제목을 입력해주세요">
				<textarea name="content" id="content"></textarea>
			</div>
		</form>
	</article>
</section>

