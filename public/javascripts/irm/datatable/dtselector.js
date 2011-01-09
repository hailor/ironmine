YUI.add("dtselector",function(Y){

    var TEMPLATE_TH = '<th id="{id}" rowspan="{rowspan}" colspan="{colspan}" class="{classnames}" abbr="{abbr}"><div class="'+Y.ClassNameManager.getClassName("datatable","liner")+'"><input type="checkbox" /></div></th>';

    function IrmDTSelector() {
        IrmDTSelector.superclass.constructor.apply(this, arguments);
    }
/////////////////////////////////////////////////////////////////////////////
//
// STATIC PROPERTIES
//
/////////////////////////////////////////////////////////////////////////////
Y.mix(IrmDTSelector, {
    /**
     * The namespace for the plugin. This will be the property on the host which
     * references the plugin instance.
     *
     * @property NS
     * @type String
     * @static
     * @final
     * @value "selector"
     */
    NS: "selector",

    /**
     * Class name.
     *
     * @property NAME
     * @type String
     * @static
     * @final
     * @value "dataTableDataSource"
     */
    NAME: "dataTableSelector",

/////////////////////////////////////////////////////////////////////////////
//
// ATTRIBUTES
//
/////////////////////////////////////////////////////////////////////////////
    ATTRS: {
        /**
        * @attribute datasource
        * @description Pointer to DataSource instance.
        * @type Arrary
        */
        selectedItems: {
            setter: "_setSelectedItems"
        },
        thValueTemplate: {
            value: TEMPLATE_TH
        }
    }
});

Y.extend(IrmDTSelector, Y.Plugin.Base, {
        tmpcolumnset:[],
        _setSelectedItems: function(items){
            return items||[]
        },


        /////////////////////////////////////////////////////////////////////////////
        //
        // METHODS
        //
        /////////////////////////////////////////////////////////////////////////////
        /**
        * Initializer.
        *
        * @method initializer
        * @param config {Object} Config object.
        * @private
        */
        initializer: function(config) {
           this.doBefore("_attachTheadThNode", this._beforeAttachTheadThNode);
           //this.doBefore("_setColumnset", this._beforeSetColumnset);
           //this.doBefore("renderUI",this._beforeRenderUI);
        },
        _beforeAttachTheadThNode:function(o){
          if(o.column.get("key")=="dt_checkbox")
            //Y.log(o);
            o.th=Y.Lang.substitute(this.thTemplate, o);
        }


    });

    Y.namespace("Plugin").IrmDTSelector = IrmDTSelector;
},"@VERSION@",{requires:["substitute"]});