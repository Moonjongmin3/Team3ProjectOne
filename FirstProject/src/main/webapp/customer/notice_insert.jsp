<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
        <div class="nav_wrap">
            <div class="nav_bar" style="padding-left: 20px">
                <ul>
                    <li><img src="../img/ico_bc_home.svg" style="padding-bottom: 3px;"></li>
                    <li>></li>
                    <li>고객센터</li>
                    <li>></li>
                    <li>공지사항</li>
                </ul>
            </div>
        </div>
        <div class="notice_detail_wrap">
            <div class="notice_side">
                <%--  수정 필요 --%>
                <div class="notice_side_top">
                    <h2>고객센터</h2>
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
                <h3>공지사항 작성</h3>
                <form method="post" action="notice_insert_ok.do">
                    <table class="table">
                        <tr style="background-color: #cdcdcd">
                            <td width="20%" class="text-center" style="font-size: 17px"><b>제목</b></td>
                            <td width="80%" style="background-color: white; padding: 0">
                                <input type="text" name="title" size="85"
                                       style="border: none; line-height: 40px; padding-left: 10px">
                                       <!-- 로그인 기능 구현까지 대기 -->
                             <%-- <input type="hidden" name="admin_id" value="${sessionScope.admin_id }"> --%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" height="300px" valign="top" style="padding: 0">
                                <textarea rows="20" cols="100" name="content"
                                    style="border: none; margin: 0; padding: 10px 10px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" colspan="2">
                                     <c:if test="${sessionScope.admin==1}">
                                    <button class="btn btn-sm btn-danger">작성</button>
                                     </c:if>
                                    <input type="button" value="취소" class="btn btn-sm btn-warning"
                                           onclick="javascript:history.back()">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
</body>
</html>