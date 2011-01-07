var yuiConfig = {
    base:      '/javascripts/yui3.3/',
    //comboBase: '/combo?',
    //root :'/javascripts/yui3.3/',
    //combine: true,
    modules:{
        irmdtdatasource:{
            fullpath:"/javascripts/irm/irm-dtdatasource.js",
            requires: ["datatable-datasource"]
        }
    },
    groups: {
            yui2: {
                base:      '/javascripts/yui2.8.1/',
                //comboBase: '/combo?',
                //root :'/javascripts/yui2.8.1/',
                //combine: true,
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
var GY = YUI(yuiConfig).use("irm");