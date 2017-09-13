;(function () {
	
	'use strict';

	var isMobile = {
		Android: function() {
			return navigator.userAgent.match(/Android/i);
		},
			BlackBerry: function() {
			return navigator.userAgent.match(/BlackBerry/i);
		},
			iOS: function() {
			return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		},
			Opera: function() {
			return navigator.userAgent.match(/Opera Mini/i);
		},
			Windows: function() {
			return navigator.userAgent.match(/IEMobile/i);
		},
			any: function() {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}
	};

	var mobileClickMenu = function() {

		if ( isMobile.any() ) {
			$('#fh5co-header .nav li a').click(function(){     
			if( $(this).next().is('ul') ){
			 $(this).next('ul').css('display','none');
			 if( $(this).next('ul').css('display') == 'none' ){
			  $(this).next('ul').show();
			 
			  $(this).find('span').removeClass("downward"); 
			  $(this).find('span').addClass("upward"); 
			  return false;    
			 }else{
			  $(this).next('ul').hide();
			  $(this).next('ul').find('ul').slideUp();
			  $(this).find('i').attr("class","touch-arrow-down");
			  $(this).find('span').removeClass("upward"); 
			  $(this).find('span').addClass("downward"); 
			  return false;    
			 }   
			}
			
		   });
		}

	};
	

	
	var dropdown = function() {

      if ( !(isMobile.any()) ) {
		$('#fh5co-header .nav li').mouseenter(function(){

			var $this = $(this);
			$this
				.find('.drop-menu')
				.css('display', 'block')
				.addClass('animated-fast fadeInUpMenu');

		}).mouseleave(function(){
			var $this = $(this);

			$this
				.find('.drop-menu')
				.css('display', 'none')
				.removeClass('animated-fast fadeInUpMenu');
		});
	  }

	};
	
    // Document on load.
	$(function(){
		mobileClickMenu();
		dropdown();
				
		//内容加载后的运动效果
	    dataAnimate();	
	});


}());

jQuery(document).ready(function(){

 /*置顶*/
	 var $backToTopTxt = "", $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body"))
        .text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 120);
     }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();    
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);    
        }
     };
     $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
	
	 /*置顶*/	
	 
	 /*微信图片显示*/
     $('#f-weixin-id').mouseenter(function(){
		   $(this).find('.weixint-content').removeClass("hidden").addClass('animated-fast bounceIn');

		}).mouseleave(function(){
			$(this).find('.weixint-content').addClass("hidden").removeClass('animated-fast bounceIn');
		});
})



//获取浏览量
function showNum(cid,ctype,cshow,showid){
	$.get('config/count.asp',{id:cid,stype:ctype,show:cshow},function(data){
		$(showid).html(data);
	});
}


/*百度分享*/
window._bd_share_config = {
		share : [{
			"tag" : "share_1",
			"bdSize" : 24,
	
		}]
	}
with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='../bdimg.share.baidu.com/static/api/js/share.js@cdnversion='+~(-new Date()/36e5)];


