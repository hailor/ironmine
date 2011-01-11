YUI.add('irm', function(Y) {

    Y.namespace('irm');

    Y.irm.handleClick = function(){
        Y.one("#content").addClass("ccc");
        alert("hello");
      };
    // {tbody, tr, td, classnames, headers, rowindex, record, column, data, value}
    Y.irm.template = function(o){
       var templateNode = this._parentNode.one("#"+o.column.get("key"));
       if(templateNode){
         return Y.Lang.substitute(unescape(templateNode.get('innerHTML')),o.data);
       }
       else{
           return o.value;
       }
    };

    Y.irm.rownum = function(o){
      return o.rowindex;
    };

    Y.irm.menuButton = function(domid,calign,lalign){
      var menuNode = Y.one("#"+domid);
      var menuContent = menuNode.one(".menuContent");
      var menuLabel = menuNode.one(".menuLabel");
      var overlay = new Y.Overlay({srcNode:menuContent,visible:false,zIndex:1000});
      overlay.set("align", {node:menuLabel,
        points:[Y.WidgetPositionAlign[calign||"TL"], Y.WidgetPositionAlign[lalign||"BL"]]
      });
      overlay.render();

      menuNode.delegate("mouseenter",function(e){
        if(!this.hasClass("menuLabelHover"))
          this.addClass("menuLabelHover");
      },".menuLabel");

     menuNode.delegate("mouseleave",function(e){
      if(this.hasClass("menuLabelHover"))
          this.removeClass("menuLabelHover");
      },".menuLabel");

      menuLabel.on("click",function(e){
        if(!e.currentTarget.hasClass("menuLabelClick"))
        {  e.currentTarget.addClass("menuLabelClick"); }
         else
        {  e.currentTarget.removeClass("menuLabelClick");}
        if(!menuContent.hasClass("menuContentVisual"))
        {
          menuContent.addClass("menuContentVisual");
          if(parseInt(menuLabel.getComputedStyle("width"))>parseInt(menuContent.getComputedStyle("width")))
            menuContent.setStyle("width",menuLabel.getComputedStyle("width"));
          overlay.set("align", {node:menuLabel,
             points:[Y.WidgetPositionAlign[calign||"TL"], Y.WidgetPositionAlign[lalign||"BL"]]
          });  
          overlay.set("visible",true);
        }
        else{
          menuContent.removeClass("menuContentVisual");
          overlay.set("visible",false);
        }
      },"*");

      Y.one("document").on("click",function(e){
          if(menuNode&&!menuNode.one("#"+e.target.get('id'))){
            if(menuLabel.hasClass("menuLabelClick"))
              menuLabel.removeClass("menuLabelClick");
            if(menuContent.hasClass("menuContentVisual")){
                menuContent.removeClass("menuContentVisual");
                overlay.set("visible",false);
            }
          }
      });
    };

    Y.irm.navTree = function(domid,p_current_permissions,p_current_menus){
        var current_permissions = p_current_permissions;
        var current_menus = p_current_menus;
        // 处理展开事件
        Y.one("#"+domid).delegate("click",function(e){
          if(this.hasClass("NavTreeCol")){
            this.removeClass("NavTreeCol");
            this.addClass("NavTreeExp");
            Y.one('#'+this.getAttribute("real")+"_child").setStyle("display","block");
          }
          else{
            this.removeClass("NavTreeExp");
            this.addClass("NavTreeCol");
            Y.one('#'+this.getAttribute("real")+"_child").setStyle("display","none");
          }

        },".NavIconLink")
        //选中当前页面的结点
        Y.one("#"+domid).all(".parent").each(function(n){
          for(var i = 0;i<current_permissions.length;i++){
            var selectedNode = n.one("div.setupLeaf[mi='"+current_permissions[i]+"']");
            if(selectedNode){
              if(n.one(".NavIconLink")&&n.one(".NavIconLink").hasClass("NavTreeCol"))
                n.one(".NavIconLink").simulate("click")
            }
          }
          for(var i = 0;i<current_menus.length;i++){
            var selectedNode = n.one("a.NavIconLink[real='"+current_menus[i]+"']");
            if(selectedNode){
              if(n.one(".NavIconLink")&&n.one(".NavIconLink").hasClass("NavTreeCol"))
                n.one(".NavIconLink").simulate("click")
            }
          }
        });
          for(var i = 0;i<current_permissions.length;i++){
            var selectedNode = Y.one("#"+domid).one("div.setupLeaf[mi='"+current_permissions[i]+"']");
            if(selectedNode){
              selectedNode.addClass("setupHighlightLeaf");
            }
          }
    }

}, '0.1.1' /* module version */, {
    requires: ['base',"overlay","node-event-simulate","event-mouseenter"]
});

GY.use('node',function(Y){
   Y.all('input[irm_uppercase]').on('keyup', function(){
      this.set('value',this.get('value').toString().toUpperCase());
   });
});
function show_irm_calendar(YAHOO,Event,Dom,id_button,id_date_field,id_cal){
        var dialog, calendar;
        var showBtn = Dom.get(id_button);
        Event.on(showBtn, "click", function () {
            // Lazy Dialog Creation - Wait to create the Dialog, and setup document click listeners,
            // until the first time the button is clicked.
            //if (!dialog) {
                // Hide Calendar if we click anywhere in the document other than the calendar
                Event.on(document, "click", function (e) {
                    var el = Event.getTarget(e);
                    var dialogEl = dialog.element;
                    if (el != dialogEl && !Dom.isAncestor(dialogEl, el) &&
                            el != showBtn && !Dom.isAncestor(showBtn, el)) {
                        dialog.hide();
                    }
                });
                function resetHandler() {
                    // Reset the current calendar page to the select date, or
                    // to today if nothing is selected.
                    var selDates = calendar.getSelectedDates();
                    var resetDate;

                    if (selDates.length > 0) {
                        resetDate = selDates[0];
                    } else {
                        resetDate = calendar.today;
                    }

                    calendar.cfg.setProperty("pagedate", resetDate);
                    calendar.render();
                }
                function closeHandler() {
                    dialog.hide();
                }
                dialog = new YAHOO.widget.Dialog("container", {
                    visible: false,
                    context: [id_button, "tl", "bl"],
                    buttons: [{
                        text: "Reset",
                        handler: resetHandler,
                        isDefault: true
                    },
                    {
                        text: "Close",
                        handler: closeHandler
                    }],
                    draggable: false,
                    close: true
                });
                dialog.setHeader('Pick A Date');
                dialog.setBody('<div id='+id_cal+'></div>');
                dialog.render(document.body);
                dialog.showEvent.subscribe(function () {
                    if (YAHOO.env.ua.ie) {
                        // Since we're hiding the table using yui-overlay-hidden, we
                        // want to let the dialog know that the content size has changed, when
                        // shown
                        dialog.fireEvent("changeContent");
                    }
                });
            //}
            // Lazy Calendar Creation - Wait to create the Calendar until
            // the first time the button is clicked.
            //if (!calendar) {
                calendar = new YAHOO.widget.Calendar(id_cal, {
                    iframe: false,
                    // Turn iframe off,
                    // since container has iframe support.
                    hide_blank_weeks: true
                    // Enable, to demonstrate how we handle changing height,
                    //department using changeContent
                });
                calendar.render();

                calendar.selectEvent.subscribe(function () {
                    if (calendar.getSelectedDates().length > 0) {
                        var selDate = calendar.getSelectedDates()[0];
                        // Pretty Date Output, using Calendar's Locale values: Friday, 8 February 2008
                        calendar.cfg.setProperty("MONTHS_SHORT",   ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]);
                        var wStr = calendar.cfg.getProperty("WEEKDAYS_LONG")[selDate.getDay()];
                        var dStr = selDate.getDate();
                        var mStr = calendar.cfg.getProperty("MONTHS_SHORT")[selDate.getMonth()];
                        var yStr = selDate.getFullYear();
                        Dom.get(id_date_field).value =  yStr+"-"+mStr+"-"+dStr;
                    } else {
                        Dom.get(id_date_field).value = "";
                    }
                    dialog.hide();
                });

                calendar.renderEvent.subscribe(function () {
                // Tell Dialog it's contents have changed, which allows
                // container to redraw the underlay (for IE6/Safari2)
                dialog.fireEvent("changeContent");
                });
            //}
            var seldate = calendar.getSelectedDates();
            if (seldate.length > 0) {
                // Set the pagedate to show the selected date if it exists
                calendar.cfg.setProperty("pagedate", seldate[0]);
                calendar.render();
            }
            dialog.show();
        });
}
//记住用户名
GY.use("cookie",function(Y){
   if(Y.Cookie.get("username")){
      Y.Cookie.set("username", Y.Cookie.get("username"), { expires: new Date("January 12, 2025") });
   }
});
