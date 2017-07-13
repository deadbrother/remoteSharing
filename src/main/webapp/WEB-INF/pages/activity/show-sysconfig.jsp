<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body style="margin-left:100px;">
<div style="width:1024px;padding-left:30px;">
	<div style="margin:30px;width:400px;float:left">
		<h1>系统缓存配置</h1>
		<c:forEach items="${cacheSysConfig}" var="entry">
			<label>${entry.key}:</label>${entry.value}
			</br>
		</c:forEach>
	</div>
	
	<div  style="margin:30px;width:400px;float:left">
		<h1>数据库配置</h1>
		<c:forEach items="${dbConfig}" var="entry">
				<label>${entry.key}:</label>${entry.value}
				</br>
		</c:forEach>
	</div>
</div>
</body>
</html>
