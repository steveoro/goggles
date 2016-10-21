!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){function e(e,n){var r,s,a,o=e.nodeName.toLowerCase();return"area"===o?(r=e.parentNode,s=r.name,!(!e.href||!s||"map"!==r.nodeName.toLowerCase())&&(a=t("img[usemap='#"+s+"']")[0],!!a&&i(a))):(/^(input|select|textarea|button|object)$/.test(o)?!e.disabled:"a"===o?e.href||n:n)&&i(e)}function i(e){return t.expr.filters.visible(e)&&!t(e).parents().addBack().filter(function(){return"hidden"===t.css(this,"visibility")}).length}t.ui=t.ui||{},t.extend(t.ui,{version:"1.11.4",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),t.fn.extend({scrollParent:function(e){var i=this.css("position"),n="absolute"===i,r=e?/(auto|scroll|hidden)/:/(auto|scroll)/,s=this.parents().filter(function(){var e=t(this);return(!n||"static"!==e.css("position"))&&r.test(e.css("overflow")+e.css("overflow-y")+e.css("overflow-x"))}).eq(0);return"fixed"!==i&&s.length?s:t(this[0].ownerDocument||document)},uniqueId:function(){var t=0;return function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++t)})}}(),removeUniqueId:function(){return this.each(function(){/^ui-id-\d+$/.test(this.id)&&t(this).removeAttr("id")})}}),t.extend(t.expr[":"],{data:t.expr.createPseudo?t.expr.createPseudo(function(e){return function(i){return!!t.data(i,e)}}):function(e,i,n){return!!t.data(e,n[3])},focusable:function(i){return e(i,!isNaN(t.attr(i,"tabindex")))},tabbable:function(i){var n=t.attr(i,"tabindex"),r=isNaN(n);return(r||n>=0)&&e(i,!r)}}),t("<a>").outerWidth(1).jquery||t.each(["Width","Height"],function(e,i){function n(e,i,n,s){return t.each(r,function(){i-=parseFloat(t.css(e,"padding"+this))||0,n&&(i-=parseFloat(t.css(e,"border"+this+"Width"))||0),s&&(i-=parseFloat(t.css(e,"margin"+this))||0)}),i}var r="Width"===i?["Left","Right"]:["Top","Bottom"],s=i.toLowerCase(),a={innerWidth:t.fn.innerWidth,innerHeight:t.fn.innerHeight,outerWidth:t.fn.outerWidth,outerHeight:t.fn.outerHeight};t.fn["inner"+i]=function(e){return void 0===e?a["inner"+i].call(this):this.each(function(){t(this).css(s,n(this,e)+"px")})},t.fn["outer"+i]=function(e,r){return"number"!=typeof e?a["outer"+i].call(this,e):this.each(function(){t(this).css(s,n(this,e,!0,r)+"px")})}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(t.fn.removeData=function(e){return function(i){return arguments.length?e.call(this,t.camelCase(i)):e.call(this)}}(t.fn.removeData)),t.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),t.fn.extend({focus:function(e){return function(i,n){return"number"==typeof i?this.each(function(){var e=this;setTimeout(function(){t(e).focus(),n&&n.call(e)},i)}):e.apply(this,arguments)}}(t.fn.focus),disableSelection:function(){var t="onselectstart"in document.createElement("div")?"selectstart":"mousedown";return function(){return this.bind(t+".ui-disableSelection",function(t){t.preventDefault()})}}(),enableSelection:function(){return this.unbind(".ui-disableSelection")},zIndex:function(e){if(void 0!==e)return this.css("zIndex",e);if(this.length)for(var i,n,r=t(this[0]);r.length&&r[0]!==document;){if(i=r.css("position"),("absolute"===i||"relative"===i||"fixed"===i)&&(n=parseInt(r.css("zIndex"),10),!isNaN(n)&&0!==n))return n;r=r.parent()}return 0}}),t.ui.plugin={add:function(e,i,n){var r,s=t.ui[e].prototype;for(r in n)s.plugins[r]=s.plugins[r]||[],s.plugins[r].push([i,n[r]])},call:function(t,e,i,n){var r,s=t.plugins[e];if(s&&(n||t.element[0].parentNode&&11!==t.element[0].parentNode.nodeType))for(r=0;r<s.length;r++)t.options[s[r][0]]&&s[r][1].apply(t.element,i)}}}),function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){var e=0,i=Array.prototype.slice;return t.cleanData=function(e){return function(i){var n,r,s;for(s=0;null!=(r=i[s]);s++)try{n=t._data(r,"events"),n&&n.remove&&t(r).triggerHandler("remove")}catch(t){}e(i)}}(t.cleanData),t.widget=function(e,i,n){var r,s,a,o,l={},h=e.split(".")[0];return e=e.split(".")[1],r=h+"-"+e,n||(n=i,i=t.Widget),t.expr[":"][r.toLowerCase()]=function(e){return!!t.data(e,r)},t[h]=t[h]||{},s=t[h][e],a=t[h][e]=function(t,e){return this._createWidget?void(arguments.length&&this._createWidget(t,e)):new a(t,e)},t.extend(a,s,{version:n.version,_proto:t.extend({},n),_childConstructors:[]}),o=new i,o.options=t.widget.extend({},o.options),t.each(n,function(e,n){return t.isFunction(n)?void(l[e]=function(){var t=function(){return i.prototype[e].apply(this,arguments)},r=function(t){return i.prototype[e].apply(this,t)};return function(){var e,i=this._super,s=this._superApply;return this._super=t,this._superApply=r,e=n.apply(this,arguments),this._super=i,this._superApply=s,e}}()):void(l[e]=n)}),a.prototype=t.widget.extend(o,{widgetEventPrefix:s?o.widgetEventPrefix||e:e},l,{constructor:a,namespace:h,widgetName:e,widgetFullName:r}),s?(t.each(s._childConstructors,function(e,i){var n=i.prototype;t.widget(n.namespace+"."+n.widgetName,a,i._proto)}),delete s._childConstructors):i._childConstructors.push(a),t.widget.bridge(e,a),a},t.widget.extend=function(e){for(var n,r,s=i.call(arguments,1),a=0,o=s.length;a<o;a++)for(n in s[a])r=s[a][n],s[a].hasOwnProperty(n)&&void 0!==r&&(t.isPlainObject(r)?e[n]=t.isPlainObject(e[n])?t.widget.extend({},e[n],r):t.widget.extend({},r):e[n]=r);return e},t.widget.bridge=function(e,n){var r=n.prototype.widgetFullName||e;t.fn[e]=function(s){var a="string"==typeof s,o=i.call(arguments,1),l=this;return a?this.each(function(){var i,n=t.data(this,r);return"instance"===s?(l=n,!1):n?t.isFunction(n[s])&&"_"!==s.charAt(0)?(i=n[s].apply(n,o),i!==n&&void 0!==i?(l=i&&i.jquery?l.pushStack(i.get()):i,!1):void 0):t.error("no such method '"+s+"' for "+e+" widget instance"):t.error("cannot call methods on "+e+" prior to initialization; attempted to call method '"+s+"'")}):(o.length&&(s=t.widget.extend.apply(null,[s].concat(o))),this.each(function(){var e=t.data(this,r);e?(e.option(s||{}),e._init&&e._init()):t.data(this,r,new n(s,this))})),l}},t.Widget=function(){},t.Widget._childConstructors=[],t.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(i,n){n=t(n||this.defaultElement||this)[0],this.element=t(n),this.uuid=e++,this.eventNamespace="."+this.widgetName+this.uuid,this.bindings=t(),this.hoverable=t(),this.focusable=t(),n!==this&&(t.data(n,this.widgetFullName,this),this._on(!0,this.element,{remove:function(t){t.target===n&&this.destroy()}}),this.document=t(n.style?n.ownerDocument:n.document||n),this.window=t(this.document[0].defaultView||this.document[0].parentWindow)),this.options=t.widget.extend({},this.options,this._getCreateOptions(),i),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:t.noop,_getCreateEventData:t.noop,_create:t.noop,_init:t.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetFullName).removeData(t.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:t.noop,widget:function(){return this.element},option:function(e,i){var n,r,s,a=e;if(0===arguments.length)return t.widget.extend({},this.options);if("string"==typeof e)if(a={},n=e.split("."),e=n.shift(),n.length){for(r=a[e]=t.widget.extend({},this.options[e]),s=0;s<n.length-1;s++)r[n[s]]=r[n[s]]||{},r=r[n[s]];if(e=n.pop(),1===arguments.length)return void 0===r[e]?null:r[e];r[e]=i}else{if(1===arguments.length)return void 0===this.options[e]?null:this.options[e];a[e]=i}return this._setOptions(a),this},_setOptions:function(t){var e;for(e in t)this._setOption(e,t[e]);return this},_setOption:function(t,e){return this.options[t]=e,"disabled"===t&&(this.widget().toggleClass(this.widgetFullName+"-disabled",!!e),e&&(this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus"))),this},enable:function(){return this._setOptions({disabled:!1})},disable:function(){return this._setOptions({disabled:!0})},_on:function(e,i,n){var r,s=this;"boolean"!=typeof e&&(n=i,i=e,e=!1),n?(i=r=t(i),this.bindings=this.bindings.add(i)):(n=i,i=this.element,r=this.widget()),t.each(n,function(n,a){function o(){if(e||s.options.disabled!==!0&&!t(this).hasClass("ui-state-disabled"))return("string"==typeof a?s[a]:a).apply(s,arguments)}"string"!=typeof a&&(o.guid=a.guid=a.guid||o.guid||t.guid++);var l=n.match(/^([\w:-]*)\s*(.*)$/),h=l[1]+s.eventNamespace,c=l[2];c?r.delegate(c,h,o):i.bind(h,o)})},_off:function(e,i){i=(i||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,e.unbind(i).undelegate(i),this.bindings=t(this.bindings.not(e).get()),this.focusable=t(this.focusable.not(e).get()),this.hoverable=t(this.hoverable.not(e).get())},_delay:function(t,e){function i(){return("string"==typeof t?n[t]:t).apply(n,arguments)}var n=this;return setTimeout(i,e||0)},_hoverable:function(e){this.hoverable=this.hoverable.add(e),this._on(e,{mouseenter:function(e){t(e.currentTarget).addClass("ui-state-hover")},mouseleave:function(e){t(e.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(e){this.focusable=this.focusable.add(e),this._on(e,{focusin:function(e){t(e.currentTarget).addClass("ui-state-focus")},focusout:function(e){t(e.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(e,i,n){var r,s,a=this.options[e];if(n=n||{},i=t.Event(i),i.type=(e===this.widgetEventPrefix?e:this.widgetEventPrefix+e).toLowerCase(),i.target=this.element[0],s=i.originalEvent)for(r in s)r in i||(i[r]=s[r]);return this.element.trigger(i,n),!(t.isFunction(a)&&a.apply(this.element[0],[i].concat(n))===!1||i.isDefaultPrevented())}},t.each({show:"fadeIn",hide:"fadeOut"},function(e,i){t.Widget.prototype["_"+e]=function(n,r,s){"string"==typeof r&&(r={effect:r});var a,o=r?r===!0||"number"==typeof r?i:r.effect||i:e;r=r||{},"number"==typeof r&&(r={duration:r}),a=!t.isEmptyObject(r),r.complete=s,r.delay&&n.delay(r.delay),a&&t.effects&&t.effects.effect[o]?n[e](r):o!==e&&n[o]?n[o](r.duration,r.easing,s):n.queue(function(i){t(this)[e](),s&&s.call(n[0]),i()})}}),t.widget}),function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){return function(){function e(t,e,i){return[parseFloat(t[0])*(f.test(t[0])?e/100:1),parseFloat(t[1])*(f.test(t[1])?i/100:1)]}function i(e,i){return parseInt(t.css(e,i),10)||0}function n(e){var i=e[0];return 9===i.nodeType?{width:e.width(),height:e.height(),offset:{top:0,left:0}}:t.isWindow(i)?{width:e.width(),height:e.height(),offset:{top:e.scrollTop(),left:e.scrollLeft()}}:i.preventDefault?{width:0,height:0,offset:{top:i.pageY,left:i.pageX}}:{width:e.outerWidth(),height:e.outerHeight(),offset:e.offset()}}t.ui=t.ui||{};var r,s,a=Math.max,o=Math.abs,l=Math.round,h=/left|center|right/,c=/top|center|bottom/,u=/[\+\-]\d+(\.[\d]+)?%?/,d=/^\w+/,f=/%$/,p=t.fn.position;t.position={scrollbarWidth:function(){if(void 0!==r)return r;var e,i,n=t("<div style='display:block;position:absolute;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),s=n.children()[0];return t("body").append(n),e=s.offsetWidth,n.css("overflow","scroll"),i=s.offsetWidth,e===i&&(i=n[0].clientWidth),n.remove(),r=e-i},getScrollInfo:function(e){var i=e.isWindow||e.isDocument?"":e.element.css("overflow-x"),n=e.isWindow||e.isDocument?"":e.element.css("overflow-y"),r="scroll"===i||"auto"===i&&e.width<e.element[0].scrollWidth,s="scroll"===n||"auto"===n&&e.height<e.element[0].scrollHeight;return{width:s?t.position.scrollbarWidth():0,height:r?t.position.scrollbarWidth():0}},getWithinInfo:function(e){var i=t(e||window),n=t.isWindow(i[0]),r=!!i[0]&&9===i[0].nodeType;return{element:i,isWindow:n,isDocument:r,offset:i.offset()||{left:0,top:0},scrollLeft:i.scrollLeft(),scrollTop:i.scrollTop(),width:n||r?i.width():i.outerWidth(),height:n||r?i.height():i.outerHeight()}}},t.fn.position=function(r){if(!r||!r.of)return p.apply(this,arguments);r=t.extend({},r);var f,g,m,v,b,y,_=t(r.of),w=t.position.getWithinInfo(r.within),x=t.position.getScrollInfo(w),k=(r.collision||"flip").split(" "),C={};return y=n(_),_[0].preventDefault&&(r.at="left top"),g=y.width,m=y.height,v=y.offset,b=t.extend({},v),t.each(["my","at"],function(){var t,e,i=(r[this]||"").split(" ");1===i.length&&(i=h.test(i[0])?i.concat(["center"]):c.test(i[0])?["center"].concat(i):["center","center"]),i[0]=h.test(i[0])?i[0]:"center",i[1]=c.test(i[1])?i[1]:"center",t=u.exec(i[0]),e=u.exec(i[1]),C[this]=[t?t[0]:0,e?e[0]:0],r[this]=[d.exec(i[0])[0],d.exec(i[1])[0]]}),1===k.length&&(k[1]=k[0]),"right"===r.at[0]?b.left+=g:"center"===r.at[0]&&(b.left+=g/2),"bottom"===r.at[1]?b.top+=m:"center"===r.at[1]&&(b.top+=m/2),f=e(C.at,g,m),b.left+=f[0],b.top+=f[1],this.each(function(){var n,h,c=t(this),u=c.outerWidth(),d=c.outerHeight(),p=i(this,"marginLeft"),y=i(this,"marginTop"),S=u+p+i(this,"marginRight")+x.width,T=d+y+i(this,"marginBottom")+x.height,D=t.extend({},b),M=e(C.my,c.outerWidth(),c.outerHeight());"right"===r.my[0]?D.left-=u:"center"===r.my[0]&&(D.left-=u/2),"bottom"===r.my[1]?D.top-=d:"center"===r.my[1]&&(D.top-=d/2),D.left+=M[0],D.top+=M[1],s||(D.left=l(D.left),D.top=l(D.top)),n={marginLeft:p,marginTop:y},t.each(["left","top"],function(e,i){t.ui.position[k[e]]&&t.ui.position[k[e]][i](D,{targetWidth:g,targetHeight:m,elemWidth:u,elemHeight:d,collisionPosition:n,collisionWidth:S,collisionHeight:T,offset:[f[0]+M[0],f[1]+M[1]],my:r.my,at:r.at,within:w,elem:c})}),r.using&&(h=function(t){var e=v.left-D.left,i=e+g-u,n=v.top-D.top,s=n+m-d,l={target:{element:_,left:v.left,top:v.top,width:g,height:m},element:{element:c,left:D.left,top:D.top,width:u,height:d},horizontal:i<0?"left":e>0?"right":"center",vertical:s<0?"top":n>0?"bottom":"middle"};g<u&&o(e+i)<g&&(l.horizontal="center"),m<d&&o(n+s)<m&&(l.vertical="middle"),a(o(e),o(i))>a(o(n),o(s))?l.important="horizontal":l.important="vertical",r.using.call(this,t,l)}),c.offset(t.extend(D,{using:h}))})},t.ui.position={fit:{left:function(t,e){var i,n=e.within,r=n.isWindow?n.scrollLeft:n.offset.left,s=n.width,o=t.left-e.collisionPosition.marginLeft,l=r-o,h=o+e.collisionWidth-s-r;e.collisionWidth>s?l>0&&h<=0?(i=t.left+l+e.collisionWidth-s-r,t.left+=l-i):h>0&&l<=0?t.left=r:l>h?t.left=r+s-e.collisionWidth:t.left=r:l>0?t.left+=l:h>0?t.left-=h:t.left=a(t.left-o,t.left)},top:function(t,e){var i,n=e.within,r=n.isWindow?n.scrollTop:n.offset.top,s=e.within.height,o=t.top-e.collisionPosition.marginTop,l=r-o,h=o+e.collisionHeight-s-r;e.collisionHeight>s?l>0&&h<=0?(i=t.top+l+e.collisionHeight-s-r,t.top+=l-i):h>0&&l<=0?t.top=r:l>h?t.top=r+s-e.collisionHeight:t.top=r:l>0?t.top+=l:h>0?t.top-=h:t.top=a(t.top-o,t.top)}},flip:{left:function(t,e){var i,n,r=e.within,s=r.offset.left+r.scrollLeft,a=r.width,l=r.isWindow?r.scrollLeft:r.offset.left,h=t.left-e.collisionPosition.marginLeft,c=h-l,u=h+e.collisionWidth-a-l,d="left"===e.my[0]?-e.elemWidth:"right"===e.my[0]?e.elemWidth:0,f="left"===e.at[0]?e.targetWidth:"right"===e.at[0]?-e.targetWidth:0,p=-2*e.offset[0];c<0?(i=t.left+d+f+p+e.collisionWidth-a-s,(i<0||i<o(c))&&(t.left+=d+f+p)):u>0&&(n=t.left-e.collisionPosition.marginLeft+d+f+p-l,(n>0||o(n)<u)&&(t.left+=d+f+p))},top:function(t,e){var i,n,r=e.within,s=r.offset.top+r.scrollTop,a=r.height,l=r.isWindow?r.scrollTop:r.offset.top,h=t.top-e.collisionPosition.marginTop,c=h-l,u=h+e.collisionHeight-a-l,d="top"===e.my[1],f=d?-e.elemHeight:"bottom"===e.my[1]?e.elemHeight:0,p="top"===e.at[1]?e.targetHeight:"bottom"===e.at[1]?-e.targetHeight:0,g=-2*e.offset[1];c<0?(n=t.top+f+p+g+e.collisionHeight-a-s,(n<0||n<o(c))&&(t.top+=f+p+g)):u>0&&(i=t.top-e.collisionPosition.marginTop+f+p+g-l,(i>0||o(i)<u)&&(t.top+=f+p+g))}},flipfit:{left:function(){t.ui.position.flip.left.apply(this,arguments),t.ui.position.fit.left.apply(this,arguments)},top:function(){t.ui.position.flip.top.apply(this,arguments),t.ui.position.fit.top.apply(this,arguments)}}},function(){var e,i,n,r,a,o=document.getElementsByTagName("body")[0],l=document.createElement("div");e=document.createElement(o?"div":"body"),n={visibility:"hidden",width:0,height:0,border:0,margin:0,background:"none"},o&&t.extend(n,{position:"absolute",left:"-1000px",top:"-1000px"});for(a in n)e.style[a]=n[a];e.appendChild(l),i=o||document.documentElement,i.insertBefore(e,i.firstChild),l.style.cssText="position: absolute; left: 10.7432222px;",r=t(l).offset().left,s=r>10&&r<11,e.innerHTML="",i.removeChild(e)}()}(),t.ui.position}),function(t){"function"==typeof define&&define.amd?define(["jquery","./core","./widget","./position"],t):t(jQuery)}(function(t){return t.widget("ui.menu",{version:"1.11.4",defaultElement:"<ul>",delay:300,options:{icons:{submenu:"ui-icon-carat-1-e"},items:"> *",menus:"ul",position:{my:"left-1 top",at:"right top"},role:"menu",blur:null,focus:null,select:null},_create:function(){this.activeMenu=this.element,this.mouseHandled=!1,this.element.uniqueId().addClass("ui-menu ui-widget ui-widget-content").toggleClass("ui-menu-icons",!!this.element.find(".ui-icon").length).attr({role:this.options.role,tabIndex:0}),this.options.disabled&&this.element.addClass("ui-state-disabled").attr("aria-disabled","true"),this._on({"mousedown .ui-menu-item":function(t){t.preventDefault()},"click .ui-menu-item":function(e){var i=t(e.target);!this.mouseHandled&&i.not(".ui-state-disabled").length&&(this.select(e),e.isPropagationStopped()||(this.mouseHandled=!0),i.has(".ui-menu").length?this.expand(e):!this.element.is(":focus")&&t(this.document[0].activeElement).closest(".ui-menu").length&&(this.element.trigger("focus",[!0]),this.active&&1===this.active.parents(".ui-menu").length&&clearTimeout(this.timer)))},"mouseenter .ui-menu-item":function(e){if(!this.previousFilter){var i=t(e.currentTarget);i.siblings(".ui-state-active").removeClass("ui-state-active"),this.focus(e,i)}},mouseleave:"collapseAll","mouseleave .ui-menu":"collapseAll",focus:function(t,e){var i=this.active||this.element.find(this.options.items).eq(0);e||this.focus(t,i)},blur:function(e){this._delay(function(){t.contains(this.element[0],this.document[0].activeElement)||this.collapseAll(e)})},keydown:"_keydown"}),this.refresh(),this._on(this.document,{click:function(t){this._closeOnDocumentClick(t)&&this.collapseAll(t),this.mouseHandled=!1}})},_destroy:function(){this.element.removeAttr("aria-activedescendant").find(".ui-menu").addBack().removeClass("ui-menu ui-widget ui-widget-content ui-menu-icons ui-front").removeAttr("role").removeAttr("tabIndex").removeAttr("aria-labelledby").removeAttr("aria-expanded").removeAttr("aria-hidden").removeAttr("aria-disabled").removeUniqueId().show(),this.element.find(".ui-menu-item").removeClass("ui-menu-item").removeAttr("role").removeAttr("aria-disabled").removeUniqueId().removeClass("ui-state-hover").removeAttr("tabIndex").removeAttr("role").removeAttr("aria-haspopup").children().each(function(){var e=t(this);e.data("ui-menu-submenu-carat")&&e.remove()}),this.element.find(".ui-menu-divider").removeClass("ui-menu-divider ui-widget-content")},_keydown:function(e){var i,n,r,s,a=!0;switch(e.keyCode){case t.ui.keyCode.PAGE_UP:this.previousPage(e);break;case t.ui.keyCode.PAGE_DOWN:this.nextPage(e);break;case t.ui.keyCode.HOME:this._move("first","first",e);break;case t.ui.keyCode.END:this._move("last","last",e);break;case t.ui.keyCode.UP:this.previous(e);break;case t.ui.keyCode.DOWN:this.next(e);break;case t.ui.keyCode.LEFT:this.collapse(e);break;case t.ui.keyCode.RIGHT:this.active&&!this.active.is(".ui-state-disabled")&&this.expand(e);break;case t.ui.keyCode.ENTER:case t.ui.keyCode.SPACE:this._activate(e);break;case t.ui.keyCode.ESCAPE:this.collapse(e);break;default:a=!1,n=this.previousFilter||"",r=String.fromCharCode(e.keyCode),s=!1,clearTimeout(this.filterTimer),r===n?s=!0:r=n+r,i=this._filterMenuItems(r),i=s&&i.index(this.active.next())!==-1?this.active.nextAll(".ui-menu-item"):i,i.length||(r=String.fromCharCode(e.keyCode),i=this._filterMenuItems(r)),i.length?(this.focus(e,i),this.previousFilter=r,this.filterTimer=this._delay(function(){delete this.previousFilter},1e3)):delete this.previousFilter}a&&e.preventDefault()},_activate:function(t){this.active.is(".ui-state-disabled")||(this.active.is("[aria-haspopup='true']")?this.expand(t):this.select(t))},refresh:function(){var e,i,n=this,r=this.options.icons.submenu,s=this.element.find(this.options.menus);this.element.toggleClass("ui-menu-icons",!!this.element.find(".ui-icon").length),s.filter(":not(.ui-menu)").addClass("ui-menu ui-widget ui-widget-content ui-front").hide().attr({role:this.options.role,"aria-hidden":"true","aria-expanded":"false"}).each(function(){var e=t(this),i=e.parent(),n=t("<span>").addClass("ui-menu-icon ui-icon "+r).data("ui-menu-submenu-carat",!0);i.attr("aria-haspopup","true").prepend(n),e.attr("aria-labelledby",i.attr("id"))}),e=s.add(this.element),i=e.find(this.options.items),i.not(".ui-menu-item").each(function(){var e=t(this);n._isDivider(e)&&e.addClass("ui-widget-content ui-menu-divider")}),i.not(".ui-menu-item, .ui-menu-divider").addClass("ui-menu-item").uniqueId().attr({tabIndex:-1,role:this._itemRole()}),i.filter(".ui-state-disabled").attr("aria-disabled","true"),this.active&&!t.contains(this.element[0],this.active[0])&&this.blur()},_itemRole:function(){return{menu:"menuitem",listbox:"option"}[this.options.role]},_setOption:function(t,e){"icons"===t&&this.element.find(".ui-menu-icon").removeClass(this.options.icons.submenu).addClass(e.submenu),"disabled"===t&&this.element.toggleClass("ui-state-disabled",!!e).attr("aria-disabled",e),this._super(t,e)},focus:function(t,e){var i,n;this.blur(t,t&&"focus"===t.type),this._scrollIntoView(e),this.active=e.first(),n=this.active.addClass("ui-state-focus").removeClass("ui-state-active"),this.options.role&&this.element.attr("aria-activedescendant",n.attr("id")),this.active.parent().closest(".ui-menu-item").addClass("ui-state-active"),t&&"keydown"===t.type?this._close():this.timer=this._delay(function(){this._close()},this.delay),i=e.children(".ui-menu"),i.length&&t&&/^mouse/.test(t.type)&&this._startOpening(i),this.activeMenu=e.parent(),this._trigger("focus",t,{item:e})},_scrollIntoView:function(e){var i,n,r,s,a,o;this._hasScroll()&&(i=parseFloat(t.css(this.activeMenu[0],"borderTopWidth"))||0,n=parseFloat(t.css(this.activeMenu[0],"paddingTop"))||0,r=e.offset().top-this.activeMenu.offset().top-i-n,s=this.activeMenu.scrollTop(),a=this.activeMenu.height(),o=e.outerHeight(),r<0?this.activeMenu.scrollTop(s+r):r+o>a&&this.activeMenu.scrollTop(s+r-a+o))},blur:function(t,e){e||clearTimeout(this.timer),this.active&&(this.active.removeClass("ui-state-focus"),this.active=null,this._trigger("blur",t,{item:this.active}))},_startOpening:function(t){clearTimeout(this.timer),"true"===t.attr("aria-hidden")&&(this.timer=this._delay(function(){this._close(),this._open(t)},this.delay))},_open:function(e){var i=t.extend({of:this.active},this.options.position);clearTimeout(this.timer),this.element.find(".ui-menu").not(e.parents(".ui-menu")).hide().attr("aria-hidden","true"),e.show().removeAttr("aria-hidden").attr("aria-expanded","true").position(i)},collapseAll:function(e,i){clearTimeout(this.timer),this.timer=this._delay(function(){var n=i?this.element:t(e&&e.target).closest(this.element.find(".ui-menu"));n.length||(n=this.element),this._close(n),this.blur(e),this.activeMenu=n},this.delay)},_close:function(t){t||(t=this.active?this.active.parent():this.element),t.find(".ui-menu").hide().attr("aria-hidden","true").attr("aria-expanded","false").end().find(".ui-state-active").not(".ui-state-focus").removeClass("ui-state-active")},_closeOnDocumentClick:function(e){return!t(e.target).closest(".ui-menu").length},_isDivider:function(t){return!/[^\-\u2014\u2013\s]/.test(t.text())},collapse:function(t){var e=this.active&&this.active.parent().closest(".ui-menu-item",this.element);e&&e.length&&(this._close(),this.focus(t,e))},expand:function(t){var e=this.active&&this.active.children(".ui-menu ").find(this.options.items).first();e&&e.length&&(this._open(e.parent()),this._delay(function(){this.focus(t,e)}))},next:function(t){this._move("next","first",t)},previous:function(t){this._move("prev","last",t)},isFirstItem:function(){return this.active&&!this.active.prevAll(".ui-menu-item").length},isLastItem:function(){return this.active&&!this.active.nextAll(".ui-menu-item").length},_move:function(t,e,i){var n;this.active&&(n="first"===t||"last"===t?this.active["first"===t?"prevAll":"nextAll"](".ui-menu-item").eq(-1):this.active[t+"All"](".ui-menu-item").eq(0)),n&&n.length&&this.active||(n=this.activeMenu.find(this.options.items)[e]()),this.focus(i,n)},nextPage:function(e){var i,n,r;return this.active?void(this.isLastItem()||(this._hasScroll()?(n=this.active.offset().top,r=this.element.height(),this.active.nextAll(".ui-menu-item").each(function(){return i=t(this),i.offset().top-n-r<0}),this.focus(e,i)):this.focus(e,this.activeMenu.find(this.options.items)[this.active?"last":"first"]()))):void this.next(e)},previousPage:function(e){var i,n,r;return this.active?void(this.isFirstItem()||(this._hasScroll()?(n=this.active.offset().top,r=this.element.height(),this.active.prevAll(".ui-menu-item").each(function(){return i=t(this),i.offset().top-n+r>0}),this.focus(e,i)):this.focus(e,this.activeMenu.find(this.options.items).first()))):void this.next(e)},_hasScroll:function(){return this.element.outerHeight()<this.element.prop("scrollHeight")},select:function(e){this.active=this.active||t(e.target).closest(".ui-menu-item");var i={item:this.active};this.active.has(".ui-menu").length||this.collapseAll(e,!0),this._trigger("select",e,i)},_filterMenuItems:function(e){var i=e.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&"),n=new RegExp("^"+i,"i");return this.activeMenu.find(this.options.items).filter(".ui-menu-item").filter(function(){return n.test(t.trim(t(this).text()))})}})});