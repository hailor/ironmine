YUI.add("dtcolwidth",function(Y){
    var     TEMPLATE_COL = '<col></col>';
    var     TEMPLATE_WCOL = '<col width="{width}"></col>';
    function IrmDTColWidth() {
        IrmDTColWidth.superclass.constructor.apply(this, arguments);
    }

Y.mix(IrmDTColWidth, {

    NS: "colwidth",

    NAME: "dataTableColWidth",

    ATTRS: {

    }
});

Y.extend(IrmDTColWidth, Y.Plugin.Base, {
        initializer: function(config) {
           this.doBefore("_addColgroupNode", this._beforeAddColgroupNode);
        },
        _beforeAddColgroupNode: function(tableNode) {
            var dt = this.get("host");
            var definitions = dt.get("columnset").get("definitions"),
                i = 0,
                allCols = ["<colgroup>"];
            var str = "";
            for(; i<definitions.length; ++i) {
               var column = definitions[i];
               if(column.width)
                 str = Y.Lang.substitute( TEMPLATE_WCOL, {width:column.width});
               else
                 str = TEMPLATE_COL;
               allCols.push(str);
            }

            allCols.push("</colgroup>");

            // Create COLGROUP
            dt._colgroupNode = tableNode.insertBefore(Y.Node.create(allCols.join("")), tableNode.get("firstChild"));

            return new Y.Do.Prevent();
        }
    });

    Y.namespace("Plugin").IrmDTColWidth = IrmDTColWidth;
});