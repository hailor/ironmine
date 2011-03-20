YUI.add("dtpaginator",function(Y){
    var SELECT = "<select class='searchSelect'>{options}</select>";
    var OPTION = "<option value='{key}'>{label}</option>";
    var INPUT = "<input type='text' size='20' class='searchBoxInput'/>";
    var PAGEPRENEXT = "<a href='#' type='prepage'>{prepage}</a>|<a href='#' type='nextpage'>{nextpage}</a>"

    function IrmDTPaginator() {
        IrmDTPaginator.superclass.constructor.apply(this, arguments);
    }

Y.mix(IrmDTPaginator, {

    NS: "paginator",

    NAME: "dataTablePaginator",

    ATTRS: {
      searchColumns:{
          setter: "_setSearchColumns"
      },
      paginatorDom: {
          value: "paginatorBox"
      },
      paginatorLabels:{
          value: {prepage:'Pre',nextpage: 'Next'}
      }
    }
});

Y.extend(IrmDTPaginator, Y.Plugin.Base, {
        initializer: function(config) {
           this.doBefore("_setColumnset", this._beforeSetColumnset);
           this.doAfter("_setColumnset", this._beforeRenderUI);
           Y.one("#"+this.get("searchDom")).delegate('keydown',this._executeQuery,'.searchBoxInput',this);
        },
        _beforeSetColumnset:function(columns){
          var cols = [];
          for(var i = 0;i<columns.length;i++){
            if(columns[i].searchable)
              cols[cols.length] = columns[i];
          }

          this.set("searchColumns",cols);
        },
        _beforeRenderUI:function(){
          var options = "";
          var cols = this.get("searchColumns");
          for(var i=0;i<cols.length;i++)
            options+=Y.Lang.substitute(OPTION,{key:cols[i].key,label:cols[i].label})
          Y.one("#"+this.get("searchDom")).setContent(Y.Lang.substitute(SELECT,{options:options})+INPUT);
        },
        _executeQuery:function(e){
          if(e.keyCode==13){
            var value = e.container.one(".searchBoxInput").get("value");
            var name = e.container.one(".searchSelect").get("value");
            value = value.replace(/\s*$/,"");
            value = value.replace(/^\s*/,"");
            var options={};
            options[name] = value;
            this.get('host').datasource.query(options);
          }
        }
    });

    Y.namespace("Plugin").IrmDTSearchBox = IrmDTSearchBox;
});