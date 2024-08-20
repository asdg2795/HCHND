<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/program/programDesc/programDesc.css">
	 <script src="<%=request.getContextPath()%>/resources/main/account.js"></script>
	<script>
		//1번 사진
		$(function(){
			$("#top img").click(function(){
				var programNo = $(this).attr("title");
				var params= "programNo="+programNo;
				
				$.ajax({
					url:'/hchnd/program/programDesc/info',
					data:params,
					type:"GET",
					 success:function(result){
						 $("#dialog").dialog({
							 	title : result.prgname,
								autoOpen : false
								,buttons : {
									START : function(){
										location.href = "/hchnd/program/programCompo/list?programNo="+result.programNo+"&prgname="+result.prgname
									}
								}
								, width : 1000
								, height : 500
								, modal : true
						});
						 
						//
						window.onresize = function(){
							if($("#dialog").dialog("isOpen")){
								$("#dialog").dialog('close');			
								$("#dialog").dialog('open');
							}
						}
						
						 $("#dialog").attr("title", result.prgname);
						 $("#src").attr("src", "<%=request.getContextPath()%>/resources/program/programDesc/img/"+result.prgname+".PNG");
						 $("#dialog p").html(result.prgExpl);
						 $("#dialog").dialog('open');
						 
					 },error:function(e){
						 console.log(e.responseText);
						 
					 }
				});
			});			
			
		})
		
	</script>
	
	<section id="container" onclick="hideAccount('${logStatus}')">
		    <article id="MainSection">
		    	<ul id = "top">
						<!--1행1열-->
						<div id = "dialogOpen1_1" ><img src = "/hchnd/resources/program/programDesc/img/strLift55.PNG" title="1"></div>
						
						<!--1행2열-->
							<div id = "dialogOpen2_2" ><img src = "/hchnd/resources/program/programDesc/img/GVT1010.PNG" title="2"></div>
					
						<!--1행3열-->
						<div id = "dialogOpen1_3" ><img src = "/hchnd/resources/program/programDesc/img/texasMethod.PNG" title="3"></div>
			
				</ul>
				
				<ul id = "middle">
					<!--2행1열-->
						<div id = "dialogOpen2_1" ><img src = "/hchnd/resources/program/programDesc/img/FST_7.jpg"></div>
						
					<!--2행2열-->
						<div id = "dialogOpen1_2" ><img src = "/hchnd/resources/program/programDesc/img/phul.PNG"></div>
					
					
					<!--2행3열-->
						<div id = "dialogOpen2_3" ><img src = "/hchnd/resources/program/programDesc/img/PHAT.jpg"></div>
				</ul>
			
				
				<ul id = "bottom">
					<!--3행1열-->
						<div id = "dialogOpen3_1" ><img src = "/hchnd/resources/program/programDesc/img/nSuns531.jpg" ></div>
					
					<!--3행2열-->
						<div id = "dialogOpen3_2" ><img src = "/hchnd/resources/program/programDesc/img/jimWendler531.PNG" ></div>
					
					<!--3행3열-->
						<div id = "dialogOpen3_3" ><img src = "/hchnd/resources/program/programDesc/img/chrisBumstead.PNG" ></div>
				</ul>
		    </article>
	</section>
	
	<div id="dialog" title="">						
							
								<ul>
									<li><div style="width:100%; display:flex; justify-content:center;"><img style="height:360px;" src = "" id="src"></div>
										<br>
										 	<p>
													${pdVO.programNo}<br>
													${pdVO.prgExpl}
								
											</p>
									</li>
								</ul>
							
	</div>