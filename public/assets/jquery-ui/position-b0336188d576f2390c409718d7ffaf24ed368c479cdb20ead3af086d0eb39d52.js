!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){return function(){function e(t,e,i){return[parseFloat(t[0])*(f.test(t[0])?e/100:1),parseFloat(t[1])*(f.test(t[1])?i/100:1)]}function i(e,i){return parseInt(t.css(e,i),10)||0}function n(e){var i=e[0];return 9===i.nodeType?{width:e.width(),height:e.height(),offset:{top:0,left:0}}:t.isWindow(i)?{width:e.width(),height:e.height(),offset:{top:e.scrollTop(),left:e.scrollLeft()}}:i.preventDefault?{width:0,height:0,offset:{top:i.pageY,left:i.pageX}}:{width:e.outerWidth(),height:e.outerHeight(),offset:e.offset()}}t.ui=t.ui||{};var r,s,o=Math.max,a=Math.abs,l=Math.round,h=/left|center|right/,c=/top|center|bottom/,u=/[\+\-]\d+(\.[\d]+)?%?/,d=/^\w+/,f=/%$/,p=t.fn.position;t.position={scrollbarWidth:function(){if(void 0!==r)return r;var e,i,n=t("<div style='display:block;position:absolute;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),s=n.children()[0];return t("body").append(n),e=s.offsetWidth,n.css("overflow","scroll"),i=s.offsetWidth,e===i&&(i=n[0].clientWidth),n.remove(),r=e-i},getScrollInfo:function(e){var i=e.isWindow||e.isDocument?"":e.element.css("overflow-x"),n=e.isWindow||e.isDocument?"":e.element.css("overflow-y"),r="scroll"===i||"auto"===i&&e.width<e.element[0].scrollWidth,s="scroll"===n||"auto"===n&&e.height<e.element[0].scrollHeight;return{width:s?t.position.scrollbarWidth():0,height:r?t.position.scrollbarWidth():0}},getWithinInfo:function(e){var i=t(e||window),n=t.isWindow(i[0]),r=!!i[0]&&9===i[0].nodeType;return{element:i,isWindow:n,isDocument:r,offset:i.offset()||{left:0,top:0},scrollLeft:i.scrollLeft(),scrollTop:i.scrollTop(),width:n||r?i.width():i.outerWidth(),height:n||r?i.height():i.outerHeight()}}},t.fn.position=function(r){if(!r||!r.of)return p.apply(this,arguments);r=t.extend({},r);var f,g,m,v,b,y,_=t(r.of),w=t.position.getWithinInfo(r.within),x=t.position.getScrollInfo(w),k=(r.collision||"flip").split(" "),C={};return y=n(_),_[0].preventDefault&&(r.at="left top"),g=y.width,m=y.height,v=y.offset,b=t.extend({},v),t.each(["my","at"],function(){var t,e,i=(r[this]||"").split(" ");1===i.length&&(i=h.test(i[0])?i.concat(["center"]):c.test(i[0])?["center"].concat(i):["center","center"]),i[0]=h.test(i[0])?i[0]:"center",i[1]=c.test(i[1])?i[1]:"center",t=u.exec(i[0]),e=u.exec(i[1]),C[this]=[t?t[0]:0,e?e[0]:0],r[this]=[d.exec(i[0])[0],d.exec(i[1])[0]]}),1===k.length&&(k[1]=k[0]),"right"===r.at[0]?b.left+=g:"center"===r.at[0]&&(b.left+=g/2),"bottom"===r.at[1]?b.top+=m:"center"===r.at[1]&&(b.top+=m/2),f=e(C.at,g,m),b.left+=f[0],b.top+=f[1],this.each(function(){var n,h,c=t(this),u=c.outerWidth(),d=c.outerHeight(),p=i(this,"marginLeft"),y=i(this,"marginTop"),S=u+p+i(this,"marginRight")+x.width,T=d+y+i(this,"marginBottom")+x.height,D=t.extend({},b),M=e(C.my,c.outerWidth(),c.outerHeight());"right"===r.my[0]?D.left-=u:"center"===r.my[0]&&(D.left-=u/2),"bottom"===r.my[1]?D.top-=d:"center"===r.my[1]&&(D.top-=d/2),D.left+=M[0],D.top+=M[1],s||(D.left=l(D.left),D.top=l(D.top)),n={marginLeft:p,marginTop:y},t.each(["left","top"],function(e,i){t.ui.position[k[e]]&&t.ui.position[k[e]][i](D,{targetWidth:g,targetHeight:m,elemWidth:u,elemHeight:d,collisionPosition:n,collisionWidth:S,collisionHeight:T,offset:[f[0]+M[0],f[1]+M[1]],my:r.my,at:r.at,within:w,elem:c})}),r.using&&(h=function(t){var e=v.left-D.left,i=e+g-u,n=v.top-D.top,s=n+m-d,l={target:{element:_,left:v.left,top:v.top,width:g,height:m},element:{element:c,left:D.left,top:D.top,width:u,height:d},horizontal:i<0?"left":e>0?"right":"center",vertical:s<0?"top":n>0?"bottom":"middle"};g<u&&a(e+i)<g&&(l.horizontal="center"),m<d&&a(n+s)<m&&(l.vertical="middle"),o(a(e),a(i))>o(a(n),a(s))?l.important="horizontal":l.important="vertical",r.using.call(this,t,l)}),c.offset(t.extend(D,{using:h}))})},t.ui.position={fit:{left:function(t,e){var i,n=e.within,r=n.isWindow?n.scrollLeft:n.offset.left,s=n.width,a=t.left-e.collisionPosition.marginLeft,l=r-a,h=a+e.collisionWidth-s-r;e.collisionWidth>s?l>0&&h<=0?(i=t.left+l+e.collisionWidth-s-r,t.left+=l-i):h>0&&l<=0?t.left=r:l>h?t.left=r+s-e.collisionWidth:t.left=r:l>0?t.left+=l:h>0?t.left-=h:t.left=o(t.left-a,t.left)},top:function(t,e){var i,n=e.within,r=n.isWindow?n.scrollTop:n.offset.top,s=e.within.height,a=t.top-e.collisionPosition.marginTop,l=r-a,h=a+e.collisionHeight-s-r;e.collisionHeight>s?l>0&&h<=0?(i=t.top+l+e.collisionHeight-s-r,t.top+=l-i):h>0&&l<=0?t.top=r:l>h?t.top=r+s-e.collisionHeight:t.top=r:l>0?t.top+=l:h>0?t.top-=h:t.top=o(t.top-a,t.top)}},flip:{left:function(t,e){var i,n,r=e.within,s=r.offset.left+r.scrollLeft,o=r.width,l=r.isWindow?r.scrollLeft:r.offset.left,h=t.left-e.collisionPosition.marginLeft,c=h-l,u=h+e.collisionWidth-o-l,d="left"===e.my[0]?-e.elemWidth:"right"===e.my[0]?e.elemWidth:0,f="left"===e.at[0]?e.targetWidth:"right"===e.at[0]?-e.targetWidth:0,p=-2*e.offset[0];c<0?(i=t.left+d+f+p+e.collisionWidth-o-s,(i<0||i<a(c))&&(t.left+=d+f+p)):u>0&&(n=t.left-e.collisionPosition.marginLeft+d+f+p-l,(n>0||a(n)<u)&&(t.left+=d+f+p))},top:function(t,e){var i,n,r=e.within,s=r.offset.top+r.scrollTop,o=r.height,l=r.isWindow?r.scrollTop:r.offset.top,h=t.top-e.collisionPosition.marginTop,c=h-l,u=h+e.collisionHeight-o-l,d="top"===e.my[1],f=d?-e.elemHeight:"bottom"===e.my[1]?e.elemHeight:0,p="top"===e.at[1]?e.targetHeight:"bottom"===e.at[1]?-e.targetHeight:0,g=-2*e.offset[1];c<0?(n=t.top+f+p+g+e.collisionHeight-o-s,(n<0||n<a(c))&&(t.top+=f+p+g)):u>0&&(i=t.top-e.collisionPosition.marginTop+f+p+g-l,(i>0||a(i)<u)&&(t.top+=f+p+g))}},flipfit:{left:function(){t.ui.position.flip.left.apply(this,arguments),t.ui.position.fit.left.apply(this,arguments)},top:function(){t.ui.position.flip.top.apply(this,arguments),t.ui.position.fit.top.apply(this,arguments)}}},function(){var e,i,n,r,o,a=document.getElementsByTagName("body")[0],l=document.createElement("div");e=document.createElement(a?"div":"body"),n={visibility:"hidden",width:0,height:0,border:0,margin:0,background:"none"},a&&t.extend(n,{position:"absolute",left:"-1000px",top:"-1000px"});for(o in n)e.style[o]=n[o];e.appendChild(l),i=a||document.documentElement,i.insertBefore(e,i.firstChild),l.style.cssText="position: absolute; left: 10.7432222px;",r=t(l).offset().left,s=r>10&&r<11,e.innerHTML="",i.removeChild(e)}()}(),t.ui.position});