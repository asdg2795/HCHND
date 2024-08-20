<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
/*
   #boardTop>div{
      float:left; width:50%;
   }
   #boardTop{
   	height:50px;
   }
   #boardTop>div:last-of-type{
      text-align:right;
   }
   #boardList{
   	overflow:auto;
   }
   
   #boardList>li{
      float:left; height:40px; line-height:40px; border-bottom:1px solid #ddd; width:10%;
   }
   #boardList>li:nth-child(5n+2){
      width:60%;
      /*말줄임하기, 줄 바꾸지 않기*/
   	  white-space:nowrap;
   	  overflow:hidden;/*넘친데이터 숨기기*/
   	  text-overflow:ellipsis; /*넘친데이터 ...로 표시하기*/
   }
   .page{height:40px;}
   .page li{
      float:left; height:40px; line-height:40px; padding:10px;
   }
   
   .search{
      text-align:center;
   }
   
   */
   
</style>
<link rel="stylesheet" href="/hchnd/resources/community/css/commustyle.css" type="text/css"/>
<link rel="stylesheet" href="/hchnd/resources/community/css/commustyle2.css" type="text/css"/>
<!-- <link rel="stylesheet" href="/hchnd/resources/community/css/headerStyle.css" type="text/css"/> -->

<!--배너 관련 코드-->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script>
	//현재 활성화된 탭의 ID를 저장할 변수
	var activeTab = "Community";
	// 네비게이션 바 활성화
	function activateNav() {
	    var sidenav = document.querySelector('.sidenav');
	    sidenav.classList.add('active');
	}
	
	// 네비게이션 바 비활성화
	function deactivateNav() {
	    var sidenav = document.querySelector('.sidenav');
	    sidenav.classList.remove('active');
	}
	
	// 카테고리 탭 열기
	function openTab(tabName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    document.getElementById(tabName).style.display = "block";
	    document.getElementById(activeTab + "-button").classList.remove("active");
	    document.getElementById(tabName + "-button").classList.add("active");
	    activeTab = tabName;
	}
	 // 초기 카테고리 탭 설정
    window.onload = function(){
    openTab("Community");
    
    }

	//검색
	function searchCheck(){
		if(document.getElementById("searchWord").value==""){
			alert("검색어를 입력 후 검색하세요..");
			return false;
		}
	}
</script>
<section id="container" onclick="acc.hideAccount();" style="margin : 0;">
<!-- Banner -->
   <div id="banner">
      <!--<b>NOTHING WILL WORK UNLESS<br/>YOU DO.</b>-->
      <div id="container">
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
   </div>
<main>
<!-- 좌측 네비게이션 바 -->
	<div class="sidenav" onmouseover="activateNav()" onmouseout="deactivateNav()">
		
	    <!-- 오른쪽 일부분 화면 좌측에 넣기 -->
	    <div class="left-placeholder"></div>
	    
	    <!-- 각각의 카테고리 탭 버튼 생성 -->
	    <button style="font-size: 1.5em; text-align: right; color:white; padding-right:25px;"><b>☰</b></button>
	    <button class="tablinks" id="Community-button" onclick="openTab('Community')" style="font-size: 1.5em;"><b>커뮤니티</b></button>
	    <br/>
	    <button class="tablinks" id="Free-button" onclick="openTab('Free')"><b>자유 게시판</b></button>
	    <hr id="hrstyle">
	    <button class="tablinks" id="Humor-button" onclick="openTab('Humor')"><b>유머 게시판</b></button>
	    <hr id="hrstyle">
	    <button class="tablinks" id="Tip-button" onclick="openTab('Tip')"><b>팁 게시판</b></button>
	    <hr id="hrstyle">
	    <button class="tablinks" id="BodyKing-button" onclick="openTab('BodyKing')"><b>몸짱 인증</b></button>
	</div>
	<article id="content">
		<!-- 커뮤니티 메인 -->
		<div id="Community" class="tabcontent">
				<li id="top"><b>커뮤니티</b></li>   
		        <div class="left-content">    
					         
		            <b id="category">자유 게시판 +</b>
		            <hr style="color: black; background-color: black; height:3px;">     
		            <div class="writelist">
				      <ul id="list">			      	
					      <c:forEach var="bVO" items="${list}">				      	
					      	 <c:if test="${bVO.category == 'N1'}">				      	 
						      	 <li class="line">
								      <div>
								     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
								      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
								     </div>
								     <div>
								     	 <span style="font-size:14px;">${bVO.uid }</span>	     
								     	 <span style="font-size:14px;">${bVO.uid }</span>
								     </div>
							      </li>
							  </c:if>
					       </c:forEach>				     
				      	</ul>
			  		 </div>                 
		            <b id="category">유머 게시판 +</b>
		            <hr style="color: black; background-color: black; height:3px;">
		            <div class="writelist">
				      <ul id="list">			      	
					      <c:forEach var="bVO" items="${list}">				      	
					      	 <c:if test="${bVO.category == 'N2'}">				      	 
						      	 <li class="line">
								      <div>
								     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
								      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
								     </div>
								     <div>
								     	 <span style="font-size:14px;">${bVO.uid }</span>	     
								     	 <span style="font-size:14px;">${bVO.writedate }</span>
								     </div>
							      </li>
							  </c:if>
					       </c:forEach>				     
				      	</ul>
			   		</div>  
		            <b id="category">팁 게시판 +</b>
		            <hr style="color: black; background-color: black; height:3px;">
		            <div class="writelist">
				      <ul id="list">			      	
					      <c:forEach var="bVO" items="${list}">				      	
					      	 <c:if test="${bVO.category == 'N3'}">				      	 
						      	 <li class="line">
								      <div>
								     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
								      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
								     </div>
								     <div>
								     	 <span style="font-size:14px;">${bVO.uid }</span>	     
								     	 <span style="font-size:14px;">${bVO.writedate }</span>
								     </div>
							      </li>
							  </c:if>
					       </c:forEach>				     
				      </ul>
				        
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
		                  	<img style="height:70px; width:70px;"src="<%=request.getContextPath()%>/img/certifyBoard/${bVO.imageName}">	                   
		                </a>                       
                	</c:forEach>
				    <img src="/hchnd/resources/community/img/protein.jpg" style="width: 220px; height: 220px; margin-top:40px;">
		        </div><br/>	        
		    </div>	
	
	<!-- 자유게시판 -->
		<div id="Free" class="tabcontent">
		   <li id="top"><b>자유 게시판</b></li> 
		   <div class="left-content">	   
		   		<c:if test="${logStatus!=''&& logStatus=='Y'}">		 
			    	<button id="writebutton"><a href="/hchnd/community/write" style="text-decoration: none; color: white;">글쓰기</a></button>
			   </c:if>
			    <div class="search-box">
			      <form method="get" action="/hchnd/community/list" onsubmit="return searchCheck()">
			         <!--  
			         <select name="searchKey">
			            <option value="subject">제목</option>
			            <option value="content">글내용</option>
			            <option option="userid">글쓴이</option>
			         </select>
			         -->
			         <input id="search-input" type="text" name="searchWord" id="searchWord"/>
			         <input id="search-button" type="submit" value="검색"/>
			      </form>
		  		 </div>	 
				<hr>		    
			   <div class="writelist">
				      <ul id="list">			      	
					      <c:forEach var="bVO" items="${list}">				      	
					      	 <c:if test="${bVO.category == 'N1'}">				      	 
						      	 <li class="line">
								      <div>
								     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
								      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
								     </div>
								     <div>
								     	 <span style="font-size:14px;">${bVO.uid }</span>	     
								     	 <span style="font-size:14px;">${bVO.writedate }</span>
								     </div>
							      </li>
							  </c:if>
					       </c:forEach>				     
				      </ul>
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
	   <div id="Humor" class="tabcontent">
	   		<li id="top"><b>유머 게시판</b></li> 
	   		<div class="left-content">	   
		   		<c:if test="${logStatus!=''&& logStatus=='Y'}">		 
			    	<button id="writebutton"><a href="/hchnd/community/write" style="text-decoration: none; color: white;">글쓰기</a></button>
			    </c:if>
			    <div class="search-box">
			      <form method="get" action="/hchnd/community/list" onsubmit="return searchCheck()">
			         <input id="search-input" type="text" name="searchWord" id="searchWord"/>
			         <input id="search-button" type="submit" value="검색"/>
			      </form>
		  		 </div>	 
				<hr>
				<div class="writelist">
				      <ul id="list">
				      	
					      <c:forEach var="bVO" items="${list}">
					      	<c:if test="${bVO.category == 'N2'}">
						      	<li class="line">
								      <div>
								     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
								      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
								     </div>
								     <div>
								     	 <span style="font-size:14px;">${bVO.uid }</span>	     
								     	 <span style="font-size:14px;">${bVO.writedate }</span>
								     </div>
							     </li>
							 </c:if>
					       </c:forEach>							     
				      </ul>
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
	  	<div id="Tip" class="tabcontent">
	   		<li id="top"><b>팁 게시판</b></li> 
	   		<div class="left-content">	   
		   		<c:if test="${logStatus!=''&& logStatus=='Y'}">		 
			    	<button id="writebutton"><a href="/hchnd/community/write" style="text-decoration: none; color: white;">글쓰기</a></button>
			    </c:if>
			    <div class="search-box">
			      <form method="get" action="/hchnd/community/list" onsubmit="return searchCheck()">
			         <input id="search-input" type="text" name="searchWord" id="searchWord"/>
			         <input id="search-button" type="submit" value="검색"/>
			      </form>
		  		 </div>	 
				<hr>		
				 <c:forEach var="bVO" items="${list}">
			      	<c:if test="${bVO.category == 'N3'}">
				      	<li class="line">
						      <div>
						     	 <span style="font-size:19px;"><b><a href="/hchnd/community/view?no=${bVO.no}&category=${bVO.category}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchkey='${pVO.searchkey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject }</a></b></span>
						      	 <span style="font-size:14px;">조회수 : ${bVO.hit }</span>
						     </div>
						     <div>
						     	 <span style="font-size:14px;">${bVO.uid }</span>	     
						     	 <span style="font-size:14px;">${bVO.writedate }</span>
						     </div>
					     </li>
					 </c:if>
			       </c:forEach>		    
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
		
	  	<div id="BodyKing" class="tabcontent">
			<li id="top"><b>몸짱인증</b></li> 
	        <div class="left-content">        
		        <c:if test="${logStatus!=''&& logStatus=='Y'}">		 
		    	<button id="writebutton2"><a href="/hchnd/community/certifyBoardWrite" style="text-decoration: none; color: white;">나도 인증하러 가기</a></button>
		    	</c:if>	
		    	<br/>    	
				<hr>
				 <!-- 바둑판 형식 -->
				<div id="ox">   
				<c:forEach var="bVO" items="${list2}">					
		                <a class ="bodyKingLayout" herf="/hchnd/community/certifyView?no=${bVO.no}&category=${bVO.category}">	               
		                  	<img src="<%=request.getContextPath()%>/img/certifyBoard/${bVO.imageName}">				
		                   <br/>	                   
		                   <li>채이스내</li>	                  
		                   <div class="attribute">                   
		                      <li> 👀 ${bVO.hit} </li><li> 👍 n </li>
		                   </div>
		                </a>    

                </c:forEach>	
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
		                  	<img src="<%=request.getContextPath()%>/img/certifyBoard/${bVO.imageName}">	                   
		                </a>                       
                	</c:forEach>
				    <img src="/hchnd/resources/community/img/protein.jpg" style="width: 220px; height: 220px; margin-top:40px;">
		        </div><br/>	 
		</div>	
	</article>
</main>
</section>