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
    $(el).find('input[type=submit]').css("cursor","pointer");
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
    $(this).attr("action",$(this).attr("action_temp").replace(":id",$(this).attr("value")));
    $(this).callRemote();
    e.preventDefault();
  });
}
//#=========================end multilingual=======================#

