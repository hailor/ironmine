YUI.add('cascadeselect', function(Y) {
    var OPTIONS_TEMPLATE = "<option value={value}>{label}</option>";
    function CascadeSelect(config){
        CascadeSelect.superclass.constructor.apply(this, arguments);
    }

    Y.mix(CascadeSelect, {

        NAME: "CascadeSelect",

        ATTRS: {
            source:{},
            target:{},
            event:{
                value: "change"
            }
        }
    });

    Y.extend(CascadeSelect, Y.Base, {
        initializer: function(config) {
          var source = Y.one(this.get("source"));
          source.on(this.get("event"), Y.bind(this._onSourceEvent,this));
          source.simulate('change');
        },
        _onSourceEvent : function(e){
           var targets = this.get("target");
           for(var i=0;i<targets.length;i++){
               var target = Y.one(targets[i]);

               var href = target.getAttribute("href");
               var depends = target.getAttribute("depend");
               if(depends!="")
                   depends=depends.split(",");
               else
                   depends = [];
               var url_options = {};
               var value_length = 0;

               for(var j=0;j<depends.length;j++){
                 if(Y.one("#"+depends[j]).get("value")&&Y.one("#"+depends[j]).get("value")!=""){
                   url_options[depends[j]] = Y.one("#"+depends[j]).get("value");
                   value_length++;
                 }
               }

               if(value_length==depends.length){
                 href = Y.Lang.substitute(unescape(href),url_options);
                 var cfg = {
                     on: {complete: this._prepareOptions},
                     arguments: {complete:target}
                 };
                 Y.io(href, cfg);

               }else
               {
                 var options = "";
                 if(target.getAttribute("blank")!="")
                   options =  options+Y.Lang.substitute(OPTIONS_TEMPLATE,{label:target.getAttribute("blank"),value:""}) ;
                 target.setContent(options);
                 target.set("value","");
                 target.simulate('change');
               }
           }
        },
        _prepareOptions: function(transactionId, response, arg){
          var results = Y.JSON.parse(response.responseText);
          var options = "";
          var items = results["items"];
          for(var o in items){
             options += Y.Lang.substitute(OPTIONS_TEMPLATE,items[o]);
          }
          var target = arg["complete"];
          if(target.getAttribute("blank")!="")
             options =  Y.Lang.substitute(OPTIONS_TEMPLATE,{label:target.getAttribute("blank"),value:""})+options ;
          target.setContent(options);
          target.set("value","");
          target.simulate('change');
        }

    });

    Y.CascadeSelect = CascadeSelect;
}, '@VERSION@' ,{requires:["io-base","substitute","json-parse"]});
