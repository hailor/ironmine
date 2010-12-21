// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    init(document);
    cascadeSelect(document)
    pre_init_partial(document);
});

function pre_init_partial(el){
    $(el).find('input[type=text]:not([readonly]):first').focus();
    $(el).find('input[required]:not([readonly]):not([disabled])').addClass("inputrequired");

    $(el).find('input[readonly]:not([lov])').addClass("inputdisable");
    //针对于uppercase的属性，强制输入大写
    $(el).find('input[irm_uppercase]').keyup(function() {
        this.value=this.value.toUpperCase();
    });
    //只能输入字母数字或者下划线
    $(el).find('input[irm_uppercase]').keyup(function() {
        if(!this.value==""){
          var reg = /^[A-Z0-9_]*$/;
          if(!reg.test(this.value)){
            this.value=this.value.replace(/[^\da-z_]/ig,'');
          }
        }
    });
    $(el).find('input[irm_numberonly]').keyup(function() {
        this.value = this.value.replace(/[^\d]/g,'')
    });
    $(el).find('textarea[required]:not([readonly]):not([disabled])').addClass("inputrequired");
    $(el).find('textarea[readonly]').addClass("inputdisable");
    
    $('<span class="textrequired">*&nbsp;</span>').insertBefore($(el).find('input[required]:not([readonly]):not([disabled]):not([span])'));
    $(el).find('input[required]:not([readonly]):not([disabled]):not(input[span])').attr("span", true);
    $('<span class="textrequired">&nbsp;&nbsp;</span>').insertBefore($(el).find('input:not([required]):not([span]):not([type=hidden])'));
    $(el).find('input:not(input[required]):not(input[span]):not([type=hidden])').attr("span", true);

    $('<span class="textrequired">*&nbsp;</span>').insertBefore($(el).find('textarea[required]:not([readonly]):not([disabled]):not([span])'));
    $(el).find('textarea[required]:not([readonly]):not([disabled]):not([span])').attr("span", true);
    $('<span class="textrequired">&nbsp;&nbsp;</span>').insertBefore($(el).find('textarea:not([required]):not([span])'));
    $(el).find('textarea:not([required]):not([span])').attr("span", true);

    $('<span class="textrequired">*&nbsp;</span>').insertBefore($(el).find('select[required]:not([readonly]):not([disabled]):not([span])'));
    $(el).find('select[required]:not([readonly]):not([disabled]):not([span])').attr("span", true);
    $('<span class="textrequired">&nbsp;&nbsp;</span>').insertBefore($(el).find('select:not([required]):not([span])'));
    $(el).find('select:not([required]):not([span])').attr("span", true);
    
    $(el).find('input[type=submit]').css("cursor","pointer");
    cascadeSelect(el);
}
//#=========================start multilingual=======================#

jQuery(function ($) {
    var mulwins;
    $('a[action_type="multilingual"]').live('click',function (e) {
      e.preventDefault();
      mulwins = new dhtmlXWindows();
      mulwins.setImagePath("/images/dhtmlx/");
      mulwins.enableAutoViewport(false);
      mulwins.attachViewportTo($(this).attr('view_port'));

      if($('#multwin').length<1){$('body').append("<div id='multwin' style='display:none'></div>");}
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

    $('#left_to_right').live('click', function (e) {
        move_row('left_grid', 'right_grid');
    });

    $('#right_to_left').live('click', function (e) {
        move_row('right_grid', 'left_grid');
    });
  });

function cascadeSelect(el){
  $('select[cascade]').each(function(){
      $(this).attr("action_temp",$(this).attr("action"));
      $(this).attr("data-type","json");
  });
  $('select[cascade]').bind("ajax:success",function(data, status, xhr){
      var choice_title = $(this).attr("choice_title");
      var options = "";
      if (choice_title!=undefined&&choice_title!=null){
        options = "<option value=''>--- "+choice_title+" ---</option>";
      }
      for(var i in status)
      {
        options += "<option value='"+status[i].id+"'>"+status[i].name+"</option>";
      }

      $("#"+$(this).attr("cascade")).html(options);
  });
  $('select[cascade]').change(function (e) {
    $(this).attr("action",$(this).attr("action_temp").replace("cascade_id",$(this).attr("value")));
    $(this).callRemote();
    e.preventDefault();
  });
}
//#=========================end multilingual=======================#
//#========================== move dhtmlxgrid row ===================
function move_row(source, target)
{
    var rows = dhtmlx_grid_array[source].getCheckedRows(0).split(",");
    for(var i=0; i< rows.length; i++)
    {
        dhtmlx_grid_array[source].moveRow(rows[i], "row_sibling", dhtmlx_grid_array[target].getRowId(0), dhtmlx_grid_array[target]);
        alert("!");
    }
}
//#========================= end move dhtmlxgrid row ================

