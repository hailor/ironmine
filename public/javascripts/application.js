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
        console.log("enter");
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
          console.log("close");
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

var siteCount = 0;
function add_site_Field(){
    if (siteCount >= 10)
        return false;
    siteCount++;
    var f1 = document.createElement("input");
    f1.type = "text";
    f1.name = "irm_sites[" + siteCount + "][site_code]";
    var f2 = document.createElement("input");
    f2.type = "text";
    f2.name = "irm_sites[" + siteCount + "][name]";
    var f3 = document.createElement("input");
    f3.type = "text";
    f3.name = "irm_sites[" + siteCount + "][description]";

    var span1 = document.createElement("span");
    span1.setAttribute("class","lookupInput");
    var span2 = document.createElement("span");
    span2.setAttribute("class","lookupInput");
    var span3 = document.createElement("span");
    span3.setAttribute("class","lookupInput");

    var cell1=document.createElement("td");// 创建td
    var cell2=document.createElement("td");// 创建td
    var cell3=document.createElement("td");// 创建td
    var row=document.createElement("tr");// 创建tr

    span1.appendChild(f1);
    span2.appendChild(f2);
    span3.appendChild(f3);
    cell1.appendChild(span1);
    cell2.appendChild(span2);
    cell3.appendChild(span3);

    row.appendChild(cell1);
    row.appendChild(cell2);
    row.appendChild(cell3);

    var p = document.getElementById("site_fields");
    p.appendChild(row);
}

function delete_site_last_row(){
   if (siteCount <= 0)
        return false;
   siteCount--;
   var t=document.getElementById('site_fields');
   t.removeChild(t.lastChild);
}