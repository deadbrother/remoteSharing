<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--声明以IE最高版本浏览器内核或谷歌浏览器内核进行渲染 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <!--声明以360极速模式进行渲染 -->
 <meta name=”renderer” content=”webkit” />
  <!-- 系统ICON图标（注:路径为TomCat根目录） -->
  <link rel ="Shortcut Icon" href="" />
<title>活动主题设置</title>
<%@include file="head-js-css.jsp" %>

</head>
<body>

 <form  method="post" id="themeForm" >
 <%-- <input type="hidden" name="saveType" value="${saveType }"/> --%>
<!--  主体内容开始 -->
  <div class="container" style="margin-bottom:50px;">
<!--   页头文字  开始-->
 <h2 class="activity">活动主题设置</h2>
 <!--   页头文字  结束-->
<!--   三个页面嵌入 开始-->
<div class="activitySetArea">
 	<table class="activeLayout">
 		 <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr>
            <th>
                <span>*</span>主题编码
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="themeCode" placeholder="" name="themeCode" value="${theme.themeCode }"  >
            </td>
            <td></td>
        </tr>
         <tr>
            <th>
                <span>*</span>主题名称
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="themeName" placeholder="" name="themeName" value="${theme.themeName }"
                check_name="主题名称" check_empty check_size="2,10">
            </td>
            <td></td>
        </tr>
         <tr>
            <th>
                主题说明
            </th>
            <td colspan="4">
                <textarea class="form-control" rows="3" name="themeDesc">${theme.themeDesc }</textarea>
            </td>
            <td></td>
        </tr>
        <tr>
            <th>
                <span>*</span>主题排序
            </th>
            <td colspan="4">
                <input class="form-control inputWidth" type="number"   min="1" max="100" name="ord"  id="ord" value="${theme.ord }"
                check_name="主题排序" check_empty check_size="1,5">
            </td>
            <td></td>
        </tr>
         <tr>
            <th><span>*</span>是否有效</th>
            <td colspan="4">
                <ul class="inputUl">
                   <li style="margin-right:58px;"><input type="radio" name="isValid" class="icheckS" value="1" ${theme.isValid=='1'?'checked':'' } />是</li>
                   <li class="ChannelOut"><input type="radio" name="isValid" class="icheckS" value="0"  ${theme.isValid=='0'?'checked':'' }/>否</li>
                </ul>
            </td>
        </tr>
 	</table>                
</div>
<div style="left: 65%;top: 42%; position: absolute;">
		<button  type="button" class="btn btn-primary" value="取消" id="cancelForm" onClick="javascript :history.back(-1);">取消</button>
		<button type="submit" class="btn btn-primary" value="提交方法" id="subForm">提交</button>
</div>
<input type="text" name="saveType" value="${saveType }" style="display:none; ">
 </div>
 </form>
</body>
<script type="text/javascript">
$(function() {
	var saveType = '${saveType}';
	if(saveType=="1") {
		$("#themeCode").attr("readonly",true);
		$("#themeForm").attr("action","../theme/updateTheme");
		
	}else{
		$("#themeForm").attr("action","../theme/saveTheme");
	}
	

	//表单提交前验证
	$("#themeForm").bind("submit",function() {
		$("button.btn.btn-primary").attr("disabled",true); //屏蔽重复提交
		var themeName = $("#themeName").val();
		var themeCode = $("#themeCode").val();
		var ord = $("#ord").val();
		var isValid = $("input[name='isValid']").val();
		if(themeCode.replace(/(^\s*)|(\s*$)/g, "")=="" || themeCode.replace(/(^\s*)|(\s*$)/g, "")==null) {
			alert("请填写活动编码！！！");
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		} 
		 if(themeName.replace(/(^\s*)|(\s*$)/g, "")=="" || themeName.replace(/(^\s*)|(\s*$)/g, "")==null) {
			alert("请填写活动名称！！！");
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		} 
		 if(ord.replace(/(^\s*)|(\s*$)/g, "")=="" || ord.replace(/(^\s*)|(\s*$)/g, "")==null) {
				alert("请选择排序！！！");
				$("button.btn.btn-primary").removeAttr("disabled");
				return false;
			}
		 if(!$("input[name=isValid]").is(":checked")) {
				alert("请选择是否有效！！！");
				$("button.btn.btn-primary").removeAttr("disabled");
				return false;
			} 
		
	});
});
//主题编码重复验证
  $("#themeCode").blur(function() {
	  var saveType = '${saveType}';
		var themeCode = $(this).val();
		 $.ajax({
			url:"../theme/isConflict",
			type: "POST",
			data:{
				"themeCode":themeCode
			},
			success: function(data){
				if(data=="1") {
					if(saveType=="0") {
						alert("主题编码已存在请重新填写");
						$("#themeCode").val("");
					}
				
				}
			}
		});
	  })


</script>
</html>