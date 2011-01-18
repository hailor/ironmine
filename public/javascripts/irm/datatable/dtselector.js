YUI.add("dtselector",function(Y){

    var M_TEMPLATE_TH = '<th id="{id}" rowspan="{rowspan}" colspan="{colspan}" class="datableSelector {classnames}" abbr="{abbr}"><div class="'+Y.ClassNameManager.getClassName("datatable","liner")+'"><input type="checkbox"/></div></th>';
    var S_TEMPLATE_TH = '<th id="{id}" rowspan="{rowspan}" colspan="{colspan}" class="datableSelector {classnames}" abbr="{abbr}"><div class="'+Y.ClassNameManager.getClassName("datatable","liner")+'"></div></th>';
    var TEMPLATE_TD = '<td headers="{headers}" class="{classnames}" ref="{rowindex}"><div class="'+Y.ClassNameManager.getClassName("datatable","liner")+'"><input type="checkbox"/></div></td>';

    function IrmDTSelector() {
        IrmDTSelector.superclass.constructor.apply(this, arguments);
    }

Y.mix(IrmDTSelector, {
    NS: "selector",
    NAME: "dataTableSelector",
    ATTRS: {
        thValueTemplate: {
            value: M_TEMPLATE_TH
        },
        tdValueTemplate: {
            value: TEMPLATE_TD
        },
        mode: {
            value: "multiple"
        }
    }
});

Y.extend(IrmDTSelector, Y.Plugin.Base, {
        selectedIndex:[],
        selectedItems: function(items){
          var items = [],
              recordset = this.get("host").get("recordset");
          for(var i = 0;i<this.selectedIndex.length;i++){
             items.push(recordset.getRecord(this.selectedIndex[i]).get("data"));
          }
          return items;
        },
        initializer: function(config) {
           var dt = this.get("host");
           dt.publish("selectedChange", {defaultFn: this._defSelectedChange, emitFacade:true, queuable:true});
           this.doBefore("_attachTheadThNode", this._beforeAttachTheadThNode);
           this.doBefore("_attachTbodyTdNode",this._beforeAttachTbodyTdNode);
           this.doBefore("_uiSetRecordset",this._beforeUiSetRecordset);
           dt.on("theadCellClick", Y.bind(this._onAllSelected,this));
           dt.on("tbodyCellClick", Y.bind(this._onCellSelected,this));

           if(this._singleMode())
             this.set("thValueTemplate",S_TEMPLATE_TH);
           else
             this.set("thValueTemplate",M_TEMPLATE_TH);
        },
        _beforeAttachTheadThNode:function(o){
          if(o.column.get("key")=="dt_selector")
            //Y.log(o);
            o.th=Y.Lang.substitute( this.get("thValueTemplate"), o);
        },
        _beforeAttachTbodyTdNode:function(o){
          if(o.column.get("key")=="dt_selector")
            //Y.log(o);
            o.td=Y.Lang.substitute( this.get("tdValueTemplate"), o);
        },
        _beforeUiSetRecordset:function(rs){
          this.selectedIndex = [];
            var allcheckbox = this.get("host")._parentNode.one("th.datableSelector input[type=checkbox]");
            if(allcheckbox)
              allcheckbox.set("checked",false);
        },
        _onAllSelected:function(e){
          var dt = this.get("host"),
              recordset = dt.get("recordset"),
            column = dt.get("columnset").idHash[e.currentTarget.get("id")];
          if(column.get("key")!="dt_selector")
            return ;
          var columnId = e.currentTarget.get("id"),
            checkbox = e.currentTarget.one("input[type=checkbox]");

          if(checkbox){
            if(checkbox.get("checked"))
            {
              dt._tableNode.all("td[headers="+columnId+"] input[type=checkbox]").set("checked",true);
              this.selectedIndex = [];
              for(var i=0;i<recordset.getLength();i++)
                this.selectedIndex.push(i);
            }
            else{
              dt._tableNode.all("td[headers="+columnId+"] input[type=checkbox]").set("checked",false);
              this.selectedIndex = [];
            }
            dt.fire("selectedChange",this.selectedItems());  
          }
        },
        _onCellSelected:function(e){
            var dt = this.get("host"),
                column = dt.get("columnset").idHash[e.currentTarget.getAttribute("headers")];
            if(column.get("key")!="dt_selector")
              return ;
            var index = parseInt(e.currentTarget.getAttribute("ref")),
                columnId = e.currentTarget.get("headers"),
                allcheckbox = Y.one("#"+columnId+" input[type=checkbox]"),
                checkbox = e.currentTarget.one("input[type=checkbox]");

            if(checkbox.get("checked")){

              if(this._singleMode()){
                dt._tableNode.all("td[headers="+columnId+"] input[type=checkbox]").set("checked",false);
                this.selectedIndex = [];
                checkbox.set("checked",true);
                this.selectedIndex.push(index);
              }else{
                this.selectedIndex.push(index);
                this._checkSelectAll(allcheckbox);
              }
            }
            else{
              var i = this.selectedIndex.indexOf(index);
              if (i >= 0) {
                this.selectedIndex.splice(i, 1);
              }
              this._checkSelectAll(allcheckbox);
            }
            dt.fire("selectedChange",this.selectedItems());
        },
        _checkSelectAll:function(node){
          if(this.selectedIndex.length == this.get("host").get("recordset").getLength())
            node.set("checked",true);
          else
            node.set("checked",false);
        },
        _singleMode: function(){
          return (this.get("mode") == "single");
        },
        _defSelectedChange:function(e){
          Y.log(e);
        }

    });

    Y.namespace("Plugin").IrmDTSelector = IrmDTSelector;
});