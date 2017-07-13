var services={};
$(function() {
	$.ajax({
		url:"../common/getServices",
		type : "POST",
		async : false,
		success : function(data) {
			//console.log(data);
			//var json = eval("("+data+")");
			//console.log(json);
			var json = JSON.parse(data);
			services = json;
			console.log(services);
			loadScript("/"+services.xbuilderoracle+"/pages/tag/lable/scripts/rule.js", function(){
				console.log("rule.js加载成功");
			});
		}
	});
});

function loadScript(url, callback){
    var script = document.createElement("script");
    script.type = "text/javascript";
    if(script.readyState){ // IE
        script.onreadystatechange = function(){
            if(script.readyState == "loaded" || script.readyState == "complete"){
                script.onreadystatechange = null;
                callback();
            }
        };
    }else{ // FF, Chrome, Opera, ...
        script.onload = function(){
            callback();
        };
    }
    script.src = url;
    document.getElementsByTagName("head")[0].appendChild(script);
}
	
