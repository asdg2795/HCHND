<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/program/programCompo/programCompo.css">
<main>
<script>

function resetForm() {
// 입력 필드 초기화
document.getElementsByClassName('input')[0].value = '';
document.getElementsByClassName('input')[1].value = '';
document.getElementsByClassName('input')[2].value = '';
document.getElementsByClassName('input')[3].value = '';
document.getElementsByClassName('input')[4].value = '';

// 결과 영역 초기화
document.getElementById('result').innerHTML = '';

}

	
</script>
<body>
<section id="container" onclick="hideAccount('${logStatus}')">
	<!--Contents-->
	<article id="MainSection">
	<h2>${pcvo.prgname}</h2>	
		<div><img src = "/hchnd/resources/program/programDesc/img/${pcvo.prgname}.PNG" style="padding-right:20px;"></div>
		<form id = "content"  action="<%=request.getContextPath() %>/program/programCompo/gen" method="get"><!-- onsubmit="return programCheck()" -->
			<ul id = "side" style="overflow:auto">
				<div style = "font-weight: bold;">
					<li>종목</li>
					<li>기준 횟수(rm)</li>
					<li>수행 가능 중량(kg)</li>
				</div>
							 
				<input type="hidden" name=programNo value="${pcvo.programNo}">
				<input type="hidden" name=prgname value="${pcvo.prgname}">
				<c:forEach var ="pcVO" items="${list }">
					<div>
					<li>${pcVO.exercises }</li>
					<li style="margin-left:60px;">${pcVO.reqReps }</li>
					<li><input type ="number" name="${pcVO.exercises }" min="0" class="input"  style="height:30px; text-align: center;" step = "0.1" required></li>
					</div>
				</c:forEach>
					<div id ="buttons">
						<li><input type = "button" value="Reset" style = " font-size : 20px; width:80px; height : 50px; margin-left:120px; background-color: rgb(52,152,219); color:white; font-weight: bold;"  onclick="resetForm()"></li>
						<li>									
						<input type = "submit" value="Next" style = " font-size : 20px; width:80px; height : 50px; margin-right:100px; background-color: rgb(52,152,219); color : white; font-weight: bold;">
						</li>
							
						<li>
							<label style="font-size:20px; font-weight:bold;">운동 시작일
						    <input type="date" name="startDay" required pattern="\d{4}-\d{2}-\d{2}"/>
						    <span class="validity"></span>
						  	</label>
					  	</li>
				  	</div>
							 
							 
				<div>
					<li style="margin-left:20px;">&nbsp;</li>
					<li style="margin-left:20px;">&nbsp;</li>
					

				</div>	
								
				
				
			</ul>		
		</form>	
	</article>
</section>
</body>
</main>