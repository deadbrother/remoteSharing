/**
 * 
 */
$(function(){
	/*html字符串转为dom*/
	  $('td #escapeXml').each(function(){
		  	$(this).html($(this).text())
	  		});
	  $('td #escapeXml2').each(function(){
		  	$(this).html($(this).text())
	  		});
	  /*html字符串转为dom结束*/
	  $("#advancedActivityBtn").click(function(){
		    $("#advancedActivity").toggle();
		    });
		 
	  if($("#check").val() == 1 ){
	  			$("#return-btn").attr("class","hidden");
	  		}
		/* 高级模式工单配置规则 */
		    
		    if($("#radioCheck4ChanneLSpecial").val()=="1"){
		    	$('.li1.toggole input.icheckS').iCheck('check'); 
		    	$("#explainTable").show();    	
		    }
		    if($("#radioCheck4PopSpecial").val()=="1"){
		    	$('.li1.pop input.icheckS').iCheck('check'); 
		    	$("#popExplainTable").show();    	
		    }
		    if($("#radioCheck4TelSpecial").val()=="1"){
				$('.li1.tel input.icheckS').iCheck('check'); 
			    $("#telExplainTable").show();    	
		    }
		    /*一次性活动查询保存的用户数*/
		    if($("#activityCycle").val()=="3"){
		    	$("#orderIsValid").addClass("hide");
		    	queryUsernum($("#activityId").val(),function(){
		    		$("[numtd]").each(function(){
		    			$(this).text("加载中");
		    		});
		    	},function(val){
		    		var list = eval("("+val+")");
		    		for(var key in list){
		    			var obj = list[key];
		    			$("#" + obj.mappedId).text(obj.usernum);
		    		}
		    	});
		    }else{
		    	$("#orderIsValid").removeClass("hide");
			    if($("#userGroupId").val()){
			    	refreshUserGroupNum();
			    }
		    }	
		    var mstDetail=$("#messageSendTimeDetail").val();
		    var messageDetail="";
		    if(mstDetail!=null&&mstDetail!=""){
		    	var mst = mstDetail.split(",");
		    	for(var i=0;i<mst.length;i++){
		    		var array=mst[i].split("-");
		    			if(messageDetail==""){
		    			   messageDetail = array[0][0]+array[0][1]+":"+array[0][2]+array[0][3]+"-"+array[1][0]+array[1][1]+":"+array[1][2]+array[1][3];
		    			}else{
		    			   messageDetail = messageDetail + ","+array[0][0]+array[0][1]+":"+array[0][2]+array[0][3]+"-"+array[1][0]+array[1][1]+":"+array[1][2]+array[1][3];
		    			}
		    	}
		    	$("#mstDetail").html(messageDetail);
		    }
		    //动态控制租户隐藏功能
		    hideFunction();
		    //渠道动态控制
		    hideChannel();
});
function hideChannel(){
	var channelIdArray = $("#hideChannelId").val();
	var channelId = channelIdArray.substring(1,channelIdArray.length-1);
	if(channelIdArray != null && channelIdArray.length>0){
		var channelIds = channelId.split(",");
		for(var i=0;i<channelIds;i++){
			$("#channelIds"+channelIds[i]).hide();
			$("#channelIdsgj"+channelIds[i]).hide();
		}
	}
}
function hideFunction(){
	var hideId = $("#hideFunctionId").val();
	if(hideId != null && hideId != ""){
		var idArray = hideId.split(",");
		for(var i=0;i<idArray.length;i++){
			$("#"+idArray[i]).hide();
		}
	}
}
    
/*    var k=1;	
	function addIssuedRule(){
		     var delid="del"+k;
			 var newdivid="deldiv"+k;
			 var newdiv1="#"+newdivid;
			 var tdid="tdid"+k;
			 var finid="#"+tdid;
		     var oSel = document.getElementById("orderIssuedRule");
			 var newdiv="<tr id='"+newdivid+"' name='newdiv'><td class='ar'>工单下发规则</td></tr>"
			 var aaa="<td class='ar'><button class='btn btn-primary term' id='"+delid+"' "+"onclick='delIssuedRule(this)'>删除</button></td>"
			 console.log(aaa);
             var oNewSel = oSel.cloneNode(true);
			  $("#selectedRule").append(newdiv);
			// $(newdiv1).append("<div name='order'>第"+k+"优先级"+"</div>");
			 $(newdiv1).append("<td colspan='2' id='"+tdid+"' name='order'></td>");
			 oNewSel.setAttribute("id","orderIssuedRule"+k);	
             $(finid).append(oNewSel);	
			 $(newdiv1).append(aaa);
			  k++;
	}
	function getSelectRule(){
		var str;
		var i=0;
		var name=document.getElementsByName("IssuedRule");
		$("select[name=IssuedRule] option:selected").each(function(){
			if($(this).val()==null||$(this).val()==""){
				return;
			}
		 if(i==0){
			  str=$(this).val();
			  i=1;
		 }else{str+=","+$(this).val();}  
         });
		 $("#newrule").val(str);
		
	}
	
	function delIssuedRule(ele){
		   // alert(ele);
		   // $(ele).empty();
		    var object= ele.parentNode.parentNode.parentNode;
			object.removeChild(ele.parentNode.parentNode);
			--k;
			
		}*/
	
	// 客户经理界面优化
    $(document).ready(function(){
    	 $("#selectData").iCheck({
 	        labelHover : false,
 	        cursor : true,
 	        checkboxClass : 'icheckbox_square-blue',
 	        radioClass : 'iradio_square-blue',
 	        increaseArea : '20%'
 	    }).on('ifChecked', function(event){
 	       // $("#content1").attr("class","");
 	        $("#content2").attr("class","");
 	        $("#content3").attr("class","btn btn-primary term");
 	        
 	    }).on('ifUnchecked', function(event){
 	       // $("#content1").attr("class","hidden");
 	        $("#content2").attr("class","hidden");
 	        $("#content3").attr("class","btn btn-primary term hidden");
 	    });
    	 
    	 $("#selectData2").iCheck({
  	        labelHover : false,
  	        cursor : true,
  	        checkboxClass : 'icheckbox_square-blue',
  	        radioClass : 'iradio_square-blue',
  	        increaseArea : '20%'
  	    }).on('ifChecked', function(event){
  	        $("#content4").attr("class","form-control");
  	        
  	    }).on('ifUnchecked', function(event){
  	        $("#content4").attr("class","form-control hidden");
  	    });
    	 
    	
    });
	
    
  $(document).ready(function(){
    	
    	 hideAndShow("FrontLineData","FrontLineContent","FrontLineContent1");
    	 hideAndShow("WebChatSelectData","WebChatContent","WebChatContent1");
    	 hideAndShow("WebOfficeSelectData","WebOfficeContent","WebOfficeContent1");
    	 hideAndShow("HandOfficeSelectData","HandOfficeContent","HandOfficeContent1");
    	 hideAndShow("WoWindowSelectData","WoWindowContent","WoWindowContent1");
    	 hideAndShow("LocalMessageSelectData","LocalMessageContent","LocalMessageContent1");
    	 hideAndShow("PrivateData","PrivateContent","PrivateContent1");
    	 hideAndShow("SocialData","SocialContent","SocialContent1");
    	 $("#huashuData").iCheck({
  	        labelHover : false,
  	        cursor : true,
  	        checkboxClass : 'icheckbox_square-blue',
  	        radioClass : 'iradio_square-blue',
  	        increaseArea : '20%'
  	    }).on('ifChecked', function(event){
  	        $("#content4").attr("class","form-control");
  	        
  	    }).on('ifUnchecked', function(event){
  	        $("#content4").attr("class","form-control hidden");
  	    });
    });
	     // 获取客户经理界面条件筛选sql
        function chooseCondition(id,numId) {
		var chooseId="#"+id+"Id";
		var chooseSql="#"+id+"Sql";
	    conditionObj.taskCond("","2",function(sql, resume) {
		$(chooseId).val(resume);
		$(chooseSql).val(sql);
	     });
	    jQuery("#"+numId).html(getUserGroupNumberByChoice($("#userGroupId").val(),$(chooseSql).val()));
        }
        function hideAndShow(first,second,third){
        	 var firstId="#"+first;
        	 var sccondId="#"+second;
        	 var thirdId="#"+third;
        	 $(firstId).iCheck({
      	        labelHover : false,
      	        cursor : true,
      	        checkboxClass : 'icheckbox_square-blue',
      	        radioClass : 'iradio_square-blue',
      	        increaseArea : '20%'
      	    }).on('ifChecked', function(event){
      	       // $("#content1").attr("class","");
      	        $(sccondId).attr("class","");
      	        $(thirdId).attr("class","btn btn-primary term");
      	        
      	    }).on('ifUnchecked', function(event){
      	       // $("#content1").attr("class","hidden");
      	        $(sccondId).attr("class","hidden");
      	        $(thirdId).attr("class","btn btn-primary term hidden");
      	    });
        }
         // 修改时回显选中的渠道
        $(document).ready(function(){
        
     	   var channelCheck=$("#selectChannelId").val().split(",");
     	   var channel=document.getElementsByName("channel");
     	   for(var i=0;i<channelCheck.length;i++){
     		   for(var j=0;j<channel.length;j++){
     			   if(channelCheck[i]==channel[j].value){
     				   var id="#"+channelCheck[i];
     				   $(id).iCheck('check');
     				  var showDiv="#channelShow"+channelCheck[i];
     				   $(showDiv).show();
     				   break;
     			   }
     		   }
     	   }
     	
        });
    
    
        // 修改时不能操作渠道
        $(document).ready(function(){
         var state=$("#activityState").val();
         if(state==11){
        	 var channel=$("#selectChannelId").val().trim();
             if(channel.length!=0){
            	 $("input[name='channel']").each(function(e){
            		 $(this).attr("disabled",true);
            		});  	
             }
         }
       
        });  
      /* 用户群使用方法一 */
        function getUserGroupNumberByChoiceAsync(orgPath,userGroupId,choice,func,funcSuccess) {
        	if(choice!='' && choice){
        		choice=" and "+choice;
        	}
        	if(func){
        		func();
        	}
        	$.ajax({
        		url : "getUserGroupNumberByChoice",
        		type : "POST",
        		data : {"orgPath":orgPath,"userGroupId":userGroupId,"choice":choice},
        		async : true,
        		success : function(data) {
        			if(funcSuccess){
        				funcSuccess(data.success);
        			}
        		}
        	});
        }
        /* 用户群使用方法二 */
        function getUserGroupNumberChannelAsync(orgPath,userGroupId,func,funcSuccess) {
        	if(func){
        		func();
        	}
        	$.ajax({
        		url : "../activity/getUserGroupNumber?userGroupId=" + userGroupId + "&orgPath=" + orgPath,
        		type : "POST",
        		async : true,
        		success : function(data) {
        			if(funcSuccess){
        				funcSuccess(data.success);
        			}
        		}
        	});
        }  
        /* 用户群数 */
        function refreshUserGroupNum(){
        	getUserGroupNumberByChoiceAsync($("#orgPath").val(),$("#userGroupId").val(),"",function(){
        		jQuery("#userGroupNum").html("加载中");
        		jQuery("#userGroupNumAll").html("--");
        		jQuery("#userGroupStrategyNum").html("--");
        		jQuery("#userGroupPopNum").html("--");
        		jQuery(".ChannelOut_activity span[id^=userGroupChannelNum]").html("--")
        	},function(val){
        		jQuery("#userGroupNum").html(val);
        		jQuery("#userGroupNumAll").html(val);
        		if(jQuery("#userGroupStrategyNum").html()=="--"){
        			jQuery("#userGroupStrategyNum").html(val);
        		}
        		if(jQuery("#userGroupPopNum").html()=="--"){
        			jQuery("#userGroupPopNum").html(val);
        		}
        		jQuery(".ChannelOut_activity span[id^=userGroupChannelNum]").html(val)
        	})
        	
        	getUserGroupNumberChannelAsync($("#orgPath").val(),$("#userGroupId").val(),function(){
        		jQuery(".IndexBlock_activity span[id^=userGroupNum]").html("--")
        		
        	},function(val){
        		var arrayKey = val[0];
        		var arrayVal = val[1];
        		var keys = arrayKey.split(";");
        		var values = arrayVal.split(";");
        		
        		var numAll= 0;
        		var channelAll=0;
        		for(var i=0;i<keys.length-1;i++){
        			numAll+=parseInt(values[i]);
        			if(jQuery(".IndexBlock_activity #userGroupNum"+keys[i]).size()>0){
        				jQuery(".IndexBlock_activity #userGroupNum"+keys[i]).html(values[i]);
        				channelAll+=parseInt(values[i])
        			}
        			
        		}
        		jQuery(".IndexBlock_activity #userGroupNumOther").html(numAll-channelAll);
        		channelNumberShow();
        	});
        	
        	outerUseRefresh();//规则列表刷新
        	outerUseRefreshPop();
        };
        
function channelNumberShow(){
	$("input[name^='filterConditionSql']").each(function(){
		if($(this).val()!=''){
			/*var abc=getUserGroupNumberByChoice($("#userGroupId").val(),$(this).val());
			$(this).parent().parent().prev().find("span").html(abc);*/
			var numSpan = $(this).parent().parent().prev().find("span");
			getUserGroupNumberByChoiceAsync($("#orgPath").val(),$("#userGroupId").val(),$(this).val(),function(){
				numSpan.html("渠道条件筛选加载中...");
			},function(val){
				numSpan.html(val);
			});
		}
		});
}

/**
 * 根据用户群id 和附加sql 进行用户数统计
 * @param userGroupId
 * @param choice
 */
function getUserGroupNumberByChoice(orgPath,userGroupId,choice) {
	if(choice!=''&& choice){
		choice=" and "+choice;
	}
	var result;
	$.ajax({
		url : "getUserGroupNumberByChoice",
		type : "POST",
		data : {"orgPath":orgPath,"userGroupId":userGroupId,"choice":choice},
		async : false,
		success : function(data) {
			result= data.success;
		}
	});
	return result;
}
/**
 * 在dom节点之外调用规则列表刷新
 */
function outerUseRefresh(){
	
	obj = $(":input[name='po.frontlineChannelPo.channelSpecialFilterList[0].filterName'][rulename]");
	var frontFilterConditionSql = $(":input[name='filterConditionSql1']").val();
	if(frontFilterConditionSql == undefined){
		frontFilterConditionSql = "";
	}
	ruleNumberChange(obj,frontFilterConditionSql);

}
function outerUseRefreshPop(){
	
	obj = $(":input[name='popSpecialFilterList[0].filterName'][rulename]");
	var frontFilterConditionSql = $(":input[name='filterConditionSql4']").val();
	if(frontFilterConditionSql == undefined){
		frontFilterConditionSql = "";
	}
	ruleNumberChange(obj,frontFilterConditionSql);

}
/**
 * 规则列表数加载调用
 * @param obj
 */
/*function ruleNumberChange(obj){
	//刷新用户数
	var frontFilterConditionSql = $("#FrontLineContent1Sql").val();
	if(typeof(frontFilterConditionSql) == undefined){
		frontFilterConditionSql = "";
	}
	var choices="";
	jQuery(obj).parent().parent().parent().find("tr").each(function(){
		var target = jQuery(this).children()[3];
		var targetVal = jQuery(target).find("[sql]").val()
		if(targetVal != null && typeof(targetVal) != undefined){
			choices = choices + targetVal + ",";
		}
	});
	if(choices != ''){
		choices = choices.substring(0,choices.length-1);
	}
	var resultList = getUserGroupNumberByRuleChoices($("#userGroupId").val(),
			choices,frontFilterConditionSql);
	
	jQuery(obj).parent().parent().parent().children().each(function(){
		var obb = jQuery(this);
		var ord = obb.find("[ord]");
		if(resultList != null){
			$.each(resultList,function(i,result){
				if(result.flag == ord.val()){
					obb.find("[numtd]").html(result.CN);
					return false;
				}
				obb.find("[numtd]").html("0");
			});
		}else{
			obb.find("[numtd]").html("系统请求错误，请联系管理员人员进行处理");
		}
	});
	
}*/

  
  //异步调用方法
function ruleNumberChange(obj,frontFilterConditionSql){
	//刷新用户数
	
	var choices="";
	jQuery(obj).parent().parent().parent().find("tr").each(function(){
		var target = jQuery(this).children()[3];
		var targetVal = jQuery(target).find("[sql]").val();
		if(targetVal != null && typeof(targetVal) != undefined){
			choices = choices + targetVal + ";";
		}
	});
	if(choices != ''){
		choices = choices.substring(0,choices.length-1);
	}
	var allTr = jQuery(obj).parent().parent().parent().children();
	getUserGroupNumberByRuleChoices($("#userGroupId").val(),$("#orgPath").val(),
			choices,frontFilterConditionSql,function(){
			$(allTr).each(function(){
				jQuery(this).find("[numtd]").html("规则数加载中...");
			});
		},function(val){
			$(allTr).each(function(){
				var obb = jQuery(this);
				var ord = obb.find("[ord]");
				if(val != null){
					if(val == ""){
						obb.find("[numtd]").html("0");
						return;
					}
					$.each(val,function(i,result){
						if(result.flag == ord.val()){
							obb.find("[numtd]").html(result.CN);
							return false;
						}
						obb.find("[numtd]").html("0");
					});
				}else{
					obb.find("[numtd]").html("系统请求错误，请联系管理员进行解决");
				}
			});
		});

}

/**
 * 根据用户群id 和多附加sql条件 进行用户数统计
 * @param userGroupId
 * @param choices
 */
/*function getUserGroupNumberByRuleChoices(userGroupId,choices,frontFilterConditionSql) {
	if(choices!=''&& choices){
	choices=" and "+choices;
}
var result;
$.ajax({
	url : "getUserGroupNumberByRuleChoices",
	type : "POST",
	data : {"userGroupId":userGroupId,"choice":choices,"po.frontlineChannelPo.filterConditionSql":frontFilterConditionSql},
		async : false,
		success : function(data) {
			result= data.success;
		}
	});
	return result;
}*/


 	//异步加载方法
  function getUserGroupNumberByRuleChoices(userGroupId,orgPath,choices,frontFilterConditionSql,func,funcSuccess) {
	if(func){
		func();
	}
	$.ajax({
		url : "getUserGroupNumberByRuleChoices",
		type : "POST",
		data : {"userGroupId":userGroupId,"orgPath":orgPath,"choice":choices,"po.frontlineChannelPo.filterConditionSql":frontFilterConditionSql},
		async : true,
		success : function(data) {
			if(funcSuccess){
				funcSuccess(data.success);
			}
		}
	});
}
  function queryUsernum(activityId,func,funcSuccess) {
		if(func){
			func();
		}
		$.ajax({
			url : "queryUsernum",
			type : "POST",
			data : {"po.activityId":activityId},
			async : true,
			success : function(data) {
				if(funcSuccess){
					funcSuccess(data);
				}
			}
		});
	}
function historyBack(){
	location.href = "../activity/main"; 
}
function loadXMLString(txt) 
{
    try //Internet Explorer
      {
          xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
          xmlDoc.async="false";
          xmlDoc.loadXML(txt);
          //alert('IE');
          return(xmlDoc); 
      }
    catch(e)
      {
          try //Firefox, Mozilla, Opera, etc.
            {
                parser=new DOMParser();
                xmlDoc=parser.parseFromString(txt,"text/xml");
             //alert('FMO');
                return(xmlDoc);
            }
          catch(e) {alert(e.message)}
      }
    return(null);
}
