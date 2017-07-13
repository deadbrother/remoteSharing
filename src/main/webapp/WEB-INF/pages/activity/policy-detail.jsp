<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'activity-result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%-- <%@include file="head-js-css.jsp" %>
     <script src="../js/activity/activity-result.js" type="text/javascript"></script> --%>
  </head>
  
  <body>
                        <div align="left">
						     <a class="blink" onclick="window.location.href='../activity/download?bo.po.policyId=${bo.activityBasicInfo.POLICY_ID}'" style="text-decoration: none;cursor: hand;">${bo.activityBasicInfo.UPLOAD_FILENAME}</a>
						     <input type="file"/>
						</div>
  </body>
 
</html>
