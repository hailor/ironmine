YUI.add('irmac', function(Y) {

var Escape  = Y.Escape,
    Lang    = Y.Lang,
    YArray  = Y.Array,
    YObject = Y.Object,
    Node   = Y.Node,
    KEY_TAB = 9,

    isFunction = Lang.isFunction,
    isString   = Lang.isString,
    trim       = Lang.trim,

    INVALID_VALUE = Y.Attribute.INVALID_VALUE,

    _FUNCTION_VALIDATOR = '_functionValidator',
    _SOURCE_SUCCESS     = '_sourceSuccess',

    ALLOW_BROWSER_AC    = 'allowBrowserAutocomplete',
    INPUT_NODE          = 'inputNode',
    QUERY               = 'query',
    QUERY_DELIMITER     = 'queryDelimiter',
    REQUEST_TEMPLATE    = 'requestTemplate',
    RESULTS             = 'results',
    RESULT_LIST_LOCATOR = 'resultListLocator',
    VALUE               = 'value',
    VALUE_CHANGE        = 'valueChange',
    RESULT="result",
    _CLASS_ITEM="_CLASS_ITEM",
    LIST="list",

    EVT_CLEAR   = 'clear',
    EVT_QUERY   = QUERY,
    EVT_RESULTS = RESULTS;
    PAGINATOR_RECORD_TEMPLATE = "<div class='displayRecord'>{start}-{end}/{total}</div>";
    PAGINATOR_NEXT_TEMPLATE="<a href='javascript:void(0)' class='nextPage'>\>></a>";
    PAGINATOR_PRE_TEMPLATE="<a href='javascript:void(0)' class='prePage'>\<<</a>";

   Y.namespace("irmac");
   function ACListPlugin(config) {
       config.inputNode = config.host;

       // Render by default.
       if (!config.render && config.render !== false) {
         config.render = true;
       }

       ACListPlugin.superclass.constructor.apply(this, arguments);
   }

   Y.extend(ACListPlugin, Y.AutoCompleteList, {
     ARIA_TEMPLATE: '<div/>',
     ITEM_TEMPLATE: '<tr/>',
     LIST_TEMPLATE: '<table/>',
     _selectFlag: false,
     _displayTemplate:"<td>{lable}</td>",
     _displayHeader:"<th>Label</th>",
     _queryOptions:{start:0,count:10},
     _paginatorOptions:{total:0,start:0,end:0,totalPage:0,currentPage:0},
     initializer: function(config) {
       this._generateDisplayTemplate();
       this["_CLASS_HEADER"]        = "lovHeader";
       this["_CLASS_PAGINATOR"]     = "lovPaginator";
     },
     _generateDisplayTemplate: function(){
         var displayConfigs = this.get("displayConfigs");
         this._displayTemplate = "";
         this._displayHeader = ""
         var width = 0;
         for(i = 0,len = displayConfigs.length;i < len; ++i){
           width+= displayConfigs[i]["width"];
           this._displayTemplate += "<td width='"+displayConfigs[i]["width"]+"px'>{"+displayConfigs[i]["key"]+"}</td>";
           this._displayHeader += "<th width='"+displayConfigs[i]["width"]+"px'>"+displayConfigs[i]["label"]+"</th>";
         }
         this.set("width",width+"px");
         this.set("queryKey",displayConfigs[0].key);
     },
    /**
     * Parses result responses, performs filtering and highlighting, and fires
     * the <code>results</code> event.
     *
     * @method _parseResponse
     * @param {String} query Query that generated these results.
     * @param {Object} response Response containing results.
     * @param {Object} data Raw response data.
     * @protected
     */
    _parseResponse: function (query, response, data) {
        var facade = {
                data   : data,
                query  : query,
                results: []
            },

            listLocator = this.get(RESULT_LIST_LOCATOR),
            results     = [],
            unfiltered  = response && response.results,

            filters,
            formatted,
            formatter,
            highlighted,
            highlighter,
            i,
            len,
            maxResults,
            result,
            text,
            textLocator;

        if (unfiltered && listLocator) {
            unfiltered = listLocator(unfiltered);
        }
        //process paginator options
        var total = response.meta.numRows;
        var start = this._queryOptions.start+1;
        var totalPage = Math.ceil(total/this._queryOptions.count);
        var currentPage = Math.ceil((start+1)/this._queryOptions.count);
        var end = Math.min(currentPage*this._queryOptions.count,total)
        Y.mix(this._paginatorOptions,{total:total,start:start,totalPage:totalPage,currentPage:currentPage,end:end},true);
        Y.log(response);

        if (unfiltered && unfiltered.length) {
            filters     = this.get('resultFilters');
            textLocator = this.get('resultTextLocator');

            // Create a lightweight result object for each result to make them
            // easier to work with. The various properties on the object
            // represent different formats of the result, and will be populated
            // as we go.
            for (i = 0, len = unfiltered.length; i < len; ++i) {
                result = unfiltered[i];
                text   = textLocator ? textLocator(result) : result[this.get("displayConfigs")[0]["key"]].toString();

                results.push({
                    display: Escape.html(text),
                    raw    : result,
                    text   : text
                });
            }

            // Run the results through all configured result filters. Each
            // filter returns an array of (potentially fewer) result objects,
            // which is then passed to the next filter, and so on.
            for (i = 0, len = filters.length; i < len; ++i) {
                results = filters[i](query, results.concat());

                if (!results) {
                    Y.log("Filter didn't return anything.", 'warn', 'autocomplete-base');
                    return;
                }

                if (!results.length) {
                    break;
                }
            }

            if (results.length) {
                formatter   = this.get('resultFormatter');
                highlighter = this.get('resultHighlighter');
                maxResults  = this.get('maxResults');

                // If maxResults is set and greater than 0, limit the number of
                // results.
                if (maxResults && maxResults > 0 &&
                        results.length > maxResults) {
                    results.length = maxResults;
                }

                // Run the results through the configured highlighter (if any).
                // The highlighter returns an array of highlighted strings (not
                // an array of result objects), and these strings are then added
                // to each result object.
                if (highlighter) {
                    highlighted = highlighter(query, results.concat());

                    if (!highlighted) {
                        Y.log("Highlighter didn't return anything.", 'warn', 'autocomplete-base');
                        return;
                    }

                    for (i = 0, len = highlighted.length; i < len; ++i) {
                        result = results[i];
                        result.highlighted = highlighted[i];
                        result.display     = result.highlighted;
                    }
                }

                // Run the results through the configured formatter (if any) to
                // produce the final formatted results. The formatter returns an
                // array of strings or Node instances (not an array of result
                // objects), and these strings/Nodes are then added to each
                // result object.
                if (formatter) {
                    formatted = formatter(query, results.concat());

                    if (!formatted) {
                        Y.log("Formatter didn't return anything.", 'warn', 'autocomplete-base');
                        return;
                    }

                    for (i = 0, len = formatted.length; i < len; ++i) {
                        results[i].display = formatted[i];
                    }
                }
                else{

                    for(i = 0,rlen = results.length;i < rlen; ++i){
                      results[i].display = Y.Lang.substitute(this._displayTemplate,results[i].raw);
                    }
                }
            }
        }

        facade.results = results;
        this.fire(EVT_RESULTS, facade);
    },
    _add: function (items) {
        var itemNodes = [];
        itemNodes.push(this._createHeaderNode());
        YArray.each(Lang.isArray(items) ? items : [items], function (item) {
            itemNodes.push(this._createItemNode(item).setData(RESULT, item));
        }, this);
        if(this._paginatorOptions.total>this._queryOptions.count){
            itemNodes.push(this._createPaginatorNode());
        }

        itemNodes = Y.all(itemNodes);
        this._listNode.append(itemNodes.toFrag());

        return itemNodes;
    },
    _createHeaderNode: function (){
        var headerNode = Node.create(this.ITEM_TEMPLATE);
        return headerNode.addClass(this["_CLASS_HEADER"]).setAttrs({
            id  : Y.stamp(headerNode),
            role: 'header'
        }).setAttribute('data-text', "header").append(this._displayHeader);

    },
    _createPaginatorNode: function (){
        var paginatorNode = Node.create(this.ITEM_TEMPLATE);
        var paginatorOptions = this._paginatorOptions;
        var paginator = "<td colspan='"+this.get("displayConfigs").length+"'>";
        paginator = paginator + Y.Lang.substitute(PAGINATOR_RECORD_TEMPLATE,paginatorOptions);
        paginator = paginator + "<div class='Page'>";
        if(paginatorOptions.currentPage>1){
          paginator = paginator + PAGINATOR_PRE_TEMPLATE;
        }
        else{
          paginator = paginator + "\<<";
        }
        paginator = paginator + "|";
        if(paginatorOptions.currentPage<paginatorOptions.totalPage){
          paginator = paginator + PAGINATOR_NEXT_TEMPLATE;
        }else{
          paginator = paginator + "\>>";
        }
        paginator = paginator +"</div></td>";
        return paginatorNode.addClass(this["_CLASS_PAGINATOR"]).setAttrs({
            id  : Y.stamp(paginatorNode),
            role: 'paginator'
        }).setAttribute('data-text', "paginator").append(paginator);

    },
    _createItemNode: function (result) {
        var itemNode = Node.create(this.ITEM_TEMPLATE);

        return itemNode.addClass(this[_CLASS_ITEM]).setAttrs({
            id  : Y.stamp(itemNode),
            role: 'option'
        }).setAttribute('data-text', result.text).append(result.display);
    },
    _createListNode: function () {
        var listNode = Node.create(this.LIST_TEMPLATE);

        listNode.addClass(this.getClassName(LIST)).addClass("lovDataTable").setAttrs({
            id  : Y.stamp(listNode),
            role: 'listbox'
        });
        listNode.delegate("click",Y.bind(this._nextPage,this),".lovPaginator .Page a.nextPage")
        listNode.delegate("click",Y.bind(this._prePage,this),".lovPaginator .Page a.prePage")
        return listNode;
    },
    _prePage:function(e){
      this._queryOptions.start = Math.max(this._paginatorOptions.currentPage-2,0)*this._queryOptions.count
      this.sendRequest(this.get(QUERY),"",true);
      this.get("inputNode").focus();
    },
    _nextPage:function(e){
      this._queryOptions.start = this._paginatorOptions.currentPage*this._queryOptions.count
      this.sendRequest(this.get(QUERY),"",true);
      this.get("inputNode").focus();
    },
    sendRequest: function (query, requestTemplate,requery) {
        var request,
            source = this.get('source');

        if (query || query === '') {
            this._set(QUERY, query);
        } else {
            query = this.get(QUERY);
        }

        if (source) {
            var config = {};
            config.callback = {success: Y.bind(this._onResponse, this, query)}
            config.request = {};
            if(!requery){
              this._selectFlag = false;
              //clear return fields
              var returnValuePairs = this.get("returnValues");
              for(var rkey in returnValuePairs){
                var returnNode = Y.one(returnValuePairs[rkey]);
                if(returnNode){
                    returnNode.set("value","");
                }

              }
              // restart from  0
              this._queryOptions.start = 0;
            }
            this._queryOptions[this.get("queryKey")] = query;
            Y.mix(config.request,this._queryOptions,true);

            var additionParams = "";
            for(var i in config.request){
              additionParams = additionParams + i+"="+config.request[i].toString()+"&"
            }
            config.request = additionParams;

            if(source.get("source").indexOf('?')<0){
                config.request = "?"+config.request;
            }else{
                config.request = "&"+config.request;
            }
            Y.log('sendRequest: ' + config.request, 'info', 'autocomplete-base');
            source.sendRequest(config);
        }

        return this;
    },
    _defSelectFn: function (e) {
        var text = e.result.text;
        // TODO: support typeahead completion, etc.
        this._inputNode.focus();
        this._updateValue(text);
        this._ariaSay('item_selected', {item: text});
        var returnValuePairs = this.get("returnValues");
        for(var rkey in returnValuePairs){
          var returnNode = Y.one(returnValuePairs[rkey]);
          if(returnNode){
              returnNode.set("value",e.result.raw[rkey]);
          }

        }
        this._selectFlag = true;
        this.hide();
    },
    _onListInputBlur: function (e) {
        // Hide the list on inputNode blur events, unless the mouse is currently
        // over the list (which indicates that the user is probably interacting
        // with it). The _lastInputKey property comes from the
        // autocomplete-list-keys module.
        if(!this._selectFlag){
            this._updateValue("");
            //clear return fields
            var returnValuePairs = this.get("returnValues");
            for(var rkey in returnValuePairs){
              var returnNode = Y.one(returnValuePairs[rkey]);
              if(returnNode){
                  returnNode.set("value","");
              }

            }
        }
        if (!this._mouseOverList || this._lastInputKey === KEY_TAB) {
            this.hide();
        }
    }

   }, {
       NAME      : 'autocompleteListPlugin',
       NS        : 'ac',
       CSS_PREFIX: Y.ClassNameManager.getClassName('aclist'),
       ATTRS:{
           valueField:{value:"value"},
           displayConfigs:{value:[{label:"Label",key:"label",width:80}]},
           maxResults: {
              value: 10
           },
           minQueryLength: {
              value: 0
           },
           queryDelay: {
              value: 1000
           },
           queryKey:{
               value: "query"
           },
           returnValues:{
               value: {}
           }
       }
   });

   Y.irmac.AutoComplete     = ACListPlugin;


}, '@VERSION@' ,{requires:['autocomplete-list', 'node-pluginhost','substitute']});