!function(){var t,a,n,r,i,e,c,s;$(function(){return s(),$(".map path:not(.original)").on("click",function(){return t(this)}),$(".year").on("click",function(){return $(this).hasClass("active")?void 0:t(e(this))}),$(".year .close").on("click",function(){return r(),!1}),$(".year").hover(function(){return $(this).hasClass("active")?void 0:a(this)},i),$(".map path").hover(function(){return $(this).attr("active")?void 0:n(this)},i),$(".end-intro").on("click",function(){return $(".intro").addClass("inactive"),$(".map").attr("class","map active"),$(".graph").addClass("active"),!1})}),s=function(){return $(".graph .year").each(function(){var t,a,n,r,i,e,c;return t=1630,n=2e3,i=n-t,c=$(this).data("year"),a=$(this).data("duration"),r=100*((c-t)/i),e=100*(a/i),$(this).css({left:r+"%",width:e+"%"})})},t=function(t){var a;return a=c(t),r(),i(),$(".year").addClass("inactive"),$(".graph-key").addClass("inactive"),a.removeClass("inactive").addClass("active"),$(t).attr("active","active")},r=function(){return $(".year").removeClass("active"),$(".year").removeClass("inactive"),$(".graph-key").removeClass("inactive"),$(".map path").attr("active","")},a=function(t){var a;return a=e(t),$(a).attr("hint","hint")},n=function(t){var a;return a=c(t),$(a).addClass("hint")},i=function(){return $(".year").removeClass("hint"),$(".map path").attr("hint","")},e=function(t){var a;return a=$(t).data("name"),$(".map ."+a)},c=function(t){var a;return a=$(t).attr("class"),$(".year[data-name="+a+"]")}}.call(this);