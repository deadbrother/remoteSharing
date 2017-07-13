<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="head-js-css.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注销弹窗配置</title>
<style type="text/css">
.em1{
background: #FFE4B7;
border: 1px solid #FFBB8B;
color: #FF6800;
width: 30px;
height: 30px;
font-style: normal;
font-family: Arial;
text-align: center;
line-height: 30px;
overflow: hidden;
}
.em2{
width: 30px;
height: 30px;
border: 1px solid #B1E0F4;
color: #6298CC;
font-style: normal;
/* font-size: 10px; */
font-family: Arial;
background: #E6F0FD;
text-align: center;
line-height: 30px;
overflow: hidden;
}
.centerDiv{
*position:absolute;
margin: 0 auto; 
left:15%; right:25%; 
}
.toptitle{
font-size: 18px;
  line-height: 50px;
  background-color: #fefdfd;
  padding: 10px 10px;
  border-bottom: 1px solid #e0e0e0;
}

</style>

</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--声明以IE最高版本浏览器内核或谷歌浏览器内核进行渲染 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <!--声明以360极速模式进行渲染 -->
 <meta name=”renderer” content=”webkit” />
  <!-- 系统ICON图标（注:路径为TomCat根目录） -->
  <link rel ="Shortcut Icon" href="" />
<script src="../js/activity/activity-pop-config.js" type="text/javascript"></script>

<body>
<input type="hidden" name="classLevel" value="${bo.po.orgLevel}"/>
<div class="container table-responsive centerDiv">
<div class="row">
	<div class="col-xs-12 col-md-12 toptitle">
		<div class="col-md-12 col-xs-12">
		<table>
		<tr>
		<td><label style="width:100px">弹窗配置</label>	</td>
		<td><button  type="button" class="btn btn-primary fr pull-right" style="margin-top:10px;width:80px" data-toggle="modal" data-target="" id="saveRule" onclick="popSubmit()">保存</button><input type="text" value="${bo.popIsSave}" id="popIsSave" style="display:none;">
		</td>
		</tr>
		</table>
		
		
		
		
		</div>
	</div>
</div>	
	
	<div class="activitySetArea">
		<table class="activeLayout">
			<colgroup>
            	<col width="125px" />
            	<col width="*" />
            	<col width="*" />
            	<col width="*" />
        	</colgroup>
        	<c:if test="${bo.po.orgLevel == 1}">
	        	<tr>
	        		<th>省份展示主题数量</th>
	           	    <td>  
	           	    	<input  class="form-control inputrefResh" type="number" min="1" max="9" id="popConfigInfo.provinceThemeNum" value="${bo.popConfigInfo.provinceThemeNum==null?'1':bo.popConfigInfo.provinceThemeNum}" name="popConfigInfo.provinceThemeNum" onFocus="numvalue();" onblur="clonepop();"> 
	       		    </td>
	            	<th>地市主题展示数量</th>
	            	<td>  
	            		<input  class="form-control inputrefResh" type="number" min="1" max="9" value="${bo.popConfigInfo.cityThemeNum==null?'1':bo.popConfigInfo.cityThemeNum}" name="popConfigInfo.cityThemeNum" onFocus="numcityvalue();" onblur="clonecitypop();"> 
	     			</td>
	        	</tr>
	        	<tr>
	        		<th>省份主题配置:</th>
	        	</tr>
        	</c:if>
        	<c:if test="${bo.po.orgLevel == 2}">
	        	<tr> 
	            	<th>地市主题展示数量</th>
	            	<td>  
	            		<input  class="form-control inputrefResh" type="number" min="1" max="9" value="${bo.popConfigInfo.cityThemeNum==null?'1':bo.popConfigInfo.cityThemeNum}" name="popConfigInfo.cityThemeNum" onFocus="numcityvalue();" onblur="clonecitypop();"> 
	     				<input  type="hidden" id="popConfigInfo.provinceThemeNum" value="${bo.popConfigInfo.provinceThemeNum==null?'1':bo.popConfigInfo.provinceThemeNum}" name="popConfigInfo.provinceThemeNum"> 
	     			</td>
	     			<td width="58%"><td>
	        	</tr>
	        	<tr>
	        		<th>地市主题配置:</th>
	        	</tr>
        	</c:if>
		</table>
		<table class="activeLayout  table table-striped" id="tablePop">
        	<colgroup>
            	<col width="125px" />
            	<col width="*" />
            	<col width="*" />
            	<col width="*" />
        	</colgroup>
        	<tr>
            	<td>优先级    
            	</td>
            	<td>活动主题    
            	</td>
        	</tr>
        	<c:if test="${bo.popIsSave ==null || bo.popIsSave =='' || bo.popIsSave =='0'}">
        	<tr>
	        		<td><div class="em1" >1</div>   
	            	</td>
	            	<td>
						<select class="form-control" name="popList[0].themeCode" value="${bo.popConfigInfo.themeCode}">
	                    <c:forEach items="${bo.activityThemeList}" var="atl">
	                       <option  value="${atl.themeCode}" ${atl.themeCode==bo.popConfigInfo.themeCode?'selected' :''}>${atl.themeName}</option>
	                    </c:forEach>
	                </select>  
	            	</td>
	        	</tr>
	        </c:if>	
	        <c:if test="${bo.popIsSave =='1'}">
        	<c:forEach items="${bo.popList}" var="str">
	        	<tr>
	        		<td><div class="em1">${str.themePriority}</div>   
	            	</td>
	            	<td>
						<select class="form-control" name="po.activityThemeCode" value="${str.themeCode}">
	                    <c:forEach items="${bo.activityThemeList}" var="atl">
	                       <option  value="${atl.themeCode}" ${atl.themeCode==str.themeCode?'selected' :''}>${atl.themeName}</option>
	                    </c:forEach>
	                </select>  
	            	</td>
	        	</tr>
        	</c:forEach>
        	</c:if>
    </table>
    <table class="activeLayout  table table-striped" id="tableCityPop">
        	<colgroup>
            	<col width="125px" />
            	<col width="*" />
            	<col width="*" />
            	<col width="*" />
        	</colgroup>
        	<c:if test="${bo.popCityIsSave ==null || bo.popCityIsSave =='' || bo.popCityIsSave =='0'}">
        	<tr>
	        		<td><div class="em2">2</div> 
	            	</td>
	            	<td>
						<select class="form-control" name="popCityList[0].themeCode" value="${bo.popConfigInfo.themeCode}">
	                    <c:forEach items="${bo.activityThemeList}" var="atl">
	                       <option  value="${atl.themeCode}" ${atl.themeCode==bo.popConfigInfo.themeCode?'selected' :''}>${atl.themeName}</option>
	                    </c:forEach>
	                </select>  
	            	</td>
	        </tr>
	        </c:if>
	        <c:if test="${bo.popCityIsSave =='1'}">
        	<c:forEach items="${bo.popCityList}" var="str">
	        	<tr>
	        		<td><div class="em2">${str.themePriority}</div>   
	            	</td>
	            	<td>
						<select class="form-control" name="po.activityThemeCode" value="${str.themeCode}">
	                    <c:forEach items="${bo.activityThemeList}" var="atl">
	                       <option  value="${atl.themeCode}" ${atl.themeCode==str.themeCode?'selected' :''}>${atl.themeName}</option>
	                    </c:forEach>
	                </select>  
	            	</td>
	        	</tr>
        	</c:forEach>
        	</c:if>
    </table>
	</div>
</div>
</body>
</html>

