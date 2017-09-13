$(function(){

		$('#fh5co-hero .flexslider').flexslider({
			animation: "fade",
			slideshowSpeed: 5000,
			directionNav: true,
			start: function(){
				setTimeout(function(){
					$('.slider-text').removeClass('animated fadeInDown');
					$('.flex-active-slide').find('.slider-text').addClass('animated fadeInDown');
					$('.flex-direction-nav').find('a').html('');
				}, 500);
			},
			before: function(){
				setTimeout(function(){
					$('.slider-text').removeClass('animated fadeInDown');
					$('.flex-active-slide').find('.slider-text').addClass('animated fadeInDown');
					$('.flex-direction-nav').find('a').html('');
				}, 500);
			}

	  	});

        /*明星产品*/
		$(".owl-carousel-carousel").owlCarousel({
			autoPlay: 3000,
			items : 3,
			navigation:true,
			pagination:false,
			itemsDesktop : [1199,3],
			itemsDesktopSmall : [979,2],
			itemsTablet : [768,2],
			itemsMobile: [479,1],
		});

});