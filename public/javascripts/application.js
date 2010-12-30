$(document).ready(function(){
      dojo.require("dojox.grid.enhanced.plugins.IndirectSelection");
      $('*[dojoType]').each(function(){
          dojo.require($(this).attr('dojoType'))
      });
      dojo.parser.parse();
      $('*[dojoType]').removeAttr("dojoType")
  });

  function template_formatter(data, rowIndex){
     var str = $("#"+this.grid.id).find("#"+this.field+"_column_template").html();
     str = unescape(str);
     console.log(str);
     return dojo.string.substitute(str,this.grid.getItem(rowIndex).i)
  }