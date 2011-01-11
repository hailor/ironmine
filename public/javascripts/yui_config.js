var yuiConfig = {
    base:      '/javascripts/yui3.3/',
    //comboBase: '/combo?',
    //root :'/javascripts/yui3.3/',
    //combine: true,
    modules:{
        dtdatasource:{
            fullpath:"/javascripts/irm/datatable/dtdatasource.js",
            requires: ["datatable-datasource"]
        },
        dtselector:{
            fullpath:"/javascripts/irm/datatable/dtselector.js",
            requires: ["datatable-datasource"]
        },
        gallerywidgetio:{
            fullpath:"/javascripts/gallery/widget-io.js",
            requires: ["io-base"]
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
var GY = YUI(yuiConfig).use("base");