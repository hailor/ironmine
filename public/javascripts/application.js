var yuiConfig = {
    modules:{
        irmdtdatasource:{
            fullpath:"/javascripts/irm/irm-dtdatasource.js",
            requires: ["datatable-datasource"]
        }
    },
    groups: {
            yui2: {
                base:      '/javascripts/yui2.8.1/',
                patterns:  {
                    'yui2-': {
                        configFn: function(me) {
                            if(/-skin|reset|fonts|grids|base/.test(me.name)) {
                                me.type = 'css';
                                me.path = me.path.replace(/\.js/, '.css');
                                // this makes skins in builds earlier than 2.6.0 work as long as combine is false
                                me.path = me.path.replace(/\/yui2-skin/, '/assets/skins/sam/yui2-skin');
                            }
                        }
                    }
                }
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