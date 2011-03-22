YUI.add("dtpaginator",function(Y){
    var TB = "<table class='paginator'><tbody><tr><td class='col1'>{record}</td><td class='col2 rowPerPageTD'>{perPage}</td><td class='col3'>{prenext}</td><td class='col4'>{goToPage}</td></tr></tbody></table>";
    var SELECT = "<label>{rowPerPage}</label>:<select class='rowPerPage'>{options}</select>";
    var OPTION = "<option value='{key}'>{label}</option>";
    var RECORD = "<label>{record}</label>:<label class='record'></label>";
    var GOTOPAGE = "<label>{page}</label><input type='text' size='3' class='goToPage'/><label class='totalPage'>/{totalPage}</labe><label class='totalPage'>/{totalPage}</labe>";
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
          value: {record:"Record",rowPerPage:"Row per Page",prepage:'Pre',nextpage: 'Next',page:"Page"}
      },
      rowPerPage:{
          value:true
      }
    }
});

Y.extend(IrmDTPaginator, Y.Plugin.Base, {
        _paginateOptions: {totalPage:1,currentPage:1,count:20,numRows:0},
        initializer: function(config) {
           this.doAfter("_setColumnset", this._beforeRenderUI);
           Y.one("#"+this.get("paginatorDom")).delegate('click',this._prePage,'.prePage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('click',this._nextPage,'.nextPage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('change',this._changeRowPerPage,'.rowPerPage',this);
           Y.one("#"+this.get("paginatorDom")).delegate('keyup',this._changePage,'.goToPage',this);
           var dt = this.get("host");
           dt.on("metaDataChange", Y.bind(this._onMetaDataChange,this));
        },
        _beforeRenderUI:function(){
          var options = "";
          var cols = this.get("perPages");
          for(var i=0;i<cols.length;i++)
            options+=Y.Lang.substitute(OPTION,{key:cols[i],label:cols[i]});

          var record = Y.Lang.substitute(RECORD,this.get("paginatorLabels"));
          var perPage = Y.Lang.substitute(SELECT,{options:options,rowPerPage:this.get("paginatorLabels").rowPerPage});
          var prenext = Y.Lang.substitute(PAGEPRENEXT,this.get("paginatorLabels"));
          var goToPage = Y.Lang.substitute(GOTOPAGE,this.get("paginatorLabels"));
          var uis = {record:record,perPage:perPage,prenext:prenext,goToPage:goToPage};
          Y.one("#"+this.get("paginatorDom")).setContent(Y.Lang.substitute(TB,uis) );
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
          var options = {count:e.target.get("value")};
          if(options.count>this._paginateOptions.total)
            Y.mix(options,{start:0},true);
          this.get('host').datasource.paginate(options,true);
        },
        _onMetaDataChange:function(e){
          var meta = e.meta;
          Y.mix(this._paginateOptions,{totalPage:Math.ceil(meta.numRows/meta.count)},true);
          Y.mix(this._paginateOptions,{currentPage:Math.ceil((meta.start+1)/meta.count)},true);
          Y.mix(this._paginateOptions,{count:meta.count},true);
          Y.mix(this._paginateOptions,{start:meta.start},true);
          Y.mix(this._paginateOptions,{total:meta.numRows},true);
          this._setupOptions();
        },
        _setupOptions:function(){
          var recordend = this._paginateOptions.currentPage*this._paginateOptions.count;
          if(this._paginateOptions.currentPage==this._paginateOptions.totalPage)
            recordend = this._paginateOptions.total;
          Y.one("#"+this.get("paginatorDom")).one(".record").setContent((this._paginateOptions.start+1)+"-"+recordend+"/"+this._paginateOptions.total);
          Y.one("#"+this.get("paginatorDom")).one(".rowPerPage").set("value",this._paginateOptions.count);
          Y.one("#"+this.get("paginatorDom")).one(".goToPage").set("value",this._paginateOptions.currentPage);
          Y.one("#"+this.get("paginatorDom")).one(".totalPage").setContent("/"+this._paginateOptions.totalPage);
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