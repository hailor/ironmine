// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    init(document);
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
var mulwins;
function multilingual(el){
  jQuery(function ($) {
    el.onclick = function (e) {
      if (!jQuery.browser.msie){
        e.preventDefault();
      }
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
      return false;
    };
  });
}
jQuery(function ($) {
    $('a[action_type="multilingual_close"]').live('click', function (e) {
      if(mulwins)
      {
        mulwins.forEachWindow(function(win){win.close()});
      }
    });
});
//#=========================end multilingual=======================#

