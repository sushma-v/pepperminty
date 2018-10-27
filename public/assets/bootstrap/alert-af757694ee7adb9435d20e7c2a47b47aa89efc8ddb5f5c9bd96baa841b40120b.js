function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var _createClass=function(){function r(e,t){for(var n=0;n<t.length;n++){var r=t[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(e,r.key,r)}}return function(e,t,n){return t&&r(e.prototype,t),n&&r(e,n),e}}(),Alert=function(u){var e="alert",f="4.0.0-alpha.6",_="bs.alert",t="."+_,n=".data-api",r=u.fn[e],h=150,o={DISMISS:'[data-dismiss="alert"]'},m={CLOSE:"close"+t,CLOSED:"closed"+t,CLICK_DATA_API:"click"+t+n},E={ALERT:"alert",FADE:"fade",SHOW:"show"},i=function(){function r(e){_classCallCheck(this,r),this._element=e}return r.prototype.close=function n(e){e=e||this._element;var t=this._getRootElement(e);this._triggerCloseEvent(t).isDefaultPrevented()||this._removeElement(t)},r.prototype.dispose=function e(){u.removeData(this._element,_),this._element=null},r.prototype._getRootElement=function o(e){var t=Util.getSelectorFromElement(e),n=!1;return t&&(n=u(t)[0]),n||(n=u(e).closest("."+E.ALERT)[0]),n},r.prototype._triggerCloseEvent=function i(e){var t=u.Event(m.CLOSE);return u(e).trigger(t),t},r.prototype._removeElement=function s(t){var n=this;u(t).removeClass(E.SHOW),Util.supportsTransitionEnd()&&u(t).hasClass(E.FADE)?u(t).one(Util.TRANSITION_END,function(e){return n._destroyElement(t,e)}).emulateTransitionEnd(h):this._destroyElement(t)},r.prototype._destroyElement=function t(e){u(e).detach().trigger(m.CLOSED).remove()},r._jQueryInterface=function a(n){return this.each(function(){var e=u(this),t=e.data(_);t||(t=new r(this),e.data(_,t)),"close"===n&&t[n](this)})},r._handleDismiss=function l(t){return function(e){e&&e.preventDefault(),t.close(this)}},_createClass(r,null,[{key:"VERSION",get:function c(){return f}}]),r}();return u(document).on(m.CLICK_DATA_API,o.DISMISS,i._handleDismiss(new i)),u.fn[e]=i._jQueryInterface,u.fn[e].Constructor=i,u.fn[e].noConflict=function(){return u.fn[e]=r,i._jQueryInterface},i}(jQuery);