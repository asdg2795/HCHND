<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    function boardDel() {
        if(confirm("글을 정말로 삭제하시겠습니까?")){
            location.href = "<%=request.getContextPath()%>/community/delete?no=${vo.no}"
        }
    }

    // ajax를 이용한 댓글 등록, 수정, 삭제, 목록
    $(function(){
        // 목록
        function replyList(){
            $.ajax({
                url:"<%=request.getContextPath()%>/boardReply/list",
                data: {articleno : ${vo.no}},
                type: "GET",
                success : function (result) {
                    console.log(result);
                    var tag = ""; // 댓글 목록 태그 + 수정 삭제
                    $(result).each(function(i, rVO){
                        tag += "<li><div><b>"+ rVO.uid +"</b>(" + rVO.writedate +")";
                        if('${logId}' === rVO.uid){
                            // 변수로 취급해서 ''처리 해주어서 String 데이터로 만들어 주어야 함
                            
                            // 댓글 내용
                            tag += "<p class='reply'>"+rVO.comment+"</p></div>";

                            // 수정폼 -> 댓글 번호 ,댓글 내용이 적혀 잇음
                            tag += "<div style='display: none'><form method='post'>";
                            tag += "<input type='hidden' name='no' value='"+ rVO.articleno +"'>";
                            tag += "<input type='hidden' name='replyno' value='" + rVO.replyno + "'>"
                            tag += "<textarea name='comment' style='width: 400px;height: 80px'> " + rVO.comment + " </textarea>";
                            tag += "<input type='submit' value='댓글수정하기'>"
                            tag += "</div></form>";

                        } else {
                            tag += "<p>"+rVO.comment+"</p></div>";
                        }
                        tag += "</li>"
                    });
                    // document.getElementById("replyList").innerHTML = tag;
                    $("#replyList").html(tag);
                },error : function (e) {
                    console.log(e.responseText);
                }

            });
        }
        // 등록
        $("#replyForm").submit(function(){
            //form태그의 action을 중지한다.
            event.preventDefault();

            //comment 입력 확인
            if($("#comment").val() == ""){
                alert("댓글을 입력후 등록하세요");
                return false;
            }
            // form의 데이터를 query로 만들기
            var param = $(this).serialize();// 쿼리로 만들어줌
                   // = "no=" + $("#no").val() + "&comment=" + $("#comment").val();         
			$.ajax({
                url : "<%=request.getContextPath()%>/boardReply/write",
                data:param,
                type:"POST",
                success:function(result){
                    console.log(result);
                    if(result == 0){
                        alert("댓글 작성이 실패하였습니다");
                    } else {
                        replyList();
                    }
                    $("#comment").val("");
                }, error:function(e){
                    console.log(e.responseText);
                }
            });
        });
        // 수정
        $(document).on('click', '#replyList input[value=Edit]', function () {
            $(this).parent().css('display', 'none');// 부모 숨기기 : 댓글 내용
            $(this).parent().next().css('display', 'block');
        });
        $(document).on('submit', '#replyList form', function () {
            event.preventDefault();
            var params = $(this).serialize();
            $.ajax({
                url : "<%=request.getContextPath()%>/boardReply/editOk",
                data:params,
                type:"POST",
                success:function(result){
                    if(result == 0){
                        alert("댓글 수정이 실패하였습니다.");
                    } else {
                        replyList();
                    }
                    console.log(result);
                }, error:function(e){
                    console.log(e.responseText);
                }
            });
        });
        // 삭제
             $(document).on('click','#replyList input[value=Del]',function(){
            if(confirm("삭제하시겠습니까?")){
               //삭제할 레코드 번호
               var replyno = $(this).attr("title");
               
               $.ajax({
                 url : "${pageContext.servletContext.contextPath}/boardReply/delete",
                 data : {
                    replyno:replayno
                 },
                 type:"GET",
                 success:function(result){
                    replyList(); //댓글목록 다시 뿌리기
                 },error:function(e){
                    console.log(e.responseText);
                 }
                 
               });
            }
        });


        /*목록 함수 호출*/
        replyList();
    })
</script>
<!-- <link rel="stylesheet" href="/hchnd/resources/community/css/commustyle.css" type="text/css"/> -->
<link rel="stylesheet" href="/hchnd/resources/community/css/post.css" type="text/css"/>
<!--배너 관련 코드-->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- Banner -->
<div id="banner">
	<!--<b>NOTHING WILL WORK UNLESS<br/>YOU DO.</b>-->
    
    	<div class="main_visual">
        	<center>
            	<div class="fotorama" data-nav="false" data-width="800" data-height="200" data-max-width="100%" data-click='false' data-swipe='false'
            data-loop="true" data-autoplay="12000" data-stopautoplayontouch="false">
            		<div data-img="/hchnd/resources/community/img/AA.jpg"><a href="/" class="item" ></a></div>
                	<div data-img="/hchnd/resources/community/img/myproteinGYM.png"><a href="/" class="item" ></a></div>
                 </div>
            </center> 
        </div>
    
</div>   

<section id=container>
<main>
	<div class="left-content">
		<div>
			<li id="top"><b>커뮤니티</b></li> 
			<div id="rside">
				 <div id="viewInfo">
	                    <div id="pimgsize">
	                        <img src="<%=request.getContextPath()%>/img/userProfile/${writer.profileImgName}">
	                    </div>
	                    <div id="writerInfo">
	                        <span>작성자 : ${writer.nickname}</span>
	                        <div>
	                            <span>${vo.writedate}</span> |
	                            <span>👀 : ${vo.hit}</span> |
	                        </div>
	                    </div>	
	              </div>      
					<li class="title">${vo.subject}</li>
					<div class="content">${vo.content }</div>		
				
			</div>
			
			<div class = "contentedit">
				<a href="/hchnd/community/list?nowpage=${pVO.nowPage}<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey}&searcWord=${pVO.searchWord }</c:if>">목록</a>
				<!-- 현재 글 작성자와 로그인 아이디가 같을 때만 가능 -->
				<c:if test="${vo.uid==logId }">
				<a href="/hchnd/community/edit?no=${vo.no}">수정</a>
				<a href="javascript:boardDel()">삭제</a>
				</c:if>
			</div>
		</div>
		<div class="buttonposition">
       		<div class="post-box">      			
       			<!-- 로그인 상태일 때 댓글쓰기 -->
				<c:if test="${logStatus=='Y' }">
					<form id="replyForm">
						<input type="hidden" name="articleno" value="${vo.no}">
		           		<textarea name="comment" id="comment" rows="8" cols="110" placeholder="댓글을 입력해주세요."></textarea>
		           		<button class="comment-button"><b>댓글<br>등록</b></button>
		           		
	           		</form>
	           	</c:if>
	           		
	           	<!-- 댓글목록 -->				
				<ul id="replyList" style="padding-left:0px;">
					<li>
						<div>
							<b>dorothy922</b>(2023-10-10 12:12:23)
							
							<p>댓글 공부중...</p>							
						</div>	
					</li>
				</ul>
        	</div>       		      		
    	</div>
	</div>
	
	<div class="right-content">
		            <li id="hot"><b>최신 글 +</b></li><hr>
		            <c:forEach var="bVO" items="${list}" end="6">				
		                 <a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}"> 
		                 <li style="margin-bottom:10px;">${bVO.subject}</li>               
		             	 </a>                       
                	</c:forEach>
		            <hr><br/>
		            <br/>
		            <li><b>몸짱 인증 +</b></li>
		            <!--<button id="gotoday">+</button><br/>-->
		            <hr>
		            <c:forEach var="bVO" items="${list2}" end="6">				
		                <a herf="/hchnd/community/certifyView?no=${bVO.no}&category=${bVO.category}">	               
		                  	<img style="width:70px; height:70px;" src="<%=request.getContextPath()%>/img/certifyBoard/${bVO.imageName}">	                   
		                </a>                       
                	</c:forEach>
				    <img src="/hchnd/resources/community/img/protein.jpg" style="width: 220px; height: 220px; margin-top:40px;">
		        </div><br/>	 
			
	  	</div>
</main>
</section>