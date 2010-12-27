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
        $(source).find("*[action_type]").each(function() {
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
		$formElement.ajaxSubmit({success: function(data, status) {
                                    loadAndRunAction(arr, tmp, data, identify);
                                },
                                error:function(xhr)
                                {
                                    loadAndRunActionFailure(arr, tmp);
                                }
                           });
		return false;
	});
}
//调用dhtmlxtabbar的方法来初始化tabbar
var dhtmlx_tabbar_array={};
var dhtmlx_tabbar_div_array={};
function ajaxDhtmlxTabbar(el){
    var id = $(el).attr("id");
    if(id==null && id==undefined){
       return;
    }
    var tabbarMode = $(el).attr("tabbar_mode");
    var tabbarSkin=$(el).attr("tabbar_skin");
    var tabbarImagePath=$(el).attr("tabbar_image_path");
    var tabbarHrefMode=$(el).attr("tabbar_href_mode");
    var tabbarA1Params=$(el).attr("tabbar_a1_params");
    var tabbarA2Params=$(el).attr("tabbar_a2_params");
    var tabbarA3Params=$(el).attr("tabbar_a3_params");
    var tabbarA4Params=$(el).attr("tabbar_a4_params");
    var tabbarA5Params=$(el).attr("tabbar_a5_params");
    var tabbarA1ContentParams=$(el).attr("tabbar_a1_content_params");
    var tabbarA2ContentParams=$(el).attr("tabbar_a2_content_params");
    var tabbarA3ContentParams=$(el).attr("tabbar_a3_content_params");
    var tabbarA4ContentParams=$(el).attr("tabbar_a4_content_params");
    var tabbarA5ContentParams=$(el).attr("tabbar_a5_content_params");
    var tabbarActive = $(el).attr("tabbar_active");
    var tabbarDisableParams=$(el).attr("tabbar_disable_params");

    var tabbar = dhtmlx_tabbar_array[id];
    //if(tabbar!=null&&tabbar!=undefined){
    //   tabbar.destructor();
    //}
    if(tabbarMode==null && tabbarMode==undefined){
        tabbarMode='top';
    }
    tabbar = new dhtmlXTabBar(id,tabbarMode);
    if(tabbarSkin!=null && tabbarSkin!=undefined){
        tabbar.setSkin(tabbarSkin);
    }
    if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
        tabbar.setHrefMode(tabbarHrefMode);
    }
    if(tabbarImagePath!=null && tabbarImagePath!=undefined){
        tabbar.setImagePath(tabbarImagePath);
    }
    if(tabbarA1Params!=null && tabbarA1Params!=undefined){
        var evalTabbarA1Params = eval("([" + tabbarA1Params + "])");
        tabbar.addTab(evalTabbarA1Params[0], evalTabbarA1Params[1], evalTabbarA1Params[2]);
    }
    if(tabbarA2Params!=null && tabbarA2Params!=undefined){
        var evalTabbarA2Params = eval("([" + tabbarA2Params + "])");
        tabbar.addTab(evalTabbarA2Params[0], evalTabbarA2Params[1], evalTabbarA2Params[2]);
    }
    if(tabbarA3Params!=null && tabbarA3Params!=undefined){
        var evalTabbarA3Params = eval("([" + tabbarA3Params + "])");
        tabbar.addTab(evalTabbarA3Params[0], evalTabbarA3Params[1], evalTabbarA3Params[2]);
    }
    if(tabbarA4Params!=null && tabbarA4Params!=undefined){
        var evalTabbarA4Params = eval("([" + tabbarA4Params + "])");
        tabbar.addTab(evalTabbarA4Params[0], evalTabbarA4Params[1], evalTabbarA4Params[2]);
    }
    if(tabbarA5Params!=null && tabbarA5Params!=undefined){
        var evalTabbarA5Params = eval("([" + tabbarA5Params + "])");
        tabbar.addTab(evalTabbarA5Params[0], evalTabbarA5Params[1], evalTabbarA5Params[2]);
    }
    if(tabbarA1ContentParams!=null && tabbarA1ContentParams!=undefined){
        var evalTabbarA1ContentParams = eval("([" + tabbarA1ContentParams + "])");
        if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
          if(tabbarHrefMode =='ajax-html'||tabbarHrefMode =='ajax'||
             tabbarHrefMode =='iframes'||tabbarHrefMode =='iframes-on-demand'){
              if(evalTabbarA1ContentParams[2] == 'COMMON'){
                tabbar.setContent(evalTabbarA1ContentParams[0], evalTabbarA1ContentParams[1]);
              }else if(evalTabbarA1ContentParams[2] == 'HTML'){
                tabbar.setContentHTML(evalTabbarA1ContentParams[0], evalTabbarA1ContentParams[1]);
              }else{
                tabbar.setContentHref(evalTabbarA1ContentParams[0], evalTabbarA1ContentParams[1]);
              }
          }
        }else{
          if(evalTabbarA1ContentParams[2] == 'HTML'){
             tabbar.setContentHTML(evalTabbarA1ContentParams[0], evalTabbarA1ContentParams[1]);
          }else{
              if(evalTabbarA1ContentParams[2] == 'CUSTOMER_AJAX'){
                  dhtmlx_tabbar_div_array[evalTabbarA1ContentParams[0]]= evalTabbarA1ContentParams[1];
              }
              tabbar.setContent(evalTabbarA1ContentParams[0], evalTabbarA1ContentParams[1]);
          }
        }
    }
    if(tabbarA2ContentParams!=null && tabbarA2ContentParams!=undefined){
        var evalTabbarA2ContentParams = eval("([" + tabbarA2ContentParams + "])");
        if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
          if(tabbarHrefMode =='ajax-html'||tabbarHrefMode =='ajax'||
             tabbarHrefMode =='iframes'||tabbarHrefMode =='iframes-on-demand'){
             if(evalTabbarA2ContentParams[2] == 'COMMON'){
                tabbar.setContent(evalTabbarA2ContentParams[0], evalTabbarA2ContentParams[1]);
             }else if(evalTabbarA2ContentParams[2] == 'HTML'){
                tabbar.setContentHTML(evalTabbarA2ContentParams[0], evalTabbarA2ContentParams[1]);
             }else{
                tabbar.setContentHref(evalTabbarA2ContentParams[0], evalTabbarA2ContentParams[1]);
             }
          }
        }else{
          if(evalTabbarA2ContentParams[2] == 'HTML'){
             tabbar.setContentHTML(evalTabbarA2ContentParams[0], evalTabbarA2ContentParams[1]);
          }else{
              if(evalTabbarA2ContentParams[2] == 'CUSTOMER_AJAX'){
                  dhtmlx_tabbar_div_array[evalTabbarA2ContentParams[0]]= evalTabbarA2ContentParams[1];
              }
              tabbar.setContent(evalTabbarA2ContentParams[0], evalTabbarA2ContentParams[1]);
          }
        }
    }
    if(tabbarA3ContentParams!=null && tabbarA3ContentParams!=undefined){
        var evalTabbarA3ContentParams = eval("([" + tabbarA3ContentParams + "])");
        if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
          if(tabbarHrefMode =='ajax-html'||tabbarHrefMode =='ajax'||
             tabbarHrefMode =='iframes'||tabbarHrefMode =='iframes-on-demand'){
             if(evalTabbarA3ContentParams[2] == 'COMMON'){
                tabbar.setContent(evalTabbarA3ContentParams[0], evalTabbarA3ContentParams[1]);
             }else if(evalTabbarA3ContentParams[2] == 'HTML'){
                tabbar.setContentHTML(evalTabbarA3ContentParams[0], evalTabbarA3ContentParams[1]);
             }else{
                tabbar.setContentHref(evalTabbarA3ContentParams[0], evalTabbarA3ContentParams[1]);
             }
          }
        }else{
          if(evalTabbarA3ContentParams[2] == 'HTML'){
             tabbar.setContentHTML(evalTabbarA3ContentParams[0], evalTabbarA3ContentParams[1]);
          }else{
              if(evalTabbarA3ContentParams[2] == 'CUSTOMER_AJAX'){
                    dhtmlx_tabbar_div_array[evalTabbarA3ContentParams[0]]= evalTabbarA3ContentParams[1];
              }
              tabbar.setContent(evalTabbarA3ContentParams[0], evalTabbarA3ContentParams[1]);
          }
        }
    }
    if(tabbarA4ContentParams!=null && tabbarA4ContentParams!=undefined){
        var evalTabbarA4ContentParams = eval("([" + tabbarA4ContentParams + "])");
        if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
          if(tabbarHrefMode =='ajax-html'||tabbarHrefMode =='ajax'||
             tabbarHrefMode =='iframes'||tabbarHrefMode =='iframes-on-demand'){
             if(evalTabbarA4ContentParams[2] == 'COMMON'){
                tabbar.setContent(evalTabbarA4ContentParams[0], evalTabbarA4ContentParams[1]);
             }else if(evalTabbarA4ContentParams[2] == 'HTML'){
                tabbar.setContentHTML(evalTabbarA4ContentParams[0], evalTabbarA4ContentParams[1]);
             }else{
                tabbar.setContentHref(evalTabbarA4ContentParams[0], evalTabbarA4ContentParams[1]);
             }
          }
        }else{
          if(evalTabbarA4ContentParams[2] == 'HTML'){
             tabbar.setContentHTML(evalTabbarA4ContentParams[0], evalTabbarA4ContentParams[1]);
          }else{
              if(evalTabbarA4ContentParams[2] == 'CUSTOMER_AJAX'){
                    dhtmlx_tabbar_div_array[evalTabbarA4ContentParams[0]]= evalTabbarA4ContentParams[1];
              }
              tabbar.setContent(evalTabbarA4ContentParams[0], evalTabbarA4ContentParams[1]);
          }
        }
    }
    if(tabbarA5ContentParams!=null && tabbarA5ContentParams!=undefined){
        var evalTabbarA5ContentParams = eval("([" + tabbarA5ContentParams + "])");
        if(tabbarHrefMode!=null && tabbarHrefMode!=undefined){
          if(tabbarHrefMode =='ajax-html'||tabbarHrefMode =='ajax'||
             tabbarHrefMode =='iframes'||tabbarHrefMode =='iframes-on-demand'){
             if(evalTabbarA5ContentParams[2] == 'COMMON'){
                tabbar.setContent(evalTabbarA5ContentParams[0], evalTabbarA5ContentParams[1]);
             }else if(evalTabbarA5ContentParams[2] == 'HTML'){
                tabbar.setContentHTML(evalTabbarA5ContentParams[0], evalTabbarA5ContentParams[1]);
             }else{
                tabbar.setContentHref(evalTabbarA5ContentParams[0], evalTabbarA5ContentParams[1]);
             }
          }
        }else{
          if(evalTabbarA5ContentParams[2] == 'HTML'){
             tabbar.setContentHTML(evalTabbarA5ContentParams[0], evalTabbarA5ContentParams[1]);
          }else{
              if(evalTabbarA5ContentParams[2] == 'CUSTOMER_AJAX'){
                 dhtmlx_tabbar_div_array[evalTabbarA5ContentParams[0]]= evalTabbarA5ContentParams[1];
              }
              tabbar.setContent(evalTabbarA5ContentParams[0], evalTabbarA5ContentParams[1]);
          }
        }
    }
    if(tabbarActive!=null && tabbarActive!=undefined){
        tabbar.setTabActive(tabbarActive);
    }
    if(tabbarDisableParams!=null && tabbarDisableParams!=undefined){
        var evalTabbarDisableParams = eval("([" + tabbarDisableParams + "])");
        for(var i=0;i< evalTabbarDisableParams.length;i++){
           tabbar.disableTab(evalTabbarDisableParams[i]);
        }
    }
    dhtmlx_tabbar_array[id]=tabbar;
    tabbar.attachEvent("onSelect", function() {
        var selectDiv= dhtmlx_tabbar_div_array[arguments[0]];
        var loadHref = $("#"+selectDiv).attr("href");
        if(loadHref!=null&&loadHref!=undefined){
           $("#"+selectDiv).load(loadHref,function(){init($("#"+selectDiv))});
        }
        return true;
    });
}

//根据div的提供的属性构造表格对象
var dhtmlx_grid_array={};
var dhtmlx_data_processor_array={};
function ajaxDhtmlxGrid(el){
   var id = $(el).attr("id");
   var grid_header = $(el).attr("grid_header");
   var grid_width = $(el).attr("grid_width");
   var grid_col_types = $(el).attr("grid_col_types");
   var grid_paging_skin = $(el).attr("grid_paging_skin");
   var grid_align = $(el).attr("grid_align");
   var enable_paging = $(el).attr("enable_paging");
   var onCheckbox = $(el).attr("grid_checkbox");
   var OnRowSelected = $(el).attr("grid_OnRowSelected");
   var onRowDblClicked = $(el).attr("grid_onRowDblClicked");
   var grid_column_hidden = $(el).attr("grid_columnHidden");
   var grid_attach_Header=$(el).attr("grid_attachHeader");
   var grid_load = $(el).attr("grid_load");
   var gridImagePath=$(el).attr("grid_image_path");
   var gridSkin=$(el).attr("grid_skin");
   var gridDateFormat =$(el).attr("grid_date_format"); 
   var gridDataProcessorUrl=$(el).attr("grid_data_processor_url");
   var gridUpdateMode=$(el).attr("grid_data_processor_update_mode");
   var gridTransactionMode=$(el).attr("grid_data_processor_transaction_mode");
   var gridEnableValidation=$(el).attr("grid_enabled_validation");
   var gridSetColValidators=$(el).attr("grid_set_col_validators");
   var gridComboParams1=$(el).attr("grid_combo_params1");
   var gridComboParams2=$(el).attr("grid_combo_params2");
   var gridColumnIds=$(el).attr("grid_column_ids");
   var gridDataProcessorEnableDataNames=$(el).attr("grid_data_processor_enable_data_names");

   var grid = dhtmlx_grid_array[id];
   if(grid!=null&&grid!=undefined){
       grid.destructor();
   }
   grid = new dhtmlXGridObject(id);
   if(grid_header!=null&&grid_header!=undefined){
      grid.setHeader(grid_header);
   }
   if(grid_width!=null&&grid_width!=undefined){
      grid.setInitWidths(grid_width);
   }
   if (grid_col_types!=null&&grid_col_types!=undefined){
      grid.setColTypes(grid_col_types);//set column types
   }
   if(gridColumnIds!=null&&gridColumnIds!=undefined){
      grid.setColumnIds(gridColumnIds);
   }
   if (grid_align!=null&&grid_align!=undefined){
      grid.setColAlign(grid_align);
   }
   if (enable_paging!=null&&enable_paging!=undefined){
      var enablePaging = eval("([" + enable_paging + "])");
      //alert(enablePaging[0] + " " + enablePaging[1] + " " + enablePaging[2] + " " + enablePaging[3] + " " + enablePaging[4] + " " + enablePaging[5]);
      grid.enablePaging(enablePaging[0], enablePaging[1], enablePaging[2], enablePaging[3], enablePaging[4], enablePaging[5]);

   }
   if (enable_paging!=null&&enable_paging!=undefined){
      grid.setPagingSkin(grid_paging_skin);
   }
   //点击checkbox和radio
   if (onCheckbox!=null&&onCheckbox!=undefined){
        //.var fnCheckbox = eval(onCheckbox);
      grid.attachEvent("onCheck", onCheckbox);
   }
   //选择当前行
   if (OnRowSelected!=null&&OnRowSelected!=undefined){
        //.var fnCheckbox = eval(onCheckbox);
      grid.attachEvent("onRowSelect", OnRowSelected);
   }
   //双击当前行
   if (onRowDblClicked!=null&&onRowDblClicked!=undefined){
      grid.attachEvent("onRowDblClicked", onRowDblClicked);
   }

   if (gridEnableValidation!=null&&gridEnableValidation!=undefined){
      grid.enableValidation(true,false);
   }

   if (gridSetColValidators!=null&&gridSetColValidators!=undefined){
      grid.setColValidators(gridSetColValidators);
   }

   if (grid_column_hidden!=null&&grid_column_hidden!=undefined){
      var gridColumnHidden = eval("([" + grid_column_hidden + "])");
      grid.setColumnHidden(gridColumnHidden[0], gridColumnHidden[1]);
   }
   if (grid_attach_Header!=null&&grid_attach_Header!=undefined){
      grid.attachHeader(grid_attach_Header);
   }
   if (gridImagePath!=null&&gridImagePath!=undefined){
      grid.setImagePath(gridImagePath);
   }else{
      grid.setImagePath("/themes/default/images/dhtmlx/");
   }
   if (gridSkin!=null&&gridSkin!=undefined){
      grid.setSkin(gridSkin);
   }else{
      grid.setSkin("dhx_skyblue");
   }
   if (gridDateFormat!=null&&gridDateFormat!=undefined){
      grid.setDateFormat(gridDateFormat);
   }else{
      grid.setDateFormat("%Y-%m-%d");
   }

   //两个参数，其中第一为grid那一列需要设置为combo，而第二列是从后台取数据的
   //URL，其中针对于返回的数据应该是[[1,1],[2,2]]
   if(gridComboParams1!=null && gridComboParams1!=undefined){
      var evalGridComboParams = eval("([" + gridComboParams1 + "])");
      var ComboOptions = sendAsyncAjaxRequest(evalGridComboParams[1]);
      for(var i=0;i<ComboOptions.length;i++){
         var OptionData = ComboOptions[i];
         grid.getCombo(evalGridComboParams[0]).put(OptionData[0],OptionData[1]);
      }
   }

   //两个参数，其中第一为grid那一列需要设置为combo，而第二列是从后台取数据的
   //URL，其中针对于返回的数据应该是[[1,1],[2,2]]
   if(gridComboParams2!=null && gridComboParams2!=undefined){
      var evalGridComboParams2 = eval("([" + gridComboParams2 + "])");
      var ComboOptions2 = sendAsyncAjaxRequest(evalGridComboParams2[1]);
      for(var j=0;j<ComboOptions2.length;j++){
         var OptionData2 = ComboOptions2[j];
         grid.getCombo(evalGridComboParams2[0]).put(OptionData2[0],OptionData2[1]);
      }
   }

   grid.init();
   if (grid_load!=null&&grid_load!=undefined){
      var gridLoad = eval("([" + grid_load + "])");
      grid.load(gridLoad[0],function(){init(el)},gridLoad[2]);
   }



   if(gridDataProcessorUrl!=null&&gridDataProcessorUrl!=undefined){
       var initDataProcessor = new dataProcessor(gridDataProcessorUrl);
       initDataProcessor.init(grid);
       if(gridUpdateMode!=null&gridUpdateMode!=undefined){
          initDataProcessor.setUpdateMode(gridUpdateMode);
       }
       if(gridDataProcessorEnableDataNames!=null&&gridDataProcessorEnableDataNames!=undefined){
          initDataProcessor.enableDataNames(gridDataProcessorEnableDataNames);
       }
       if(gridTransactionMode!=null&gridTransactionMode!=undefined){
          initDataProcessor.setTransactionMode("POST");
       }
       dhtmlx_data_processor_array[id]=initDataProcessor;
   }
   dhtmlx_grid_array[id]=grid;
}

function init(el) {
	var numload = 0;
	$el=$(el);
	var i = 0;
	$el.find("*[action_type]").each(function() {
		i++;
		var actionType = $(this).attr("action_type");
        if(actionType == "menuLink") {
			menuLink(this);
		}else if(actionType == "ajaxSubmit") {
			ajaxSubmit(this);
		}else if (actionType == "ajaxLink"){
            ajaxLink(this);
        }else if (actionType== "ajaxDhtmlxGrid"){
            ajaxDhtmlxGrid(this);
        }else if (actionType== "ajaxDhtmlxTabbar"){
            ajaxDhtmlxTabbar(this);
        }
        pre_init_partial(el);
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
    //alert('data = '+ data);
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

function loadAndRunActionFailure(arr, e){
    executeFunctions(arr.fail, null);
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
	$(source).find("*[action_type]").each(function() {
		this.onclick = null;
	});
	if(html&&html!=""){$(source).html(html);}
    //$("#system_message_box").empty();
	init("#" + s[0]);
    pre_init_partial("#" + s[0]);
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

//send async ajax request
function sendAsyncAjaxRequest(url){
    var result = false;
     $.ajax({
         dataType: "json",
         cache: false,
         async:false,
         url: url,
         timeout: 2000,
         error: function(XMLHttpRequest, errorTextStatus, error){
             alert("Failed to submit : "+ errorTextStatus+" ;"+error);
         },
         success: function(data){
             result = data;
             return true;
         }
     });
    return result;
}

