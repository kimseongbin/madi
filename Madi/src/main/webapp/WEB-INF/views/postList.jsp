<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.spring.madi.*" %>
<%
	List<RecipeVO> postList = (ArrayList<RecipeVO>)request.getAttribute("postList");
	List<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");
	
	String fileName = (String)request.getAttribute("fileName");
%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=divice-width, initial-scale=1">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <style>

  	#columns {
  		column-width: 220px;
  		column-gap: 10px;
  		margin: 10px;
  	}
  	
  	#columns figure {
  		display: inline-block;
  		margin: 0;
  		margin-bottom: 15px;
  		padding: 4px;
  		max-height: 800px;
  		width: 100%;
  	}
  	
  	#columns figure img {
  		width: 100%;
  		border-radius: 3%;
  		overflow: hidden;
  	} 
  	
  	#columns figure video {
  		width: 100%;
  		border-radius: 3%;
  		overflow: hidden;
  	} 
  	
  	video {
  		autostart: 0;
  	}
  	
	footer {
	    background-color: #DE4F4F;
	    color: white;
	    padding: 15px;
	}
  	
  	#postBtn {	 	
  		position:fixed;
  		right:0;
  		bottom:0;
  		margin-bottom: 80px;
  		margin-right: 25px;
  		z-index:10000;
  	}
  	
	/* ICON Design */
	.glyphicon {
	    font-size: 17px;
	}
	.glyphicon.top {
	    color: #000000;
	}
	.glyphicon.glyphicon-comment {
	    color: #4C4C4C;
	}
	.glyphicon.glyphicon-heart {
	    color: #DB005B;
	}
	.glyphicon.glyphicon-pencil {
	    color: #3D3D3D;
	}
	.glyphicon.glyphicon-share-alt {
	    color: #487BE1;
	}
	.glyphicon.icon-size {
	    font-size: 25px;
	}
  	
	/* 헤더버튼 주변색 */
	.btn.form {
	    background-color: #DE4F4F;
	}

	/*헤더 색*/
	.navbar.head {
	    background-color: #DE4F4F;
	}
	/* 움직이는 헤더 */
	.affix {
	    top: 0;
	    width: 100%;
	    z-index: 9999 !important;
	}
	.affix+.container-fluid {
	    padding-top: 70px;
	}
	/* Modal 크기 조절 */
	.modal-dialog.modal-size {
	    width: 20%;
	    height: 60%;
	    margin: 0;
	    padding: 0;
	}
	.modal-content.modal-size {
	    height: auto;
	    min-height: 60%;
	}
	.modal.modal-center {
	    text-align: center;
	}
	@media screen and (min-width: 768px) {
	    .modal.modal-center:before {
	        display: inline-block;
	        vertical-align: middle;
	        content: " ";
	        height: 100%;
	    }
	}
	.modal-dialog.modal-center {
	    display: inline-block;
	    text-align: left;
	    vertical-align: middle;
	}
	/* follow 모달 크기 조절 */
	.modal-dialog.follow-size {
	    width: 23%;
	    height: 50%;
	    margin: 0;
	    padding: 0;
	}
	.modal-content.follow-size {
	    height: auto;
	    min-height: 50%;
	}
	<!-- 헤더 스타일 끝 -->
	
	/*postModal*/
	@media (max-width: 600px) {
	    .carousel-caption {
	      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
	    }
  	}
  	
  	.bg-1 {
	      color: #bdbdbd;
	}
	    
	.list-group-item:first-child {
		border-top-right-radius: 0;
	    border-top-left-radius: 0;
	}
	.list-group-item:last-child {
		border-bottom-right-radius: 0;
	    border-bottom-left-radius: 0;
	}
	  
	.btn {
	    padding: 10px 20px;
	    background-color: #DE4F4F;
	    color: #f1f1f1;
	    border-radius: 0;
	    transition: .2s;
	}
	  
	.btn:hover, .btn:focus {
	    border: 1px solid #333;
	    background-color: #fff;
	    color: #000;
	}
	.modal-header, h4, .close {
	    background-color: #DE4F4F;
	    color: #fff !important;
	    text-align: center;
	    font-size: 30px;
	}
	.modal-header, .modal-body {
	    padding: 20px 50px;
	}
	
	#irdntAddBtn {
		float:right;
		padding-top:0px;
		padding-bottom:0px;
		padding-left:5px;
		padding-right:5px;
	}
  	
  	#recipeProcessAddBtn {
  		float:right;
  		padding-top:0px;
  		padding-bottom:0px;
  		padding-left:5px;
  		padding-right:5px;
  	}
  	
  	#cooking_no {
  		border: none;  		
  		background-color: white;
  	}
  	
	.file-upload {
		position: relative;
		display: inline-block;
	}
	
	.file-upload__label {
	  display: block;
	  /* padding: 1em 2em; */
	  color: #fff;
	  background: #DE4F4F;
	  border-radius: .4em;
	  transition: background .3s;
	  
	}
	    
	.file-upload__input {
	    position: absolute;
	    left: 0;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    font-size: 1;
	    width:0;
	    height: 100%;
	    opacity: 10;
	}
  </style>
  
  <script type="text/javascript">
  
  	$("#postBtn").affix({
  		offset: {
  			top: 100,
  			bottom: function() {
  				return (this.bottom = $('.footer').outerHeight(true))
  			}
  		}
  	});
  	
  	$(document).ready(function () {	

  	  	
  		// 무한 스크롤 이벤트
  		$(document).scroll(function() { // 스크롤이 변경될 때마다 이벤트 발생
  			var maxHeight = $(document).height(); // 현재 페이지의 높이
  			var currentScroll = $(window).scrollTop() + $(window).height();  // 브라우저의 스크롤 위치값  + 현재 페이지 문서의 높이
  			console.log(maxHeight+":"+currentScroll);
  			if (maxHeight <= currentScroll + 100) {
  				$.ajax ({
  					// ajax로 비동기식으로 데이터 받아와서 무한 스크롤 구현하는 부분 
  					
  				});
  			}
  		});
  			
  		// 이미지 마우스 hover시 이미지 투명하게 하는 이벤트
  		$(".imageHover").hover(function(){
  			$(this).css({
  				"opacity": "0.4"
  				
  			});
  		},
  		function() {
  			$(this).css({
  				"opacity": "1.0"
  			})		
  		});
  		
  		$("#postBtn").click(function(){
  			$("#postModal").modal();
  		});
  		
  		
/*   	  	$('#recipeInsert').click(function(){
  	  		alert('?');
   	  		$("#recipeModalFrm").ajaxForm({
	  	  		url: '/recipeInsert.do',
	  	  		contentType: false,
	  	  		processData: false,
	  	  		enctype: "multipart/form-data", 
	  			data: formData,
	  			type: 'POST',
	  			success: function(result) {
	  				alert('?');
	  				$("#img_url").html(result);
	  			},
	  			error : function(error) {
	  		        alert("Error!");
	  		    }
  	  		});	  		
	  	});    */
  		
  	});
  	
  	function post(recipe_id) {
  		location.href="./recipeDetail.do?recipe_id="+recipe_id;
  	}
  	
  	function image () {}
  	  	
  	function recipeSubmit() {
  		
  		/* 내용 입력 체크 */
  		// 요리명 입력 체크
  		if ($("#recipe_title").val() == "") {
  			alert("요리명을 입력");
  			event.preventDefault();
  			return;
  		}
  		// 요리 설명 입력 체크
  		if (document.recipeModalFrm.recipe_desc.value == "") {
  			alert("요리 설명을 입력하세요");
  			document.recipeModalFrm.recipe_desc.focus();
  			event.preventDefault();
  			return;
  		}
  		
  		// 이미지 첨부 체크?
  		/* if (document.recipeModalFrm.img_url.value == "") {
  			alert("이미지를 넣어주세요");
  			event.preventDefault();
  			return;
  		} */
  		
  		// 재료명 입력 체크
  		if ($("#irdnt_name").val() == "") {
  			alert('재료명을 입력하세요');
  			event.preventDefault();
  			return;
  		}
  		
  		// 분량 입력 체크
  		if ($("#irdnt_cpcty").val() == "") {
  			alert('분량을 입력하세요');
  			event.preventDefault();
  			return;
  		}
  		
	  	
  	  	$('#recipeInsert').click(function(){
  	  		alert('?');
/*   	  		$("#recipeModalFrm").ajaxForm({
	  	  		url: '/recipeInsert.do',
	  	  		contentType: false,
	  	  		processData: false,
	  	  		enctype: "multipart/form-data", 
	  			data: formData,
	  			type: 'POST',
	  			success: function(result) {
	  				alert('?');
	  				$("#img_url").html(result);
	  			},
	  			error : function(error) {
	  		        alert("Error!");
	  		    }
  	  		});	  */ 		
	  	});  
  	  	
  		recipeModalFrm.submit();
  		
  	}
  	
 
  </script>
  	
  </head>
  
  <body style="background-color: #F6F6F6">
     <!-- 헤더 시작 -->
    <nav class="navbar navbar-default head" data-spy="affix" data-offset-top="197">
    <div class="container-fluid">
        <div class="navbar-header" style="padding-right: 30%;">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span><span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">MADI</a>
        </div>
        <!--검색 창 -->
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar">
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group input-group">
                        <input type="text" class="form-control" placeholder="Search.." size="80%"> 
                        	<span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </form>
            </ul>
            <!--오른쪽 아이콘 -->
            <ul class="nav navbar-nav navbar-right">
                <!-- 냉장고 아이콘 -->
                <li>
                    <div style="padding-top: 9px; padding-left: 5px;">
                        <button type="button" class="btn form" data-toggle="modal" data-target="#fridge">
                            <img src="./resources/ingredient_icon/fridge.png" style="width:20px; height:20px;">
                        </button>
                        <div class="modal fade" id="fridge" tableindex="-1" role="dialog" aria-labelledby="modallabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <!-- 알림, 메시지 탭 -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!-- Modal bar 내용들 -->
                                    <div class="modal-body">
                                        <div class="tab-content">
                                            <div id="home" class="tab-pane fade in active">
                                                <ul class="list-group">
                                                    <!-- ?? 내용들 -->
                                                    <li>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div id="message" class="tab-pane fade">
                                                <ul class="list-group">
                                                    <!-- ?? 내용들 -->
                                                    <li class="list-group-item">
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--home 아이콘 -->
                <li>
                	<button type="button" class="btn form" style="padding-top: 15px;">
                    	<span class="glyphicon glyphicon-home color"></span>
                    </button>
                </li>
                <li>
                    <div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
                        <button class="btn dropdown-toggle form" type="button" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user color"></span>
                        </button>
                        <ul class="dropdown-menu" style="text-align:center; background-color:#F6F6F6;">
                            <li>
                            	<img src="./resources/profile/bird.jpg" class="img-circle" height="70" width="70" alt="Avatar">
                            </li>
                            <li>
                                <h4>
                                    <p class="text-primary">이글이글</p>
                                </h4>
                            </li>
                            <li>
                            	<a href="#">회원수정</a>
                            </li>
                            <li>
                            	<a href="#">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!--알림 아이콘 -->
                <li>
                    <div style="padding-top: 9px; padding-left: 5px;">
                        <button type="button" class="btn form" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-align-justify color"></span>
                        </button>
                        <!-- Modal bar -->
                        <div class="modal modal-center fade" id="myModal" tableindex="-1"role="dialog" aria-labelledby="modallabel">
                        	<div class="modal-dialog modal-size modal-center" role="document">
                        		<div class="modal-content modal-size">
                        			<!-- 알림, 메시지 탭 -->
                        			<div class="modal-header">
                        				<button type="button" class="close" data-dismiss="modal">&times;</button>
                        				<ul class="nav nav-tabs">
                        					<li class="active">
                        						<a data-toggle="tab" href="#home">알림
                        							<span class="badge">New</span>
                        						</a>
                        					</li>
                                            <li>
                                            	<a data-toggle="tab" href="#message">메시지 
                                            		<span class="badge">New</span>
                                            	</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Modal bar 내용들 -->
                                    <div class="modal-body">
                                        <div class="tab-content">
                                            <div id="home" class="tab-pane fade in active">
                                                <ul class="list-group">
                                                    <div class="row">
                                                        <div class="col-sm-2" style="padding-bottom: 5px;">
                                                            <img src="./resources/profile/bird.jpg" class="img-circle" height="40"
                                                                width="40" alt="Avatar">
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <h4 class="text-primary" style="">이글이글</h4>
                                                        </div>
                                                    </div>
                                                    <!-- 알림 내용들 -->
                                                    <li class="list-group-item">
                                                    	<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar">
                                                    	<a>AAA</a>
                                                    	<em> 님이 ~~~ 게시물을 공유했습니다.</em>
                                                    </li>
                                                    <li class="list-group-item">
                                                    	<img src="./resources/profile/bird.jpg"
                                                        class="img-circle" height="20" width="20" alt="Avatar">
                                                        <a>BBB</a>
                                                        <em> 님이 ~~~ 게시물을 공유했습니다.</em>
                                                        <div class="row"></div>
                                                    </li>
                                                    <li class="list-group-item">
                                                    	<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar">
                                                    	<a>CCC</a> 
                                                    	<em> 님이 ~~~ 게시물을 공유했습니다.</em>
                                                        <div class="row"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div id="message" class="tab-pane fade">
                                                <ul class="list-group">
                                                    <div class="row">
                                                        <div class="col-sm-2" style="padding-bottom: 5px;">
                                                            <img src="./resources/profile/bird.jpg" class="img-circle" height="40" width="40" alt="Avatar">
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <h4 class="text-primary" style="">이글이글</h4>
                                                        </div>
                                                    </div>
                                                    <!-- 메시지 내용들 -->
                                                    <li class="list-group-item">
                                                    	<strong>From </strong> 
                                                    	<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar"> 
                                                    	<a>AAA</a> 
                                                    	<strong>: "지금 뭐하는지"</strong>
                                                    </li>
                                                    <li class="list-group-item">
                                                    	<strong>From </strong>
                                                    	<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar"> 
                                                    	<a>BBB</a> 
                                                    	<strong>: "먹을게 없다"</strong>
                                                    </li>
                                                    <li class="list-group-item">
                                                    	<strong>From </strong>
                                                    	<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar"> 
                                                    	<a>CCC</a> 
                                                    	<strong>: "사진"</strong>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--소셜 아이콘 -->
                <li>
                    <button type="button" class="btn form" style="padding-top: 15px;">
                        <span class="glyphicon glyphicon-globe color"></span>
                    </button>
                </li>
            </ul>
        </div>
    </div>
    </nav>
    <!-- 헤더 끝 -->
  	
  	<!-- 게시물 핀터레스트형식 리스트 -->
  	<div id="columns" style="margin: 50px;">
  	   <!-- 핀터레스트 형식으로 하려면 css의 멀티컬럼을 사용해야 함: 공통의 부모가 필요 -->
  	   <!-- 삽화를 그룹핑 -->		 
<%		
		for(int i = 0; i < postList.size(); i++)
		{
			RecipeVO recipe = postList.get(i);
			
%>
	  		<figure>
	  			<a href="#" class="imageHover">
	  				<img class="imgsrc" id="enters" src="<%= recipe.getImg_url()%>" onclick="post(<%=recipe.getRecipe_id()%>)">
	  			</a>
	  		</figure>
<%
		}
%>  		 
  	</div>
  	
  	<!-- 게시물 post 버튼 -->
  	<div id="postQuick" >
  		<button type="button" data-target="#postModal" id="postBtn" class="btn btn-danger" data-spy="affixBtn"  style="margin-left: 97%">+</button> 
  		<!--  onclick="javascript:post();" -->
  	</div>
  	
  	<!-- Footer -->
  	<footer class="container-fluid text-center">
  		<p>MADI</p>
  	</footer>
  	
  	<!-- Post Modal -->
	<!-- Modal -->
	<form name="recipeModalFrm" action="./recipeInsert.do">
		<div class="modal fade" id="postModal" role="dialog" style="margin-top: 130px;" data-backdrop="static">
			<div class="modal-dialog">
				    
		    <!-- Modal content-->
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<button type="button" class="close" data-dismiss="modal">x</button>
		    		<recipe style="font-size:20px;font-weight:bold"><span class="glyphicon glyphicon-cutlery"></span> 레시피 등록</recipe>
		    	</div>
		    <div>
		    
		    <!-- 요리명/사진등록 -->
		    <div class="modal-body">
		    	<div class="form-group">
		    		<label for="usrname">
		    			<span class="glyphicon glyphicon-cutlery"></span> 요리명
		    		</label>
		            
			        <div>	
		    			<!-- 사진: board_img -->					
			        	<div class="file-upload" id="upload_recipe_pic">
						    <label for="upload" class="file-upload__label">
						    	<span class="glyphicon glyphicon-camera"></span>사진등록
						    </label>
						    <input id="recipeInsert" class="file-upload__input" type="file" name="recipeInsert" >
						</div>
			        	<input type="text" class="form-control" name="recipe_title" id="recipe_title" placeholder="요리명 입력" style="margin-bottom: 5px">
			        	<input type="text" class="form-control" name="recipe_desc" id="recipe_desc" placeholder="한줄 설명">
			        </div>
		          </div>
		      </div>
		      
		      <div class="modal-body">
		      	<div class="form-group">
		      		<div>
			      		<label>
			      			<span class="glyphicon glyphicon-map-marker"></span> 국가
			      		</label>
			      		<select name="nation_code" id="nation_code" class="form-control">
			      			<option value="3020001">한식</option>
			      			<option value="3020002">서양</option>
			      			<option value="3020003">일본</option>
			      			<option value="3020004">중국</option>
			      			<option value="3020005">동남아시아</option>
			      			<option value="3020006">이탈리아</option>
			      			<option value="3020009">퓨전</option>
			      		</select>
			      		<br>
			      		<label>
			      			<span class="glyphicon glyphicon-tags"></span> 종류
			      		</label>
			      		<select name="ty_code" id="ty_code" class="form-control">
			      			<option value="3010001">밥</option>
			      			<option value="3010002">국</option>
			      			<option value="3010003">조림</option>
			      			<option value="3010004">구이</option>
			      			<option value="3010005">튀김/커틀릿</option>
			      			<option value="3010006">찜</option>
			      			<option value="3010007">나물/생채/샐러드</option>
			      			<option value="3010008">밑반찬/김치</option>
			      			<option value="3010009">양식</option>
			      			<option value="3010010">도시락/간식</option>
			      			<option value="3010012">양념장</option>
			      			<option value="3010013">떡/한과</option>
			      			<option value="3010014">빵/과자</option>
			      			<option value="3010015">음료</option>
			      			<option value="3010016">만두/면류</option>
			      			<option value="3010016">찌개/전골/스튜</option>
			      			<option value="3010018">부침</option>
			      			<option value="3010019">그타랑/리조또</option>
			      			<option value="3010020">샌드위치/햄버거</option>
			      			<option value="3010021">피자</option>
			      			<option value="3010022">볶음</option>
			      			<option value="3010023">기타</option>
			      		</select>
		      		</div>
		      	</div>
		      </div>
		      
		      <!-- 재료/분량입력 -->
		      <div class="modal-body">
		      	<div class="form-group">
		      		<label for="psw">
		      			<span class="glyphicon glyphicon-shopping-cart"></span> 재료 입력
		      		</label>
		      		
		      		<!-- + -->
		      		<button type="button" id="irdntAddBtn" class="btn btn-primary btn-xs">+</button>
		      		<div id="irdntAdd">
		      			<input type="text" class="form-control" name="irdnt_name" id="irdnt_name" placeholder="재료 입력" style="margin-bottom: 5px;">
		      			<input type="text" class="form-control" name="irdnt_cpcty" id="irdnt_cpcty" placeholder="분량 입력" style="margin-bottom: 5px;">
		      			<!-- 재료타입(주재료/부재료/양념) select option -->
		      			<select id="irdnt_type" class="form-control">
		      				<option value="3060001">주재료</option>
		      				<option value="3060002">부재료</option>
		      				<option value="3060003">양념</option>
		      			</select>
		      		</div>		      			
		       	 </div>
		       </div>
		        
		       <!-- 사진/과정 -->
		       <div class="modal-body">
		       	<div class="form-group">
		       		<label for="psw">
		       			<span class="glyphicon glyphicon-sort-by-order"></span> 레시피 입력
		       		</label>
		       		<!-- + -->
		       		<input type="text" class="form-control" name="cooking_time" placeholder="예상시간(분)" style="width: 105px; margin-left: 80%; margin-bottom: 12px;">
		       		<button type="button" id="recipeProcessAddBtn" class="btn btn-primary btn-xs">+</button>	
		       		<div id="reciptInput">
		       			<!-- 사진이미지: step_img_url -->
		       			<!-- 순서 -->
		       			1 
		       			<input type="hidden" name="cooking_no" id="cooking_no" value="1">	     
			        	<div class="file-upload">
						    <label for="upload" class="file-upload__label"><span class="glyphicon glyphicon-camera"></span>사진등록</label>
						    <!-- <input id="upload_recipe" class="file-upload__input" type="file" name="file-upload_recipe"> -->
						</div>
		       			<textarea name="cooking_desc" id="cooking_desc" class="form-control" style="margin-bottom: 5px;" placeholder="입력"></textarea>
		       			<input type="text" name="step_tip" id="step_tip" class="form-control" style="margin-bottom: 5px;" placeholder="TIP★ 입력">
		        	</div>
		        </div>
		        
		        <button class="btn btn-block" onclick="javascript:recipeSubmit()">submit
		        	<span class="glyphicon glyphicon-ok"></span>
		        </button>
		       </div>
		      </div>
		    </div>
		  </div>
		</div>
  	</form>			
  	<script>  	
	  	
	  	$('#irdntAddBtn').click(function() {
	  		
	  		// 수정
	  		$("#irdntAdd").append('<hr/><input type="text" class="form-control" name="irdnt_name" id="irdnt_name" placeholder="재료 입력" style="margin-bottom: 5px">');
	  		$("#irdntAdd").append('<input type="text" class="form-control" name="irdnt_cpcty" id="irdnt_cpcty" step="0.5" min="0" placeholder="분량 입력" style="margin-bottom: 5px;">');
	  		$("#irdntAdd").append('<select id="irdnt_type" class="form-control"><option value="3060001">주재료</option><option value="3060002">부재료</option><option value="3060003">양념</option></select>');
	  		
	  		return false;
	  	});
	  	
	  	var i = parseInt($("#cooking_no").val());
	  	
	  	$('#recipeProcessAddBtn').click(function() {
	  		
	  		$("#reciptInput").append('<hr/>'+ (i + 1) +'<input type="hidden" name="cooking_no" id="cooking_no" value="'+ (i + 1) +'">');
	  		$("#reciptInput").append('<div class="file-upload"><label for="upload" class="file-upload__label"><span class="glyphicon glyphicon-camera"></span>사진등록</label><input id="upload" class="file-upload__input" type="file" name="file-upload"></div>');
	  		$("#reciptInput").append('<textarea name="cooking_desc" id="cooking_desc" class="form-control" style="margin-bottom: 5px;" placeholder="입력"></textarea>');
	  		$("#reciptInput").append('<input type="text" name="step_tip" id="step_tip" class="form-control" style="margin-bottom: 5px;" placeholder="TIP★ 입력">');
	  		
	  		i++;
	  		
	  		return false;
	  	});

	  	
  	</script>
 </body>
 </html>