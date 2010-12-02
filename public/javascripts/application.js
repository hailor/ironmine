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
