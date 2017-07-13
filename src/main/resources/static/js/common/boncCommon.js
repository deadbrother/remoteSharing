$(function(){

    //icheck模拟单选多选
    $('input.icheckS').iCheck({
        labelHover : false,
        cursor : true,
        checkboxClass : 'icheckbox_square-blue',
        radioClass : 'iradio_square-blue',
        increaseArea : '20%'
    });

    //bootstrap气泡弹出层
     $("[data-toggle='tooltip']").tooltip();

    //活动类型显示隐藏控制
    if( $(".ChannelOut input.icheckS").prop("checked")==true){
    	$(".mon").attr("class","mon");
    };
        $(".ChannelOut input.icheckS").on('ifChecked', function(event){
            //选中时要做的事
        	$("#activityCycleType").iCheck("uncheck");
        	$(".mon").attr("class","mon");
         
        }).on('ifUnchecked', function(event){
            //取消选中时要做的事
        	 $(".mon").attr("class","showInput mon");
        });

       
        
        
   // 活动类型显示隐藏控制
       $("#activityCycleType").iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            //选中时要做的事
        	  $(".mon").attr("class","showInput mon");
        	  $(".ChannelOut input.icheckS").iCheck("uncheck");
        	  $("#isMonth").html("日");
        	  $("input[name='po.orderCycle']").val("1");
        	  $("#orderIsValid").addClass("hide");
        	  $("#orderRuleUpdate").addClass("hidden");
        }).on('ifUnchecked', function(event){
            //取消选中时要做的事
        	 $(".ChannelOut input.icheckS").iCheck("check");
        	$(".mon").attr("class","mon");
        	$("#month").iCheck("check");
        	
        });
       
       $("#month").on('ifChecked', function(event){
           //选中时要做的事
       	  $("#isMonth").html("月");
       	  $("input[name='po.orderCycle']").val("3");
       	$("#orderIsValid").removeClass("hide");
       	$("#orderRuleUpdate").removeClass("hidden");
       });
       
       $("#activityDayCycle").on('ifChecked', function(event){
           //选中时要做的事
       	  $("#isMonth").html("日");
       	$("input[name='po.orderCycle']").val("7");
       	$("#orderIsValid").removeClass("hide");
       	$("#orderRuleUpdate").removeClass("hidden");
       });
        
        
        
    //icheck advancedActivity.html隐藏处
        $('.li1.toggole input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#explainTable").show();
        }).on('ifUnchecked', function(event){
            $("#explainTable").hide();
        });
        
        $('.li1.pop input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#popExplainTable").show();
        }).on('ifUnchecked', function(event){
            $("#popExplainTable").hide();
        });

        $('.li1.tel input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#telExplainTable").show();
        }).on('ifUnchecked', function(event){
            $("#telExplainTable").hide();
        });
        
        $('.li2.front input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#advanceActivity_frontlineChannel").show();
        }).on('ifUnchecked', function(event){
            $("#advanceActivity_frontlineChannel").hide();
        });
        
        
        $('.li2.message input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#advanceActivity_message").show();
        }).on('ifUnchecked', function(event){
            $("#advanceActivity_message").hide();
        });
        
        $('.li2.messageZB input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#advanceActivity_messageZB").show();
        }).on('ifUnchecked', function(event){
            $("#advanceActivity_messageZB").hide();
        });
        
    //各渠道指标块
    $(function(){
        var $indexBlockList =$(".IndexBlock_activity ol li");
        $indexBlockList.eq(0).addClass("first-child");//各渠道指标总和样式,读取顺序勿动
        var $firstBlockWidth = $indexBlockList.eq(0).width()+14;
        var $lt3BlockWidth = $(".IndexBlock_activity").width()-$firstBlockWidth-13;
        $(".IndexBlock_activity h4").css("padding-left",$firstBlockWidth); //各渠道指标块自适应 副标题位置
        $(".IndexBlock_activity li:lt(4)").not($indexBlockList.eq(0)).css("width",$lt3BlockWidth/3); //第一排渠道指标块自适应
        $(".IndexBlock_activity ol li:gt(3)").addClass("wAuto");//第二排或更多渠道指标块自适应
        $indexBlockList.each(function(index, obj){
            $(this).addClass('ColorNo0'+(index+1));//渠道指标块颜色追加class类
        });
    });
    //各渠道块内容
        $(".ChannelOut_activity").eq(0).css("margin-top", "16px");//第一个渠道内容给出间距
        $(".ChannelOut_activity .AreaIn").hide();//默认所有渠道块隐藏
        //$(".ChannelOut_activity h5:gt(1)").addClass("unbordered");//渠道块头部线处理
        $(".ChannelOut_activity h5:last").removeClass("unbordered");
        $(".ChannelOut_activity h5").each(function(index, obj){
            $(this).addClass('ColorNo0'+(index+1));//各渠道内容追加class类
        });
        $('.ChannelOut_activity input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $(this).parents("h5").siblings(".AreaIn").slideDown(100);
            $(this).parents("h5").removeClass("unbordered");
            if($("#5").prop("checked")==true){
       		 $("#orderRuleTable").attr("style","");
       		$("#orderRuleInfo").attr("style","display:none;");
       		$("#advanceFrontLine").attr("style","");
       		if($("#frontLineisUniSet").prop("checked")==true){
       			$("#advanceActivity_frontlineChannel").attr("style","");
       		}
       	       		
       	 }
            if($("#7").prop("checked")==true){
       			$("#localMessageInfo").attr("style","");
       			if($("#localMessageisUniSet").prop("checked")==true){
       				$("#advanceActivity_message").attr("style",""); 
           		}	
       		} 
            if($("#8").prop("checked")==true){
         		$("#orderPopRuleTable").attr("style","");
           	    $("#popRuleInfo").attr("style","display:none;");
      		}
            if($("#12").prop("checked")==true){
         		$("#telPhoneTable").attr("style","");
           	    $("#telPhoneInfo").attr("style","display:none;");
      		}
            if($("#3").prop("checked")==true){
       			$("#localMessageInfoZB").attr("style","");
       			if($("#ZBMessageisUniSet").prop("checked")==true){
       				$("#advanceActivity_messageZB").attr("style",""); 
           		}	
       		} 
            
        }).on('ifUnchecked', function(event){
            $(this).parents("h5").siblings(".AreaIn").slideUp(200);
            $(this).parents("h5").addClass("unbordered");
            if($("#5").prop("checked")==false){
       		$("#orderRuleTable").attr("style","display:none;");
       		$("#orderRuleInfo").attr("style","");
       		$("#advanceFrontLine").attr("style","display:none;");    		
       		$("#advanceActivity_frontlineChannel").attr("style","display:none;");  
       	    }
            if($("#7").prop("checked")==false){
            	$("#localMessageInfo").attr("style","display:none;");
            	$("#advanceActivity_message").attr("style","display:none;"); 
       		}
            if($("#8").prop("checked")==false){
         		$("#orderPopRuleTable").attr("style","display:none;");
           	    $("#popRuleInfo").attr("style","");
      		}
            if($("#12").prop("checked")==false){
         		$("#telPhoneTable").attr("style","display:none;");
           	    $("#telPhoneInfo").attr("style","");
      		}
            if($("#3").prop("checked")==false){
            	$("#localMessageInfoZB").attr("style","display:none;");
            	$("#advanceActivity_messageZB").attr("style","display:none;"); 
       		}
        });//选中后显示渠道快
});