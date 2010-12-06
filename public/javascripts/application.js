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

