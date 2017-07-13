<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>存量营销活动新增页面</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="../js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="../js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" /> 
<script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../js/ztree/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<script src="../js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="../js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="../js/ztree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script> 
<script src="../js/activity/activity-ctree.js" type="text/javascript"></script>

</head>
<body>
	<div id="zTreeDemoBack">      
		 <div id="cityContent" class="menuContent" style="display:none;">
	      <ul id="cityOrgtree" class="ztree" style=""></ul>
          </div>         
    </div>
				    <div class="content_wrap slds-size--7-of-8 slds-text-align--left" style="height:20px">
	                    <div class="zTreeDemoBackground left" style="height:20px">
	                    <input type="hidden" id="cityOrgId" value="${bo.channelTelePhone.orgCityIds }"/>		
	                     <input type="hidden" id="cityOrgPath"  value="${bo.channelTelePhone.companyId }"/>	                                     		                
	                    </div>
	               
                    </div>
</body>
</html>
