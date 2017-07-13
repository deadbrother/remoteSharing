
$(function(){
	var gridManager;
	gridManager=$("#maingrid").ligerGrid({
		columns: [
		          { display: '部门名称', type: 'String', align: 'center', name: 'clientsetname',editor:{type:"text"} 
		          },
		          { display: '划配规则', name: 'rule_type_name', align: 'center', width: 200, editor:{type:"text"}},
		          { display: '用户筛选条件', name: 'cond_resume', align: 'center',type: 'String' ,editor:{type:"text"}
		          },
		          { display: '制定部门', name: 'dept_id', align: 'center', type: 'String'
		          },
		          { display: '目标部门',name:'target_dept_id', align: 'center' ,editor:{type:"text"}
			      },
		          { display: '创建人', name: 'creatuserid', align: 'center', type: 'String'
		          },
		          { display: '调整顺序', name: 'arvstutas', align: 'center', type: 'String',render:function(rowdata,rowindex,value){
			        	var h=  "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"RuleImplement.move('"+rowindex+"','up','arv')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"RuleImplement.move('"+rowindex+"','down','arv')\" /> </div>";
			            return h;
			           }
		          },
		          ],   
		          isScroll: false,
		          checkbox:true,
		          rownumbers:false,
		          usePager: true ,
		          url:"../distribution/findAllAjax",
		          parms:{ "dept_id":"root" }
	});	
});