function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var _createClass=function(){function a(e,t){for(var n=0;n<t.length;n++){var a=t[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(e,a.key,a)}}return function(e,t,n){return t&&a(e.prototype,t),n&&a(e,n),e}}(),Tab=function(d){var e="tab",r="4.0.0-alpha.6",i="bs.tab",t="."+i,n=".data-api",a=d.fn[e],u=150,f={HIDE:"hide"+t,HIDDEN:"hidden"+t,SHOW:"show"+t,SHOWN:"shown"+t,CLICK_DATA_API:"click"+t+n},c={DROPDOWN_MENU:"dropdown-menu",ACTIVE:"active",DISABLED:"disabled",FADE:"fade",SHOW:"show"},_={A:"a",LI:"li",DROPDOWN:".dropdown",LIST:"ul:not(.dropdown-menu), ol:not(.dropdown-menu), nav:not(.dropdown-menu)",FADE_CHILD:"> .nav-item .fade, > .fade",ACTIVE:".active",ACTIVE_CHILD:"> .nav-item > .active, > .active",DATA_TOGGLE:'[data-toggle="tab"], [data-toggle="pill"]',DROPDOWN_TOGGLE:".dropdown-toggle",DROPDOWN_ACTIVE_CHILD:"> .dropdown-menu .active"},o=function(){function a(e){_classCallCheck(this,a),this._element=e}return a.prototype.show=function l(){var n=this;if(!(this._element.parentNode&&this._element.parentNode.nodeType===Node.ELEMENT_NODE&&d(this._element).hasClass(c.ACTIVE)||d(this._element).hasClass(c.DISABLED))){var e=void 0,a=void 0,t=d(this._element).closest(_.LIST)[0],r=Util.getSelectorFromElement(this._element);t&&(a=(a=d.makeArray(d(t).find(_.ACTIVE)))[a.length-1]);var i=d.Event(f.HIDE,{relatedTarget:this._element}),o=d.Event(f.SHOW,{relatedTarget:a});if(a&&d(a).trigger(i),d(this._element).trigger(o),!o.isDefaultPrevented()&&!i.isDefaultPrevented()){r&&(e=d(r)[0]),this._activate(this._element,t);var s=function s(){var e=d.Event(f.HIDDEN,{relatedTarget:n._element}),t=d.Event(f.SHOWN,{relatedTarget:a});d(a).trigger(e),d(n._element).trigger(t)};e?this._activate(e,e.parentNode,s):s()}}},a.prototype.dispose=function e(){d.removeClass(this._element,i),this._element=null},a.prototype._activate=function s(e,t,n){var a=this,r=d(t).find(_.ACTIVE_CHILD)[0],i=n&&Util.supportsTransitionEnd()&&(r&&d(r).hasClass(c.FADE)||Boolean(d(t).find(_.FADE_CHILD)[0])),o=function o(){return a._transitionComplete(e,r,i,n)};r&&i?d(r).one(Util.TRANSITION_END,o).emulateTransitionEnd(u):o(),r&&d(r).removeClass(c.SHOW)},a.prototype._transitionComplete=function o(e,t,n,a){if(t){d(t).removeClass(c.ACTIVE);var r=d(t.parentNode).find(_.DROPDOWN_ACTIVE_CHILD)[0];r&&d(r).removeClass(c.ACTIVE),t.setAttribute("aria-expanded",!1)}if(d(e).addClass(c.ACTIVE),e.setAttribute("aria-expanded",!0),n?(Util.reflow(e),d(e).addClass(c.SHOW)):d(e).removeClass(c.FADE),e.parentNode&&d(e.parentNode).hasClass(c.DROPDOWN_MENU)){var i=d(e).closest(_.DROPDOWN)[0];i&&d(i).find(_.DROPDOWN_TOGGLE).addClass(c.ACTIVE),e.setAttribute("aria-expanded",!0)}a&&a()},a._jQueryInterface=function t(n){return this.each(function(){var e=d(this),t=e.data(i);if(t||(t=new a(this),e.data(i,t)),"string"==typeof n){if(t[n]===undefined)throw new Error('No method named "'+n+'"');t[n]()}})},_createClass(a,null,[{key:"VERSION",get:function n(){return r}}]),a}();return d(document).on(f.CLICK_DATA_API,_.DATA_TOGGLE,function(e){e.preventDefault(),o._jQueryInterface.call(d(this),"show")}),d.fn[e]=o._jQueryInterface,d.fn[e].Constructor=o,d.fn[e].noConflict=function(){return d.fn[e]=a,o._jQueryInterface},o}(jQuery);