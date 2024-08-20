<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/hchnd/resources/community/css/edit.css"/>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
	var boardCheck = function(){
		if(document.getElementById("subject").value==""){
			alert("제목을 입력하세요");
			return false;
			
		}
		//값이 있으면 true 없으면 false
		if(document.getElementById("content").value==""){
			alert("글 내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	$(document).ready(function() {
	$('#summernote').summernote({
	  placeholder: '내용을 입력해주세요.',
	  tabsize: 2,
	  height: 400
	});});
	
	//카테고리번호
	document.getElementById('categorySelect').addEventListener('change', function() {
	var selectedOption = this.value;
	var hiddenCategoryInput = document.getElementById('hiddenCategory');
	hiddenCategoryInput.value = selectedOption;
	});
	</script>
<main>
	<h1>글 수정 하기</h1>
	
	<form method="post" action="${pageContext.servletContext.contextPath }/community/editOk" onsubmit="return boardCheck()">
		<input type="hidden" name="no" value="${vo.no }"/>
		<div class="editer-main">
		<div class="editer-edit">
			<li id="top_2"><b>글쓰기</b></li>
		</div>
		<div class="editerWritingTitle">			
			<div class="editer-row">
				<div class="editer-columnTitle">
					<div class="editer-formSelectButton">
						<select class="button" id="categorySelect" name="category">
							<option value="N1">자유 게시판</option>
							<option value="N2">유머 게시판</option>
							<option value="N3">팁 게시판</option>
						</select>
						
					</div>
					<div class="editer-selectOption" style="display: none;">
						<ul class="option-list">
							<li aria-selected="false" class="item">
								<button type="button" class="option">
									<span class="option-text">자유 게시판</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="editer-columnCategory">
					<div class="editer-formSelectButton">
						<select class="button">
							<option value="1">말머리 선택</option>
							<option value="2">기타</option>
						</select>
					</div>
				</div>
				<li id="button" style="list-style:none;">
					<input type="submit" id="writebutton" type="button" style="width: 90px; height: 40px;" value="글수정">			
				</li>
			</div>			
			<div class="row">
				<div class="editer-fixableTextArea">
					<textarea name="subject" placeholder="제목을 입력해 주세요." class="textarea-input" style="height: 40px;">${vo.subject}</textarea>
					<textarea id="summernote" name="content">${vo.content}</textarea>
				</div>
			</div>
		</div>			 
		</div>
		
	</form>
</main>	