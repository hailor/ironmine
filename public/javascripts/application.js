// irm模块公共的方法
YUI.add('irm', function(Y) {

    Y.namespace('irm');

    Y.irm.publisher = new Y.EventTarget();
    Y.irm.publisher.publish('irm:change', {
      broadcast: 1,   // instance level notification
      emitFacade: true // emit a facade so we get the event target
    });

    Y.irm.setAttribute = function(name,value,type){
      this[name] = value;
      Y.irm.publisher.fire("irm:change",name,value,type);
    };

    Y.irm.handleClick = function(){
        Y.one("#content").addClass("ccc");
      };
    //表格模板formatter
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
    //表格显示行号列
    Y.irm.rownum = function(o){
      return o.rowindex;
    };
    //菜单式按钮
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
    //设置页面导航树
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
    };
    //表格过过滤器
    Y.irm.ViewFilter = function (domid){
       Y.on("irm:change",function(e){
           Y.one("#"+domid).all("select.viewFilter").each(function(n){
             if(e.details[2]=="Datatable"&&n.getAttribute("ref")==e.details[0])
             {
               var datasource = e.details[1].datasource;
               Y.one("#"+n.get("id")+"Overview").setStyle("display","block");
               datasource.filter({_view_filter_id:n.get("value")});
               n.on("change",function(e){
                   datasource.filter({_view_filter_id:n.get("value")});
               });
               Y.one("#"+n.get("id")+"EditLink").on("click",function(e){
                   if(!this.getAttribute("thref")){
                      this.setAttribute("thref",this.getAttribute("href"));
                   }
                   var href = unescape(this.getAttribute("thref"));
                   href = Y.Lang.substitute(href,{id:n.get("value")});
                   this.setAttribute("href",href);
                   if(!n.get("value"))
                    e.preventDefault()
               });
             }
           });
       });
    };
    //表格过过滤器编辑逻辑
    Y.irm.rawConditionClause = function (e){
        var content = Y.one("#rawConditionClause").get("value");
        var addition = e.target.getAttribute("ref");
        content = content.replace(/\s*$/,"");
        content = content.replace(/^\s*/,"");
        var re = new RegExp(e.target.getAttribute("ref"));
        var m = re.exec(content);
        if(e.target.get("value"))
        {
            if(m == null){

              if(new RegExp("\\d+").exec(content)!=null)
                addition = " AND "+ addition;
              Y.one("#rawConditionClause").set("value",content+ addition);
            }
        }
        else
        {
          if(m != null){
            var originLength = content.length;
            if(m.index ==0){
              var rp = new RegExp(addition+"\\s*AND\\s*");
              content = content.replace(rp,"");
              rp = new RegExp(addition+"\\s+OR\\s*");
              content = content.replace(rp,"");
              if(originLength == content.length)
                content = content.replace(re,"");
            }
            else{
              var rp = new RegExp("AND\\s*"+addition+"\\s*");
              content = content.replace(rp,"");
              rp = new RegExp("OR\\s*"+addition+"\\s*");
              content = content.replace(rp,"");
              if(originLength == content.length)
                content = content.replace(re,"");
            }
            Y.one("#rawConditionClause").set("value",content);
          }
        }
      };

}, '0.1.1' /* module version */, {
    requires: ['base',"overlay","node-event-simulate","event-custom","event-mouseenter"]
});

GY.use('node',function(Y){
   Y.all('input[irm_uppercase]').on('keyup', function(){
      this.set('value',this.get('value').toString().toUpperCase());
   });
});
//记住用户名
GY.use("cookie",function(Y){
   if(Y.Cookie.get("username")){
      Y.Cookie.set("username", Y.Cookie.get("username"), { expires: new Date("January 12, 2025") });
   }
});
