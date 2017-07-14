$('.top_js_images').vegas({
    slides: [
        { src: '/assets/images/toppage/footwear-1838767_1920.jpg' },
        { src: '/assets/images/toppage/StockSnap_HKZLXBRRFP.jpg' },
        { src: '/assets/images/toppage/leather-926660_1280.jpg' }
    ],
    animation: [ 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ]

});


$(function() {
    $('.thumb-item').slick({
          infinite: true,
          dots:true,
          slidesToShow: 6,
          slidesToScroll: 6,
          responsive: [{
               breakpoint: 768,
                    settings: {
                         slidesToShow: 3,
                         slidesToScroll: 3,
               }
          },{
               breakpoint: 480,
                    settings: {
                         slidesToShow: 2,
                         slidesToScroll: 2,
                    }
               }
          ]
     });
});

// $('.thumb-item').slick({
//   infinite: true,
//   slidesToShow: 3,
//   slidesToScroll: 3
// });

//  $('.thumb-item').slick({
//   slidesToShow: 1,
//   slidesToScroll: 1,
//   arrows: false,
//   fade: true,
//   asNavFor: '.thumb-item-nav'
// });
// $('.thumb-item-nav').slick({
//   slidesToShow: 3,
//   slidesToScroll: 1,
//   asNavFor: '.thumb-item',
//   dots: true,
//   centerMode: true,
//   focusOnSelect: true
// });


// $(function() {
//      $('.thumb-item').slick({
//           infinite: true,
//           slidesToShow: 1,
//           slidesToScroll: 1,
//           arrows: false,
//           fade: true,
//           asNavFor: '.thumb-item-nav' //サムネイルのクラス名
//      });
//      $('.thumb-item-nav').slick({
//           dots: true,
//           infinite: true,
//           autoplay: true,
//           slidesToShow: 4,
//           slidesToScroll: 1,
//           asNavFor: '.thumb-item', //スライダー本体のクラス名
//           focusOnSelect: true,
//      });
// });


