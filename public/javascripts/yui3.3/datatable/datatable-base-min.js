YUI.add("datatable-base",function(C){var W=C.Lang,G=W.isValue,g=C.Lang.substitute,D=C.Node,T=D.create,P=C.ClassNameManager.getClassName,Q="datatable",R="column",i="focus",l="keydown",H="mouseenter",O="mouseleave",K="mouseup",a="mousedown",d="click",V="dblclick",E=P(Q,"columns"),c=P(Q,"data"),B=P(Q,"msg"),L=P(Q,"liner"),f=P(Q,"first"),I=P(Q,"last"),U=P(Q,"even"),b=P(Q,"odd"),e="<table></table>",X="<col></col>",j='<thead class="'+E+'"></thead>',F='<tbody class="'+c+'"></tbody>',k='<th id="{id}" rowspan="{rowspan}" colspan="{colspan}" class="{classnames}" abbr="{abbr}"><div class="'+L+'">{value}</div></th>',h='<tr id="{id}"></tr>',A='<td headers="{headers}" class="{classnames}"><div class="'+L+'">{value}</div></td>',J="{value}",N='<tbody class="'+B+'"></tbody>';function M(Y){M.superclass.constructor.apply(this,arguments);}C.mix(M,{NAME:"column",ATTRS:{id:{valueFn:"_defaultId",readOnly:true},key:{valueFn:"_defaultKey"},field:{valueFn:"_defaultField"},label:{valueFn:"_defaultLabel"},children:{value:null},abbr:{value:""},classnames:{readOnly:true,getter:"_getClassnames"},formatter:{},sortable:{value:false},editor:{},width:{},resizeable:{},minimized:{},minWidth:{},maxAutoWidth:{}}});C.extend(M,C.Widget,{_defaultId:function(){return C.guid();},_defaultKey:function(Y){return Y||C.guid();},_defaultField:function(Y){return Y||this.get("key");},_defaultLabel:function(Y){return Y||this.get("key");},_afterAbbrChange:function(Y){this._uiSetAbbr(Y.newVal);},keyIndex:null,headers:null,colSpan:1,rowSpan:1,parent:null,thNode:null,initializer:function(Y){},destructor:function(){},_getClassnames:function(){return C.ClassNameManager.getClassName(R,this.get("id"));},syncUI:function(){this._uiSetAbbr(this.get("abbr"));},_uiSetAbbr:function(Y){this.thNode.set("abbr",Y);}});C.Column=M;function Z(Y){Z.superclass.constructor.apply(this,arguments);}C.mix(Z,{NAME:"columnset",ATTRS:{definitions:{setter:"_setDefinitions"}}});C.extend(Z,C.Base,{_setDefinitions:function(Y){return C.clone(Y);},tree:null,idHash:null,keyHash:null,keys:null,initializer:function(){var Y=[],q={},r={},p=[],o=this.get("definitions"),m=this;function n(z,y,x){var u=0,t=y.length,w,v,s;z++;if(!Y[z]){Y[z]=[];}for(;u<t;++u){w=y[u];w=W.isString(w)?{key:w}:w;v=new C.Column(w);w.yuiColumnId=v.get("id");q[v.get("id")]=v;r[v.get("key")]=v;if(x){v.parent=x;}if(W.isArray(w.children)){s=w.children;v._set("children",s);m._setColSpans(v,w);m._cascadePropertiesToChildren(v,s);if(!Y[z+1]){Y[z+1]=[];}n(z,s,v);}else{v.keyIndex=p.length;p.push(v);}Y[z].push(v);}z--;}n(-1,o);this.tree=Y;this.idHash=q;this.keyHash=r;this.keys=p;this._setRowSpans();this._setHeaders();},destructor:function(){},_cascadePropertiesToChildren:function(o,m){var n=0,Y=m.length,p;for(;n<Y;++n){p=m[n];if(o.get("className")&&(p.className===undefined)){p.className=o.get("className");}if(o.get("editor")&&(p.editor===undefined)){p.editor=o.get("editor");}if(o.get("formatter")&&(p.formatter===undefined)){p.formatter=o.get("formatter");}if(o.get("resizeable")&&(p.resizeable===undefined)){p.resizeable=o.get("resizeable");}if(o.get("sortable")&&(p.sortable===undefined)){p.sortable=o.get("sortable");}if(o.get("hidden")){p.hidden=true;}if(o.get("width")&&(p.width===undefined)){p.width=o.get("width");}if(o.get("minWidth")&&(p.minWidth===undefined)){p.minWidth=o.get("minWidth");}if(o.get("maxAutoWidth")&&(p.maxAutoWidth===undefined)){p.maxAutoWidth=o.get("maxAutoWidth");}}},_setColSpans:function(n,m){var o=0;function Y(r){var s=r.children,q=0,p=s.length;for(;q<p;++q){if(W.isArray(s[q].children)){Y(s[q]);}else{o++;}}}Y(m);n.colSpan=o;},_setRowSpans:function(){function Y(o){var q=1,s,r,n,u;function t(x,w){w=w||1;var v=0,m=x.length,p;for(;v<m;++v){p=x[v];if(W.isArray(p.children)){w++;t(p.children,w);w--;}else{if(p.get&&W.isArray(p.get("children"))){w++;t(p.get("children"),w);w--;}else{if(w>q){q=w;}}}}}for(n=0;n<o.length;n++){s=o[n];t(s);for(u=0;u<s.length;u++){r=s[u];if(!W.isArray(r.get("children"))){r.rowSpan=q;}}q=1;}}Y(this.tree);},_setHeaders:function(){var q,o,n=this.keys,m=0,Y=n.length;function p(s,r){s.push(r.get("id"));if(r.parent){p(s,r.parent);}}for(;m<Y;++m){q=[];o=n[m];p(q,o);o.headers=q.reverse().join(" ");}},getColumn:function(){}});C.Columnset=Z;function S(Y){S.superclass.constructor.apply(this,arguments);}C.mix(S,{NAME:"dataTable",ATTRS:{columnset:{setter:"_setColumnset"},recordset:{value:new C.Recordset({records:[]}),setter:"_setRecordset"},summary:{},caption:{},thValueTemplate:{value:J},tdValueTemplate:{value:J},trTemplate:{value:h}},HTML_PARSER:{}});C.extend(S,C.Widget,{thTemplate:k,tdTemplate:A,_theadNode:null,_tbodyNode:null,_msgNode:null,_setColumnset:function(Y){return W.isArray(Y)?new C.Columnset({definitions:Y}):Y;},_afterColumnsetChange:function(Y){if(this.get("rendered")){this._uiSetColumnset(Y.newVal);}},_setRecordset:function(Y){if(W.isArray(Y)){Y=new C.Recordset({records:Y});}Y.addTarget(this);return Y;},_afterRecordsetChange:function(Y){if(this.get("rendered")){this._uiSetRecordset(Y.newVal);}},_afterSummaryChange:function(Y){if(this.get("rendered")){this._uiSetSummary(Y.newVal);}},_afterCaptionChange:function(Y){if(this.get("rendered")){this._uiSetCaption(Y.newVal);}},initializer:function(Y){this.after("columnsetChange",this._afterColumnsetChange);this.after("recordsetChange",this._afterRecordsetChange);this.after("summaryChange",this._afterSummaryChange);this.after("captionChange",this._afterCaptionChange);},destructor:function(){this.get("recordset").removeTarget(this);},renderUI:function(){return(this._addTableNode(this.get("contentBox"))&&this._addColgroupNode(this._tableNode)&&this._addTheadNode(this._tableNode)&&this._addTbodyNode(this._tableNode)&&this._addMessageNode(this._tableNode)&&this._addCaptionNode(this._tableNode));},_addTableNode:function(Y){if(!this._tableNode){this._tableNode=Y.appendChild(T(e));}return this._tableNode;},_addColgroupNode:function(n){var Y=this.get("columnset").keys.length,m=0,o=["<colgroup>"];for(;m<Y;++m){o.push(X);}o.push("</colgroup>");this._colgroupNode=n.insertBefore(T(o.join("")),n.get("firstChild"));
return this._colgroupNode;},_addTheadNode:function(Y){if(Y){this._theadNode=Y.insertBefore(T(j),this._colgroupNode.next());return this._theadNode;}},_addTbodyNode:function(Y){this._tbodyNode=Y.appendChild(T(F));return this._tbodyNode;},_addMessageNode:function(Y){this._msgNode=Y.insertBefore(T(N),this._tbodyNode);return this._msgNode;},_addCaptionNode:function(Y){this._captionNode=Y.createCaption();return this._captionNode;},bindUI:function(){var m=this.get("contentBox"),o=this.get("boundingBox"),n="thead."+E+">tr>th",p="tbody."+c+">tr>td",Y="tbody."+B+">tr>td";this.publish("theadCellFocus",{defaultFn:this._defTheadCellFocusFn,emitFacade:false,queuable:true});this.publish("theadRowFocus",{defaultFn:this._defTheadRowFocusFn,emitFacade:false,queuable:true});this.publish("theadFocus",{defaultFn:this._defTheadFocusFn,emitFacade:false,queuable:true});this.publish("tbodyCellFocus",{defaultFn:this._defTbodyCellFocusFn,emitFacade:false,queuable:true});this.publish("tbodyRowFocus",{defaultFn:this._defTbodyRowFocusFn,emitFacade:false,queuable:true});this.publish("tbodyFocus",{defaultFn:this._defTbodyFocusFn,emitFacade:false,queuable:true});this.publish("msgCellFocus",{defaultFn:this._defMsgCellFocusFn,emitFacade:false,queuable:true});this.publish("msgRowFocus",{defaultFn:this._defMsgRowFocusFn,emitFacade:false,queuable:true});this.publish("msgTbodyFocus",{defaultFn:this._defMsgTbodyFocusFn,emitFacade:false,queuable:true});this.publish("theadCellKeydown",{defaultFn:this._defTheadCellKeydownFn,emitFacade:false,queuable:true});this.publish("theadRowKeydown",{defaultFn:this._defTheadRowKeydownFn,emitFacade:false,queuable:true});this.publish("theadKeydown",{defaultFn:this._defTheadKeydownFn,emitFacade:false,queuable:true});this.publish("tbodyCellKeydown",{defaultFn:this._defTbodyCellKeydownFn,emitFacade:false,queuable:true});this.publish("tbodyRowKeydown",{defaultFn:this._defTbodyRowKeydownFn,emitFacade:false,queuable:true});this.publish("tbodyKeydown",{defaultFn:this._defTbodyKeydownFn,emitFacade:false,queuable:true});this.publish("msgCellKeydown",{defaultFn:this._defMsgCellKeydownFn,emitFacade:false,queuable:true});this.publish("msgRowKeydown",{defaultFn:this._defMsgRowKeydownFn,emitFacade:false,queuable:true});this.publish("msgTbodyKeydown",{defaultFn:this._defMsgTbodyKeydownFn,emitFacade:false,queuable:true});this.publish("theadCellMouseenter",{defaultFn:this._defTheadCellMouseenterFn,emitFacade:false,queuable:true});this.publish("theadRowMouseenter",{defaultFn:this._defTheadRowMouseenterFn,emitFacade:false,queuable:true});this.publish("theadMouseenter",{defaultFn:this._defTheadMouseenterFn,emitFacade:false,queuable:true});this.publish("tbodyCellMouseenter",{defaultFn:this._defTbodyCellMouseenterFn,emitFacade:false,queuable:true});this.publish("tbodyRowMouseenter",{defaultFn:this._defTbodyRowMouseenterFn,emitFacade:false,queuable:true});this.publish("tbodyMouseenter",{defaultFn:this._defTbodyMouseenterFn,emitFacade:false,queuable:true});this.publish("msgCellMouseenter",{defaultFn:this._defMsgCellMouseenterFn,emitFacade:false,queuable:true});this.publish("msgRowMouseenter",{defaultFn:this._defMsgRowMouseenterFn,emitFacade:false,queuable:true});this.publish("msgTbodyMouseenter",{defaultFn:this._defMsgTbodyMouseenterFn,emitFacade:false,queuable:true});this.publish("theadCellMouseleave",{defaultFn:this._defTheadCellMouseleaveFn,emitFacade:false,queuable:true});this.publish("theadRowMouseleave",{defaultFn:this._defTheadRowMouseleaveFn,emitFacade:false,queuable:true});this.publish("theadMouseleave",{defaultFn:this._defTheadMouseleaveFn,emitFacade:false,queuable:true});this.publish("tbodyCellMouseleave",{defaultFn:this._defTbodyCellMouseleaveFn,emitFacade:false,queuable:true});this.publish("tbodyRowMouseleave",{defaultFn:this._defTbodyRowMouseleaveFn,emitFacade:false,queuable:true});this.publish("tbodyMouseleave",{defaultFn:this._defTbodyMouseleaveFn,emitFacade:false,queuable:true});this.publish("msgCellMouseleave",{defaultFn:this._defMsgCellMouseleaveFn,emitFacade:false,queuable:true});this.publish("msgRowMouseleave",{defaultFn:this._defMsgRowMouseleaveFn,emitFacade:false,queuable:true});this.publish("msgTbodyMouseleave",{defaultFn:this._defMsgTbodyMouseleaveFn,emitFacade:false,queuable:true});this.publish("theadCellMouseup",{defaultFn:this._defTheadCellMouseupFn,emitFacade:false,queuable:true});this.publish("theadRowMouseup",{defaultFn:this._defTheadRowMouseupFn,emitFacade:false,queuable:true});this.publish("theadMouseup",{defaultFn:this._defTheadMouseupFn,emitFacade:false,queuable:true});this.publish("tbodyCellMouseup",{defaultFn:this._defTbodyCellMouseupFn,emitFacade:false,queuable:true});this.publish("tbodyRowMouseup",{defaultFn:this._defTbodyRowMouseupFn,emitFacade:false,queuable:true});this.publish("tbodyMouseup",{defaultFn:this._defTbodyMouseupFn,emitFacade:false,queuable:true});this.publish("msgCellMouseup",{defaultFn:this._defMsgCellMouseupFn,emitFacade:false,queuable:true});this.publish("msgRowMouseup",{defaultFn:this._defMsgRowMouseupFn,emitFacade:false,queuable:true});this.publish("msgTbodyMouseup",{defaultFn:this._defMsgTbodyMouseupFn,emitFacade:false,queuable:true});this.publish("theadCellMousedown",{defaultFn:this._defTheadCellMousedownFn,emitFacade:false,queuable:true});this.publish("theadRowMousedown",{defaultFn:this._defTheadRowMousedownFn,emitFacade:false,queuable:true});this.publish("theadMousedown",{defaultFn:this._defTheadMousedownFn,emitFacade:false,queuable:true});this.publish("tbodyCellMousedown",{defaultFn:this._defTbodyCellMousedownFn,emitFacade:false,queuable:true});this.publish("tbodyRowMousedown",{defaultFn:this._defTbodyRowMousedownFn,emitFacade:false,queuable:true});this.publish("tbodyMousedown",{defaultFn:this._defTbodyMousedownFn,emitFacade:false,queuable:true});this.publish("msgCellMousedown",{defaultFn:this._defMsgCellMousedownFn,emitFacade:false,queuable:true});this.publish("msgRowMousedown",{defaultFn:this._defMsgRowMousedownFn,emitFacade:false,queuable:true});this.publish("msgTbodyMousedown",{defaultFn:this._defMsgTbodyMousedownFn,emitFacade:false,queuable:true});
this.publish("theadCellClick",{defaultFn:this._defTheadCellClickFn,emitFacade:false,queuable:true});this.publish("theadRowClick",{defaultFn:this._defTheadRowClickFn,emitFacade:false,queuable:true});this.publish("theadClick",{defaultFn:this._defTheadClickFn,emitFacade:false,queuable:true});this.publish("tbodyCellClick",{defaultFn:this._defTbodyCellClickFn,emitFacade:false,queuable:true});this.publish("tbodyRowClick",{defaultFn:this._defTbodyRowClickFn,emitFacade:false,queuable:true});this.publish("tbodyClick",{defaultFn:this._defTbodyClickFn,emitFacade:false,queuable:true});this.publish("msgCellClick",{defaultFn:this._defMsgCellClickFn,emitFacade:false,queuable:true});this.publish("msgRowClick",{defaultFn:this._defMsgRowClickFn,emitFacade:false,queuable:true});this.publish("msgTbodyClick",{defaultFn:this._defMsgTbodyClickFn,emitFacade:false,queuable:true});this.publish("theadCellDblclick",{defaultFn:this._defTheadCellDblclickFn,emitFacade:false,queuable:true});this.publish("theadRowDblclick",{defaultFn:this._defTheadRowDblclickFn,emitFacade:false,queuable:true});this.publish("theadDblclick",{defaultFn:this._defTheadDblclickFn,emitFacade:false,queuable:true});this.publish("tbodyCellDblclick",{defaultFn:this._defTbodyCellDblclickFn,emitFacade:false,queuable:true});this.publish("tbodyRowDblclick",{defaultFn:this._defTbodyRowDblclickFn,emitFacade:false,queuable:true});this.publish("tbodyDblclick",{defaultFn:this._defTbodyDblclickFn,emitFacade:false,queuable:true});this.publish("msgCellDblclick",{defaultFn:this._defMsgCellDblclickFn,emitFacade:false,queuable:true});this.publish("msgRowDblclick",{defaultFn:this._defMsgRowDblclickFn,emitFacade:false,queuable:true});this.publish("msgTbodyDblclick",{defaultFn:this._defMsgTbodyDblclickFn,emitFacade:false,queuable:true});m.delegate(i,this._onDomEvent,n,this,"theadCellFocus");m.delegate(l,this._onDomEvent,n,this,"theadCellKeydown");m.delegate(H,this._onDomEvent,n,this,"theadCellMouseenter");m.delegate(O,this._onDomEvent,n,this,"theadCellMouseleave");m.delegate(K,this._onDomEvent,n,this,"theadCellMouseup");m.delegate(a,this._onDomEvent,n,this,"theadCellMousedown");m.delegate(d,this._onDomEvent,n,this,"theadCellClick");o.delegate(V,this._onDomEvent,n,this,"theadCellDblclick");m.delegate(i,this._onDomEvent,p,this,"tbodyCellFocus");m.delegate(l,this._onDomEvent,p,this,"tbodyCellKeydown");m.delegate(H,this._onDomEvent,p,this,"tbodyCellMouseenter");m.delegate(O,this._onDomEvent,p,this,"tbodyCellMouseleave");m.delegate(K,this._onDomEvent,p,this,"tbodyCellMouseup");m.delegate(a,this._onDomEvent,p,this,"tbodyCellMousedown");m.delegate(d,this._onDomEvent,p,this,"tbodyCellClick");o.delegate(V,this._onDomEvent,p,this,"tbodyCellDblclick");m.delegate(i,this._onDomEvent,Y,this,"msgCellFocus");m.delegate(l,this._onDomEvent,Y,this,"msgCellKeydown");m.delegate(H,this._onDomEvent,Y,this,"msgCellMouseenter");m.delegate(O,this._onDomEvent,Y,this,"msgCellMouseleave");m.delegate(K,this._onDomEvent,Y,this,"msgCellMouseup");m.delegate(a,this._onDomEvent,Y,this,"msgCellMousedown");m.delegate(d,this._onDomEvent,Y,this,"msgCellClick");o.delegate(V,this._onDomEvent,Y,this,"msgCellDblclick");},_onDomEvent:function(m,Y){this.fire(Y,m);},_defTheadCellClickFn:function(Y){this.fire("theadRowClick",Y);},_defTheadRowClickFn:function(Y){this.fire("theadClick",Y);},_defTheadClickFn:function(Y){},syncUI:function(){this._uiSetColumnset(this.get("columnset"));this._uiSetRecordset(this.get("recordset"));this._uiSetSummary(this.get("summary"));this._uiSetCaption(this.get("caption"));},_uiSetSummary:function(Y){Y=G(Y)?Y:"";this._tableNode.set("summary",Y);},_uiSetCaption:function(Y){Y=G(Y)?Y:"";this._captionNode.setContent(Y);},_uiSetColumnset:function(p){var m=p.tree,r=this._theadNode,n=0,Y=m.length,o=r.get("parentNode"),q=r.next();r.remove();r.get("children").remove(true);for(;n<Y;++n){this._addTheadTrNode({thead:r,columns:m[n]},(n===0),(n===Y-1));}o.insert(r,q);},_addTheadTrNode:function(n,Y,m){n.tr=this._createTheadTrNode(n,Y,m);this._attachTheadTrNode(n);},_createTheadTrNode:function(t,m,s){var r=T(g(this.get("trTemplate"),t)),p=0,n=t.columns,Y=n.length,q;if(m){r.addClass(f);}if(s){r.addClass(I);}for(;p<Y;++p){q=n[p];this._addTheadThNode({value:q.get("label"),column:q,tr:r});}return r;},_attachTheadTrNode:function(Y){Y.thead.appendChild(Y.tr);},_addTheadThNode:function(Y){Y.th=this._createTheadThNode(Y);this._attachTheadThNode(Y);Y.column.thNode=Y.th;},_createTheadThNode:function(m){var Y=m.column;m.id=Y.get("id");m.colspan=Y.colSpan;m.rowspan=Y.rowSpan;m.abbr=Y.get("abbr");m.classnames=Y.get("classnames");m.value=g(this.get("thValueTemplate"),m);return T(g(this.thTemplate,m));},_attachTheadThNode:function(Y){Y.tr.appendChild(Y.th);},_uiSetRecordset:function(m){var p=0,Y=m.getLength(),t=this._tbodyNode,q=t.get("parentNode"),r=t.next(),s={},n;t.remove();t=null;n=this._addTbodyNode(this._tableNode);n.remove();this._tbodyNode=n;s.tbody=n;for(;p<Y;++p){s.record=m.getRecord(p);s.rowindex=p;this._addTbodyTrNode(s);}q.insert(this._tbodyNode,r);},_addTbodyTrNode:function(n){var m=n.tbody,Y=n.record;n.tr=m.one("#"+Y.get("id"))||this._createTbodyTrNode(n);this._attachTbodyTrNode(n);},_createTbodyTrNode:function(q){var p=T(g(this.get("trTemplate"),{id:q.record.get("id")})),m=0,n=this.get("columnset").keys,Y=n.length;q.tr=p;for(;m<Y;++m){q.column=n[m];this._addTbodyTdNode(q);}return p;},_attachTbodyTrNode:function(q){var m=q.tbody,p=q.tr,Y=q.rowindex,n=m.get("children").item(Y)||null,r=(Y%2===0);if(r){p.replaceClass(b,U);}else{p.replaceClass(U,b);}m.insertBefore(p,n);},_addTbodyTdNode:function(Y){Y.td=this._createTbodyTdNode(Y);this._attachTbodyTdNode(Y);},_createTbodyTdNode:function(m){var Y=m.column;m.headers=Y.headers;m.classnames=Y.get("classnames");m.value=this.formatDataCell(m);return T(g(this.tdTemplate,m));},_attachTbodyTdNode:function(Y){Y.tr.appendChild(Y.td);},formatDataCell:function(p){var Y=p.record,n=p.column,m=n.get("formatter");p.data=Y.get("data");p.value=Y.getValue(n.get("field"));return W.isString(m)?g(m,p):W.isFunction(m)?m.call(this,p):g(this.get("tdValueTemplate"),p);
}});C.namespace("DataTable").Base=S;},"@VERSION@",{requires:["recordset-base","widget","substitute","event-mouseenter"]});