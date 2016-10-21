!function(t,e,i,n){function s(e,i){this.element=e,this.options=t.extend({},a,i),this._defaults=a,this._name=r,this.init()}var r="stellar",a={scrollProperty:"scroll",positionProperty:"position",horizontalScrolling:!0,verticalScrolling:!0,horizontalOffset:0,verticalOffset:0,responsive:!1,parallaxBackgrounds:!0,parallaxElements:!0,hideDistantElements:!0,hideElement:function(t){t.hide()},showElement:function(t){t.show()}},o={scroll:{getLeft:function(t){return t.scrollLeft()},setLeft:function(t,e){t.scrollLeft(e)},getTop:function(t){return t.scrollTop()},setTop:function(t,e){t.scrollTop(e)}},position:{getLeft:function(t){return parseInt(t.css("left"),10)*-1},getTop:function(t){return parseInt(t.css("top"),10)*-1}},margin:{getLeft:function(t){return parseInt(t.css("margin-left"),10)*-1},getTop:function(t){return parseInt(t.css("margin-top"),10)*-1}},transform:{getLeft:function(t){var e=getComputedStyle(t[0])[c];return"none"!==e?parseInt(e.match(/(-?[0-9]+)/g)[4],10)*-1:0},getTop:function(t){var e=getComputedStyle(t[0])[c];return"none"!==e?parseInt(e.match(/(-?[0-9]+)/g)[5],10)*-1:0}}},l={position:{setLeft:function(t,e){t.css("left",e)},setTop:function(t,e){t.css("top",e)}},transform:{setPosition:function(t,e,i,n,s){t[0].style[c]="translate3d("+(e-i)+"px, "+(n-s)+"px, 0)"}}},h=function(){var e,i=/^(Moz|Webkit|Khtml|O|ms|Icab)(?=[A-Z])/,n=t("script")[0].style,s="";for(e in n)if(i.test(e)){s=e.match(i)[0];break}return"WebkitOpacity"in n&&(s="Webkit"),"KhtmlOpacity"in n&&(s="Khtml"),function(t){return s+(s.length>0?t.charAt(0).toUpperCase()+t.slice(1):t)}}(),c=h("transform"),u=t("<div />",{style:"background:#fff"}).css("background-position-x")!==n,d=u?function(t,e,i){t.css({"background-position-x":e,"background-position-y":i})}:function(t,e,i){t.css("background-position",e+" "+i)},p=u?function(t){return[t.css("background-position-x"),t.css("background-position-y")]}:function(t){return t.css("background-position").split(" ")},f=e.requestAnimationFrame||e.webkitRequestAnimationFrame||e.mozRequestAnimationFrame||e.oRequestAnimationFrame||e.msRequestAnimationFrame||function(t){setTimeout(t,1e3/60)};s.prototype={init:function(){this.options.name=r+"_"+Math.floor(1e9*Math.random()),this._defineElements(),this._defineGetters(),this._defineSetters(),this._handleWindowLoadAndResize(),this._detectViewport(),this.refresh({firstLoad:!0}),"scroll"===this.options.scrollProperty?this._handleScrollEvent():this._startAnimationLoop()},_defineElements:function(){this.element===i.body&&(this.element=e),this.$scrollElement=t(this.element),this.$element=this.element===e?t("body"):this.$scrollElement,this.$viewportElement=this.options.viewportElement!==n?t(this.options.viewportElement):this.$scrollElement[0]===e||"scroll"===this.options.scrollProperty?this.$scrollElement:this.$scrollElement.parent()},_defineGetters:function(){var t=this,e=o[t.options.scrollProperty];this._getScrollLeft=function(){return e.getLeft(t.$scrollElement)},this._getScrollTop=function(){return e.getTop(t.$scrollElement)}},_defineSetters:function(){var e=this,i=o[e.options.scrollProperty],n=l[e.options.positionProperty],s=i.setLeft,r=i.setTop;this._setScrollLeft="function"==typeof s?function(t){s(e.$scrollElement,t)}:t.noop,this._setScrollTop="function"==typeof r?function(t){r(e.$scrollElement,t)}:t.noop,this._setPosition=n.setPosition||function(t,i,s,r,a){e.options.horizontalScrolling&&n.setLeft(t,i,s),e.options.verticalScrolling&&n.setTop(t,r,a)}},_handleWindowLoadAndResize:function(){var i=this,n=t(e);i.options.responsive&&n.bind("load."+this.name,function(){i.refresh()}),n.bind("resize."+this.name,function(){i._detectViewport(),i.options.responsive&&i.refresh()})},refresh:function(i){var n=this,s=n._getScrollLeft(),r=n._getScrollTop();i&&i.firstLoad||this._reset(),this._setScrollLeft(0),this._setScrollTop(0),this._setOffsets(),this._findParticles(),this._findBackgrounds(),i&&i.firstLoad&&/WebKit/.test(navigator.userAgent)&&t(e).load(function(){var t=n._getScrollLeft(),e=n._getScrollTop();n._setScrollLeft(t+1),n._setScrollTop(e+1),n._setScrollLeft(t),n._setScrollTop(e)}),this._setScrollLeft(s),this._setScrollTop(r)},_detectViewport:function(){var t=this.$viewportElement.offset(),e=null!==t&&t!==n;this.viewportWidth=this.$viewportElement.width(),this.viewportHeight=this.$viewportElement.height(),this.viewportOffsetTop=e?t.top:0,this.viewportOffsetLeft=e?t.left:0},_findParticles:function(){var e=this;this._getScrollLeft(),this._getScrollTop();if(this.particles!==n)for(var i=this.particles.length-1;i>=0;i--)this.particles[i].$element.data("stellar-elementIsActive",n);this.particles=[],this.options.parallaxElements&&this.$element.find("[data-stellar-ratio]").each(function(){var i,s,r,a,o,l,h,c,u,d=t(this),p=0,f=0,g=0,m=0;if(d.data("stellar-elementIsActive")){if(d.data("stellar-elementIsActive")!==this)return}else d.data("stellar-elementIsActive",this);e.options.showElement(d),d.data("stellar-startingLeft")?(d.css("left",d.data("stellar-startingLeft")),d.css("top",d.data("stellar-startingTop"))):(d.data("stellar-startingLeft",d.css("left")),d.data("stellar-startingTop",d.css("top"))),r=d.position().left,a=d.position().top,o="auto"===d.css("margin-left")?0:parseInt(d.css("margin-left"),10),l="auto"===d.css("margin-top")?0:parseInt(d.css("margin-top"),10),c=d.offset().left-o,u=d.offset().top-l,d.parents().each(function(){var e=t(this);return e.data("stellar-offset-parent")===!0?(p=g,f=m,h=e,!1):(g+=e.position().left,void(m+=e.position().top))}),i=d.data("stellar-horizontal-offset")!==n?d.data("stellar-horizontal-offset"):h!==n&&h.data("stellar-horizontal-offset")!==n?h.data("stellar-horizontal-offset"):e.horizontalOffset,s=d.data("stellar-vertical-offset")!==n?d.data("stellar-vertical-offset"):h!==n&&h.data("stellar-vertical-offset")!==n?h.data("stellar-vertical-offset"):e.verticalOffset,e.particles.push({$element:d,$offsetParent:h,isFixed:"fixed"===d.css("position"),horizontalOffset:i,verticalOffset:s,startingPositionLeft:r,startingPositionTop:a,startingOffsetLeft:c,startingOffsetTop:u,parentOffsetLeft:p,parentOffsetTop:f,stellarRatio:d.data("stellar-ratio")!==n?d.data("stellar-ratio"):1,width:d.outerWidth(!0),height:d.outerHeight(!0),isHidden:!1})})},_findBackgrounds:function(){var e,i=this,s=this._getScrollLeft(),r=this._getScrollTop();this.backgrounds=[],this.options.parallaxBackgrounds&&(e=this.$element.find("[data-stellar-background-ratio]"),this.$element.data("stellar-background-ratio")&&(e=e.add(this.$element)),e.each(function(){var e,a,o,l,h,c,u,f=t(this),g=p(f),m=0,v=0,b=0,y=0;if(f.data("stellar-backgroundIsActive")){if(f.data("stellar-backgroundIsActive")!==this)return}else f.data("stellar-backgroundIsActive",this);f.data("stellar-backgroundStartingLeft")?d(f,f.data("stellar-backgroundStartingLeft"),f.data("stellar-backgroundStartingTop")):(f.data("stellar-backgroundStartingLeft",g[0]),f.data("stellar-backgroundStartingTop",g[1])),o="auto"===f.css("margin-left")?0:parseInt(f.css("margin-left"),10),l="auto"===f.css("margin-top")?0:parseInt(f.css("margin-top"),10),h=f.offset().left-o-s,c=f.offset().top-l-r,f.parents().each(function(){var e=t(this);return e.data("stellar-offset-parent")===!0?(m=b,v=y,u=e,!1):(b+=e.position().left,void(y+=e.position().top))}),e=f.data("stellar-horizontal-offset")!==n?f.data("stellar-horizontal-offset"):u!==n&&u.data("stellar-horizontal-offset")!==n?u.data("stellar-horizontal-offset"):i.horizontalOffset,a=f.data("stellar-vertical-offset")!==n?f.data("stellar-vertical-offset"):u!==n&&u.data("stellar-vertical-offset")!==n?u.data("stellar-vertical-offset"):i.verticalOffset,i.backgrounds.push({$element:f,$offsetParent:u,isFixed:"fixed"===f.css("background-attachment"),horizontalOffset:e,verticalOffset:a,startingValueLeft:g[0],startingValueTop:g[1],startingBackgroundPositionLeft:isNaN(parseInt(g[0],10))?0:parseInt(g[0],10),startingBackgroundPositionTop:isNaN(parseInt(g[1],10))?0:parseInt(g[1],10),startingPositionLeft:f.position().left,startingPositionTop:f.position().top,startingOffsetLeft:h,startingOffsetTop:c,parentOffsetLeft:m,parentOffsetTop:v,stellarRatio:f.data("stellar-background-ratio")===n?1:f.data("stellar-background-ratio")})}))},_reset:function(){var t,e,i,n,s;for(s=this.particles.length-1;s>=0;s--)t=this.particles[s],e=t.$element.data("stellar-startingLeft"),i=t.$element.data("stellar-startingTop"),this._setPosition(t.$element,e,e,i,i),this.options.showElement(t.$element),t.$element.data("stellar-startingLeft",null).data("stellar-elementIsActive",null).data("stellar-backgroundIsActive",null);for(s=this.backgrounds.length-1;s>=0;s--)n=this.backgrounds[s],n.$element.data("stellar-backgroundStartingLeft",null).data("stellar-backgroundStartingTop",null),d(n.$element,n.startingValueLeft,n.startingValueTop)},destroy:function(){this._reset(),this.$scrollElement.unbind("resize."+this.name).unbind("scroll."+this.name),this._animationLoop=t.noop,t(e).unbind("load."+this.name).unbind("resize."+this.name)},_setOffsets:function(){var i=this,n=t(e);n.unbind("resize.horizontal-"+this.name).unbind("resize.vertical-"+this.name),"function"==typeof this.options.horizontalOffset?(this.horizontalOffset=this.options.horizontalOffset(),n.bind("resize.horizontal-"+this.name,function(){i.horizontalOffset=i.options.horizontalOffset()})):this.horizontalOffset=this.options.horizontalOffset,"function"==typeof this.options.verticalOffset?(this.verticalOffset=this.options.verticalOffset(),n.bind("resize.vertical-"+this.name,function(){i.verticalOffset=i.options.verticalOffset()})):this.verticalOffset=this.options.verticalOffset},_repositionElements:function(){var t,e,i,n,s,r,a,o,l,h,c=this._getScrollLeft(),u=this._getScrollTop(),p=!0,f=!0;if(this.currentScrollLeft!==c||this.currentScrollTop!==u||this.currentWidth!==this.viewportWidth||this.currentHeight!==this.viewportHeight){for(this.currentScrollLeft=c,this.currentScrollTop=u,this.currentWidth=this.viewportWidth,this.currentHeight=this.viewportHeight,h=this.particles.length-1;h>=0;h--)t=this.particles[h],e=t.isFixed?1:0,this.options.horizontalScrolling?(r=(c+t.horizontalOffset+this.viewportOffsetLeft+t.startingPositionLeft-t.startingOffsetLeft+t.parentOffsetLeft)*-(t.stellarRatio+e-1)+t.startingPositionLeft,o=r-t.startingPositionLeft+t.startingOffsetLeft):(r=t.startingPositionLeft,o=t.startingOffsetLeft),this.options.verticalScrolling?(a=(u+t.verticalOffset+this.viewportOffsetTop+t.startingPositionTop-t.startingOffsetTop+t.parentOffsetTop)*-(t.stellarRatio+e-1)+t.startingPositionTop,l=a-t.startingPositionTop+t.startingOffsetTop):(a=t.startingPositionTop,l=t.startingOffsetTop),this.options.hideDistantElements&&(f=!this.options.horizontalScrolling||o+t.width>(t.isFixed?0:c)&&o<(t.isFixed?0:c)+this.viewportWidth+this.viewportOffsetLeft,p=!this.options.verticalScrolling||l+t.height>(t.isFixed?0:u)&&l<(t.isFixed?0:u)+this.viewportHeight+this.viewportOffsetTop),f&&p?(t.isHidden&&(this.options.showElement(t.$element),t.isHidden=!1),this._setPosition(t.$element,r,t.startingPositionLeft,a,t.startingPositionTop)):t.isHidden||(this.options.hideElement(t.$element),t.isHidden=!0);for(h=this.backgrounds.length-1;h>=0;h--)i=this.backgrounds[h],e=i.isFixed?0:1,n=this.options.horizontalScrolling?(c+i.horizontalOffset-this.viewportOffsetLeft-i.startingOffsetLeft+i.parentOffsetLeft-i.startingBackgroundPositionLeft)*(e-i.stellarRatio)+"px":i.startingValueLeft,s=this.options.verticalScrolling?(u+i.verticalOffset-this.viewportOffsetTop-i.startingOffsetTop+i.parentOffsetTop-i.startingBackgroundPositionTop)*(e-i.stellarRatio)+"px":i.startingValueTop,d(i.$element,n,s)}},_handleScrollEvent:function(){var t=this,e=!1,i=function(){t._repositionElements(),e=!1},n=function(){e||(f(i),e=!0)};this.$scrollElement.bind("scroll."+this.name,n),n()},_startAnimationLoop:function(){var t=this;this._animationLoop=function(){f(t._animationLoop),t._repositionElements()},this._animationLoop()}},t.fn[r]=function(e){var i=arguments;return e===n||"object"==typeof e?this.each(function(){t.data(this,"plugin_"+r)||t.data(this,"plugin_"+r,new s(this,e))}):"string"==typeof e&&"_"!==e[0]&&"init"!==e?this.each(function(){var n=t.data(this,"plugin_"+r);n instanceof s&&"function"==typeof n[e]&&n[e].apply(n,Array.prototype.slice.call(i,1)),"destroy"===e&&t.data(this,"plugin_"+r,null)}):void 0},t[r]=function(){var i=t(e);return i.stellar.apply(i,Array.prototype.slice.call(arguments,0))},t[r].scrollProperty=o,t[r].positionProperty=l,e.Stellar=s}(jQuery,this,document);