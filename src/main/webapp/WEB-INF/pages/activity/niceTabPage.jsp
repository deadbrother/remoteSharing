<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://www.bonc.com.cn/easy/taglib/c"%>
<%@ taglib prefix="e" uri="http://www.bonc.com.cn/easy/taglib/e"%> --%>
<%-- <%@taglib prefix="a" tagdir="/WEB-INF/tags/app"%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- <c:resources type="easyui,app"  style="${ThemeStyle }"></c:resources> --%>
	<title>活动优先级</title>
	<!-- <e:style value="/pages/workbench/resources/themes/base/boncX@links.css"/> -->
	<script type="text/javascript">
		function changeTab_1(index) {
			for ( var i = 1; i <= 5; i++) {
				document.getElementById("Atab_" + i).className = "normalBlock";
				document.getElementById("Acontent_" + i).style.display = "none";
			}
			document.getElementById("Atab_" + index).className = "selectBlock";
			document.getElementById("Acontent_" + index).style.display = "block";	
		}
		function changeTab_2(index) {
			for ( var i = 1; i <= 2; i++) {
				
				document.getElementById("Btab_" + i).className = "normalTemp";
				document.getElementById("Bcontent_" + i).style.display = "none";
			}
			document.getElementById("Btab_" + index).className = "selectNum";
			document.getElementById("Bcontent_" + index).style.display = "block";	
		}
	</script>
 </head>
  
<body>
	<!-- 活动优先级 -->
	<div class="niceTabWrap">
		<div class="tabBlockDiv">
			<p class="tit">活动总数：<strong>100</strong>个</p>
			<ul class="chooseTab">
				<li class="bg01"><i class="fa fa-clipboard"></i><font class="selectBlock" onclick="changeTab_1('1')" id="Atab_1">暂存</font><em>10</em></li>
				<li class="bg02"><i class="fa fa-spinner"></i><font class="normalBlock" onclick="changeTab_1('2')" id="Atab_2">待审核</font><em>10</em></li>
				<li class="bg03"><i class="fa fa-play-circle"></i><font class="normalBlock" onclick="changeTab_1('3')" id="Atab_3">启用</font><em>10</em></li>
				<li class="bg04"><i class="fa fa-pause-circle-o"></i><font class="normalBlock" onclick="changeTab_1('4')" id="Atab_4">暂停</font><em>10</em></li>
				<li class="bg05"><i class="fa fa-stop-circle-o"></i><font class="normalBlock" onclick="changeTab_1('5')" id="Atab_5">终止</font><em>10</em></li>
			</ul>
		</div>
		<div class="contentTabPage" id="Acontent_1" style="display:block;">
			<div class="titPage">
				当前位置：<span>暂存</span>
			</div>
			<div class="tabSearch">
				创建人：<input type="text">
				创建时间：<input type="text">
				<button class="btnBlue">查询</button>
			</div>
		</div>
		<div class="contentTabPage" id="Acontent_2" style="display:none;">
			<div class="titPage">
				当前位置：<span>待审核</span>
			</div>
			<div class="tabSearch">
				创建人：<input type="text">
				创建时间：<input type="text">
				<button class="btnBlue">查询</button>
			</div>
		</div>
		<div class="contentTabPage" id="Acontent_3" style="display:none;">
			<div class="chooseQuestion">
				<ul>
					<li>已完成工单活动：<span class="selectNum" onclick="changeTab_2('1')" id="Btab_1">19</span></li>
					<li>排队生成工单活动：<span class="normalTemp" onclick="changeTab_2('2')" id="Btab_2">40</span></li>
					<li>生成工单中活动：<font>活动名称hn_002</font></li>
				</ul>
			</div>
			<div id="Bcontent_1" style="display:block;">
				<div class="titPage">
					当前位置：<span>启用 > <strong>已完成活动</strong></span>
				</div>
				<div class="tabSearch">
					创建人：<input type="text">
					创建时间：<input type="text">
					<button class="btnBlue">查询</button>
				</div>
			</div>
			<div id="Bcontent_2" style="display:none;">
				<div class="titPage">
					当前位置：<span>启用 > <strong>排队生成工单活动</strong></span>
				</div>
				<div class="tabSearch">
					创建人：<input type="text">
					创建时间：<input type="text">
					<button class="btnBlue">查询</button>
				</div>
			</div>
		</div>
		<div class="contentTabPage" id="Acontent_4" style="display:none;">
			<div class="titPage">
				当前位置：<span>暂停</span>
			</div>
			<div class="tabSearch">
				创建人：<input type="text">
				创建时间：<input type="text">
				<button class="btnBlue">查询</button>
			</div>
		</div>
		<div class="contentTabPage" id="Acontent_5" style="display:none;">
			<div class="titPage">
				当前位置：<span>终止</span>
			</div>
			<div class="tabSearch">
				创建人：<input type="text">
				创建时间：<input type="text">
				<button class="btnBlue">查询</button>
			</div>
		</div>
	</div>
	<!-- //活动优先级 -->
</body>
</html>
