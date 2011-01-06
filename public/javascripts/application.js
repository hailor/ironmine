var yuiConfig = {
    modules:{
        irmdtdatasource:{
            fullpath:"/javascripts/irm/irm-dtdatasource.js",
            requires: ["datatable-datasource"]
        }
    }
  };

YUI.add('irm', function(Y) {

    Y.namespace('irm');

    Y.irm.handleClick = function handleClick(){
        Y.one("#content").addClass("ccc");
        alert("hello");
      }

}, '0.1.1' /* module version */, {
    requires: ['base']
});

var GY = YUI(yuiConfig).use("irm");

GY.use('node',function(Y){
   Y.all('input[irm_uppercase]').on('keyup', function(){
      this.set('value',this.get('value').toString().toUpperCase());
   });
});