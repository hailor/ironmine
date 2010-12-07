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
function processDblClicked(targetDiv,sourceDiv,href,rowId){
    //ajax
    var replaceHref=href.replace(":id",rowId);
    $("#"+targetDiv).load(replaceHref,"",function(response, status, xhr) {
    });
    //init data
    var source = document.getElementById("#"+targetDiv);
    $(source).find("*[action_type]").each(function() {
        this.onclick = null;
    });
    init("#" + targetDiv);
}
//#=========================end irm/language/_new_form.html.erb=======================#
