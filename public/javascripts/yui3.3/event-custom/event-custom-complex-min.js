YUI.add("event-custom-complex",function(f){var b,e,d={},a=f.CustomEvent.prototype,c=f.EventTarget.prototype;f.EventFacade=function(h,g){h=h||d;this._event=h;this.details=h.details;this.type=h.type;this._type=h.type;this.target=h.target;this.currentTarget=g;this.relatedTarget=h.relatedTarget;};f.extend(f.EventFacade,Object,{stopPropagation:function(){this._event.stopPropagation();this.stopped=1;},stopImmediatePropagation:function(){this._event.stopImmediatePropagation();this.stopped=2;},preventDefault:function(){this._event.preventDefault();this.prevented=1;},halt:function(g){this._event.halt(g);this.prevented=1;this.stopped=(g)?2:1;}});a.fireComplex=function(p){var r,l,g,n,i,o,u,j,h,t=this,s=t.host||t,m,k;if(t.stack){if(t.queuable&&t.type!=t.stack.next.type){t.log("queue "+t.type);t.stack.queue.push([t,p]);return true;}}r=t.stack||{id:t.id,next:t,silent:t.silent,stopped:0,prevented:0,bubbling:null,type:t.type,afterQueue:new f.Queue(),defaultTargetOnly:t.defaultTargetOnly,queue:[]};j=t.getSubs();t.stopped=(t.type!==r.type)?0:r.stopped;t.prevented=(t.type!==r.type)?0:r.prevented;t.target=t.target||s;u=new f.EventTarget({fireOnce:true,context:s});t.events=u;if(t.preventedFn){u.on("prevented",t.preventedFn);}if(t.stoppedFn){u.on("stopped",t.stoppedFn);}t.currentTarget=s;t.details=p.slice();t.log("Firing "+t.type);t._facade=null;l=t._getFacade(p);if(f.Lang.isObject(p[0])){p[0]=l;}else{p.unshift(l);}if(j[0]){t._procSubs(j[0],p,l);}if(t.bubbles&&s.bubble&&!t.stopped){k=r.bubbling;r.bubbling=t.type;if(r.type!=t.type){r.stopped=0;r.prevented=0;}o=s.bubble(t,p,null,r);t.stopped=Math.max(t.stopped,r.stopped);t.prevented=Math.max(t.prevented,r.prevented);r.bubbling=k;}if(t.defaultFn&&!t.prevented&&((!t.defaultTargetOnly&&!r.defaultTargetOnly)||s===l.target)){t.defaultFn.apply(s,p);}t._broadcast(p);if(j[1]&&!t.prevented&&t.stopped<2){if(r.id===t.id||t.type!=s._yuievt.bubbling){t._procSubs(j[1],p,l);while((m=r.afterQueue.last())){m();}}else{h=j[1];if(r.execDefaultCnt){h=f.merge(h);f.each(h,function(q){q.postponed=true;});}r.afterQueue.add(function(){t._procSubs(h,p,l);});}}t.target=null;if(r.id===t.id){n=r.queue;while(n.length){g=n.pop();i=g[0];r.next=i;i.fire.apply(i,g[1]);}t.stack=null;}o=!(t.stopped);if(t.type!=s._yuievt.bubbling){r.stopped=0;r.prevented=0;t.stopped=0;t.prevented=0;}return o;};a._getFacade=function(){var g=this._facade,j,i,h=this.details;if(!g){g=new f.EventFacade(this,this.currentTarget);}j=h&&h[0];if(f.Lang.isObject(j,true)){i={};f.mix(i,g,true,e);f.mix(g,j,true);f.mix(g,i,true,e);g.type=j.type||g.type;}g.details=this.details;g.target=this.originalTarget||this.target;g.currentTarget=this.currentTarget;g.stopped=0;g.prevented=0;this._facade=g;return this._facade;};a.stopPropagation=function(){this.stopped=1;if(this.stack){this.stack.stopped=1;}this.events.fire("stopped",this);};a.stopImmediatePropagation=function(){this.stopped=2;if(this.stack){this.stack.stopped=2;}this.events.fire("stopped",this);};a.preventDefault=function(){if(this.preventable){this.prevented=1;if(this.stack){this.stack.prevented=1;}this.events.fire("prevented",this);}};a.halt=function(g){if(g){this.stopImmediatePropagation();}else{this.stopPropagation();}this.preventDefault();};c.addTarget=function(g){this._yuievt.targets[f.stamp(g)]=g;this._yuievt.hasTargets=true;};c.getTargets=function(){return f.Object.values(this._yuievt.targets);};c.removeTarget=function(g){delete this._yuievt.targets[f.stamp(g)];};c.bubble=function(u,q,o,s){var m=this._yuievt.targets,p=true,v,r=u&&u.type,h,l,n,j,g=o||(u&&u.target)||this,k;if(!u||((!u.stopped)&&m)){for(l in m){if(m.hasOwnProperty(l)){v=m[l];h=v.getEvent(r,true);j=v.getSibling(r,h);if(j&&!h){h=v.publish(r);}k=v._yuievt.bubbling;v._yuievt.bubbling=r;if(!h){if(v._yuievt.hasTargets){v.bubble(u,q,g,s);}}else{h.sibling=j;h.target=g;h.originalTarget=g;h.currentTarget=v;n=h.broadcast;h.broadcast=false;h.emitFacade=true;h.stack=s;p=p&&h.fire.apply(h,q||u.details||[]);h.broadcast=n;h.originalTarget=null;if(h.stopped){break;}}v._yuievt.bubbling=k;}}}return p;};b=new f.EventFacade();e=f.Object.keys(b);},"@VERSION@",{requires:["event-custom-base"]});