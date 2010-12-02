/*
 * ajax link and submit js
 * action,script,actionType(ajaxLink,ajaxSubmit)
 */

function adjustElementId(el, identify) {
	var id = $(el).attr("id");
	if(id == null || $.trim(id) == "") {
		$(el).attr("id", new Date().getTime() + "_" + identify);
	}
}

function getBrowse() {
	 var Sys = {};
     var ua = navigator.userAgent.toLowerCase();
     var s;
     (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
     (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
     (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
     (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
     (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
     return Sys;
}


function get_target_div(script){
    var fs = script.split(";");
	var result = true;
	for(var i = 0; i < fs.length; i++) {
		fs[i] = $.trim(fs[i]);
		if(fs[i] == "") {
			continue;
		}
		if(fs[i].indexOf("replace(") == 0) {
			var param = fs[i].substring("replace(".length, fs[i].length - 1);
			var s = param.split(",");
		}
    }
    return s[0];
}

function ajaxLink(el) {
    var identify=0;
	var $this=$(el);
	el.onclick=function() {
		identify++;
		var tmp = this;
		var arr = parseScript($this.attr("script"));
		if(arr.beforeAction != "") {
			var s = parseFunction(arr.beforeAction, tmp, identify);
		    var result = executeFunctions(s, document);
   			if(result != null && result!=undefined && !result ) {
   				return false;
   			}
		}
		var href=$this.attr("href");
		//if(isIE()) {href = encodeURI(href);}
		var params={url: href,data:""}
		var hrefLength=href.indexOf("?");
		if(hrefLength>0){//包含?
			params.url=href.substring(0, hrefLength);
			params.data=href.substring(hrefLength+1);
			if(params.data.indexOf("&") == 0) {
				params.data=params.data.substring(1);
			}
		}
		$.ajax({
		    type: "GET",
			url: params.url,
			data:params.data,
			cache:false,
			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			success : function(data) {
				loadAndRunAction(arr, tmp, data, identify);
			}});
		return false;
	};
}

function menuLink(el){
   var identify=0;
	var $this=$(el);
	el.onclick=function() {
		identify++;
		var tmp = this;
		var arr = parseScript($this.attr("script"));
		if(arr.beforeAction != "") {
			var s = parseFunction(arr.beforeAction, tmp, identify);
		    var result = executeFunctions(s, document);
   			if(result != null && result!=undefined && !result ) {
   				return false;
   			}
		}
		var href=$this.attr("href");
        var targetDiv= get_target_div(arr.success);
        //jquery ajax loading
        $("#"+targetDiv).load(href,"",function(response, status, xhr) {
        });
        //init data
        var source = document.getElementById("#"+targetDiv);
        $(source).find("*[actionType]").each(function() {
            this.onclick = null;
        });
        init("#" + targetDiv);
		return false;
	};
}

function ajaxSubmit(el) {
    var identify=0;
	$(el).click(function() {
		identify++;
		var $this=$(this);

		var arr = parseScript($this.attr("script"));
		var tmp = this;
        //alert($this.attr("script"));
		if(arr.beforeAction != "") {
		    var s = parseFunction(arr.beforeAction, tmp, identify);
		    var result = executeFunctions(s, document);
   			if(result != null && result!="undefined" && !result ) {
   				return false;
   			}
		}
		var $formElement = $this.parents("form:first");
        //alert($formElement.attr('action'));
		$formElement.ajaxSubmit(function(data, status) {
			loadAndRunAction(arr, tmp, data, identify);
		});
		return false;
	});
}

function init(el) {
	var numload = 0;
	$el=$(el);
	var i = 0;
	$el.find("*[actionType]").each(function() {
		i++;
		var actionType = $(this).attr("actionType");
        if(actionType == "menuLink") {
			menuLink(this);
		}else if(actionType == "ajaxSubmit") {
			ajaxSubmit(this);
		}else if (actionType == "AjaxLink"){
            ajaxLink(this);
        }
	});
}

function parseScript(script) {
	var result = {
		beforeAction:"",
		success:"",
		fail:""
	};
	var s = script.split("/");
	if(s.length == 1) {
		result.success = s[0];
	}
	else if(s.length == 2) {
		result.beforeAction = s[0];
		result.success = s[1];
	}
	else if(s.length == 3) {
		result.beforeAction = s[0];
		result.success = s[1];
		result.fail = s[2];
	}
	return result;
}

function parseJsonMessage(msessgeval) {
	msessgeval = $.trim(msessgeval);
	var message = msessgeval.replace(/\n/g, "\\n");
	if(message==""){
		return null;
	}
	return eval("(" + message + ")");
}

function parseFunctionJsonParam(jsonId, f, json) {
	var r = new RegExp(jsonId + "\\[\\'([A-Za-z0-9]+)\\'\\]", "i");
	while(f.search(r) != -1) {
		f = f.replace(r, json[RegExp.$1]);
	}
	return f;
}

function loadAndRunAction(arr, e, data, identify) {
	var element = document.createElement("div");
	$(element).html(data);
	var jsonEls = $(element).find("*[type=json]");
	var json = null;
	var result = "true";
	if(jsonEls.length > 0) {
		jsonEls.each(function() {
			json = parseJsonMessage($(this).html());
			if(json != null && json["result"] != "undefined") {
				result = json["result"];
			}
			//result = json != null ? json["result"] : "false";
			if(arr.success != null && arr.success != "")
				arr.success = parseFunctionJsonParam($(this).attr("id"), arr.success, json);
			if(arr.fail != null && arr.fail != "")
				arr.fail = parseFunctionJsonParam($(this).attr("id"), arr.fail, json);
		});
	}
	if(isTrue(result)) {
		var s = parseFunction(arr.success, e, identify);
    	executeFunctions(s, element);
    }
    else {
    	var fail = parseFunction(arr.fail, e, identify);
    	executeFunctions(fail, element);
    }
}

function executeFunctions(script, data) {
	var fs = script.split(";");
	var result = true;
	for(var i = 0; i < fs.length; i++) {
		fs[i] = $.trim(fs[i]);
		if(fs[i] == "") {
			continue;
		}
		if(fs[i].indexOf("replace(") == 0) {
			var param = fs[i].substring("replace(".length, fs[i].length - 1);
			replace(param, data);
		}
		else {
			//alert(1);
			result = eval(fs[i]);
			//alert("eval:" + fs[i] + " " + result);
		}
		if(result != null && result!=undefined && !result ) {
				//alert("false");
				return false;
		}
	}
	//alert("result:" + result);
	return result;
}

function replace(param, data) {
	var s = param.split(",");
	var targetData=data;
	if(s.length == 2) {
		targetData = $(data).find("#" + s[1])[0];
	}
	var html=$(targetData).html();
	var source = document.getElementById(s[0]);
	$(source).find("*[actionType]").each(function() {
		this.onclick = null;
	});
	if(html&&html!=""){$(source).html(html);}
	init("#" + s[0]);
}

function parseFunction(f, el, identify) {
	adjustElementId(el, identify);
	var re = /this/g;
	f = f.replace(re, "$('#" + $(el).attr("id") + "').get(0)");
	//alert(f);
	return f;
}

function isTrue(s) {
	return $.trim(s) == "true";
}

