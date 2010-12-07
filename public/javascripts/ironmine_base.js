//#=========================start irm/lookup_types/_new_form.html.erb=======================#
function after_save_lookup_type(){
   $("#irm_lookup_type_lookup_type").attr('readonly','readonly');
   $("input[type=radio]").each(function(){
        $(this).attr('disabled','disabled');
   });
   $("#irm_lookup_type_lookup_type").attr("style","background-color:#CCCCCC;");
}

var saveLookupType="";
var dp = "";
function init_grid(grid){
    grid.setImagePath("/images/dhtmlx/");
    grid.setSkin("dhx_skyblue");
    grid.setDateFormat("%Y-%m-%d");
    grid.init();
}

function addRow(id) {
    var grid = dhtmlx_grid_array[id];
    var newId = (new Date()).valueOf();
    grid.addRow(newId,"",grid.getRowsNum());
    grid.selectRow(grid.getRowIndex(newId),false,false,true);

}
function removeRow(id){
    var grid = dhtmlx_grid_array[id];
    var selId = grid.getSelectedId();
    grid.deleteRow(selId);
}
function saveRow(){
  dp.sendData();
}
function setLookupType(id,lookupType){
    var grid = dhtmlx_grid_array[id];
    saveLookupType = lookupType;
    dp = new dataProcessor('/lookup_types/create_value?lookup_type_id='+lookupType);
    dp.init(grid);
    dp.setUpdateMode("off");
    dp.setTransactionMode("POST");
}
//#=========================end irm/lookup_types/_new_form.html.erb=======================#
//#=========================start irm/lookup_types/_edit_form.html.erb=======================#
var dpEdit=""
function addEditRow(id,lookupTypeId) {
    var grid = dhtmlx_grid_array[id];
    var newId = (new Date()).valueOf();
    grid.addRow(newId,"",grid.getRowsNum());
    grid.selectRow(grid.getRowIndex(newId),false,false,true);
    dpEdit = new dataProcessor('/lookup_types/create_edit_value?lookup_type_id='+lookupTypeId);
    dpEdit.init(grid);
    dpEdit.setUpdateMode("off");
    dpEdit.setTransactionMode("POST");

}
function removeEditRow(id){
    var grid = dhtmlx_grid_array[id];
    var selId = grid.getSelectedId();
    grid.deleteRow(selId);
}
function saveEditRow(){
  dpEdit.sendData();
}
//#=========================start irm/lookup_types/_new_form.html.erb=======================#
//#=========================start irm/language/_new_form.html.erb=======================#
function reload_grid(id){
   var element = ("#"+id);
   var grid_load = $(element).attr("grid_load");
   var grid = dhtmlx_grid_array[id];
   if (grid_load!=null&&grid_load!=undefined){
      var gridLoad = eval("([" + grid_load + "])");
      grid.clearAll();
      grid.load(gridLoad[0],function(){init(element)},gridLoad[2]);
   }
}

//处理表格的双击事件
function processDblClicked(targetDiv,sourceDiv,href,rowId){
    //ajax
    var replaceHref=href.replace(":id",rowId);
    var returnElement=document.createElement("div");
    $.ajax({
		  type: "GET",
	      url: replaceHref,
		  cache:false,
		  contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		  success : function(data) {
		    $(returnElement).html(data);
            processHtmlReplace(returnElement,targetDiv)
	}});

}
//处理html的replace
function processHtmlReplace(returnElement,targetDiv){
    var html=$(returnElement).html();
	var source = document.getElementById(targetDiv);
	$(source).find("*[action_type]").each(function() {
		this.onclick = null;
	});
	if(html&&html!=""){$(source).html(html);}
    init('#'+targetDiv);
    pre_init_partial("#" + targetDiv);
}
//#=========================end irm/language/_new_form.html.erb=======================#
