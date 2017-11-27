<%@page import="com.spring.madi.MemberVO"%>
<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MessageVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.RecipeProcessVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.RecipeIrdntVO"%>
<%@page import="com.spring.madi.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//내 정보 받아오기
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	//메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	
%>
  <style>  	
	footer {
	    background-color: #DE4F4F;
	    color: white;
	    padding: 15px;
	}  	
	/* ICON Design */
	.header.glyphicon {
	    font-size: 17px;
	}
	.header.glyphicon.top {
	    color: #000000;
	}
	.header.glyphicon.glyphicon-comment {
	    color: #4C4C4C;
	}
	.header.glyphicon.glyphicon-heart {
	    color: #DB005B;
	}
	.header.glyphicon.glyphicon-pencil {
	    color: #3D3D3D;
	}
	.header.glyphicon.glyphicon-share-alt {
	    color: #487BE1;
	}
	.header.glyphicon.icon-size {
	    font-size: 25px;
	}
  	
	/* 헤더버튼 주변색 */
	.header.btn.form {
	    background-color: #DE4F4F;
	}

	/*헤더 색*/
	.header.navbar.head {
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
	/* 알림창 Modal 크기 조절 */
	.modal-dialog.modal-size {
	    width: 300px;
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
	        vertical-align: top;
	        content: " ";
	        height: 100%;
	    }
	}
	.modal-dialog.modal-center {
	    display: inline-block;
	    text-align: left;
	    vertical-align: top;
	}
	<!-- 헤더 스타일 끝 -->
	
	/*postModal*/
	@media (min-width: 600px) {
	    #navbar_toggle {
	      postion:absolute; /* Hide the carousel text when the screen is less than 600 pixels wide */
	      right: 0;
	    }
  	}
  	
  	.header.bg-1 {
	      color: #bdbdbd;
	}
	    
	.header.list-group-item:first-child {
		border-top-right-radius: 0;
	    border-top-left-radius: 0;
	}
	.header.list-group-item:last-child {
		border-bottom-right-radius: 0;
	    border-bottom-left-radius: 0;
	}
	  
	.header.btn {
	    padding: 10px 20px;
	    background-color: #DE4F4F;
	    color: #f1f1f1;
	    border-radius: 0;
	    transition: .2s;
	}
	.header.btn:hover, .btn:focus {
	    color: #000;
	 	outline: none;   
	}
	.header.modal-header, .header.h4, .close {
	    background-color: #DE4F4F;
	    color: #fff !important;
	    text-align: center;
	    font-size: 30px;
	}
	.header.modal-header, .modal-body {
	    padding: 20px 50px;
	}
  </style>
<!-- 헤더 시작 -->
 <nav class="navbar navbar-default head header" data-spy="affix" data-offset-top="197">
    <div class="container-fluid">
        <div class="navbar-header header" style="padding-right: 0;" id="navbar_toggle">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background-color:#DE4F4F;">
                <span class="icon-bar" style="background-color:white;"></span>
                <span class="icon-bar" style="background-color:white;"></span>
                <span class="icon-bar" style="background-color:white;"></span>
            </button>
            <a class="navbar-brand" href="#">MADI</a>
        </div>
        <!--검색 창 -->
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar" style="margin-left:25%;">
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group input-group">
                        <input type="text" class="form-control" placeholder="Search.." size="80%"> 
                        	<span class="input-group-btn">
                            <button class="btn btn-default" type="button" style="padding-bottom:2px; margin-top:1px;">
                                <span class="glyphicon glyphicon-search header"></span>
                            </button>
                        	</span>
                    </div>
                </form>
            </ul>
              <!--오른쪽 아이콘 -->
            <ul class="nav navbar-nav navbar-right">
                <!--home 아이콘 -->
                <li>
                	<button type="button" class="btn form header" style="padding-top: 10px; margin-top:10px;">
                    	<span class="glyphicon glyphicon-home color header"></span>


                    </button>
                </li>
                <!-- profile 아이콘 -->
                <li>
                    <div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
                        <button class="btn dropdown-toggle form header" type="button" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user color header"></span>
                        </button>
                        <ul class="dropdown-menu" style="text-align:center; background-color:#F6F6F6;">
                            <li>
                            	<a href="./mypage.do"><img src="<%=memberVO.getUser_img()%>" class="img-circle" height="70" width="70" alt="Avatar"></a>
                            </li>
                            <li>
                                <h4>
                                    <a href="./mypage.do"><p class="text-primary"><%=memberVO.getUser_id()%></p></a>
                                </h4>
                            </li>
                            <li>
                            	<a href="./updateMember.do"><strong>회원수정</strong></a>
                            </li>
                            <li></li><!-- 간격을 주기 위한 빈 공간 -->
                            <li>
                            	<a href="./logout.do"><strong>로그아웃</strong></a>
                            </li>
                        </ul>
                    </div>
                </li>
                 <!-- 냉장고 아이콘 -->
                <li>
                    <div style="padding-top: 9px; padding-left: 5px;">
                        <button type="button" class="btn form header" data-toggle="modal" data-target="#fridge">
                            <img src="./resources/food_icon/fridge_white.png" style="width:20px; height:20px;" onmouseover="hover(this);" onmouseout="unhover(this);"/>
                        </button>
                    </div>
                </li>
                <script>
                function hover(element) {
                    element.setAttribute('src', './resources/food_icon/fridge.png');
                }
                function unhover(element) {
                    element.setAttribute('src', './resources/food_icon/fridge_white.png');
                }
                </script>              	
                <!--알림 아이콘 -->
                <li onclick="getNotification();">
                    <div style="padding-top: 10px; padding-left: 5px;">
                        <button type="button" class="btn form header" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-envelope color"></span>
                        </button>
                    </div>
                </li>
                <!--소셜 아이콘 -->
                <li>
                    <button type="button" class="btn form header" style="padding-top: 10px; margin-top:10px; margin-left:1px;">
                        <span class="glyphicon glyphicon-globe color"></span>
                    </button>
                </li>
          	</ul>
       	</div>
    </div>
</nav>
<!-- 냉장고 모달바 -->
<div class="modal fade" id="fridge" tableindex="-1" role="dialog"
	aria-labelledy="modallabel">
	<div class="modal-dialog modal-lg" role="document">
		<!-- content 시작 -->
		<div class="modal-content">
			<!-- 탭 -->
			<div class="modal-header header" style="background-color: #DE4F4F;">
				<button type="button" class="close header" data-dismiss="modal">&times;</button>
				<h3 style="color: #FFFFFF; text-align: center;">
					<img src="./resources/food_icon/fridge_white.png"
						style="width: 35px; height: 35px;"> <strong>냉장고 재료들</strong>
				</h3>
			</div>
			<div class="modal-body header" style="text-align: center;">
				<div class="row">
					<!-- 왼쪽 카테고리 -->
					<div class="col-sm-2">
						<ul class="nav nav-stacked">
							<li class="active"><a data-toggle="tab" href="#menu1"> <strong>주재료</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu2"> <strong>부재료</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu3"> <strong>양념/소스</strong>
							</a></li>
						</ul>
					</div>
					<!--  가운데 리스트 나열 -->
					<div class="col-sm-8"
						style="background-color: #FFD8D8; text-align: center;">
						<div class="tab-content">
							<!-- 메뉴1 주재료 -->
							<div id="menu1" class="tab-pane fade in active">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 메뉴2 부재료-->
							<div id="menu2" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 메뉴3 양념/조미료 -->
							<div id="menu3" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 재료 입력 끝 -->
						</div>
					</div>
					<!-- 오른쪽 내가 가진 재료들? -->
					<div class="col-sm-2"></div>
				</div>
			</div>
			<!-- 내용 끝 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default header" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- 모달 content 끝 -->
	</div>
</div>
<!-- 메시지 및 알림 모달 -->
<!-- Modal bar -->
<div class="modal modal-center fade" id="myModal" tableindex="-1"
	role="dialog" aria-labelledby="modallabel">
	<div class="modal-dialog modal-size modal-center" role="document">
		<div class="modal-content modal-size">
			<!-- 알림, 메시지 탭 -->
			<div class="modal-header header">
				<button type="button" class="close" data-dismiss="modal" class="btn header">&times;</button>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">알림 <span
							class="badge" id="no"><%=notificationList.size() %></span>
					</a></li>
					<li onclick="getMessage();"><a data-toggle="tab" href="#message">메시지 <span
							class="badge header" id="me"><%=messageList.size() %></span></a></li>
				</ul>
			</div>
			<!-- Modal bar 내용들 -->
			<div class="modal-body header">
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<ul class="list-group">
							<div class="row">
								<div class="col-sm-2">
									<img src="./resources/profile/bird.jpg" class="img-circle"
										height="40" width="40" alt="Avatar">
								</div>
								
								<div class="col-sm-6">
									<h4 class="text-primary" style=""><%=memberVO.getUser_id() %></h4>
								</div>
							</div>
							<!-- 알림 내용들 -->
							<div id="notificationList">
								<!-- 알림 내용들 -->
							</div>
						</ul>
					</div>
					<div id="message" class="tab-pane fade">
						<ul class="list-group">
							<div class="row">
								<div class="col-sm-2" style="padding-bottom: 5px;">
									<img src="./resources/profile/bird.jpg" class="img-circle"
										height="40" width="40" alt="Avatar">
								</div>
								
								<div class="col-sm-6">
									<h5 class="text-primary header" style="magin-bottom:5px;"><strong>&nbsp;이글이글</strong></h5>
								</div>
							</div>
							<!-- 메시지 내용들 -->
							<div id="messageList">
								<!-- ajax, 메시지 리스트 로드 영역 -->
							</div>
						</ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default header" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	function recipeDo() {
		location.href = "./recipe.do";
	}
	function postListDo() {
		location.href = "./postList.do"
	}
	function getMessage() {
		var user_id = "<%=memberVO.getUser_id()%>";
		$.ajax({
			url: "./message.do",
			type: "GET",
			data: {
				user_id : user_id
			},
			dataType: "text",
			success: function(data) {
				$("#messageList").empty();
				$("#messageList").append(data);
			}  
		});
	}
	function getNotification() {
		var user_id = "<%=memberVO.getUser_id()%>";
		$.ajax({
			url: "./notification.do",
			type: "GET",
			data: {
				user_id : user_id
			},
			dataType: "text",
			success: function(data) {
				$("#notificationList").empty();
				$("#notificationList").append(data);
			}
		});
	}
</script>