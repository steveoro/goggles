!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){var e="ui-effects-",i=t;return t.effects={effect:{}},function(t,e){function i(t,e,i){var n=u[e.type]||{};return null==t?i||!e.def?null:e.def:(t=n.floor?~~t:parseFloat(t),isNaN(t)?e.def:n.mod?(t+n.mod)%n.mod:0>t?0:n.max<t?n.max:t)}function n(e){var i=h(),n=i._rgba=[];return e=e.toLowerCase(),f(l,function(t,r){var s,a=r.re.exec(e),o=a&&r.parse(a),l=r.space||"rgba";if(o)return s=i[l](o),i[c[l].cache]=s[c[l].cache],n=i._rgba=s._rgba,!1}),n.length?("0,0,0,0"===n.join()&&t.extend(n,s.transparent),i):s[e]}function r(t,e,i){return i=(i+1)%1,6*i<1?t+(e-t)*i*6:2*i<1?e:3*i<2?t+(e-t)*(2/3-i)*6:t}var s,a="backgroundColor borderBottomColor borderLeftColor borderRightColor borderTopColor color columnRuleColor outlineColor textDecorationColor textEmphasisColor",o=/^([\-+])=\s*(\d+\.?\d*)/,l=[{re:/rgba?\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(t){return[t[1],t[2],t[3],t[4]]}},{re:/rgba?\(\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(t){return[2.55*t[1],2.55*t[2],2.55*t[3],t[4]]}},{re:/#([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})/,parse:function(t){return[parseInt(t[1],16),parseInt(t[2],16),parseInt(t[3],16)]}},{re:/#([a-f0-9])([a-f0-9])([a-f0-9])/,parse:function(t){return[parseInt(t[1]+t[1],16),parseInt(t[2]+t[2],16),parseInt(t[3]+t[3],16)]}},{re:/hsla?\(\s*(\d+(?:\.\d+)?)\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,space:"hsla",parse:function(t){return[t[1],t[2]/100,t[3]/100,t[4]]}}],h=t.Color=function(e,i,n,r){return new t.Color.fn.parse(e,i,n,r)},c={rgba:{props:{red:{idx:0,type:"byte"},green:{idx:1,type:"byte"},blue:{idx:2,type:"byte"}}},hsla:{props:{hue:{idx:0,type:"degrees"},saturation:{idx:1,type:"percent"},lightness:{idx:2,type:"percent"}}}},u={"byte":{floor:!0,max:255},percent:{max:1},degrees:{mod:360,floor:!0}},d=h.support={},p=t("<p>")[0],f=t.each;p.style.cssText="background-color:rgba(1,1,1,.5)",d.rgba=p.style.backgroundColor.indexOf("rgba")>-1,f(c,function(t,e){e.cache="_"+t,e.props.alpha={idx:3,type:"percent",def:1}}),h.fn=t.extend(h.prototype,{parse:function(r,a,o,l){if(r===e)return this._rgba=[null,null,null,null],this;(r.jquery||r.nodeType)&&(r=t(r).css(a),a=e);var u=this,d=t.type(r),p=this._rgba=[];return a!==e&&(r=[r,a,o,l],d="array"),"string"===d?this.parse(n(r)||s._default):"array"===d?(f(c.rgba.props,function(t,e){p[e.idx]=i(r[e.idx],e)}),this):"object"===d?(r instanceof h?f(c,function(t,e){r[e.cache]&&(u[e.cache]=r[e.cache].slice())}):f(c,function(e,n){var s=n.cache;f(n.props,function(t,e){if(!u[s]&&n.to){if("alpha"===t||null==r[t])return;u[s]=n.to(u._rgba)}u[s][e.idx]=i(r[t],e,!0)}),u[s]&&t.inArray(null,u[s].slice(0,3))<0&&(u[s][3]=1,n.from&&(u._rgba=n.from(u[s])))}),this):void 0},is:function(t){var e=h(t),i=!0,n=this;return f(c,function(t,r){var s,a=e[r.cache];return a&&(s=n[r.cache]||r.to&&r.to(n._rgba)||[],f(r.props,function(t,e){if(null!=a[e.idx])return i=a[e.idx]===s[e.idx]})),i}),i},_space:function(){var t=[],e=this;return f(c,function(i,n){e[n.cache]&&t.push(i)}),t.pop()},transition:function(t,e){var n=h(t),r=n._space(),s=c[r],a=0===this.alpha()?h("transparent"):this,o=a[s.cache]||s.to(a._rgba),l=o.slice();return n=n[s.cache],f(s.props,function(t,r){var s=r.idx,a=o[s],h=n[s],c=u[r.type]||{};null!==h&&(null===a?l[s]=h:(c.mod&&(h-a>c.mod/2?a+=c.mod:a-h>c.mod/2&&(a-=c.mod)),l[s]=i((h-a)*e+a,r)))}),this[r](l)},blend:function(e){if(1===this._rgba[3])return this;var i=this._rgba.slice(),n=i.pop(),r=h(e)._rgba;return h(t.map(i,function(t,e){return(1-n)*r[e]+n*t}))},toRgbaString:function(){var e="rgba(",i=t.map(this._rgba,function(t,e){return null==t?e>2?1:0:t});return 1===i[3]&&(i.pop(),e="rgb("),e+i.join()+")"},toHslaString:function(){var e="hsla(",i=t.map(this.hsla(),function(t,e){return null==t&&(t=e>2?1:0),e&&e<3&&(t=Math.round(100*t)+"%"),t});return 1===i[3]&&(i.pop(),e="hsl("),e+i.join()+")"},toHexString:function(e){var i=this._rgba.slice(),n=i.pop();return e&&i.push(~~(255*n)),"#"+t.map(i,function(t){return t=(t||0).toString(16),1===t.length?"0"+t:t}).join("")},toString:function(){return 0===this._rgba[3]?"transparent":this.toRgbaString()}}),h.fn.parse.prototype=h.fn,c.hsla.to=function(t){if(null==t[0]||null==t[1]||null==t[2])return[null,null,null,t[3]];var e,i,n=t[0]/255,r=t[1]/255,s=t[2]/255,a=t[3],o=Math.max(n,r,s),l=Math.min(n,r,s),h=o-l,c=o+l,u=.5*c;return e=l===o?0:n===o?60*(r-s)/h+360:r===o?60*(s-n)/h+120:60*(n-r)/h+240,i=0===h?0:u<=.5?h/c:h/(2-c),[Math.round(e)%360,i,u,null==a?1:a]},c.hsla.from=function(t){if(null==t[0]||null==t[1]||null==t[2])return[null,null,null,t[3]];var e=t[0]/360,i=t[1],n=t[2],s=t[3],a=n<=.5?n*(1+i):n+i-n*i,o=2*n-a;return[Math.round(255*r(o,a,e+1/3)),Math.round(255*r(o,a,e)),Math.round(255*r(o,a,e-1/3)),s]},f(c,function(n,r){var s=r.props,a=r.cache,l=r.to,c=r.from;h.fn[n]=function(n){if(l&&!this[a]&&(this[a]=l(this._rgba)),n===e)return this[a].slice();var r,o=t.type(n),u="array"===o||"object"===o?n:arguments,d=this[a].slice();return f(s,function(t,e){var n=u["object"===o?t:e.idx];null==n&&(n=d[e.idx]),d[e.idx]=i(n,e)}),c?(r=h(c(d)),r[a]=d,r):h(d)},f(s,function(e,i){h.fn[e]||(h.fn[e]=function(r){var s,a=t.type(r),l="alpha"===e?this._hsla?"hsla":"rgba":n,h=this[l](),c=h[i.idx];return"undefined"===a?c:("function"===a&&(r=r.call(this,c),a=t.type(r)),null==r&&i.empty?this:("string"===a&&(s=o.exec(r),s&&(r=c+parseFloat(s[2])*("+"===s[1]?1:-1))),h[i.idx]=r,this[l](h)))})})}),h.hook=function(e){var i=e.split(" ");f(i,function(e,i){t.cssHooks[i]={set:function(e,r){var s,a,o="";if("transparent"!==r&&("string"!==t.type(r)||(s=n(r)))){if(r=h(s||r),!d.rgba&&1!==r._rgba[3]){for(a="backgroundColor"===i?e.parentNode:e;(""===o||"transparent"===o)&&a&&a.style;)try{o=t.css(a,"backgroundColor"),a=a.parentNode}catch(t){}r=r.blend(o&&"transparent"!==o?o:"_default")}r=r.toRgbaString()}try{e.style[i]=r}catch(t){}}},t.fx.step[i]=function(e){e.colorInit||(e.start=h(e.elem,i),e.end=h(e.end),e.colorInit=!0),t.cssHooks[i].set(e.elem,e.start.transition(e.end,e.pos))}})},h.hook(a),t.cssHooks.borderColor={expand:function(t){var e={};return f(["Top","Right","Bottom","Left"],function(i,n){e["border"+n+"Color"]=t}),e}},s=t.Color.names={aqua:"#00ffff",black:"#000000",blue:"#0000ff",fuchsia:"#ff00ff",gray:"#808080",green:"#008000",lime:"#00ff00",maroon:"#800000",navy:"#000080",olive:"#808000",purple:"#800080",red:"#ff0000",silver:"#c0c0c0",teal:"#008080",white:"#ffffff",yellow:"#ffff00",transparent:[null,null,null,0],_default:"#ffffff"}}(i),function(){function e(e){var i,n,r=e.ownerDocument.defaultView?e.ownerDocument.defaultView.getComputedStyle(e,null):e.currentStyle,s={};if(r&&r.length&&r[0]&&r[r[0]])for(n=r.length;n--;)i=r[n],"string"==typeof r[i]&&(s[t.camelCase(i)]=r[i]);else for(i in r)"string"==typeof r[i]&&(s[i]=r[i]);return s}function n(e,i){var n,r,a={};for(n in i)r=i[n],e[n]!==r&&(s[n]||!t.fx.step[n]&&isNaN(parseFloat(r))||(a[n]=r));return a}var r=["add","remove","toggle"],s={border:1,borderBottom:1,borderColor:1,borderLeft:1,borderRight:1,borderTop:1,borderWidth:1,margin:1,padding:1};t.each(["borderLeftStyle","borderRightStyle","borderBottomStyle","borderTopStyle"],function(e,n){t.fx.step[n]=function(t){("none"!==t.end&&!t.setAttr||1===t.pos&&!t.setAttr)&&(i.style(t.elem,n,t.end),t.setAttr=!0)}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t.effects.animateClass=function(i,s,a,o){var l=t.speed(s,a,o);return this.queue(function(){var s,a=t(this),o=a.attr("class")||"",h=l.children?a.find("*").addBack():a;h=h.map(function(){var i=t(this);return{el:i,start:e(this)}}),s=function(){t.each(r,function(t,e){i[e]&&a[e+"Class"](i[e])})},s(),h=h.map(function(){return this.end=e(this.el[0]),this.diff=n(this.start,this.end),this}),a.attr("class",o),h=h.map(function(){var e=this,i=t.Deferred(),n=t.extend({},l,{queue:!1,complete:function(){i.resolve(e)}});return this.el.animate(this.diff,n),i.promise()}),t.when.apply(t,h.get()).done(function(){s(),t.each(arguments,function(){var e=this.el;t.each(this.diff,function(t){e.css(t,"")})}),l.complete.call(a[0])})})},t.fn.extend({addClass:function(e){return function(i,n,r,s){return n?t.effects.animateClass.call(this,{add:i},n,r,s):e.apply(this,arguments)}}(t.fn.addClass),removeClass:function(e){return function(i,n,r,s){return arguments.length>1?t.effects.animateClass.call(this,{remove:i},n,r,s):e.apply(this,arguments)}}(t.fn.removeClass),toggleClass:function(e){return function(i,n,r,s,a){return"boolean"==typeof n||void 0===n?r?t.effects.animateClass.call(this,n?{add:i}:{remove:i},r,s,a):e.apply(this,arguments):t.effects.animateClass.call(this,{toggle:i},n,r,s)}}(t.fn.toggleClass),switchClass:function(e,i,n,r,s){return t.effects.animateClass.call(this,{add:i,remove:e},n,r,s)}})}(),function(){function i(e,i,n,r){return t.isPlainObject(e)&&(i=e,e=e.effect),e={effect:e},null==i&&(i={}),t.isFunction(i)&&(r=i,n=null,i={}),("number"==typeof i||t.fx.speeds[i])&&(r=n,n=i,i={}),t.isFunction(n)&&(r=n,n=null),i&&t.extend(e,i),n=n||i.duration,e.duration=t.fx.off?0:"number"==typeof n?n:n in t.fx.speeds?t.fx.speeds[n]:t.fx.speeds._default,e.complete=r||i.complete,e}function n(e){return!(e&&"number"!=typeof e&&!t.fx.speeds[e])||("string"==typeof e&&!t.effects.effect[e]||(!!t.isFunction(e)||"object"==typeof e&&!e.effect))}t.extend(t.effects,{version:"1.11.4",save:function(t,i){for(var n=0;n<i.length;n++)null!==i[n]&&t.data(e+i[n],t[0].style[i[n]])},restore:function(t,i){var n,r;for(r=0;r<i.length;r++)null!==i[r]&&(n=t.data(e+i[r]),void 0===n&&(n=""),t.css(i[r],n))},setMode:function(t,e){return"toggle"===e&&(e=t.is(":hidden")?"show":"hide"),e},getBaseline:function(t,e){var i,n;switch(t[0]){case"top":i=0;break;case"middle":i=.5;break;case"bottom":i=1;break;default:i=t[0]/e.height}switch(t[1]){case"left":n=0;break;case"center":n=.5;break;case"right":n=1;break;default:n=t[1]/e.width}return{x:n,y:i}},createWrapper:function(e){if(e.parent().is(".ui-effects-wrapper"))return e.parent();var i={width:e.outerWidth(!0),height:e.outerHeight(!0),"float":e.css("float")},n=t("<div></div>").addClass("ui-effects-wrapper").css({fontSize:"100%",background:"transparent",border:"none",margin:0,padding:0}),r={width:e.width(),height:e.height()},s=document.activeElement;try{s.id}catch(t){s=document.body}return e.wrap(n),(e[0]===s||t.contains(e[0],s))&&t(s).focus(),n=e.parent(),"static"===e.css("position")?(n.css({position:"relative"}),e.css({position:"relative"})):(t.extend(i,{position:e.css("position"),zIndex:e.css("z-index")}),t.each(["top","left","bottom","right"],function(t,n){i[n]=e.css(n),isNaN(parseInt(i[n],10))&&(i[n]="auto")}),e.css({position:"relative",top:0,left:0,right:"auto",bottom:"auto"})),e.css(r),n.css(i).show()},removeWrapper:function(e){var i=document.activeElement;return e.parent().is(".ui-effects-wrapper")&&(e.parent().replaceWith(e),(e[0]===i||t.contains(e[0],i))&&t(i).focus()),e},setTransition:function(e,i,n,r){return r=r||{},t.each(i,function(t,i){var s=e.cssUnit(i);s[0]>0&&(r[i]=s[0]*n+s[1])}),r}}),t.fn.extend({effect:function(){function e(e){function i(){t.isFunction(s)&&s.call(r[0]),t.isFunction(e)&&e()}var r=t(this),s=n.complete,o=n.mode;(r.is(":hidden")?"hide"===o:"show"===o)?(r[o](),i()):a.call(r[0],n,i)}var n=i.apply(this,arguments),r=n.mode,s=n.queue,a=t.effects.effect[n.effect];return t.fx.off||!a?r?this[r](n.duration,n.complete):this.each(function(){n.complete&&n.complete.call(this)}):s===!1?this.each(e):this.queue(s||"fx",e)},show:function(t){return function(e){if(n(e))return t.apply(this,arguments);var r=i.apply(this,arguments);return r.mode="show",this.effect.call(this,r)}}(t.fn.show),hide:function(t){return function(e){if(n(e))return t.apply(this,arguments);var r=i.apply(this,arguments);return r.mode="hide",this.effect.call(this,r)}}(t.fn.hide),toggle:function(t){return function(e){if(n(e)||"boolean"==typeof e)return t.apply(this,arguments);var r=i.apply(this,arguments);return r.mode="toggle",this.effect.call(this,r)}}(t.fn.toggle),cssUnit:function(e){var i=this.css(e),n=[];return t.each(["em","px","%","pt"],function(t,e){i.indexOf(e)>0&&(n=[parseFloat(i),e])}),n}})}(),function(){var e={};t.each(["Quad","Cubic","Quart","Quint","Expo"],function(t,i){e[i]=function(e){return Math.pow(e,t+2)}}),t.extend(e,{Sine:function(t){return 1-Math.cos(t*Math.PI/2)},Circ:function(t){return 1-Math.sqrt(1-t*t)},Elastic:function(t){return 0===t||1===t?t:-Math.pow(2,8*(t-1))*Math.sin((80*(t-1)-7.5)*Math.PI/15)},Back:function(t){return t*t*(3*t-2)},Bounce:function(t){for(var e,i=4;t<((e=Math.pow(2,--i))-1)/11;);return 1/Math.pow(4,3-i)-7.5625*Math.pow((3*e-2)/22-t,2)}}),t.each(e,function(e,i){t.easing["easeIn"+e]=i,t.easing["easeOut"+e]=function(t){return 1-i(1-t)},t.easing["easeInOut"+e]=function(t){return t<.5?i(2*t)/2:1-i(t*-2+2)/2}})}(),t.effects}),function(t){"function"==typeof define&&define.amd?define(["jquery","./effect"],t):t(jQuery)}(function(t){return t.effects.effect.highlight=function(e,i){var n=t(this),r=["backgroundImage","backgroundColor","opacity"],s=t.effects.setMode(n,e.mode||"show"),a={backgroundColor:n.css("backgroundColor")};"hide"===s&&(a.opacity=0),t.effects.save(n,r),n.show().css({backgroundImage:"none",backgroundColor:e.color||"#ffff99"}).animate(a,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){"hide"===s&&n.hide(),t.effects.restore(n,r),i()}})}});