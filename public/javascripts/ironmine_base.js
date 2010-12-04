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

function addRow(grid) {
    var newId = (new Date()).valueOf();
    grid.addRow(newId,"",grid.getRowsNum());
    grid.selectRow(grid.getRowIndex(newId),false,false,true);

}
function removeRow(grid){
    var selId = grid.getSelectedId();
    grid.deleteRow(selId);
}
function saveRow(){
  dp.sendData();
}
function setLookupType(grid,lookupType){
    saveLookupType = lookupType;
    dp = new dataProcessor('/lookup_types/create_value?lookup_type_id='+lookupType);
    dp.init(grid);
    dp.setUpdateMode("off");
    dp.setTransactionMode("POST");
}
//#=========================end irm/lookup_types/_new_form.html.erb=======================#
