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
	
	int result = dao.idConfir(id); // result���� 1�̳� 0 ����
	if(result == MemberDao.EXISTANT){%>
		<b id="red">�ߺ��� ID�Դϴ�.</b>
<% 	} else { %>
		<b>��밡���� ID�Դϴ�.</b>		
<% 	}%>
</body>
</html>