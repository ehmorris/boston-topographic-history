!function(){var a,t,n,r,e,i,s,c,o,u;$(function(){return o(),$(".map .land path:not(.original)").on("click",function(){return a(this)}),$(".year").on("click",function(){return $(this).hasClass("active")?void 0:a(s(this))}),$(".year .close").on("click",function(){return e(),!1}),$(".year .overlay-map").on("click",function(){return u($(this).siblings("img")),!1}),$(".year").hover(function(){return $(this).hasClass("active")?void 0:t(this)},i),$(".map .land path").hover(function(){return $(this).attr("active")?void 0:n(this)},i),$(".end-intro").on("click",function(){return $(".intro").addClass("inactive"),$(".map").attr("class","map active"),$(".graph").addClass("active"),r($(".current-year span:first")),$(".time-marker").addClass("active"),!1})}),o=function(){return $(".graph .year").each(function(){var a,t,n,r,e,i,s;return a=1630,n=2e3,e=n-a,s=$(this).data("year"),t=$(this).data("duration"),r=100*((s-a)/e),i=100*(t/e),$(this).css({left:r+"%",width:i+"%"})})},r=function(a){return $(a).parent(".current-year").addClass("active"),$(a).prev("span").length&&$(a).prev("span").css("display","none"),$(a).css("opacity",1),$(a).next("span").length?setTimeout(function(){return r($(a).next("span"))},14e3/$(".current-year span").length):$(a).css("display","none")},a=function(a){var t;return t=c(a),e(),i(),$(".year").addClass("inactive"),$(".graph-key").addClass("inactive"),t.removeClass("inactive").addClass("active"),$(a).attr("active","active")},e=function(){return $(".year").removeClass("active"),$(".year").removeClass("inactive"),$(".graph-key").removeClass("inactive"),$(".map .land path").attr("active","")},u=function(a){return $(a).toggleClass("active")},t=function(a){var t;return t=s(a),$(t).attr("hint","hint")},n=function(a){var t;return t=c(a),$(t).addClass("hint")},i=function(){return $(".year").removeClass("hint"),$(".map .land path").attr("hint","")},s=function(a){var t;return t=$(a).data("name"),$(".map ."+t)},c=function(a){var t;return t=$(a).attr("class"),$(".year[data-name="+t+"]")}}.call(this);