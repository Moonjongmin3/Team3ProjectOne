<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<section>
		<div class="nav_wrap">
			<div class="nav_bar">
				<ul>
					<li><img src="../img/ico_bc_home.svg" style="padding-bottom: 3px;"></li>
					<li>></li>
					<li>고객센터</li>
					<li>></li>
					<li>${path }</li>
				</ul>
			</div>
		</div>
		
		<div class="notice_detail_wrap">
			<div class="notice_side">
				<%--  수정 필요 --%>
				<div class="notice_side_top">
					<img alt="고객센터" src="../img/cscenter.png">
				</div>
				<div class="faq_nav" style="border: 1px solid #cdcdcd">
					<dl>
						<dt>FAQ</dt>
						<dd>
							<ul>
								<li>상품</li>
								<li>주문/결제</li>
								<li>배송</li>
								<li>환불</li>
							</ul>
						</dd>

					</dl>
					<dl>
						<dt>1:1 문의</dt>
						<dd>
							<ul>
								<li>1:1 문의하기</li>
								<li>1:1 문의내역</li>
							</ul>
						</dd>

					</dl>
					<dl>
						<dt><a href="../customer/notice.do">공지사항</a></dt>
					</dl>
				</div>
			</div>
			<div class="notice_detail">
				<div class="top">
					<h3>공지사항</h3>
					<div class="notice_search_bar">
						<select name="notice_search">
							<option value="total">제목+내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						 <div class="search-area">
							<form method="get" action="">
								<!-- <select class="input-sm" name="find">
									<option value="total">제목+내용</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select> -->
								<input type="text" placeholder="검색어를 입력해 주세요" size=23 name="notice">
	<!--							<input type="submit" class="btn btn-sm btn-default" value="검색">-->
							<button type="submit" class="search_btn"></button>
								<div class="search_icon"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="contents">
					<div class="contents_top">
						<ul>
							<li>순번</li>
							<li>제목</li>
							<li>등록일</li>
						</ul>
					</div>
					<div class="contents_main">
						<c:forEach items="${notice_list}" var="list">
						<ul>
							<li>${list.no}</li>
							<li><a href="../customer/notice_detail.do?page=${curpage}&no=${list.no}">${list.title}</a> </li>
							<li>${list.created_At}</li>
						</ul>
						</c:forEach>
					</div>
					<div class="contents_page">
						<!-- 넘김 버튼 변경 예정 -->
						<ul>
							<c:if test="${curpage!=1}">
								<li class="prev_first"><a href="notice.do?page=1" class="pageicon"></a></li>
								<li class="prev"><a href="notice.do?page=${curpage-1}" class="pageicon"></a></li>
							</c:if>
							<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
								<c:set var="css" value=""/>
								<c:if test="${i==curpage}">
									<c:set var="css" value="style=\"color: #0052d4\""/>
								</c:if>
								<li class="page_list"><a href="notice.do?page=${i}" ${css} class="pagenum">${i}</a></li>
							</c:forEach>
							<c:if test="${curpage!=endpage}">
								<li class="next" ><a href="notice.do?page=${curpage+1}" class="pageicon"></a></li>
								<li class="next_end"><a href="notice.do?page=${total}" class="pageicon"></a></li>
							</c:if>
						</ul>
						<div class="notice_write">
						<form action="notice_insert.do" method="get">
                             <input type="hidden" name="page" value="${curpage }" style="display: inline-block;"> 
							<button class="btn btn-sm btn-info text-right" style="display: inline-block;">글쓰기</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>