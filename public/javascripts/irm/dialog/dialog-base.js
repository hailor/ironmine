YUI.add('dialog', function(Y) {

Y.Dialog = Y.Base.create("dialog", Y.Widget, [Y.WidgetStdMod, Y.WidgetPosition, Y.WidgetStack, Y.WidgetPositionAlign, Y.WidgetPositionConstrain],{
  bindUI: function(){
      this.get("contentBox").appendChild("<div>ccccccccccccccccccccc</div>");
  }
},{
    ATTRS:{
        headerContent:{
            value:"Dialog"
        }
    }
});


}, '@VERSION@' ,{requires:['widget', 'widget-stdmod', 'widget-position', 'widget-stack', 'widget-position-align', 'widget-position-constrain']});
