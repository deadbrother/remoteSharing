var drData;
var amanager;
var ad,ar;
var parms = new Array();
var doType,rule_type_id;
$(function (){
	
	ad = options("dr","drsele","");
	ar = options("rr","rrsele","");
	doType= $("#doType").val();
	rule_type_id  = $("#rule_type_id").val();
	$("#drsele").change(function(){
		if($(this).val()!=null&&$(this).val().length>0){
			$("#ruleadd").addClass("l-button-brand").removeClass("l-button-disabled");
			$("#ruleadd").attr("disabled",false);
		}else{
			$("#ruleadd").removeClass("l-button-brand").addClass("l-button-disabled");
			$("#ruleadd").attr("disabled",true);
		}
	});

	doEditInfo(doType,rule_type_id);
	$("#rule").ligerForm({inputWidth: 200});
	$("#ruleadd").click(function() {
		 var DrType=$("#drseleid").val();
		 var ruleDesc=$("#ruleDesc").text();
		
		 conditionObj.taskCond(ruleDesc,"-1",function(condSql,condResume){
			 $("#ruleDesc").text(condResume);
			 $("#rulesql").val(condSql);
		 });

	 });
	$("#addFileds").click(function (){
		var DrType=$("#drseleid").val();
		var RrType=$("#rrseleid").val();
		if((DrType!=null&&DrType.length>=1)&&(RrType!=null&&RrType.length>=1)){
			if(RrType=="arv"){
				conditionObj.avgPersonCond(ruleDesc,function(condSql,condResume){
					save(DrType,"","arv",condSql,condResume);
			});
			}else if(RrType=="first"){
				addNewRow("first","1","2","3");
			}
		 }else if((DrType==null||DrType=="")&&(RrType!=null&&RrType!="")){
			alert("请先选择划配类型");
		 }else if((RrType==null||RrType=="")&&(DrType!=null&&DrType!="")){
			 alert("请选择规则分类");
		 }else if((DrType==null||DrType=="")&&(RrType==null||RrType=="")){
			 alert("请选择划配类型和规则分类");
		 }
	});
	
});
function  options(type,id,value){
	amanager = $("#"+id).ligerComboBox({
        width : 200,
        selectBoxWidth:200,
        initIsTriggerEvent: false,
        value:value,
        resize:true,
        url:"/epmwxwl/ruleType/option/"+type,
        onSelected :function(value){
        	$("#"+id+"id").attr("value",value);
	        if(type!=null&&type.length>=1&&type=="rr"){
	        	initGridTable(value,"");
	        }
        },
        onChangeValue : function(value){
        	$("#"+id+"id").attr("value",value);
	        if(type!=null&&type.length>=1&&type=="rr"){
	        	initGridTable(value,"");
	        }
        }
        
    });
	return amanager;
}
function doEditInfo(type,rule_type_id){
	if(type=="edit"){
		$.ajax({
			url: "/epmwxwl/ruleType/findById/"+rule_type_id,
			type: "POST",
			async: true,
			success: function(data) 
			{   
			    if(data!=null){
				    var jsonData=strToJson(data); 
				    ad.selectValue(jsonData.draw_type_id);
				    ar.selectValue(jsonData.res_type_id);
				    $("#drseleid").attr("value",jsonData.draw_type_id);
				    $("#rrseleid").attr("value",jsonData.res_type_id);
				    $("#ruleTypeName").attr("value",jsonData.rule_type_name);
				    $("#ruleDesc").html(jsonData.condition_resume);
				    $("#rulesql").attr("value",jsonData.condition_sql);
				    //加载分组信息表
				    doEditTableInfo(jsonData.res_type_id,jsonData.rule_type_id);
			    }
			}
	}); 
	}
}
function doEditTableInfo(type,rule_type_id){
	
	parms.push({"type":type,"rule_type_id":rule_type_id});
	var url="/epmwxwl/ruleType/findFields?type="+type+"&&rule_type_id="+rule_type_id;
	initGridTable(type,url);
}


var tagLayer;
var manager,a,l;
function getRuleInfo(RuleSql,RuleDesc){
	$("#rulesql").attr("value",RuleSql);
	$("#ruleDesc").html(RuleDesc);
}
function getTagInfo(Type,RuleName,filedSql,filedName){
	addNewRow(Type,RuleName,filedSql,filedName);
}
function initGridTable(Type,url){
	if((Type!=null&&Type.length>1)&&Type=="arv"){
		$("#maingridarv").show();
		$("#maingridfir").hide();
		a=$("#maingridarv").ligerGrid({
			width:"700",
			columns: [
			          { display: '分组名称', type: 'String', align: 'center', name: 'arvruleName' 
			          },
			          { display: '分组规则', name: 'arvfiledName', align: 'center', width: 200 },
			          { display: '分组规则(字段)', name: 'arvfiledSql', align: 'center',type: 'String' 
			          },
			          { display: '执行顺序', name: 'arvsort_num', align: 'center', type: 'String',render:function(rowdata,rowindex,value){
			        	  return rowindex+1;
			          }
			          },
			          { display: '调整顺序',name:'firdosort', align: 'center' ,render:function(rowdata,rowindex,value){
				        	var h=  "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"RuleImplement.move('"+rowindex+"','up','arv')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"RuleImplement.move('"+rowindex+"','down','arv')\" /> </div>";
				            return h;
				           }
				          },
			          { display: '操作', name: 'arvstutas', align: 'center', type: 'String',render: function (rowdata, rowindex, value){
			        	  var h = "<div id="+rowdata.res_type_id+"><a id='updateType' onclick=\"updateType('"+rowdata.res_type_id+"')\">修改</a>||<a style='cursor:pointer' onclick=\"RuleImplement.deleteRow('" + rowindex + "','arv')\">删除</a> </div>";
			        	  return h;
			          }
			          },
			          ],   
			          isScroll: false,
			          checkbox:false,
			          rownumbers:true,
			          url:url,
			          parms:parms,
			          usePager:false
		});		 
	}else if((Type!=null&&Type.length>1)&&Type=="first"){
		$("#maingridfir").show();
		$("#maingridarv").hide();
		l=$("#maingridfir").ligerGrid({
			width:"700",
			columns: [
			          { display: '字段名称', type: 'String', align: 'center', name: 'firruleName', editor:{type:"text"}
			          },
			          { display: '资源字段', name: 'firresFiledName', align: 'center', 
			        	  render: function (rowdata, rowindex, value){
			        		  value = value!=null&&value.length>0?value:"&nbsp;";
			        		  var s = "<div id='resc_"+rowindex+"'  onclick=\"RuleImplement.dialog('" + rowindex + "','resc_')\"  >"+value+"<span>&nbsp;</span></div>";
			        		  if(rowdata.isparent=="true"&&"root"!=rowdata.id){
			        			  s="";
			        		  }
			        		  return s;				
			        	  }
			        	  
			          },
			          { display: '资源字段Sql', name: 'firresFiledSql', align: 'left', hide:true,width:"0"
			          },
			          { display: '责任体字段', name: 'firDutyFiledName', align: 'center',type: 'String' , 
			        	  render: function (rowdata, rowindex, value){
			        		  value = value!=null&&value.length>0?value:"&nbsp;";
			        		  var s = "<div id='resp_"+rowindex+"'  onclick=\"RuleImplement.dialog('" + rowindex + "','resp_')\"  >"+value+"<span>&nbsp;</span></div>";
			        		  if(rowdata.isparent=="true"&&"root"!=rowdata.id){
			        			  s="";
			        		  }
			        		  return s;				
			        	  }
			          },
			          { display: '责任体字段Sql', name: 'firDutyFiledSql', align: 'left', hide:true,width:"0"
			          },
			          { display: '执行顺序', name: 'firsort_num', align: 'center', type: 'String',render:function(rowdata,rowindex,value){
			        	  return rowindex+1;
			          }
			          },
			          { display: '调整顺序',name:'firdosort', align: 'center' ,render:function(rowdata,rowindex,value){
			        	var h=  "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"RuleImplement.move('"+rowindex+"','up','first')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"RuleImplement.move('"+rowindex+"','down','first')\" /> </div>";
			            return h;
			           }
			          },
			          { display: '操作', name: 'firstutas', align: 'center', type: 'String',render: function (rowdata, rowindex, value){
			        	  var h = "<a style='cursor:pointer' onclick=\"RuleImplement.deleteRow('" + rowindex + "','first')\">删除</a> </div>";
			        	  return h;
			          }
			          },
			          ],   
			          isScroll: false,
			          checkbox:false,
			          rownumbers:true, 
			          enabledEdit: true ,
			          url:url,
			          parms:parms,
			          usePager:false
			          
			          
		});		 
	}else if(Type==null||Type==""){
	}else{
		$("#maingridarv").hide();
		$("#maingridfir").hide();
	}
}
var detailWin;
var RuleImplement = {
		dfindex:null,
		timerNum:0,
		arr:[],
		dialog:function(rowindex,ftype){
			 var DrType=$("#drseleid").val();
			 var RrType=$("#rrseleid").val();
			 var rowdata=l.getRow(rowindex);
			 var filedName;
			 if(ftype=="resc_"){
				 filedName=rowdata.firresFiledName;
			 }else if(ftype=="resp_"){
				 filedName =rowdata.firDutyFiledName;
			 }  
			   var ruleDesc="";
			   if(ftype=="first"){
			    ruleDesc=filedName;
			   }else if(ftype=="arv"){
				ruleDesc=rowdata.arvfiledName;  
			   }
				conditionObj.avgPersonCond(ruleDesc,function(condSql,condResume){
					if(RrType=="first"){
						save(rowindex,ftype,"first",condSql,condResume);
					   }else if(RrType=="arv"){
						 save(DrType,"","arv",condSql,condResume);
					   }
				});
			 if(filedName!=null&&filedName.length>=1){
				 detailWin.frame.initEditData(filedName);
			 }
		},
		deleteRow :function(rowindex,rtype){
			if(rtype=="first"){
				l.deleteRow(rowindex);	
			}else if(rtype=="arv"){
				a.deleteRow(rowindex);
			}
			
		},
		move:function(rowindex,mtype,rtype){
			if(mtype=="up"){
			if(rtype=="first"){
				l.up(rowindex);
			}else if(rtype=="arv"){
				a.up(rowindex);
			}
			}else if(mtype=="down"){
				if(rtype=="first"){
					l.down(rowindex);
				}else if(rtype=="arv"){
					a.down(rowindex);
				}	
			}
		},
};
function save(rowindex,ftype,rtype,ruleSql,ruleDesc){
	if(rtype=="first"){
		if(ftype=="resc_"){
			l.updateCell("firresFiledName", ruleDesc, rowindex);
			l.updateCell("firresFiledSql",ruleSql,rowindex);
		}else if(ftype=="resp_"){
			l.updateCell("firDutyFiledName",ruleDesc,rowindex);
			l.updateCell("firDutyFiledSql",ruleSql,rowindex);
		}
	}else if(rtype=="arv"){
		addNewRow(rtype,"",ruleSql,ruleDesc);
	}
	detailWin.hide();
}
function addNewRow(Type,RuleName,filedSql,filedName){
	if(Type=="arv"){
		 a.addRow({
			 arvruleName : RuleName,
			 arvfiledName:filedName,
			 arvfiledSql:filedSql,
			 arvsort_num:"",
			 arvdosort:"",
			 arvstutas:''
	     });
	}else if(Type="first"){
		l.addRow({
			firruleName:"",	
			firresFiledName:"",
			firDutyFiledName:"",
			firsort_num:"",
			firdosort:"",
			firstutas:""
		});
	}
}
function JsonSele (text,id){
	var str="";
	return str+"{text:'"+text+"',id:'"+id+"'}";
}

function strToJson(str)
{
     var json = eval('(' + str + ')');
     return json;
}
