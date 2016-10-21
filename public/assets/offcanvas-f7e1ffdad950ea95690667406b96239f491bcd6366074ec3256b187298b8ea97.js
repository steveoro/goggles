+function(t){"use strict";var e=function(i,n){if(this.$element=t(i),this.options=t.extend({},e.DEFAULTS,n),this.state=null,this.placement=null,this.options.recalc&&(this.calcClone(),t(window).on("resize",t.proxy(this.recalc,this))),this.options.autohide&&!this.options.modal){null===navigator.userAgent.match(/(iPad|iPhone)/i)?"click":"touchstart";t(document).on("click touchstart",t.proxy(this.autohide,this))}this.options.toggle&&this.toggle(),this.options.disablescrolling&&(this.options.disableScrolling=this.options.disablescrolling,delete this.options.disablescrolling)};e.DEFAULTS={toggle:!0,placement:"auto",autohide:!0,recalc:!0,disableScrolling:!0,modal:!1},e.prototype.offset=function(){switch(this.placement){case"left":case"right":return this.$element.outerWidth();case"top":case"bottom":return this.$element.outerHeight()}},e.prototype.calcPlacement=function(){function e(t,e){if("auto"===s.css(e))return t;if("auto"===s.css(t))return e;var i=parseInt(s.css(t),10),n=parseInt(s.css(e),10);return i>n?e:t}if("auto"!==this.options.placement)return void(this.placement=this.options.placement);this.$element.hasClass("in")||this.$element.css("visiblity","hidden !important").addClass("in");var i=t(window).width()/this.$element.width(),n=t(window).height()/this.$element.height(),s=this.$element;this.placement=i>=n?e("left","right"):e("top","bottom"),"hidden !important"===this.$element.css("visibility")&&this.$element.removeClass("in").css("visiblity","")},e.prototype.opposite=function(t){switch(t){case"top":return"bottom";case"left":return"right";case"bottom":return"top";case"right":return"left"}},e.prototype.getCanvasElements=function(){var e=this.options.canvas?t(this.options.canvas):this.$element,i=e.find("*").filter(function(){return"fixed"===t(this).css("position")}).not(this.options.exclude);return e.add(i)},e.prototype.slide=function(e,i,n){if(!t.support.transition){var s={};return s[this.placement]="+="+i,e.animate(s,350,n)}var r=this.placement,a=this.opposite(r);e.each(function(){"auto"!==t(this).css(r)&&t(this).css(r,(parseInt(t(this).css(r),10)||0)+i),"auto"!==t(this).css(a)&&t(this).css(a,(parseInt(t(this).css(a),10)||0)-i)}),this.$element.one(t.support.transition.end,n).emulateTransitionEnd(350)},e.prototype.disableScrolling=function(){var e=t("body").width(),i="padding-right";if(void 0===t("body").data("offcanvas-style")&&t("body").data("offcanvas-style",t("body").attr("style")||""),t("body").css("overflow","hidden"),t("body").width()>e){var n=parseInt(t("body").css(i),10)+t("body").width()-e;setTimeout(function(){t("body").css(i,n)},1)}t("body").on("touchmove.bs",function(e){t(event.target).closest(".offcanvas").length||e.preventDefault()})},e.prototype.enableScrolling=function(){t("body").off("touchmove.bs")},e.prototype.show=function(){if(!this.state){var e=t.Event("show.bs.offcanvas");if(this.$element.trigger(e),!e.isDefaultPrevented()){this.state="slide-in",this.calcPlacement();var i=this.getCanvasElements(),n=this.placement,s=this.opposite(n),r=this.offset();i.index(this.$element)!==-1&&(t(this.$element).data("offcanvas-style",t(this.$element).attr("style")||""),this.$element.css(n,-1*r),this.$element.css(n)),i.addClass("canvas-sliding").each(function(){var e=t(this);void 0===e.data("offcanvas-style")&&e.data("offcanvas-style",e.attr("style")||""),"static"===e.css("position")&&e.css("position","relative"),"auto"!==e.css(n)&&"0px"!==e.css(n)||"auto"!==e.css(s)&&"0px"!==e.css(s)||e.css(n,0)}),this.options.disableScrolling&&this.disableScrolling(),this.options.modal&&this.toggleBackdrop();var a=function(){"slide-in"==this.state&&(this.state="slid",i.removeClass("canvas-sliding").addClass("canvas-slid"),this.$element.trigger("shown.bs.offcanvas"))};setTimeout(t.proxy(function(){this.$element.addClass("in"),this.slide(i,r,t.proxy(a,this))},this),1)}}},e.prototype.hide=function(){if("slid"===this.state){var e=t.Event("hide.bs.offcanvas");if(this.$element.trigger(e),!e.isDefaultPrevented()){this.state="slide-out";var i=t(".canvas-slid"),n=(this.placement,-1*this.offset()),s=function(){"slide-out"==this.state&&(this.state=null,this.placement=null,this.$element.removeClass("in"),i.removeClass("canvas-sliding"),i.add(this.$element).add("body").each(function(){t(this).attr("style",t(this).data("offcanvas-style")).removeData("offcanvas-style")}),this.$element.trigger("hidden.bs.offcanvas"))};this.options.disableScrolling&&this.enableScrolling(),this.options.modal&&this.toggleBackdrop(),i.removeClass("canvas-slid").addClass("canvas-sliding"),setTimeout(t.proxy(function(){this.slide(i,n,t.proxy(s,this))},this),1)}}},e.prototype.toggle=function(){"slide-in"!==this.state&&"slide-out"!==this.state&&this["slid"===this.state?"hide":"show"]()},e.prototype.toggleBackdrop=function(e){if(e=e||t.noop,"slide-in"==this.state){var i=t.support.transition;this.$backdrop=t('<div class="modal-backdrop fade" />').insertAfter(this.$element),i&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),this.$backdrop.on("click.bs",t.proxy(this.autohide,this)),i?this.$backdrop.one(t.support.transition.end,e).emulateTransitionEnd(150):e()}else if("slide-out"==this.state&&this.$backdrop){this.$backdrop.removeClass("in"),t("body").off("touchmove.bs");var n=this;t.support.transition?this.$backdrop.one(t.support.transition.end,function(){n.$backdrop.remove(),e(),n.$backdrop=null}).emulateTransitionEnd(150):(this.$backdrop.remove(),this.$backdrop=null,e())}else e&&e()},e.prototype.calcClone=function(){this.$calcClone=this.$element.clone().html("").addClass("offcanvas-clone").removeClass("in").appendTo(t("body"))},e.prototype.recalc=function(){if("none"!==this.$calcClone.css("display")&&("slid"===this.state||"slide-in"===this.state)){this.state=null,this.placement=null;var e=this.getCanvasElements();this.$element.removeClass("in"),e.removeClass("canvas-slid"),e.add(this.$element).add("body").each(function(){t(this).attr("style",t(this).data("offcanvas-style")).removeData("offcanvas-style")})}},e.prototype.autohide=function(e){0===t(e.target).closest(this.$element).length&&this.hide();var i=t(e.target);i.hasClass("dropdown-backdrop")||0!==t(e.target).closest(this.$element).length||this.hide()};var i=t.fn.offcanvas;t.fn.offcanvas=function(i){return this.each(function(){var n=t(this),s=n.data("bs.offcanvas"),r=t.extend({},e.DEFAULTS,n.data(),"object"==typeof i&&i);s||n.data("bs.offcanvas",s=new e(this,r)),"string"==typeof i&&s[i]()})},t.fn.offcanvas.Constructor=e,t.fn.offcanvas.noConflict=function(){return t.fn.offcanvas=i,this},t(document).on("click.bs.offcanvas.data-api","[data-toggle=offcanvas]",function(e){var i,n=t(this),s=n.attr("data-target")||(i=n.attr("href"))&&i.replace(/.*(?=#[^\s]+$)/,""),r=t(s),a=r.data("bs.offcanvas"),o=a?"toggle":n.data();e.preventDefault(),e.stopPropagation(),a?a.toggle():r.offcanvas(o)})}(window.jQuery);