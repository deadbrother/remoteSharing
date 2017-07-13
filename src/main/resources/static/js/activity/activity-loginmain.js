$(function ()
{	
	allclick();

	/*
	 * 
	 * 旋转方法，获取需要旋转的图片赋值旋转函数
	 */
	var oDiv=document.getElementById('div1');
	var aImg=oDiv.children;

	for(var i=0; i<aImg.length; i++)
	{
		aImg[i].I=rndNum(-5,5);
		if(aImg[i].I==0){aImg[i].I=1};

		aImg[i]._I=aImg[i].I;
         if(i==0){
        	 aImg[i].style.width=300+i*20+'px';
     		aImg[i].style.margin=-150+'px';
         }else if(i==1){
     		aImg[i].style.width=400+i*40+'px';
    		aImg[i].style.margin=-220+'px';
            }else if(i==2){
     		aImg[i].style.width=550+i*40+'px';
    		aImg[i].style.margin=-320+'px';
          }
	}

	setInterval(function ()
	{
		for(var i=0; i<aImg.length; i++)
		{
			aImg[i].style.WebkitTransform='rotate('+aImg[i].I+'deg)';
			aImg[i].style.MozTransform='rotate('+aImg[i].I+'deg)';
			aImg[i].style.msTransform='rotate('+aImg[i].I+'deg)';

			aImg[i].I+=aImg[i]._I;
		}
	},50);
	
});



function rndNum(m, n)
{
	n++;
	return parseInt(n);
	/*return parseInt(Math.random()*(n-m)+m);*/
}

/*文字说明*/
function over(dec,type){
	
/*	 var oDiv = document.createElement('yy');
	   oDiv.innerHTML = '<div class="bottom" >'+obj+'</div>';*/
	if(type==11||type==12){
	$("#lefttooltip").removeClass("hide");
	$("#lefttooltip").html(dec);
	}else if(type==22||type==21){
	$("#righttooltip").removeClass("hide");
	$("#righttooltip").html(dec);
	}
	
}
function out(){		
		$("#lefttooltip").addClass("hide");		
		$("#righttooltip").addClass("hide");
			
	}
/*
 * 按钮的点击事件
 */

function allclick(){ 	  
 
	/* url跳转 */
	// 普通营销策划新增id="add-activity-btn"
		/*$("#add-activity-btn").click(function() {
			if(top.openTab==undefined){				 
				location.href="../activity/add";
				}else{
					top.openTab("活动策划","/clyxactivity/activity/add");
					}
		});
		$("#add-activitysc-btn").click(function() {
			if(top.openTab==undefined){
				location.href="../activitysc/add";
				}else{
					top.openTab("场景策划","/scenemarketing/activitysc/add?saveType=1");
					}
		});
		$("#add-activityyw-btn").click(function() {
			if(top.openTab==undefined){
				location.href="../activitysc/add";
				}else{
					top.openTab("异网策划","/clyxactivityyw/activityyw/add");
					}
		});
		 客户群 
		$("#usertool-btn-extract").click(function() {
			if(top.openTab==undefined){
				location.href="../activitysc/add";
				}else{
					top.openTab("客户群提取","/xbuilderoracle/lable/index.e");
					}
		});
		$("#usertool-btn-explore").click(function() {
			if(top.openTab==undefined){
				location.href="../activitysc/add";
				}else{
					top.openTab("客户群探索分析","/usertool/explore.action?cubeId=C12419292583");
					}
		});
		$("#usertool-btn-insight").click(function() {
			if(top.openTab==undefined){
				location.href="../activitysc/add";
				}else{
					top.openTab("客户群洞察","/xbuilderoracle/userView/getAuthAction.e?cubeID=C12419292583");
					}
		});*/
		
		/* 营销执行 */
		var left1=$("#left1").val();
	
		
		$(".btncontent1 >button").click(function(){
			if(top.openTab==undefined){				 
				location.href=$(this).val();
				}else{
					top.openTab($(this).text(),$(this).val());
					}		
		});
		$(".btncontent2 >button").click(function(){
			if(top.openTab==undefined){				 
				location.href="../activity/add";
				}else{
					top.openTab($(this).text(),$(this).val());
					}
		});
		

		
}
setInterval(function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    $("#currentdate").html(currentdate);
    return currentdate;
    
},1000);