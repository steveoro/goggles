!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){function e(e,n){var r,s,o,a=e.nodeName.toLowerCase();return"area"===a?(r=e.parentNode,s=r.name,!(!e.href||!s||"map"!==r.nodeName.toLowerCase())&&(o=t("img[usemap='#"+s+"']")[0],!!o&&i(o))):(/^(input|select|textarea|button|object)$/.test(a)?!e.disabled:"a"===a?e.href||n:n)&&i(e)}function i(e){return t.expr.filters.visible(e)&&!t(e).parents().addBack().filter(function(){return"hidden"===t.css(this,"visibility")}).length}t.ui=t.ui||{},t.extend(t.ui,{version:"1.11.4",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),t.fn.extend({scrollParent:function(e){var i=this.css("position"),n="absolute"===i,r=e?/(auto|scroll|hidden)/:/(auto|scroll)/,s=this.parents().filter(function(){var e=t(this);return(!n||"static"!==e.css("position"))&&r.test(e.css("overflow")+e.css("overflow-y")+e.css("overflow-x"))}).eq(0);return"fixed"!==i&&s.length?s:t(this[0].ownerDocument||document)},uniqueId:function(){var t=0;return function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++t)})}}(),removeUniqueId:function(){return this.each(function(){/^ui-id-\d+$/.test(this.id)&&t(this).removeAttr("id")})}}),t.extend(t.expr[":"],{data:t.expr.createPseudo?t.expr.createPseudo(function(e){return function(i){return!!t.data(i,e)}}):function(e,i,n){return!!t.data(e,n[3])},focusable:function(i){return e(i,!isNaN(t.attr(i,"tabindex")))},tabbable:function(i){var n=t.attr(i,"tabindex"),r=isNaN(n);return(r||n>=0)&&e(i,!r)}}),t("<a>").outerWidth(1).jquery||t.each(["Width","Height"],function(e,i){function n(e,i,n,s){return t.each(r,function(){i-=parseFloat(t.css(e,"padding"+this))||0,n&&(i-=parseFloat(t.css(e,"border"+this+"Width"))||0),s&&(i-=parseFloat(t.css(e,"margin"+this))||0)}),i}var r="Width"===i?["Left","Right"]:["Top","Bottom"],s=i.toLowerCase(),o={innerWidth:t.fn.innerWidth,innerHeight:t.fn.innerHeight,outerWidth:t.fn.outerWidth,outerHeight:t.fn.outerHeight};t.fn["inner"+i]=function(e){return void 0===e?o["inner"+i].call(this):this.each(function(){t(this).css(s,n(this,e)+"px")})},t.fn["outer"+i]=function(e,r){return"number"!=typeof e?o["outer"+i].call(this,e):this.each(function(){t(this).css(s,n(this,e,!0,r)+"px")})}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(t.fn.removeData=function(e){return function(i){return arguments.length?e.call(this,t.camelCase(i)):e.call(this)}}(t.fn.removeData)),t.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),t.fn.extend({focus:function(e){return function(i,n){return"number"==typeof i?this.each(function(){var e=this;setTimeout(function(){t(e).focus(),n&&n.call(e)},i)}):e.apply(this,arguments)}}(t.fn.focus),disableSelection:function(){var t="onselectstart"in document.createElement("div")?"selectstart":"mousedown";return function(){return this.bind(t+".ui-disableSelection",function(t){t.preventDefault()})}}(),enableSelection:function(){return this.unbind(".ui-disableSelection")},zIndex:function(e){if(void 0!==e)return this.css("zIndex",e);if(this.length)for(var i,n,r=t(this[0]);r.length&&r[0]!==document;){if(i=r.css("position"),("absolute"===i||"relative"===i||"fixed"===i)&&(n=parseInt(r.css("zIndex"),10),!isNaN(n)&&0!==n))return n;r=r.parent()}return 0}}),t.ui.plugin={add:function(e,i,n){var r,s=t.ui[e].prototype;for(r in n)s.plugins[r]=s.plugins[r]||[],s.plugins[r].push([i,n[r]])},call:function(t,e,i,n){var r,s=t.plugins[e];if(s&&(n||t.element[0].parentNode&&11!==t.element[0].parentNode.nodeType))for(r=0;r<s.length;r++)t.options[s[r][0]]&&s[r][1].apply(t.element,i)}}}),function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){var e=0,i=Array.prototype.slice;return t.cleanData=function(e){return function(i){var n,r,s;for(s=0;null!=(r=i[s]);s++)try{n=t._data(r,"events"),n&&n.remove&&t(r).triggerHandler("remove")}catch(t){}e(i)}}(t.cleanData),t.widget=function(e,i,n){var r,s,o,a,l={},h=e.split(".")[0];return e=e.split(".")[1],r=h+"-"+e,n||(n=i,i=t.Widget),t.expr[":"][r.toLowerCase()]=function(e){return!!t.data(e,r)},t[h]=t[h]||{},s=t[h][e],o=t[h][e]=function(t,e){return this._createWidget?void(arguments.length&&this._createWidget(t,e)):new o(t,e)},t.extend(o,s,{version:n.version,_proto:t.extend({},n),_childConstructors:[]}),a=new i,a.options=t.widget.extend({},a.options),t.each(n,function(e,n){return t.isFunction(n)?void(l[e]=function(){var t=function(){return i.prototype[e].apply(this,arguments)},r=function(t){return i.prototype[e].apply(this,t)};return function(){var e,i=this._super,s=this._superApply;return this._super=t,this._superApply=r,e=n.apply(this,arguments),this._super=i,this._superApply=s,e}}()):void(l[e]=n)}),o.prototype=t.widget.extend(a,{widgetEventPrefix:s?a.widgetEventPrefix||e:e},l,{constructor:o,namespace:h,widgetName:e,widgetFullName:r}),s?(t.each(s._childConstructors,function(e,i){var n=i.prototype;t.widget(n.namespace+"."+n.widgetName,o,i._proto)}),delete s._childConstructors):i._childConstructors.push(o),t.widget.bridge(e,o),o},t.widget.extend=function(e){for(var n,r,s=i.call(arguments,1),o=0,a=s.length;o<a;o++)for(n in s[o])r=s[o][n],s[o].hasOwnProperty(n)&&void 0!==r&&(t.isPlainObject(r)?e[n]=t.isPlainObject(e[n])?t.widget.extend({},e[n],r):t.widget.extend({},r):e[n]=r);return e},t.widget.bridge=function(e,n){var r=n.prototype.widgetFullName||e;t.fn[e]=function(s){var o="string"==typeof s,a=i.call(arguments,1),l=this;return o?this.each(function(){var i,n=t.data(this,r);return"instance"===s?(l=n,!1):n?t.isFunction(n[s])&&"_"!==s.charAt(0)?(i=n[s].apply(n,a),i!==n&&void 0!==i?(l=i&&i.jquery?l.pushStack(i.get()):i,!1):void 0):t.error("no such method '"+s+"' for "+e+" widget instance"):t.error("cannot call methods on "+e+" prior to initialization; attempted to call method '"+s+"'")}):(a.length&&(s=t.widget.extend.apply(null,[s].concat(a))),this.each(function(){var e=t.data(this,r);e?(e.option(s||{}),e._init&&e._init()):t.data(this,r,new n(s,this))})),l}},t.Widget=function(){},t.Widget._childConstructors=[],t.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(i,n){n=t(n||this.defaultElement||this)[0],this.element=t(n),this.uuid=e++,this.eventNamespace="."+this.widgetName+this.uuid,this.bindings=t(),this.hoverable=t(),this.focusable=t(),n!==this&&(t.data(n,this.widgetFullName,this),this._on(!0,this.element,{remove:function(t){t.target===n&&this.destroy()}}),this.document=t(n.style?n.ownerDocument:n.document||n),this.window=t(this.document[0].defaultView||this.document[0].parentWindow)),this.options=t.widget.extend({},this.options,this._getCreateOptions(),i),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:t.noop,_getCreateEventData:t.noop,_create:t.noop,_init:t.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetFullName).removeData(t.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:t.noop,widget:function(){return this.element},option:function(e,i){var n,r,s,o=e;if(0===arguments.length)return t.widget.extend({},this.options);if("string"==typeof e)if(o={},n=e.split("."),e=n.shift(),n.length){for(r=o[e]=t.widget.extend({},this.options[e]),s=0;s<n.length-1;s++)r[n[s]]=r[n[s]]||{},r=r[n[s]];if(e=n.pop(),1===arguments.length)return void 0===r[e]?null:r[e];r[e]=i}else{if(1===arguments.length)return void 0===this.options[e]?null:this.options[e];o[e]=i}return this._setOptions(o),this},_setOptions:function(t){var e;for(e in t)this._setOption(e,t[e]);return this},_setOption:function(t,e){return this.options[t]=e,"disabled"===t&&(this.widget().toggleClass(this.widgetFullName+"-disabled",!!e),e&&(this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus"))),this},enable:function(){return this._setOptions({disabled:!1})},disable:function(){return this._setOptions({disabled:!0})},_on:function(e,i,n){var r,s=this;"boolean"!=typeof e&&(n=i,i=e,e=!1),n?(i=r=t(i),this.bindings=this.bindings.add(i)):(n=i,i=this.element,r=this.widget()),t.each(n,function(n,o){function a(){if(e||s.options.disabled!==!0&&!t(this).hasClass("ui-state-disabled"))return("string"==typeof o?s[o]:o).apply(s,arguments)}"string"!=typeof o&&(a.guid=o.guid=o.guid||a.guid||t.guid++);var l=n.match(/^([\w:-]*)\s*(.*)$/),h=l[1]+s.eventNamespace,c=l[2];c?r.delegate(c,h,a):i.bind(h,a)})},_off:function(e,i){i=(i||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,e.unbind(i).undelegate(i),this.bindings=t(this.bindings.not(e).get()),this.focusable=t(this.focusable.not(e).get()),this.hoverable=t(this.hoverable.not(e).get())},_delay:function(t,e){function i(){return("string"==typeof t?n[t]:t).apply(n,arguments)}var n=this;return setTimeout(i,e||0)},_hoverable:function(e){this.hoverable=this.hoverable.add(e),this._on(e,{mouseenter:function(e){t(e.currentTarget).addClass("ui-state-hover")},mouseleave:function(e){t(e.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(e){this.focusable=this.focusable.add(e),this._on(e,{focusin:function(e){t(e.currentTarget).addClass("ui-state-focus")},focusout:function(e){t(e.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(e,i,n){var r,s,o=this.options[e];if(n=n||{},i=t.Event(i),i.type=(e===this.widgetEventPrefix?e:this.widgetEventPrefix+e).toLowerCase(),i.target=this.element[0],s=i.originalEvent)for(r in s)r in i||(i[r]=s[r]);return this.element.trigger(i,n),!(t.isFunction(o)&&o.apply(this.element[0],[i].concat(n))===!1||i.isDefaultPrevented())}},t.each({show:"fadeIn",hide:"fadeOut"},function(e,i){t.Widget.prototype["_"+e]=function(n,r,s){"string"==typeof r&&(r={effect:r});var o,a=r?r===!0||"number"==typeof r?i:r.effect||i:e;r=r||{},"number"==typeof r&&(r={duration:r}),o=!t.isEmptyObject(r),r.complete=s,r.delay&&n.delay(r.delay),o&&t.effects&&t.effects.effect[a]?n[e](r):a!==e&&n[a]?n[a](r.duration,r.easing,s):n.queue(function(i){t(this)[e](),s&&s.call(n[0]),i()})}}),t.widget}),function(t){"function"==typeof define&&define.amd?define(["jquery","./widget"],t):t(jQuery)}(function(t){var e=!1;return t(document).mouseup(function(){e=!1}),t.widget("ui.mouse",{version:"1.11.4",options:{cancel:"input,textarea,button,select,option",distance:1,delay:0},_mouseInit:function(){var e=this;this.element.bind("mousedown."+this.widgetName,function(t){return e._mouseDown(t)}).bind("click."+this.widgetName,function(i){if(!0===t.data(i.target,e.widgetName+".preventClickEvent"))return t.removeData(i.target,e.widgetName+".preventClickEvent"),i.stopImmediatePropagation(),!1}),this.started=!1},_mouseDestroy:function(){this.element.unbind("."+this.widgetName),this._mouseMoveDelegate&&this.document.unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(i){if(!e){this._mouseMoved=!1,this._mouseStarted&&this._mouseUp(i),this._mouseDownEvent=i;var n=this,r=1===i.which,s=!("string"!=typeof this.options.cancel||!i.target.nodeName)&&t(i.target).closest(this.options.cancel).length;return!(r&&!s&&this._mouseCapture(i))||(this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){n.mouseDelayMet=!0},this.options.delay)),this._mouseDistanceMet(i)&&this._mouseDelayMet(i)&&(this._mouseStarted=this._mouseStart(i)!==!1,!this._mouseStarted)?(i.preventDefault(),!0):(!0===t.data(i.target,this.widgetName+".preventClickEvent")&&t.removeData(i.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(t){return n._mouseMove(t)},this._mouseUpDelegate=function(t){return n._mouseUp(t)},this.document.bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate),i.preventDefault(),e=!0,!0))}},_mouseMove:function(e){if(this._mouseMoved){if(t.ui.ie&&(!document.documentMode||document.documentMode<9)&&!e.button)return this._mouseUp(e);if(!e.which)return this._mouseUp(e)}return(e.which||e.button)&&(this._mouseMoved=!0),this._mouseStarted?(this._mouseDrag(e),e.preventDefault()):(this._mouseDistanceMet(e)&&this._mouseDelayMet(e)&&(this._mouseStarted=this._mouseStart(this._mouseDownEvent,e)!==!1,this._mouseStarted?this._mouseDrag(e):this._mouseUp(e)),!this._mouseStarted)},_mouseUp:function(i){return this.document.unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,i.target===this._mouseDownEvent.target&&t.data(i.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(i)),e=!1,!1},_mouseDistanceMet:function(t){return Math.max(Math.abs(this._mouseDownEvent.pageX-t.pageX),Math.abs(this._mouseDownEvent.pageY-t.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return!0}})}),function(t){"function"==typeof define&&define.amd?define(["jquery","./core","./mouse","./widget"],t):t(jQuery)}(function(t){return t.widget("ui.resizable",t.ui.mouse,{version:"1.11.4",widgetEventPrefix:"resize",options:{alsoResize:!1,animate:!1,animateDuration:"slow",animateEasing:"swing",aspectRatio:!1,autoHide:!1,containment:!1,ghost:!1,grid:!1,handles:"e,s,se",helper:!1,maxHeight:null,maxWidth:null,minHeight:10,minWidth:10,zIndex:90,resize:null,start:null,stop:null},_num:function(t){return parseInt(t,10)||0},_isNumber:function(t){return!isNaN(parseInt(t,10))},_hasScroll:function(e,i){if("hidden"===t(e).css("overflow"))return!1;var n=i&&"left"===i?"scrollLeft":"scrollTop",r=!1;return e[n]>0||(e[n]=1,r=e[n]>0,e[n]=0,r)},_create:function(){var e,i,n,r,s,o=this,a=this.options;if(this.element.addClass("ui-resizable"),t.extend(this,{_aspectRatio:!!a.aspectRatio,aspectRatio:a.aspectRatio,originalElement:this.element,_proportionallyResizeElements:[],_helper:a.helper||a.ghost||a.animate?a.helper||"ui-resizable-helper":null}),this.element[0].nodeName.match(/^(canvas|textarea|input|select|button|img)$/i)&&(this.element.wrap(t("<div class='ui-wrapper' style='overflow: hidden;'></div>").css({position:this.element.css("position"),width:this.element.outerWidth(),height:this.element.outerHeight(),top:this.element.css("top"),left:this.element.css("left")})),this.element=this.element.parent().data("ui-resizable",this.element.resizable("instance")),this.elementIsWrapper=!0,this.element.css({marginLeft:this.originalElement.css("marginLeft"),marginTop:this.originalElement.css("marginTop"),marginRight:this.originalElement.css("marginRight"),marginBottom:this.originalElement.css("marginBottom")}),this.originalElement.css({marginLeft:0,marginTop:0,marginRight:0,marginBottom:0}),this.originalResizeStyle=this.originalElement.css("resize"),this.originalElement.css("resize","none"),this._proportionallyResizeElements.push(this.originalElement.css({position:"static",zoom:1,display:"block"})),this.originalElement.css({margin:this.originalElement.css("margin")}),this._proportionallyResize()),this.handles=a.handles||(t(".ui-resizable-handle",this.element).length?{n:".ui-resizable-n",e:".ui-resizable-e",s:".ui-resizable-s",w:".ui-resizable-w",se:".ui-resizable-se",sw:".ui-resizable-sw",ne:".ui-resizable-ne",nw:".ui-resizable-nw"}:"e,s,se"),this._handles=t(),this.handles.constructor===String)for("all"===this.handles&&(this.handles="n,e,s,w,se,sw,ne,nw"),e=this.handles.split(","),this.handles={},i=0;i<e.length;i++)n=t.trim(e[i]),s="ui-resizable-"+n,r=t("<div class='ui-resizable-handle "+s+"'></div>"),r.css({zIndex:a.zIndex}),"se"===n&&r.addClass("ui-icon ui-icon-gripsmall-diagonal-se"),this.handles[n]=".ui-resizable-"+n,this.element.append(r);this._renderAxis=function(e){var i,n,r,s;e=e||this.element;for(i in this.handles)this.handles[i].constructor===String?this.handles[i]=this.element.children(this.handles[i]).first().show():(this.handles[i].jquery||this.handles[i].nodeType)&&(this.handles[i]=t(this.handles[i]),this._on(this.handles[i],{mousedown:o._mouseDown})),this.elementIsWrapper&&this.originalElement[0].nodeName.match(/^(textarea|input|select|button)$/i)&&(n=t(this.handles[i],this.element),s=/sw|ne|nw|se|n|s/.test(i)?n.outerHeight():n.outerWidth(),r=["padding",/ne|nw|n/.test(i)?"Top":/se|sw|s/.test(i)?"Bottom":/^e$/.test(i)?"Right":"Left"].join(""),e.css(r,s),this._proportionallyResize()),this._handles=this._handles.add(this.handles[i])},this._renderAxis(this.element),this._handles=this._handles.add(this.element.find(".ui-resizable-handle")),this._handles.disableSelection(),this._handles.mouseover(function(){o.resizing||(this.className&&(r=this.className.match(/ui-resizable-(se|sw|ne|nw|n|e|s|w)/i)),o.axis=r&&r[1]?r[1]:"se")}),a.autoHide&&(this._handles.hide(),t(this.element).addClass("ui-resizable-autohide").mouseenter(function(){a.disabled||(t(this).removeClass("ui-resizable-autohide"),o._handles.show())}).mouseleave(function(){a.disabled||o.resizing||(t(this).addClass("ui-resizable-autohide"),o._handles.hide())})),this._mouseInit()},_destroy:function(){this._mouseDestroy();var e,i=function(e){t(e).removeClass("ui-resizable ui-resizable-disabled ui-resizable-resizing").removeData("resizable").removeData("ui-resizable").unbind(".resizable").find(".ui-resizable-handle").remove()};return this.elementIsWrapper&&(i(this.element),e=this.element,this.originalElement.css({position:e.css("position"),width:e.outerWidth(),height:e.outerHeight(),top:e.css("top"),left:e.css("left")}).insertAfter(e),e.remove()),this.originalElement.css("resize",this.originalResizeStyle),i(this.originalElement),this},_mouseCapture:function(e){var i,n,r=!1;for(i in this.handles)n=t(this.handles[i])[0],(n===e.target||t.contains(n,e.target))&&(r=!0);return!this.options.disabled&&r},_mouseStart:function(e){var i,n,r,s=this.options,o=this.element;return this.resizing=!0,this._renderProxy(),i=this._num(this.helper.css("left")),n=this._num(this.helper.css("top")),s.containment&&(i+=t(s.containment).scrollLeft()||0,n+=t(s.containment).scrollTop()||0),this.offset=this.helper.offset(),this.position={left:i,top:n},this.size=this._helper?{width:this.helper.width(),height:this.helper.height()}:{width:o.width(),height:o.height()},this.originalSize=this._helper?{width:o.outerWidth(),height:o.outerHeight()}:{width:o.width(),height:o.height()},this.sizeDiff={width:o.outerWidth()-o.width(),height:o.outerHeight()-o.height()},this.originalPosition={left:i,top:n},this.originalMousePosition={left:e.pageX,top:e.pageY},this.aspectRatio="number"==typeof s.aspectRatio?s.aspectRatio:this.originalSize.width/this.originalSize.height||1,r=t(".ui-resizable-"+this.axis).css("cursor"),t("body").css("cursor","auto"===r?this.axis+"-resize":r),o.addClass("ui-resizable-resizing"),this._propagate("start",e),!0},_mouseDrag:function(e){var i,n,r=this.originalMousePosition,s=this.axis,o=e.pageX-r.left||0,a=e.pageY-r.top||0,l=this._change[s];return this._updatePrevProperties(),!!l&&(i=l.apply(this,[e,o,a]),this._updateVirtualBoundaries(e.shiftKey),(this._aspectRatio||e.shiftKey)&&(i=this._updateRatio(i,e)),i=this._respectSize(i,e),this._updateCache(i),this._propagate("resize",e),n=this._applyChanges(),!this._helper&&this._proportionallyResizeElements.length&&this._proportionallyResize(),t.isEmptyObject(n)||(this._updatePrevProperties(),this._trigger("resize",e,this.ui()),this._applyChanges()),!1)},_mouseStop:function(e){this.resizing=!1;var i,n,r,s,o,a,l,h=this.options,c=this;return this._helper&&(i=this._proportionallyResizeElements,n=i.length&&/textarea/i.test(i[0].nodeName),r=n&&this._hasScroll(i[0],"left")?0:c.sizeDiff.height,s=n?0:c.sizeDiff.width,o={width:c.helper.width()-s,height:c.helper.height()-r},a=parseInt(c.element.css("left"),10)+(c.position.left-c.originalPosition.left)||null,l=parseInt(c.element.css("top"),10)+(c.position.top-c.originalPosition.top)||null,h.animate||this.element.css(t.extend(o,{top:l,left:a})),c.helper.height(c.size.height),c.helper.width(c.size.width),this._helper&&!h.animate&&this._proportionallyResize()),t("body").css("cursor","auto"),this.element.removeClass("ui-resizable-resizing"),this._propagate("stop",e),this._helper&&this.helper.remove(),!1},_updatePrevProperties:function(){this.prevPosition={top:this.position.top,left:this.position.left},this.prevSize={width:this.size.width,height:this.size.height}},_applyChanges:function(){var t={};return this.position.top!==this.prevPosition.top&&(t.top=this.position.top+"px"),this.position.left!==this.prevPosition.left&&(t.left=this.position.left+"px"),this.size.width!==this.prevSize.width&&(t.width=this.size.width+"px"),this.size.height!==this.prevSize.height&&(t.height=this.size.height+"px"),this.helper.css(t),t},_updateVirtualBoundaries:function(t){var e,i,n,r,s,o=this.options;s={minWidth:this._isNumber(o.minWidth)?o.minWidth:0,maxWidth:this._isNumber(o.maxWidth)?o.maxWidth:1/0,minHeight:this._isNumber(o.minHeight)?o.minHeight:0,maxHeight:this._isNumber(o.maxHeight)?o.maxHeight:1/0},(this._aspectRatio||t)&&(e=s.minHeight*this.aspectRatio,n=s.minWidth/this.aspectRatio,i=s.maxHeight*this.aspectRatio,r=s.maxWidth/this.aspectRatio,e>s.minWidth&&(s.minWidth=e),n>s.minHeight&&(s.minHeight=n),i<s.maxWidth&&(s.maxWidth=i),r<s.maxHeight&&(s.maxHeight=r)),this._vBoundaries=s},_updateCache:function(t){this.offset=this.helper.offset(),this._isNumber(t.left)&&(this.position.left=t.left),this._isNumber(t.top)&&(this.position.top=t.top),this._isNumber(t.height)&&(this.size.height=t.height),this._isNumber(t.width)&&(this.size.width=t.width)},_updateRatio:function(t){var e=this.position,i=this.size,n=this.axis;return this._isNumber(t.height)?t.width=t.height*this.aspectRatio:this._isNumber(t.width)&&(t.height=t.width/this.aspectRatio),"sw"===n&&(t.left=e.left+(i.width-t.width),t.top=null),"nw"===n&&(t.top=e.top+(i.height-t.height),t.left=e.left+(i.width-t.width)),t},_respectSize:function(t){var e=this._vBoundaries,i=this.axis,n=this._isNumber(t.width)&&e.maxWidth&&e.maxWidth<t.width,r=this._isNumber(t.height)&&e.maxHeight&&e.maxHeight<t.height,s=this._isNumber(t.width)&&e.minWidth&&e.minWidth>t.width,o=this._isNumber(t.height)&&e.minHeight&&e.minHeight>t.height,a=this.originalPosition.left+this.originalSize.width,l=this.position.top+this.size.height,h=/sw|nw|w/.test(i),c=/nw|ne|n/.test(i);return s&&(t.width=e.minWidth),o&&(t.height=e.minHeight),n&&(t.width=e.maxWidth),r&&(t.height=e.maxHeight),s&&h&&(t.left=a-e.minWidth),n&&h&&(t.left=a-e.maxWidth),o&&c&&(t.top=l-e.minHeight),r&&c&&(t.top=l-e.maxHeight),t.width||t.height||t.left||!t.top?t.width||t.height||t.top||!t.left||(t.left=null):t.top=null,t},_getPaddingPlusBorderDimensions:function(t){for(var e=0,i=[],n=[t.css("borderTopWidth"),t.css("borderRightWidth"),t.css("borderBottomWidth"),t.css("borderLeftWidth")],r=[t.css("paddingTop"),t.css("paddingRight"),t.css("paddingBottom"),t.css("paddingLeft")];e<4;e++)i[e]=parseInt(n[e],10)||0,i[e]+=parseInt(r[e],10)||0;return{height:i[0]+i[2],width:i[1]+i[3]}},_proportionallyResize:function(){if(this._proportionallyResizeElements.length)for(var t,e=0,i=this.helper||this.element;e<this._proportionallyResizeElements.length;e++)t=this._proportionallyResizeElements[e],this.outerDimensions||(this.outerDimensions=this._getPaddingPlusBorderDimensions(t)),t.css({height:i.height()-this.outerDimensions.height||0,width:i.width()-this.outerDimensions.width||0})},_renderProxy:function(){var e=this.element,i=this.options;this.elementOffset=e.offset(),this._helper?(this.helper=this.helper||t("<div style='overflow:hidden;'></div>"),this.helper.addClass(this._helper).css({width:this.element.outerWidth()-1,height:this.element.outerHeight()-1,position:"absolute",left:this.elementOffset.left+"px",top:this.elementOffset.top+"px",zIndex:++i.zIndex}),this.helper.appendTo("body").disableSelection()):this.helper=this.element},_change:{e:function(t,e){return{width:this.originalSize.width+e}},w:function(t,e){var i=this.originalSize,n=this.originalPosition;return{left:n.left+e,width:i.width-e}},n:function(t,e,i){var n=this.originalSize,r=this.originalPosition;return{top:r.top+i,height:n.height-i}},s:function(t,e,i){return{height:this.originalSize.height+i}},se:function(e,i,n){return t.extend(this._change.s.apply(this,arguments),this._change.e.apply(this,[e,i,n]))},sw:function(e,i,n){return t.extend(this._change.s.apply(this,arguments),this._change.w.apply(this,[e,i,n]))},ne:function(e,i,n){return t.extend(this._change.n.apply(this,arguments),this._change.e.apply(this,[e,i,n]))},nw:function(e,i,n){return t.extend(this._change.n.apply(this,arguments),this._change.w.apply(this,[e,i,n]))}},_propagate:function(e,i){t.ui.plugin.call(this,e,[i,this.ui()]),"resize"!==e&&this._trigger(e,i,this.ui())},plugins:{},ui:function(){return{originalElement:this.originalElement,element:this.element,helper:this.helper,position:this.position,size:this.size,originalSize:this.originalSize,originalPosition:this.originalPosition}}}),t.ui.plugin.add("resizable","animate",{stop:function(e){var i=t(this).resizable("instance"),n=i.options,r=i._proportionallyResizeElements,s=r.length&&/textarea/i.test(r[0].nodeName),o=s&&i._hasScroll(r[0],"left")?0:i.sizeDiff.height,a=s?0:i.sizeDiff.width,l={width:i.size.width-a,height:i.size.height-o},h=parseInt(i.element.css("left"),10)+(i.position.left-i.originalPosition.left)||null,c=parseInt(i.element.css("top"),10)+(i.position.top-i.originalPosition.top)||null;i.element.animate(t.extend(l,c&&h?{top:c,left:h}:{}),{duration:n.animateDuration,easing:n.animateEasing,step:function(){var n={width:parseInt(i.element.css("width"),10),height:parseInt(i.element.css("height"),10),top:parseInt(i.element.css("top"),10),left:parseInt(i.element.css("left"),10)};r&&r.length&&t(r[0]).css({width:n.width,height:n.height}),i._updateCache(n),i._propagate("resize",e)}})}}),t.ui.plugin.add("resizable","containment",{start:function(){var e,i,n,r,s,o,a,l=t(this).resizable("instance"),h=l.options,c=l.element,u=h.containment,d=u instanceof t?u.get(0):/parent/.test(u)?c.parent().get(0):u;d&&(l.containerElement=t(d),/document/.test(u)||u===document?(l.containerOffset={left:0,top:0},l.containerPosition={left:0,top:0},l.parentData={element:t(document),left:0,top:0,width:t(document).width(),height:t(document).height()||document.body.parentNode.scrollHeight}):(e=t(d),i=[],t(["Top","Right","Left","Bottom"]).each(function(t,n){i[t]=l._num(e.css("padding"+n))}),l.containerOffset=e.offset(),l.containerPosition=e.position(),l.containerSize={height:e.innerHeight()-i[3],width:e.innerWidth()-i[1]},n=l.containerOffset,r=l.containerSize.height,s=l.containerSize.width,o=l._hasScroll(d,"left")?d.scrollWidth:s,a=l._hasScroll(d)?d.scrollHeight:r,l.parentData={element:d,left:n.left,top:n.top,width:o,height:a}))},resize:function(e){var i,n,r,s,o=t(this).resizable("instance"),a=o.options,l=o.containerOffset,h=o.position,c=o._aspectRatio||e.shiftKey,u={top:0,left:0},d=o.containerElement,f=!0;d[0]!==document&&/static/.test(d.css("position"))&&(u=l),h.left<(o._helper?l.left:0)&&(o.size.width=o.size.width+(o._helper?o.position.left-l.left:o.position.left-u.left),c&&(o.size.height=o.size.width/o.aspectRatio,f=!1),o.position.left=a.helper?l.left:0),h.top<(o._helper?l.top:0)&&(o.size.height=o.size.height+(o._helper?o.position.top-l.top:o.position.top),c&&(o.size.width=o.size.height*o.aspectRatio,f=!1),o.position.top=o._helper?l.top:0),r=o.containerElement.get(0)===o.element.parent().get(0),s=/relative|absolute/.test(o.containerElement.css("position")),r&&s?(o.offset.left=o.parentData.left+o.position.left,o.offset.top=o.parentData.top+o.position.top):(o.offset.left=o.element.offset().left,o.offset.top=o.element.offset().top),i=Math.abs(o.sizeDiff.width+(o._helper?o.offset.left-u.left:o.offset.left-l.left)),n=Math.abs(o.sizeDiff.height+(o._helper?o.offset.top-u.top:o.offset.top-l.top)),i+o.size.width>=o.parentData.width&&(o.size.width=o.parentData.width-i,c&&(o.size.height=o.size.width/o.aspectRatio,f=!1)),n+o.size.height>=o.parentData.height&&(o.size.height=o.parentData.height-n,c&&(o.size.width=o.size.height*o.aspectRatio,f=!1)),f||(o.position.left=o.prevPosition.left,o.position.top=o.prevPosition.top,o.size.width=o.prevSize.width,o.size.height=o.prevSize.height)},stop:function(){var e=t(this).resizable("instance"),i=e.options,n=e.containerOffset,r=e.containerPosition,s=e.containerElement,o=t(e.helper),a=o.offset(),l=o.outerWidth()-e.sizeDiff.width,h=o.outerHeight()-e.sizeDiff.height;e._helper&&!i.animate&&/relative/.test(s.css("position"))&&t(this).css({left:a.left-r.left-n.left,width:l,height:h}),e._helper&&!i.animate&&/static/.test(s.css("position"))&&t(this).css({left:a.left-r.left-n.left,width:l,height:h})}}),t.ui.plugin.add("resizable","alsoResize",{start:function(){var e=t(this).resizable("instance"),i=e.options;t(i.alsoResize).each(function(){var e=t(this);e.data("ui-resizable-alsoresize",{width:parseInt(e.width(),10),height:parseInt(e.height(),10),left:parseInt(e.css("left"),10),top:parseInt(e.css("top"),10)})})},resize:function(e,i){var n=t(this).resizable("instance"),r=n.options,s=n.originalSize,o=n.originalPosition,a={height:n.size.height-s.height||0,width:n.size.width-s.width||0,top:n.position.top-o.top||0,left:n.position.left-o.left||0};t(r.alsoResize).each(function(){var e=t(this),n=t(this).data("ui-resizable-alsoresize"),r={},s=e.parents(i.originalElement[0]).length?["width","height"]:["width","height","top","left"];t.each(s,function(t,e){var i=(n[e]||0)+(a[e]||0);i&&i>=0&&(r[e]=i||null)}),e.css(r)})},stop:function(){t(this).removeData("resizable-alsoresize")}}),t.ui.plugin.add("resizable","ghost",{start:function(){var e=t(this).resizable("instance"),i=e.options,n=e.size;e.ghost=e.originalElement.clone(),e.ghost.css({opacity:.25,display:"block",position:"relative",height:n.height,width:n.width,margin:0,left:0,top:0}).addClass("ui-resizable-ghost").addClass("string"==typeof i.ghost?i.ghost:""),e.ghost.appendTo(e.helper)},resize:function(){var e=t(this).resizable("instance");e.ghost&&e.ghost.css({position:"relative",height:e.size.height,width:e.size.width})},stop:function(){var e=t(this).resizable("instance");e.ghost&&e.helper&&e.helper.get(0).removeChild(e.ghost.get(0))}}),t.ui.plugin.add("resizable","grid",{resize:function(){var e,i=t(this).resizable("instance"),n=i.options,r=i.size,s=i.originalSize,o=i.originalPosition,a=i.axis,l="number"==typeof n.grid?[n.grid,n.grid]:n.grid,h=l[0]||1,c=l[1]||1,u=Math.round((r.width-s.width)/h)*h,d=Math.round((r.height-s.height)/c)*c,f=s.width+u,p=s.height+d,g=n.maxWidth&&n.maxWidth<f,m=n.maxHeight&&n.maxHeight<p,v=n.minWidth&&n.minWidth>f,b=n.minHeight&&n.minHeight>p;n.grid=l,v&&(f+=h),b&&(p+=c),g&&(f-=h),m&&(p-=c),/^(se|s|e)$/.test(a)?(i.size.width=f,i.size.height=p):/^(ne)$/.test(a)?(i.size.width=f,i.size.height=p,i.position.top=o.top-d):/^(sw)$/.test(a)?(i.size.width=f,i.size.height=p,i.position.left=o.left-u):((p-c<=0||f-h<=0)&&(e=i._getPaddingPlusBorderDimensions(this)),p-c>0?(i.size.height=p,i.position.top=o.top-d):(p=c-e.height,i.size.height=p,i.position.top=o.top+s.height-p),f-h>0?(i.size.width=f,i.position.left=o.left-u):(f=h-e.width,i.size.width=f,i.position.left=o.left+s.width-f))}}),t.ui.resizable});