<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
body {
	background-color: #202020;
}

#container {
	color: white;
	text-decoration: none;
}

#MainSection {
	/*flex-grow: 3;*/
	width: 1300px;
	margin: 0 auto;;
}

#main {
	margin-left: 50px;
	margin-right: 150px;
	width: 450px;
	height: 500px;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 10%;
	margin-top: 30px;
	float: left;
	background-color: black;
}

#head {
	padding: 10px 0;
	text-align: center;
	font-size: 1.5em;
	color: white;
	font-weight: bold;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#cal_view>ul {
	overflow: auto;
}

#cal_view li {
	border-radius: 5px;
	height: 68px;
	font-weight: bold;
	background-color: white;
	border: 1px solid;
	float: left;
	width: 14.28%;
	text-align: center;
	color: black;
	padding: 10px 0;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.planner {
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 700px;
	text-align: left;
}

.planner>h1 {
	color: white;
}

.planner>ul {
	list-style: none;
	padding: 0;
}

.planner>li {
	margin-bottom: 10px;
}

.planner>input[type="checkbox"] {
	margin-right: 10px;
}

.planner>label {
	font-weight: bold;
	margin-right: 10px;
}

.planner>p {
	margin: 0;
}

.planner>label input[type="checkbox"] {
	display: none;
}

.planner>label span {
	display: inline-block;
	width: 22px;
	height: 22px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	border-radius: 5px;
	cursor: pointer;
	border: 1px solid red;
}
/*.planner > h1{
				
		}*/
.planner>label input[type="checkbox"]:checked+span {
	background: red;
}

#selected_date {
	text-align: right;
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
}

#selected_Main {
	width: 500px;
	float: left;
}

h2 {
	color: rgb(231, 76, 60);
	font-size: 50px;
	text-shadow: 5px 5px black;
}

.selected {
	background-color: rgb(52, 152, 219) !important; /* 선택된 날짜의 배경색 */
}

.yellow_back {
	background-color: yellow !important;
}
</style>
<head>
<script>
		var selectDay;
		var clr;
		var pname = '${vo.prgname}';
		//달력
		let weekName = ["일","월","화","수","목","금","토"];
		function calendar(year, month){
				let now = new Date(year, month-1, 1);
				let nowDate = now.getDate();
				let y = now.getFullYear();
				let m = now.getMonth() + 1;
				let w = now.getDay();
				
				let lastDay = new Date(y, m, 0).getDate();
				
				let tag = "<div id = 'head'>" +y+"년 "+m+"월"+"</div>";
				
				tag += "<ul>";
				for(var i = 0; i < weekName.length; i++){
						tag += "<li>"+weekName[i] + "</li>";
				}
				for(var i = 1; i<=w;i++){
						tag += "<li>&nbsp;</li>";
				}
				
				let dayCounter = 1;
				tag += "<ul>";
				
		
				
		
		
				for (var i = 1; i <= lastDay; i++) {
				    
				    if ((w == 1 ||w == 3	 ||w == 5) && !(i == 1 || i == 4 || i == 6 || i == 8 || i == 11)) {
				    	}else {						
				        tag += "<li>" + i + "</li>";
				    }
						  w = (w + 1) % 7; 
						  
				    if (i % 7 == 0) { // 7일마다 줄바꿈
				        tag += "</ul><ul>";
				   
				     }	   
					}//
	
        tag += "</ul>";
        document.getElementById("cal_view").innerHTML = tag;

        let dateCells = document.querySelectorAll("#cal_view li");
									dateCells.forEach(cell => {
					    cell.addEventListener("click", function () {
							selectDay = this;
							clr = selectDay.style.backgrounColor;
							console.log(selectDay.style.backgroundColor);
				        // 이미 선택된 날짜라면 선택 해제
				        if (cell.innerText < 1 || weekName.includes(cell.innerText)) {
				            return;
				        }else if(cell.classList.contains("selected")){
							cell.classList.remove("selected")
						}else{
							cell.classList.add("selected");
												
												
            // 선택된 날짜의 월과 일 출력
            let selectedMonth = m;
            let selectedDay = cell.innerText;
            let selectedDateText = selectedMonth + "월 "	+ selectedDay + "일";
            let selectedMainText = "";
            
            selectedMainText +="<div class='planner' style = 'margin-bottom : 100px;'>"
							        
							        
							        +"<ul>"
																+"<h1 style =' color : rgb(255,159,41);'>Squat 120kg 기준</h1>"
           			 +"<li style = 'border : 5px solid white; border-radius:10px; width : 650px; height : 175px;'>"
		               +" <label for='squat' ></label>"
		               +" <label style = 'margin-left : 30px; margin-top : 20px;'>워밍업</label>"
		               +" <p style = 'margin-left : 50px;'>빈바(5회), 40kg(5회), 60kg(5회), 80kg(5회), 100kg(3회), 110kg(1회)</p>"
		               +" <label for='squat_main_set'  style = 'margin-left : 30px;'>메인세트<br><br></label>"
		               +" <input style = 'margin-left : 50px;' type='checkbox' id='squat_main_set1'>"
		               +" <label for='squat_main_set1'>120kg (5회)</label>"
		               +" <input type='checkbox' id='squat_main_set2'>"
		               +" <label for='squat_main_set2'>120kg (5회)</label>"
		               +" <input type='checkbox' id='squat_main_set3'>"
		               +" <label for='squat_main_set3'>120kg (5회)</label>"
		               +" <input type='checkbox' id='squat_main_set4'>"
		               +" <label for='squat_main_set4'>120kg (5회)</label>"
		               +" <input type='checkbox' id='squat_main_set5'>"
		               +" <label for='squat_main_set5'>120kg (5회)</label>"
				           +" </li>"
				           
				           
				           +"<h1 style =' color : rgb(255,159,41);'>BenchPress 45kg 기준</h1>"
           			 +"<li style = 'border : 5px solid white; border-radius:10px;width : 650px; height : 175px';>"
		               +" <label for='bench_press'></label>"
		               +" <label style = 'margin-left : 30px;'>워밍업</label>"
		               +" <p style = 'margin-left : 50px;'>빈바(5회), 40kg(5회), 50kg(5회), 60kg(5회), 70kg(3회)</p>"
		               +" <label for='bench_press_main_set' style ='margin-left : 30px;' >&nbsp;메인세트<br><br></label>"
		               +" <input style = 'margin-left : 50px;' type='checkbox' id='bench_press_main_set1'>"
		               +" <label for='bench_press_main_set1'>45kg (5회)</label>"
		               +" <input type='checkbox' id='bench_press_main_set2'>"
		               +" <label for='bench_press_main_set2'>45kg (5회)</label>"
		               +" <input type='checkbox' id='bench_press_main_set3'>"
		               +" <label for='bench_press_main_set3'>45kg (5회)</label>"
		               +" <input type='checkbox' id='bench_press_main_set4'>"
		               +" <label for='bench_press_main_set4'>45kg (5회)</label>"
		               +" <input type='checkbox' id='bench_press_main_set5'>"
		               +" <label for='bench_press_main_set' >45kg (5회)</label>"
				           +"</li>"
				          					           
				           
																+"<h1 style =' color : rgb(255,159,41);'>BarBellRow 45kg 기준</h1>"
           			 +"<li style = 'border : 5px solid white; border-radius:10px; width : 650px; height : 175px;'>"
               +" <label for='barbell_row'></label>"
               +" <label style = 'margin-left : 30px;'>워밍업</label>"
               +" <p style = 'margin-left : 50px;'>빈바(5회), 40kg(5회), 50kg(5회), 60kg(5회), 70kg(3회)</p>"
               +" <label for='barbell_row_main_set' style = 'margin-left : 30px;'>메인세트<br><br></label>"
               +" <input style = 'margin-left : 50px;' type='checkbox' id='barbell_row_main_set1'>"
               +" <label for='barbell_row_main_set1'>45kg (5회)</label>"
               +" <input type='checkbox' id='barbell_row_main_set2'>"
               +" <label for='barbell_row_main_set2'>45kg (5회)</label>"
               +" <input type='checkbox' id='barbell_row_main_set3'>"
               +" <label for='barbell_row_main_set3'>45kg (5회)</label>"
               +" <input type='checkbox' id='barbell_row_main_set4'>"
               +" <label for='barbell_row_main_set4'>45kg (5회)</label>"
               +" <input type='checkbox' id='barbell_row_main_set5'>"
               +" <label for='barbell_row_main_set5'>45kg (5회)</label>"
				           +" </li>"
				           +"</ul>"
				           +" <button onclick = 'selectedDay12()' style = 'background-color : rgb(52,152,219); color:white; border-radius : 50px; font-weight : bold; padding : 15px 15px; font-size : 1.5rem; margin-left : 280px; margin-top : 30px;'>Set START Day</button>"
				             +" </div>"
				             
            	document.getElementById("selected_date").innerHTML = selectedDateText;
            	document.getElementById("selected_Main").innerHTML = selectedMainText;
															}
							    });
							});

    			}
        window.onload = function () {
        let now = new Date();
        let year = now.getFullYear();
        let month = now.getMonth() + 1;
        calendar(year, month);
   		 }
		  function selectedDay12(pname){
						selectDay.classList.remove("selected");
						//selectDay.classList.remove("selected");
				  selectDay.classList.add("yellow_back");
				  console.log(selectDay);
		}

	</script>
</head>

<body>

	<section id="container">
		<!--Contents-->
		<article id="MainSection">
			<h2 style="text-align: center;">${vo.prgname }</h2>

			<div id="main">
				<div id="cal_view"></div>
			</div>
			<div id="selected_date"></div>
			<div id="selected_Main"></div>
		</article>
	</section>


</body>