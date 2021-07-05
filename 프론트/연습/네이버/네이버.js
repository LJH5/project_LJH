var id;
$(function(){
    //타임라인의 리스트 왼쪽 롤링
    id = rollingLeft('.main4-right-box .timeline .menu','li',800,1500);
    
    $('.timeline').hover(function(){
        clearInterval(id);
    },function(){
        id = rollingLeft('.main4-right-box .timeline .menu','li',800,1500);
    })
     // 타임라인의 컨텐츠 다음 버튼
    $('.main4-right-box .timeline .next-btn').click(function(){
        if(!$('.main4-right-box .timeline li').first().is(':animated')){
            var width = $('.main4-right-box .timeline li').first().width();
            $('.main4-right-box .timeline li').first().animate({'margin-left':'-'+width},800,function(){
                $(this).detach().appendTo('.main4-right-box .timeline .menu').removeAttr('style');
            })
        }
    })
     //타임라인의 컨텐츠 이전 버튼
    $('.main4-right-box .timeline .prev-btn').click(function(){
        if(!$('.main4-right-box .timeline li').first().is(':animated')){
            var width = $('.main4-right-box .timeline li').first().width();
            $('.main4-right-box .timeline li').last().detach().prependTo('.main4-right-box .timeline .menu').css('margin-left',-width+'px').animate({'margin-left':0},800);
        }	
    })
})