YUI.add("datatable-sort",function(G){var F=G.ClassNameManager.getClassName,H="datatable",B="column",D="asc",C="desc",A='<a class="{link_class}" title="{link_title}" href="{link_href}">{value}</a>';function E(){E.superclass.constructor.apply(this,arguments);}G.mix(E,{NS:"sort",NAME:"dataTableSort",ATTRS:{trigger:{value:"theadCellClick",writeOnce:"initOnly"},lastSortedBy:{setter:"_setLastSortedBy",lazyAdd:false},template:{value:A}}});G.extend(E,G.Plugin.Base,{initializer:function(I){var J=this.get("host");J.get("recordset").plug(G.Plugin.RecordsetSort,{dt:J});J.get("recordset").sort.addTarget(J);this.doBefore("_createTheadThNode",this._beforeCreateTheadThNode);this.doBefore("_attachTheadThNode",this._beforeAttachTheadThNode);this.doBefore("_attachTbodyTdNode",this._beforeAttachTbodyTdNode);J.on(this.get("trigger"),G.bind(this._onEventSortColumn,this));J.after("recordsetSort:sort",function(){this._uiSetRecordset(this.get("recordset"));});this.on("lastSortedByChange",function(K){this._uiSetLastSortedBy(K.prevVal,K.newVal,J);});if(J.get("rendered")){J._uiSetColumnset(J.get("columnset"));this._uiSetLastSortedBy(null,this.get("lastSortedBy"),J);}},_setLastSortedBy:function(I){if(G.Lang.isString(I)){return{key:I,dir:"asc",notdir:"desc"};}else{if(I&&I.key){if(I.dir==="desc"){return{key:I.key,dir:"desc",notdir:"asc"};}else{return{key:I.key,dir:"asc",notdir:"desc"};}}else{return null;}}},_uiSetLastSortedBy:function(M,J,I){var U=M&&M.key,N=M&&M.dir,T=J&&J.key,K=J&&J.dir,Q=I.get("columnset"),S=Q.keyHash[U],O=Q.keyHash[T],R=I._tbodyNode,L,P;if(S){S.thNode.removeClass(F(H,N));L=R.all("."+F(B,S.get("id")));L.removeClass(F(H,N));}if(O){O.thNode.addClass(F(H,K));P=R.all("."+F(B,O.get("id")));P.addClass(F(H,K));}},_beforeCreateTheadThNode:function(I){if(I.column.get("sortable")){I.value=G.substitute(this.get("template"),{link_class:I.link_class||"",link_title:"title",link_href:"#",value:I.value});}},_beforeAttachTheadThNode:function(M){var L=this.get("lastSortedBy"),K=L&&L.key,I=L&&L.dir,J=L&&L.notdir;if(M.column.get("sortable")){M.th.addClass(F(H,"sortable"));}if(K&&(K===M.column.get("key"))){M.th.replaceClass(F(H,J),F(H,I));}},_beforeAttachTbodyTdNode:function(M){var L=this.get("lastSortedBy"),K=L&&L.key,I=L&&L.dir,J=L&&L.notdir;if(M.column.get("sortable")){M.td.addClass(F(H,"sortable"));}if(K&&(K===M.column.get("key"))){M.td.replaceClass(F(H,J),F(H,I));}},_onEventSortColumn:function(N){N.halt();var L=this.get("host"),K=L.get("columnset").idHash[N.currentTarget.get("id")],J=K.get("key"),M=K.get("field"),O=this.get("lastSortedBy"),I=(O&&O.key===J&&O.dir===D)?C:D,P=K.get("sortFn");if(K.get("sortable")){L.get("recordset").sort.sort(M,I===C,P);this.set("lastSortedBy",{key:J,dir:I});}}});G.namespace("Plugin").DataTableSort=E;},"@VERSION@",{lang:["en"],requires:["datatable-base","plugin","recordset-sort"]});