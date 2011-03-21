YUI.add("dtpaginator",function(Y){
    var SELECT = "<select class='rowPerPage'>{options}</select>";
    var OPTION = "<option value='{key}'>{label}</option>";
    var INPUT = "<input type='text' size='3' class='goPage'/><label class='totalPage'>{totalPage}</labe>";
    var PAGEPRENEXT = "<a href='javascript:void(0)' class='prePage'>{prepage}</a>|<a href='javascript:void(0)' class='nextPage'>{nextpage}</a>";

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
      perPages:{
          value: [5,10,25,50,100]
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
        _paginateOptions: {totalPage:1,currentPage:1,count:20},
        initializer: function(config) {
           this.doAfter("_setColumnset", this._beforeRenderUI);
           Y.one("#"+this.get("paginatorDom")).delegate('click',this._prePage,'.prePage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('click',this._nextPage,'.nextPage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('change',this._changeRowPerPage,'.rowPerPage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('keyup',this._changePage,'.goPage',this);
           var dt = this.get("host");
           dt.on("metaDataChange", Y.bind(this._onMetaDataChange,this));
        },
        _beforeRenderUI:function(){
          var options = "";
          var cols = this.get("perPages");
          for(var i=0;i<cols.length;i++)
            options+=Y.Lang.substitute(OPTION,{key:cols[i],label:cols[i]})
          Y.one("#"+this.get("paginatorDom")).setContent(Y.Lang.substitute(PAGEPRENEXT,this.get("paginatorLabels"))+Y.Lang.substitute(SELECT,{options:options})+Y.Lang.substitute(INPUT,{totalPage:this._paginateOptions.totalPage}));
          this._setupOptions();
        },
        _nextPage:function(e){
          this._goToPage(this._paginateOptions.currentPage+1);
        },
        _prePage:function(e){
          this._goToPage(this._paginateOptions.currentPage-1);
        },
        _changePage:function(e){
          var value = e.target.get("value");
          if(e.keyCode<48&&e.keyCode>57){
            value=value.replace(/[^\d]/g,'') ;
          }

          if(e.keyCode==13){
            value = parseInt(value);
            value = value||0;
            value = Math.max(1,value);
            value = Math.min(this._paginateOptions.totalPage,value);
            this._goToPage(value);
          }
          e.target.set("value",value);
        },
        _goToPage:function(page){
           var value = Math.max(1,page);
           value = Math.min(this._paginateOptions.totalPage,value);
           var start = (value-1)*this._paginateOptions.count
           this.get('host').datasource.paginate({start:start},true);
        },
        _changeRowPerPage:function(e){
          this.get('host').datasource.paginate({count:e.target.get("value")},true);
        },
        _onMetaDataChange:function(e){
          var meta = e.meta;
          Y.mix(this._paginateOptions,{totalPage:Math.ceil(meta.numRows/meta.count)},true);
          Y.mix(this._paginateOptions,{currentPage:Math.ceil((meta.start+1)/meta.count)},true);
          Y.mix(this._paginateOptions,{count:meta.count},true);
          this._setupOptions();
        },
        _setupOptions:function(){
          Y.one("#"+this.get("paginatorDom")).one(".rowPerPage").set("value",this._paginateOptions.count);
          Y.one("#"+this.get("paginatorDom")).one(".goPage").set("value",this._paginateOptions.currentPage);
          Y.one("#"+this.get("paginatorDom")).one(".totalPage").setContent(this._paginateOptions.totalPage);
          if(this._paginateOptions.currentPage==this._paginateOptions.totalPage)
            Y.one("#"+this.get("paginatorDom")).one(".nextPage").setAttribute("disabled","true");
          else
            Y.one("#"+this.get("paginatorDom")).one(".nextPage").setAttribute("disabled","false");

          if(this._paginateOptions.currentPage==1)
            Y.one("#"+this.get("paginatorDom")).one(".prePage").setAttribute("disabled","true");
          else
            Y.one("#"+this.get("paginatorDom")).one(".prePage").setAttribute("disabled","false");

        }
    });

    Y.namespace("Plugin").IrmDTPaginator = IrmDTPaginator;
});