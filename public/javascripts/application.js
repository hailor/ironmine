// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    $('input[type=text]:not([readonly]):first').focus();
    $('input[required]:not([readonly]):not([disabled])').addClass("inputrequired");
    $('input[readonly]:not([lov])').css("background-color","#CCCCCC");
    //针对于uppercase的属性，强制输入大写
    $('input[irm_uppercase]').keyup(function() {
        this.value=this.value.toUpperCase();
    });
    //只能输入字母数字或者下划线
    $('input[irm_uppercase]').keyup(function() {
        if(!this.value==""){
          var reg = /^[A-Z0-9_]*$/;
          if(!reg.test(this.value)){
            this.value=this.value.replace(/[^\da-z_]/ig,'');
          }
        }
    });
    $('input[irm_numberonly]').keyup(function() {
        this.value = this.value.replace(/[^\d]/g,'')
    });
    $('textarea[required]:not([readonly]):not([disabled])').addClass("inputrequired");
    $('textarea[readonly]').addClass("inputdisable");
    $('input[type=submit]').css("cursor","pointer");
    init(document);
});



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
    alert('1111');
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
    alert('111111111');
    saveLookupType = lookupType;
    dp = new dataProcessor('/lookup_types/create_value?lookup_type_id='+lookupType);
    dp.init(grid);
    dp.setUpdateMode("off");
    dp.setTransactionMode("POST");
}
//#=========================end irm/lookup_types/_new_form.html.erb=======================#

//#=========================start multilingual=======================#
jQuery(function ($) {
    var mulwins;
    $('a[action_type="multilingual"]').live('click', function (e) {
      e.preventDefault();
      if(!mulwins)
      {
        mulwins = new dhtmlXWindows();
        mulwins.setImagePath("/images/dhtmlx/");
        mulwins.enableAutoViewport(false);
        mulwins.attachViewportTo($(this).attr('view_port'));
      }
      var div_str = "<div id='multwin' style='display:none'></div>"
      if($('#multwin').length<1){$('body').append(div_str);}
      
      $('#multwin').load($(this).attr('href'));
      var win = mulwins.createWindow("mutilwin",50,50,590,142);
      win.attachObject('multwin');
      win.button('park').hide();
      win.button('close').hide();
      win.button('minmax1').hide();
      win.button('minmax2').hide();
      win.denyResize();
      win.setModal(true);
    });

    $('a[action_type="multilingual_close"]').live('click', function (e) {
      if(mulwins)
      {
        mulwins.forEachWindow(function(win){win.close()});
      }
    });
    
});
//#=========================end multilingual=======================#
