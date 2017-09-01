<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>可拖拽页面</title>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<%-- <script src="${pageContext.request.contextPath}/js/activity/activity-prov-successStandard_add.js" type="text/javascript"></script> --%>
<style type="text/css">
.sortalbe{
	border:solid 1px #ddd;
	padding:20px 30px;
	margin:100px;
}
.sortable .item{
	width:210px;
	border:solid 1px #ccc;
	line-height:30px;
	padding-left:10px;
	cursor:move;
	transition:all .2s ease;
}

.sortable .item strong{
	color:#333;
	-webkit-user-select:none;
}
</style>

<script type="text/javascript">
$(function(){
	

	debugger;
	var itemArr = document.getElementsByClassName("item");
	for(var i = 0;i < itemArr.length;i ++){
		itemArr[i].setAttribute('draggable',true);
		itemArr[i].dataset.order = i;
	}
	var targetY = 0;
	var itemHeight = itemArr[0].innerHeight;
	var nowItem = "";
	var targetItem = "";
	
	document.addEventListener('dragstart',function(event){
		event.target.style.opacity = "0.4";
		nowItem = event.target.dataset.order;
	},false);
	
	document.addEventListener('drag',function(event){
		if(event.pageY >= targetY){
			document.getElementById('sortable').insertBefore(event.target,targetItem.nextSibling);
		}else{
			document.getElementById('sortable').insertBefore(event.target,targetItem);
		}
	},false);
	document.addEventListener('dragend',function(event){
		event.target.style.opacity = "1";
		for(var i = 0; i < itemArr.length; i ++){
			itemArr[i].dataset.order = i;
		}
	},false);
	document.addEventListener('dragenter',function(event){
		if(event.target.className = "item"){
			console.log('目标：' + event.pageY);
			targetY = event.pageY;
			targetItem = event.target;
		}else{
			console.log("不是拖动目标");
		}
	});
});
</script>
</head>
<body>
	<div class="sortable" id="sortable">
		<div class="item">
			<strong>1</strong>
		</div>
		<div class="item">
			<strong>2</strong>
		</div>
		<div class="item">
			<strong>3</strong>
		</div>
		<div class="item">
			<strong>4</strong>
		</div>
		<div class="item">
			<strong>5</strong>
		</div>
		<div class="item">
			<strong>6</strong>
		</div>
		
	</div>
</body>
</html>
