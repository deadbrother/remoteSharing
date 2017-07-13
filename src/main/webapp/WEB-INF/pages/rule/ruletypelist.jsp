<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类信息</title>     
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    var  Data ;
    var typeLayer;
    var list = strToJson('${JSONStr}');
    Data={Rows : list};
    function strToJson(str)
    {
         var json = eval('(' + str + ')');
         return json;
    }
        $(function ()
        {
 
            $("#maingrid").ligerGrid({
                columns: [
                { display: '主键', type: 'String', name: 'res_type_id' 
                },
                { display: '名称', name: 'res_type_name', align: 'left', width: 200 },
                { display: '排序', name: 'sort_num', align: 'right',type: 'String' 
                },
                { display: '状态', name: 'stutas', align: 'right', type: 'String'
                },
                { display: '操作', align: 'center' ,render: function (rowdata, rowindex, value){
		        	  //var h = "<div id="+rowdata.res_type_id+"><a id='updateType' href='../resRuleType/updateJsp/"+rowdata.res_type_id+"'>修改</a>||<a href='../resRuleType/delete/"+rowdata.res_type_id+"'>删除</a> </div>";
		        	  var h = "<div id="+rowdata.res_type_id+"><a id='updateType' onclick=\"updateType('"+rowdata.res_type_id+"')\">修改</a>||<a href='../resRuleType/delete/"+rowdata.res_type_id+"'>删除</a> </div>";
		        	  return h;
		          }
                }
                ],   isScroll: false,
                data: Data,checkbox:false,rownumbers:true
            });
            
            
            
            //新增类型
            $("#addType").click(function() {
        		 typeLayer=layer.open({
        			closeBtn : 1,
        			shadeClose : false,
        			type: 2,
        			area: ['300px', '300px'],
        			shadeClose: true, //点击遮罩关闭
        			fix : false, // 不固定
        			maxmin : true,
        			content: "../resRuleType/saveJsp"
        		});
        	});
            //修改类型
            
            function updateType(res_type_id){
            	 typeLayer=layer.open({
        			closeBtn : 1,
        			shadeClose : false,
        			type: 2,
        			area: ['300px', '300px'],
        			shadeClose: true, //点击遮罩关闭
        			fix : false, // 不固定
        			maxmin : true,
        			content: "../resRuleType/updateJsp/"+res_type_id
        		});
            }
            
        });
        function closeTypelayer(){
        	layer.close(typeLayer);
        }
    </script>
    <body>
    <div align="right">
   		 <button class="l-button l-button-brand btn_add" id="addType" >&nbsp;新增类型</button>
    </div>
    <div id="maingrid">  </div>
  </body>