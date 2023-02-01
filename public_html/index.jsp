<%@ page import="java.util.*,java.io.*,malgnsoft.db.*,malgnsoft.util.*" %><%@ page import="java.text.DecimalFormat" %><%

Malgn m = new Malgn(request, response, out);

response.sendRedirect("/main/index.jsp");

//	response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
//	response.setHeader("Location", request.getContextPath() + "/main/index.jsp");
//	String userIp = request.getRemoteAddr();
%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>준비중입니다.</title>
	<style>
	* { margin:0; padding:0; }
	html, body { width:100%; height:100%; overflow:hidden; }
	#container { width:100%; height:100%; text-align:center; background:url('/common/images/under_construction.jpg') 50% 50% no-repeat; text-indent:-9999px; }

	@media screen and (max-width:998px) {
		#container { background-size:contain; }
	}
	@media screen and (max-height:469px) {
		#container { background-size:contain; }
	}
	</style>
</head>
<body>
<div id="container">
	<h1>홈페이지 <strong>오픈 준비중</strong>입니다.</h1>
	<h2>홈페이지를 찾아주시는 모든 분들께 더 나은 서비스를 제공하기 위해 <strong>홈페이지가 새 단장 중에 있습니다.</strong> 좋은 모습으로 곧 찾아뵙겠습니다. 감사합니다.</h2>
</div>
</body>
</html>
