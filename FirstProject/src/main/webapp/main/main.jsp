<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>MainPage</title>
	<!-- Index 페이지 StyleSheet -->
	<link rel="stylesheet" href="../css/index.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<!-- Index 페이지 StyleSheet -->
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/customer.css">
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
	<!-- 상단 공통 페이지 -->
	<!-- 모바일 : 카테고리 리스트 섹션 -->
	<aside>
		<div id="mobileNavListArea">
			<!-- 모바일 : 메인 카테고리 -->
			<div id="mobile-mainlist">
				<a href="javascript:void(0)" onclick="toggleMobileMainList()">X</a>
				<ul>
					<li><a href="javascript:void(0)" onclick="toggleMobileDomesticList()">국내도서<br></a></li>
					<li><a href="javascript:void(0)" onclick="toggleMobileForeignList()">외국도서<br></a></li>
					<li><a href="javascript:void(0)" onclick="toggleMobileEbookList()">E-Book</a></li>
				</ul>
			</div>
			<!-- 모바일 : 서브 카테고리 -->
			<div id="mobile-domesticlist">
				<ul>
					<li><a href="#">가정 살림</a></li>
					<li><a href="#">건강 취미</a></li>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">국어 외국어사전</a></li>
					<li><a href="#">대학교재</a></li>
					<li><a href="#">만화/라이트노벨</a></li>
					<li><a href="#">사회 정치</a></li>
					<li><a href="#">소설/시/희곡</a></li>
					<li><a href="#">수험서 자격증</a></li>
					<li><a href="#">어린이</a></li>
				</ul>
			</div>
			<div id="mobile-foreignlist">
				<ul>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">인문 사회</a></li>
					<li><a href="#">문학 소설</a></li>
					<li><a href="#">취미 라이프스타일</a></li>
					<li><a href="#">자연과학</a></li>
					<li><a href="#">ELT 사전</a></li>
					<li><a href="#">해외잡지</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">예술 대중문화</a></li>
					<li><a href="#">대학교재 전문서</a></li>
				</ul>
			</div>
			<div id="mobile-ebooklist">
				<ul>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">라이트노벨</a></li>
					<li><a href="#">로맨스</a></li>
					<li><a href="#">만화</a></li>
					<li><a href="#">사회 정치</a></li>
					<li><a href="#">소설</a></li>
					<li><a href="#">에세이 시</a></li>
					<li><a href="#">인문</a></li>
					<li><a href="#">자기계발</a></li>
					<li><a href="#">판타지/무협</a></li>
				</ul>
			</div>
		</div>
	</aside>
	<!-- 최상단 섹션 (로그인, 장바구니 등) -->
	<header>
		<div class="top-bar">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-5 col-sm-12"></div>
					<div class="col-lg-7 col-sm-12 top-bar-content">
						<ul class="top-list">
							<c:if test="${sessionScope.userId != null}" var="loginCheck">
							<li class="top-list-element cart"><a href="#">장바구니</a></li>
							<li class="top-list-element mypage"><a href="#">주문배송</a></li>
							<li class="top-list-element sign-up"><a href="#">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.userId == null}">
								<li class="top-list-element sign-up"><a href="#">회원가입</a></li>
							</c:if>
							<li class="top-list-element sign-in">
								<div class="btn-sign-in">
									<c:if test="${sessionScope.userId != null}" var="loginCheck">
										<a href="../user/logout.do">로그아웃</a>
									</c:if>
									<c:if test="${sessionScope.userId == null}" var="loginCheck">
										<a href="../user/login.do">로그인</a>
									</c:if>
								</div>
							</li>
							<c:if test="${sessionScope.userId != null}">
							<li class="top-list-element">
								${sessionScope.userName }
								<c:if test="${sessionScope.admin==0}">
									<sub>님</sub>
								</c:if>
								<c:if test="${sessionScope.admin==1}">
									<sub>운영자</sub>
								</c:if>
							</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 로고 & 검색 창 섹션 -->
		<div class="middle-inner">
			<div class="container-fluid">
				<div class="row">
					<div class="hidden-xs col-sm-1 col-sm-offset-1" id="logo-space"><a href="../main/main.do">LOGO</a></div>
					<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-md-6 col-sm-offset-1">
						<form action="BookList.do" method="get" name="search_form" class="form-inline">
							<div class="form-group search-group">
								<select class="form-control search-category" name="searchCategory">
									<option value="통합검색">통합검색</option>
									<option value="국내도서">국내도서</option>
									<option value="외국도서">외국도서</option>
									<option value="E-Book">E-Book</option>
								</select>
								<div class="input-group">
									<input type="text" class="form-control search-input" name="searchWord" placeholder="검색어를 입력해주세요..">
								</div>
								<button type="submit" class="btn btn-default search-button" id="search-button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- 네비게이션 섹션 -->
	<nav>
		<div class="nav-bar">
			<!-- 네비게이션 바 -->
			<div class="nav-main">
				<div class="nav-option" id="category-btn"><a href="javascript:void(0)" onclick="javascript:toggleMainList();toggleMobileMainList();">
					<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick=""></span>
					<span class="hidden-xs hidden-sm">&nbsp;&nbsp;&nbsp;카테고리</span></a></div>
				<div class="nav-option hidden-xs hidden-sm"><a href="javascript:void(0)">베스트셀러</a></div>
				<div class="nav-option hidden-xs hidden-sm"><a href="javascript:void(0)">신간도서</a></div>
				<div class="nav-option hidden-xs hidden-sm"><a href="javascript:void(0)">자유게시판</a></div>
				<div class="nav-option hidden-xs hidden-sm cscenter-main"><a href="../customer/notice.do">고객센터</a>
					 <ul class="cscenter-nav">
								<li><a href="../customer/notice.do">공지사항</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
				</div>
				<!-- Mobil 네비게이션 바 -->
				<div class="swiper navSwiper hidden-md hidden-lg">
					<div class="swiper-wrapper nav-mobile-wrapper">
						<div class="swiper-slide nav-mobile-option"><a href="javascript:void(0)">베스트셀러</a></div>
						<div class="swiper-slide nav-mobile-option"><a href="javascript:void(0)">신간도서</a></div>
						<div class="swiper-slide nav-mobile-option"><a href="javascript:void(0)">자유게시판</a></div>
						<div class="swiper-slide nav-mobile-option"><a href="../customer/notice.do">고객센터</a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 카테고리 리스트 -->
		<div class="nav-list" id="navListArea">
			<!-- 메인 카테고리 -->
			<div class="nav-mainlist hidden-xs hidden-sm" id="mainList">
				<ul>
					<li><a href="javascript:void(0)" onclick="toggleDomesticList()">국내도서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="glyphicon glyphicon-menu-right hidden-md" aria-hidden="true"></span></a></li>
					<li><a href="javascript:void(0)" onclick="toggleForeignList()">외국도서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="glyphicon glyphicon-menu-right hidden-md" aria-hidden="true"></span></a></li>
					<li><a href="javascript:void(0)" onclick="toggleEbookList()">E-Book&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="glyphicon glyphicon-menu-right hidden-md" aria-hidden="true"></span></a></li>
				</ul>
			</div>
			<!-- 서브 카테고리 -->
			<div class="nav-sublist hidden-xs hidden-sm" id="domesticList">
				<ul>
					<li><a href="#">가정 살림</a></li>
					<li><a href="#">건강 취미</a></li>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">국어 외국어사전</a></li>
					<li><a href="#">대학교재</a></li>
					<li><a href="#">만화/라이트노벨</a></li>
					<li><a href="#">사회 정치</a></li>
					<li><a href="#">소설/시/희곡</a></li>
					<li><a href="#">수험서 자격증</a></li>
					<li><a href="#">어린이</a></li>
				</ul>
			</div>
			<div class="nav-sublist hidden-xs hidden-sm" id="foreignList">
				<ul>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">인문 사회</a></li>
					<li><a href="#">문학 소설</a></li>
					<li><a href="#">취미 라이프스타일</a></li>
					<li><a href="#">자연과학</a></li>
					<li><a href="#">ELT 사전</a></li>
					<li><a href="#">해외잡지</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">예술 대중문화</a></li>
					<li><a href="#">대학교재 전문서</a></li>
				</ul>
			</div>
			<div class="nav-sublist hidden-xs hidden-sm" id="ebookList">
				<ul>
					<li><a href="#">경제 경영</a></li>
					<li><a href="#">라이트노벨</a></li>
					<li><a href="#">로맨스</a></li>
					<li><a href="#">만화</a></li>
					<li><a href="#">사회 정치</a></li>
					<li><a href="#">소설</a></li>
					<li><a href="#">에세이 시</a></li>
					<li><a href="#">인문</a></li>
					<li><a href="#">자기계발</a></li>
					<li><a href="#">판타지/무협</a></li>
				</ul>
			</div>
		</div>
	</nav>
	 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- Compiled and minified JavaScript -->
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script src="../js/index.js"></script>
	
	<jsp:include page="${main_jsp }"/>
	
	  <!-- footer 시작 -->
    <footer id="footer">
        <div class="footer_wrap">
            <div class="footer_left">
                <div class="footer_nav">
                    <ul>
                        <li><a href="">베스트셀러</a></li>
                        <li><a href="">신규도서</a></li>
                        <li><a href="">자유게시판</a></li>
                        <li><a href="">고객센터</a></li>
                    </ul>
                </div>
                <address>
                   서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층<br>
                       대표이사 문종민 | 사업자등록번호 2022-02-19 | 통신판매업신고번호 2012-경기성남-0552<br>
                    <small>Copyright © GOWOONSESANG COSMETICS Co.,Ltd. All Rights Reserved.</small>
                </address>
            </div>
            <div class="footer_right">
                <div class="sns_icon">
                    <ul>
                        <li><a href=""><img src="../img/sns_kakaoch.png" alt="kakao"></a></li>
                        <li><a href=""><img src="../img/sns_youtube.png" alt="youtube"></a></li>
                        <li><a href=""><img src="../img/sns_facebook.png" alt="facebook"></a></li>
                        <li><a href=""><img src="../img/sns_insta.png" alt="insta"></a></li>
                    </ul>
                </div>
                <div class="footer_information">
                    <ul>
                        <li><span>고객센터 1811-9415</span></li>
                        <li>평일 : 09:30~16:00</li>
                        <li>점심 : 12:30 ~ 13:30</li>
                        <li>토요일, 일요일, 공휴일 휴무</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>