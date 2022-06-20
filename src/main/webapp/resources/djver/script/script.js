$(function(){
	goUpToSearchResult();
	showPopup();
	toggleNavDepth();
	showSearch();
    mainSlideVisual();
    mainSlideNews();
	todayjobTab();
	clickHeart();
	openImgPopup();
	goTop();
	headerDepth2();
	popupPosition();
})

function goUpToSearchResult(){
	$('.btn_goup').click(function(){
		$('.searchList .searchResult').toggleClass('on');
	})
}

function showPopup(){
	$('.btn_menu').click(function(){
		$('.navMobile').addClass('on');
	})

	$('.btn_close').click(function(){
		$('.navMobile').removeClass('on')
	})
}

function toggleNavDepth(){
	$('.navMobile nav > ul > li.on > a').click(function(){
		if( $(this).parent().hasClass('active') ){
			$(this).parent().removeClass('active');
			$(this).next('ul').slideDown();
		}else{
			$(this).parent().addClass('active');
			$(this).next('ul').slideUp();
		}
	})
}


function showSearch(){
	$('.btn_show_search').click(function(){
		$('.popupSearch').show();
		$('html, body').css({overflow:'hidden'})
	})

	$('.close_search').click(function(){
		$('.popupSearch').hide();
		$('html, body').css({overflow:'auto'})
	})
}



function mainSlideVisual(){
    var swiper = new Swiper('.mainSlideVisual', {
		autoplay:true,
		loop:true,
		pagination: {
			el: '.mainSlideVisual .swiper-pagination',
			type: 'bullets',
		},
		spaceBetween: 80,
    });
}

function mainSlideNews(){
    var swiper = new Swiper('.mainSlideNews', {
		navigation: {
			prevEl: '.swiper-button-prev',
			nextEl: '.swiper-button-next',
		},
		loop:true,
		autoplay:false,
		slidesPerView: 4,
        spaceBetween:40,
        centeredSlides: false,

		breakpoints: {
			300: {
				slidesPerView: 2,
				spaceBetween: 10,
			  },
			640: {
			  slidesPerView: 2,
			  spaceBetween: 10,
			},
			768: {
			  slidesPerView:3,
			  spaceBetween: 10,
			},
			1024: {
			  slidesPerView: 4,
			  spaceBetween: 10,
			},
		},
    });
}


function todayjobTab(){
	$('.tabBtn a').click(function(){
		var tabName = $(this).attr('id');
		var typeAll =  $(this).is('#typeAll');

		$('.itemList .item').each(function(){
			if( !typeAll ){
				if( $(this).hasClass(tabName)){
					$(this).show();
				}else{ 
					$(this).hide();
				}
			}else{
				$(this).show();
			}
		})

		$('.tabBtn a').removeClass('on');
		$(this).addClass('on');
	})
}


function clickHeart(){
	$('.btn_heart').click(function(){
		$(this).toggleClass('on')
	})
}


function openImgPopup(){
	var box = $('.imgPopupBox').eq(0);
	$('.openImgPopup').click(function(){
		var img = $(this).find('img').attr('src');

		box.show();
		box.find('img').attr(img);
	})

	box.find('.bg').click(function(){
		box.hide();
	})
}



// 최상단 올리기
function goTop(){
	if($("#gotop").length){
		var scTop;
		$("#gotop").css({opacity:"0"});
		$(window).scroll(function(){
			scTop = $(window).scrollTop();
			if (scTop >= $("header").height()) {
				$("#gotop").css({opacity:"1"});
			} else {
				$("#gotop").css({opacity:"0"});
			}
		});
		$("#gotop").click(function(){
			$("html, body").stop().animate({scrollTop:0},500);
		});
	};
};


function headerDepth2(){
	$('.btn_depth2').on('mouseenter', function(){
		$(this).next('.pc_depth2').slideDown(200);
	})

	$('.pc_depth2, header').on('mouseleave', function(){
		$('.pc_depth2').hide();
	})
}


function popupPosition(){
	var popup = $('.popup_position').eq(0)

	$('.btn_position_close, .btn_position_back').click(function(){
		popup.removeClass('on')
	});

	$('.btnSettingPosition').click(function(){
		popup.addClass('on');
	});
}
