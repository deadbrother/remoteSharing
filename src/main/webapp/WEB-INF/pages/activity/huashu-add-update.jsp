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
<%@include file="head-js-css.jsp" %>
</head>
<body>


 <form  method="post" id="huashuForm"  >
<title>${po.title=="话术变量修改"?"话术变量修改":"话术变量新增"} </title>
<!--  主体内容开始 -->
  <div class="container" style="margin-bottom:50px;">
<!--   页头文字  开始-->
 <h2 class="activity">话术变量设置</h2>
 <!--   页头文字  结束-->
<!--   三个页面嵌入 开始-->
<div class="activitySetArea" style="margin:0 0;">
 	<table class="activeLayout">
 		 <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr>
            <th>
                <span>*</span>变量名称
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="name"  name="name" value="${po.name }"  >
            </td>
            <td><div id="isExist" style="color: red"></div></td>
        </tr>
         <tr>
            <th>
                <span>*</span>变量内容
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="content" name="content" value="${po.content }">
            </td>
            <td></td>
        </tr>
         <tr>
            <th>
             <span>*</span> 变量描述
            </th>
            <td colspan="4">
                <textarea class="form-control" rows="3" id="remarks" name="remarks">${po.remarks }</textarea>
            </td>
            <td></td>
        </tr> 
        <tr>
            <th>
             <span>*</span> 排序
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="ord" name="ord" value="${po.ord }">
            </td>
            <td></td>
        </tr> 
          <tr>
            <th>
                <span>*</span>映射行云字段
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="realName" name="realName" value="${po.realName }">
            </td>
            <td></td>
        </tr>
                  <tr>
            <th>
                <span>*</span>mysql对应行云字段
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="mysqlName"  name="mysqlName" value="${po.mysqlName }">
            </td>
            <td></td>
        </tr>
         <tr>
            <th><span>*</span>变量类型</th>
            <td colspan="4">
                <ul class="inputUl">
                   <li style="margin-right:58px;"><input type="radio" name="varType" class="icheckS" value="02" ${po.varType=='01'?'checked':'' } />实时</li>
                   <li class="ChannelOut"><input type="radio" name="varType" class="icheckS" value="01"  ${po.varType=='02'?'checked':'' }/>非实时</li>
                </ul>
            </td>
        </tr>   
         <tr>
            <th><span>*</span>是否有效</th>
            <td colspan="4">
                <ul class="inputUl">
                   <li style="margin-right:58px;"><input type="radio" name="valid" class="icheckS" value="1" ${po.valid=='1'?'checked':'' } />是</li>
                   <li class="ChannelOut"><input type="radio" name="valid" class="icheckS" value="0"  ${po.valid=='0'?'checked':'' }/>否</li>
                </ul>
            </td>
        </tr>
 	</table>   
 	<input type="hidden" id="saveType" name="saveType" value="${po.saveType=='1'?'1':'0'}" />
	<input type="hidden" id="huashuid" name="id" value="${po.id}" />             
</div>
<div style="left: 60%;top: 60%; position: absolute;">
		<button  type="button" class="btn btn-primary" value="取消" id="cancel" onClick="javascript :history.back(-1);">取消</button>
		<button type="submit" class="btn btn-primary" value="提交" id="submit">提交</button>
</div>
 </div>
 </form>
 <script type="text/javascript">
 	
	//提交
	$(function() {
	var startName= $.trim($("#name").val());
	var saveType = $("#saveType").val();
	if(saveType=="1") {	
		$("#huashuForm").attr("action","../huashu/huashuUpdate1");
		
	}else{
		$("#huashuForm").attr("action","../huashu/huashuAdd1");
	}
	
	//Ajax判断变量名称是否已经存在
	 $("#name").focus(function(){
		$("#isExist").html("");
	}); 
	$("#name").blur(function(){
		var name=$.trim($("#name").val());
		var saveType=$("#saveType").val();
		 $.ajax({
			url:"../huashu/isExist",
			type: "POST",
			data:{
				"name":name
			},
			success: function(data){
				if(data!="null"&&data!="") {
					if(saveType=="0") {
						$("#isExist").html("变量名称已存在请重新填写");
						$("#name").val("");
					}else{
						if(data!=startName){
							$("#isExist").html("变量名称已存在请重新填写");
							$("#name").val("");
						}
					}
				
				}
			}
		});
	});
	//验证排序字段内容格式
	$("#ord").blur(
		function(){
			var ord=$("#ord").val();
			var reg=new RegExp("^[0-9]*$");
			  if(!reg.test(ord)){
				  $.ligerDialog.warn("排序内容只能是数字，请重新输入!");
			    }	
		}
	);
	
	//提交前验证
	$("#huashuForm").submit(function(){
		$("#mysqlName").val($.trim($("#mysqlName").val()));
		$("#remarks").val($.trim($("#remarks").val()));
		$("#ord").val($.trim($("#ord").val()));
		$("#name").val($.trim($("#name").val()));
		$("#realName").val($.trim($("#realName").val()));
		$("#content").val($.trim($("#content").val()));
		$("button.btn.btn-primary").attr("disabled",true); //屏蔽重复提交
	if($.trim($("#name").val())==""||$.trim($("#name").val())==null){
		$.ligerDialog.warn("请输入变量名称");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#name").val()).length>100){
			$.ligerDialog.warn("变量名称最多包含100个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if($.trim($("#content").val())==""||$.trim($("#content").val())==null){
		$.ligerDialog.warn("请输入变量内容");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#content").val()).length>100){
			$.ligerDialog.warn("变量内容最多包含100个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if($.trim($("#remarks").val())==""||$.trim($("#remarks").val())==null){
		$.ligerDialog.warn("请输入变量描述");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#remarks").val()).length>500){
			$.ligerDialog.warn("变量描述最多包含500个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if($.trim($("#ord").val())==""||$.trim($("#ord").val())==null){
		$.ligerDialog.warn("请输入排序内容");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#ord").val()).length>10){
			$.ligerDialog.warn("排序内容最多包含10个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if($.trim($("#realName").val())==""||$.trim($("#realName").val())==null){
		$.ligerDialog.warn("请输入映射行云字段");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#realName").val()).length>100){
			$.ligerDialog.warn("映射行云字段最多包含100个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if($.trim($("#mysqlName").val())==""||$.trim($("#mysqlName").val())==null){
		$.ligerDialog.warn("请输入mysql对应行云字段");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}else{
		if($.trim($("#mysqlName").val()).length>100){
			$.ligerDialog.warn("mysql对应行云字段最多包含100个字符");	
			$("button.btn.btn-primary").removeAttr("disabled");
			return false;
		}
	}
	if(!$("input[name=varType]").is(":checked")){
		$.ligerDialog.warn("请选择变量类型");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}
	if(!$("input[name=valid]").is(":checked")){
		$.ligerDialog.warn("请选择是否有效");
		$("button.btn.btn-primary").removeAttr("disabled");
		return false;
	}
	});
	});
	
 </script>
</body>
