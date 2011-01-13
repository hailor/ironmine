YUI.add("dtdatasource",function(Y){
    function IrmDTDataSource() {
        IrmDTDataSource.superclass.constructor.apply(this, arguments);
    }
    /////////////////////////////////////////////////////////////////////////////
//
// STATIC PROPERTIES
//
/////////////////////////////////////////////////////////////////////////////
Y.mix(IrmDTDataSource, {
    /**
     * The namespace for the plugin. This will be the property on the host which
     * references the plugin instance.
     *
     * @property NS
     * @type String
     * @static
     * @final
     * @value "datasource"
     */
    NS: "datasource",

    /**
     * Class name.
     *
     * @property NAME
     * @type String
     * @static
     * @final
     * @value "dataTableDataSource"
     */
    NAME: "dataTableDataSource",

/////////////////////////////////////////////////////////////////////////////
//
// ATTRIBUTES
//
/////////////////////////////////////////////////////////////////////////////
    ATTRS: {
        /**
        * @attribute datasource
        * @description Pointer to DataSource instance.
        * @type Y.DataSource
        */
        datasource: {
            setter: "_setDataSource"
        },

        /**
        * @attribute initialRequest
        * @description Request sent to DataSource immediately upon initialization.
        * @type Object
        */
        initialRequest: {
            setter: "_setInitialRequest"
        }


    }
});

    Y.extend(IrmDTDataSource, Y.Plugin.DataTableDataSource, {
        _loadRequest: {},
        _paginateOptions: {start:0,count:20},
        _filterOptions: {},
        _queryOptions: {},
        initializer: function(config) {
          if(!Y.Lang.isUndefined(config.initialRequest)) {
            this.load({request:config.initialRequest});
          }
          this.doBefore("_uiSetCaption", this._beforeuiSetCaption);
        },
        load: function(config) {
            config = config || {};
            config.request = config.request || this.get("initialRequest")||{};
            this._loadRequest = Y.clone(config,true);
            Y.mix(config.request,this._paginateOptions,true);
            //mix in filterOptions
            Y.mix(config.request,this._filterOptions,true);
            //mix in queryOptions
            Y.mix(config.request,this._queryOptions,true);

            config.callback = config.callback || {
                success: Y.bind(this.onDataReturnInitializeTable, this),
                failure: Y.bind(this.onDataReturnInitializeTable, this),
                argument: this.get("host").get("state") //TODO
            };

            var ds = (config.datasource || this.get("datasource"));
            var additionParams = "";
            for(var i in config.request){
              additionParams = additionParams + i+"="+config.request[i].toString()+"&"
            }
            config.request = additionParams;
            if(ds) {
                if(ds.get("source").indexOf('?')<0){
                    config.request = "?"+config.request;
                }else{
                    config.request = "&"+config.request;
                }
                ds.sendRequest(config);
            }
        },
        reload: function(){
          this.load(this._loadRequest);
        },
        filter: function(options){
          this._filterOptions = options;
          Y.mix(this._paginateOptions,{start:0},true);
          this.reload();
        },
        query: function(options){
          this._queryOptions = options;
          Y.mix(this._paginateOptions,{start:0},true);
          this.reload();
        },
        paginate: function(options){
          Y.mix(this._paginateOptions,options,true);
        },
        onDataReturnInitializeTable : function(e) {
          this.get("host").set("recordset", new Y.Recordset({records: e.response.results,sort:{sort:function(){alert("sort")}}}));
        },
        _beforeuiSetCaption: function(val) {
          if(Y.Lang.isValue(val)){
            this.get("host")._captionNode.setContent(val);
          }else{
              this.get("host")._captionNode.get('parentNode').removeChild(this.get("host")._captionNode);
          }
          return new Y.Do.Prevent();  
        },
        onDataReturnInitializeTable : function(e) {
          var recordset = new Y.Recordset({records: e.response.results});
          Y.mix(recordset,{sort:{sort:function(){}}});  
          this.get("host").set("recordset", recordset);
        }

    });

    Y.namespace("Plugin").IrmDTDataSource = IrmDTDataSource;
});