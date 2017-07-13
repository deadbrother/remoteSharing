<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<title>规则函数设置</title>
</head>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/cond/cond.js" type="text/javascript"></script>
<style type="text/css">
.conbtn {width:35px;padding:6px;}
.contentformula {text-align:center;overflow: auto;height:480px;padding:10px;}
.center {
  width: auto;
  display: table;
  margin-left: auto;
  margin-right: auto;
}
.text-center {
  text-align: center;
}
</style>
<body>
 <ul id="leftTree" class="ztree"></ul>
</body>
</html>
<script>
$(function(){
	var setting = {
        view: {
            dblClickExpand: false,
            showLine: false
        }, 
        data: {
            key: {
                title: "name"
            },
            keep: {
				leaf: true,
				parent: true
			},
            simpleData: {
                enable: true,
                idKey:"id",
                pIdKey:"pid"
           }
        },
        edit: {
			drag:{
				isCopy: false,
				isMove: true
			},
			enable: false,
		},
        callback: {
            onDblClick: function(event,treeId,treeNode){
            	symbol("【"+treeNode.name+"】");
            },
            onDrop:function(event, treeId, treeNodes, targetNode, moveType){
            	return false;
            }
        }
    };
    //请求树状数据，初始化树
	$.ajax({
        type: 'Get',
        url: '${pageContext.request.contextPath}/js/wxwl/cond/tag.json',
        dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
        success: function (data) {
            $.fn.zTree.init($("#leftTree"), setting, data);

        },
        error: function (msg) {

            alert(" 数据加载失败！" + msg);
        }
    });
});
</script>