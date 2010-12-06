$(document).ready(function(){
    $('input[type=text]:not([readonly]):first').focus();
    $('input[required]:not([readonly]):not([disabled])').addClass("inputrequired");
    $('form[data-remote]:[zone]').bind("ajax:success",function(data, status, xhr){
      var target_zone = $(this).attr("zone");
      if($("#"+target_zone))
        $("#"+target_zone).html(status)
      });
});