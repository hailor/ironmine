YUI.add('menubutton', function(Y) {
    function MenuButton(config){
        MenuButton.superclass.constructor.apply(this, arguments);
    }

    Y.mix(MenuButton, {

        NAME: "MenuButton",

        ATTRS: {
            menuNode:{setter: Y.one},
            dropAlign:{value:["TL","BL"]}
        }
    });

    Y.extend(MenuButton, Y.Base, {
        _menuContent: null,
        _menuLabel: null,
        _menuOverlay: null,
        _globalClickHandle: null,
        initializer: function(config) {
          this._menuContent = this.get("menuNode").one(".menuContent");
          this._menuLabel = this.get("menuNode").one(".menuLabel");
          this.renderUI();
          this.bindUI();
        },
        renderUI: function(){
           this._menuOverlay = new Y.Overlay({srcNode:this._menuContent,visible:false,zIndex:1000});
           this._menuOverlay.set("align", {node:this._menuLabel,
             points:[Y.WidgetPositionAlign[this.get("dropAlign")[0]], Y.WidgetPositionAlign[this.get("dropAlign")[1]]]
           });
           this._menuOverlay.render();
        },
        bindUI: function(){
            this._menuLabel.on("mouseenter",function(e){
               if(!e.currentTarget.hasClass("menuLabelHover"))
                 e.currentTarget.addClass("menuLabelHover");
            });

            this._menuLabel.on("mouseleave",function(e){
             if(e.currentTarget.hasClass("menuLabelHover"))
                 e.currentTarget.removeClass("menuLabelHover");
             });

            this._menuLabel.on("click",Y.bind(this._renderOverlay,this));
        },
        _renderOverlay: function(e){
              if(!e.currentTarget.hasClass("menuLabelClick"))
              {
                  e.currentTarget.addClass("menuLabelClick");
              }
              else
              {
                  e.currentTarget.removeClass("menuLabelClick");
              }

              if(!this._menuContent.hasClass("menuContentVisual"))
              {
                this._menuContent.addClass("menuContentVisual");
                if(parseInt(this._menuLabel.getComputedStyle("width"))>parseInt(this._menuContent.getComputedStyle("width")))
                  this._menuContent.setStyle("width",this._menuLabel.getComputedStyle("width"));
                  this._menuOverlay.set("align", {node:this._menuLabel,
                      points:[Y.WidgetPositionAlign[this.get("dropAlign")[0]], Y.WidgetPositionAlign[this.get("dropAlign")[1]]]
                  });
                this._menuOverlay.set("visible",true);
                this._globalClickHandle = Y.one("document").on("click",Y.bind(this._hiddenOverlay,this))
              }
              else{
                this._menuContent.removeClass("menuContentVisual");
                this._menuOverlay.set("visible",false);
                if(this._globalClickHandle){
                  this._globalClickHandle.detach();
                  this._globalClickHandle=null;
                }
              }
        },
        _hiddenOverlay: function(e){
          if(!this.get("menuNode").one("#"+e.target.get('id'))){
            if(this._menuLabel.hasClass("menuLabelClick"))
              this._menuLabel.removeClass("menuLabelClick");
            if(this._menuContent.hasClass("menuContentVisual")){
                this._menuContent.removeClass("menuContentVisual");
                this._menuOverlay.set("visible",false);
            }
            if(this._globalClickHandle){
                this._globalClickHandle.detach();
                this._globalClickHandle=null;
            }
          }
        }

    });

    Y.MenuButton = MenuButton;
}, '@VERSION@' ,{requires:["base","node-base","overlay"]});
