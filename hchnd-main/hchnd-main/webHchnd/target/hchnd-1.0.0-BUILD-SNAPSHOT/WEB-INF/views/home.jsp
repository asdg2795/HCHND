<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--Bodies-->
<section id="container" onclick="acc.hideAccount();">
	<!--Contents-->
	<header id="main_top">
		<h1>
			<span>NOTHING WILL</span>
			<span>WORK UNLESS</span>
			<span>YOU DO.</span>
		</h1>
		<p>
			나에게 가장 알맞은 운동 프로그램을 생성하고
			<br>더욱 효과적으로 득근하세요!
		</p>
		<a id="start">
			시작하기
		</a>
	</header>

	<div class="skewYBackground"></div>
	<article id="main_term1">
		<div id="exPrgmTxts">
			<h1 class="term1Txt">
				Popular
			</h1>
			<p class="term1Txt">
				가장 추천하는 베스트 프로그램
			</p>
			<span class="term1Txt">
				    <a href="Program/Program.html">
					    시작하기
				    </a>
			    </span>
		</div>
		<div id="exPrgmImgs" style="text-align: center;">
			<img src="imgs_main/taxasMethodLogo.PNG">
			<img src="imgs_main/strLift55.PNG">
			<img src="imgs_main/program_PHUL.jpg">
		</div>
	</article>

	<article id="main_community">
		<div>
			<img src="imgs_main/workout2_social.jpg">
			<h1>
				<div>
					Train together<br>
					&amp; <br>
					Share your experience.
				</div>
				<span>함께 할 수록 강해집니다.</span>
				<span>
					    <a href="Community/community.html">커뮤니티 이동</a>
				    </span>
			</h1>
		</div>
	</article>

	<article id="main_ad">
		<div id="mainDiv">
			<input type="button" value="◁" onclick="xStep=-1; posterMove();"/>
			<div id="imgView" style="position: relative;"></div>
			<input type="button" value="▷" onclick="xStep=1; posterMove();"/>
		</div>
	</article>

</section>