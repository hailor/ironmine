YUI.add('irmac', function(Y) {
   Y.namespace("irmac");
   function ACListPlugin(config) {
       config.inputNode = config.host;

       // Render by default.
       if (!config.render && config.render !== false) {
         config.render = true;
       }

       ACListPlugin.superclass.constructor.apply(this, arguments);
   }

   Y.extend(ACListPlugin, Y.AutoCompleteList, {}, {
       NAME      : 'autocompleteListPlugin',
       NS        : 'ac',
       CSS_PREFIX: Y.ClassNameManager.getClassName('aclist')
   });

   Y.irmac.AutoComplete     = ACListPlugin;


}, '@VERSION@' ,{requires:['autocomplete-list', 'node-pluginhost']});