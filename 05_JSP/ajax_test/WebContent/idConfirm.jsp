<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#red {
		color: red;
	}
</style>
</head>
<body>
<% 
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	
	int result = dao.idConfir(id); // result에는 1이나 0 들어옴
	if(result == MemberDao.EXISTANT){%>
		<b id="red">중복된 ID입니다.</b>
<% 	} else { %>
		<b>사용가능한 ID입니다.</b>		
<% 	}%>
</body>
</html>