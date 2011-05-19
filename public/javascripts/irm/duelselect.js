YUI.add('duelselect', function(Y) {
    function DuelSelect(config){
        DuelSelect.superclass.constructor.apply(this, arguments);
    }

    Y.mix(DuelSelect, {

        NAME: "DuelSelect",

        ATTRS: {
            source:{setter: Y.one},
            target:{setter: Y.one},
            addButton:{setter: Y.one},
            removeButton:{setter: Y.one},
            type:{value:""},
            query:{value:""},
            valueNode:{setter: Y.one},
            selectedValue:{value:[]}
        }
    });

    Y.extend(DuelSelect, Y.Base, {
        _storedOptions:[],
        _values:[],
        initializer: function(config) {
            this._prepareOptions();
            this._bindUI();
            this._syncUI();
        },
        _prepareOptions: function(){
          this.get("source").all("option").each(Y.bind(function(e){
              this._storedOptions.push(e)
          },this));

          this._values = this.get("valueNode").get("value").split(",");
        },
        _bindUI: function(){
            if(this.get("addButton"));
              this.get("addButton").on("click",Y.bind(this._add,this));
            if(this.get("removeButton"));
              this.get("removeButton").on("click",Y.bind(this._remove,this));
        },
        _syncUI: function(){
            this.get("source").setContent("");
            this.get("target").setContent("");
            for(var i in this._storedOptions){
                var option = this._storedOptions[i];
                var selectableOption = option;
                if(this._present(this.get("type"))&&this.get("type")!=option.getAttribute("type")){
                  selectableOption = null;
                }
                if(this._present(this.get("query"))&&option.getAttribute("query").indexOf(this.get("query"))<0){
                  selectableOption = null;
                }
                if(Y.Array.indexOf(this._values,option.getAttribute("value"))>-1){
                  this.get("target").appendChild(option);
                  selectableOption = null;
                }
                if(selectableOption)
                  this.get("source").appendChild(selectableOption);
            }
        },
        _syncValue: function(){
          this.get("valueNode").set("value",this._values.join(","))
        },
        filter: function(type,query){
          this.set("type",type);
          this.set("query",query);
          this._syncUI();
        },
        _add: function(){
          var addValues = this._getMultSelectValue(this.get("source"));
          this._values = this._values.concat(addValues);
          this._syncValue();
          this._syncUI();
        },
        _remove: function(){
          var newValues = [];
          var removeValues = this._getMultSelectValue(this.get("target"));
          for(var e in this._values){
            if(Y.Array.indexOf(removeValues,this._values[e])<0)
              newValues.push(this._values[e]);
          }
          this._values = newValues;
          this._syncValue();
          this._syncUI();
        },
        _getMultSelectValue:function(selectNode){
          var values = [];
          selectNode.get("options").each(function(e){
              if(e._node.selected)
                values.push(e._node.value);
          });
          return values;
        },
        _present:function(value){
          return value&&value!=""
        }
    });

    Y.DuelSelect = DuelSelect;
}, '@VERSION@' ,{requires:[]});
