<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../js/ligerui/lib/jquery/jquery-1.4.4.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
$("#importFile").click(function() {
	//alert(123);
	var url = "../filte/importFile";
	var file = document.getElementById("file").value;
	var yzxls = /.(?:xls|xlsx)$/;
	var issubmit = yzxls.test(file);
    if (yzxls.test(file)) {
        document.getElementById('upFileFrom').action = url;
        $("#upFileFrom").submit();
        setTimeout(function(){
      	 // location.href="activity-filte!respExcel";
        	alert("延时测试");
        },1000);
    } else {
        alert("请上传Excel文件");
    }
});
	</script>
<!-- <script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script> -->

<%-- <c:set var="propertyInfo" value="${propertyInfo}" scope="application" /> --%>
<div style="margin-left: 50px">
		<form name="upFileForm" id="upFileForm"  method="post" enctype="multipart/form-data"  action="../filte/importFile">
			<input type="file" id="file" name="eventfile" style="margin-left: 3px;" >
			<!-- <a id="importFile" class="l-button l-button-brand btn_add" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-import"></span>&nbsp;导入
			</a> -->
			<!-- <input type="submit" value="导入" > -->
		</form>
		<input type="button" id="importFile">
	
</div>

