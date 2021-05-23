<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<link href="resources/css/togetherBoard/togetherMain.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<script src="resources/js/togetherBoard/togetherMain.js?v=<%=System.currentTimeMillis()%>"></script>
<script>
	$(document).ready(function(){
		var sessionUser = '${sessionScope.user}';
		console.log(sessionUser);
		
		//로그인을 안할 시 이용제한
		if(sessionUser == '' || sessionUser == null){
			$('.nav-link').click(function(e){
				e.preventDefault();
				alert("로그인 해주세요.\n<참고> 아이디:soomin@bit.com 비밀빈호:dltnals1234^^ \n(^^도 비밀번호에 포함됩니다.)");
			});
			$('#getWritingBoard').click(function(e){
				e.preventDefault();
				alert("로그인 해주세요.\n<참고> 아이디:soomin@bit.com 비밀빈호:dltnals1234^^ \n(^^도 비밀번호에 포함됩니다.)");
			});
			$('.getBoard').click(function(e){
				e.preventDefault();
				alert("로그인 해주세요.\n<참고> 아이디:soomin@bit.com 비밀빈호:dltnals1234^^ \n(^^도 비밀번호에 포함됩니다.)");
			});
			
			$('.tBookmark').attr('onclick', '');
			$('.tBookmark').click(function(e){
				alert("로그인 해주세요.\n<참고> 아이디:soomin@bit.com 비밀빈호:dltnals1234^^ \n(^^도 비밀번호에 포함됩니다.)");
			});
			
			clearInterval(setTimeBoardList);
		}
	});
</script>
	<!------- navigation start---------->
	<section id="navWrap" class="clearfix">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			id="t_navbar1">
			<div class="collapse navbar-collapse" id="t_navbar2">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" class="t_navbar-items"><a
						class="nav-link" href="t_openBoardList.do?tHeader=함께먹어요">함께 먹어요 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="t_openBoardList.do?tHeader=함께출퇴근해요" class="loginOut">함께 출퇴근해요</a></li>
					<li class="nav-item"><a class="nav-link"
						href="t_openBoardList.do?tHeader=함께나눠요">함께 나눠요</a></li>
				</ul>
			</div>
		</nav>
	</section>
	<!------- navigation end---------->
	<div id="upperChange"><!--CSS추가 노노 -->
		<div id="t_uppercontents">
			<div id="t_uppercontent">
				<h2>
					<span>혼자하는 것</span>에 외로운 사람
				</h2>
				<h2>
					<span>누군가와 함께하고 싶은</span> 사람
				</h2>
				<div id="pWrap">
					<p>지금 바로 해요의 커뮤니티에 당신의 일상을</p>
					<p>함께 공유해보세요</p>
					<div>
						<a href="t_getWritingBoard.do" id="getWritingBoard">
							<button type="submit" id="heayo_writing_Mainbtn">글 작성하기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!------- contents start --------->
	<div id="t_contents" class="clearfix">
		<div id="t_content_box">
			<c:forEach var="board" items="${boardList}">
				<div id="t_content">
					<div id="tAddress_Bookmark" class="clearfix">
						<div id="tAddress">${board.tAddress}</div>
						<c:choose>
							<c:when test="${board.tBookmarkVO.tNo != null}">
								<div class="tBookmark select" id="${board.tNo}"  onclick="checkBookmark(${board.tNo})">1</div>
							</c:when>
							<c:otherwise>
								<div class="tBookmark" id="${board.tNo}" onclick="checkBookmark(${board.tNo})">0</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="imgWrap">
						<a href="t_getBoard.do?tNo=${board.tNo}" class="getBoard"> <img
							src="/WEB-INF/boardImages/${board.tPic1}" height="250" width="250">
						</a>
					</div>
					<div id="tTitle">${board.tTitle}</div>
					<div id="tHeader">
						<button type="submit" class="heayo_btn" style="pointer-events: none;">${board.tHeader}</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="paging_box">
		</div>
	</div>
	<!------- contents end --------->
