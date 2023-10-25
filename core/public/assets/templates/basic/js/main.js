(function ($) {
  "user strict";
  $(window).on('load', function () {
    $('.preloader').fadeOut(1000);
    sectionBgImg();
    headerFixed();
    sectionHeaderSpacing();
  });
  function headerFixed() {
    var headerTopHeight = $('.header-top').height();
    $('.header-bottom').css(`top`, function () {
      return headerTopHeight;
    })
  }

  // ========================= Header Sticky Js Start =====================
  $(window).scroll(function () {
    headerSticky()
  });

  function headerSticky() {
    if ($(window).scrollTop() >= 100) {
      $('.header-section').addClass('fixed-header');
    }
    else {
      $('.header-section').removeClass('fixed-header');
    }
  }
  headerSticky()
  // ========================= Header Sticky Js End=====================

  function sectionBgImg() {
    var img = $('.bg_img');
    img.css('background-image', function () {
      var bg = ('url(' + $(this).data('background') + ')');
      return bg;
    });
  }
  function sectionHeaderSpacing() {
    var sectionHeader = $('.move--top').prev();
    sectionHeader.addClass('contact-hero')
  }
  $(document).ready(function () {
    //Menu Dropdown Icon Adding
    $("ul>li>.submenu").parent("li").addClass("menu-item-has-children");
    // drop down menu width overflow problem fix
    $('ul').parent('li').hover(function () {
      var menu = $(this).find("ul");
      var menupos = $(menu).offset();
      if (menupos.left + menu.width() > $(window).width()) {
        var newpos = -$(menu).width();
        menu.css({
          left: newpos
        });
      }
    });
    $('.menu li a').on('click', function (e) {
      var element = $(this).parent('li');
      if (element.hasClass('open')) {
        element.removeClass('open');
        element.find('li').removeClass('open');
        element.find('ul').slideUp(300, "swing");
      } else {
        element.addClass('open');
        element.children('ul').slideDown(300, "swing");
        element.siblings('li').children('ul').slideUp(300, "swing");
        element.siblings('li').removeClass('open');
        element.siblings('li').find('li').removeClass('open');
        element.siblings('li').find('ul').slideUp(300, "swing");
      }
    })
    // Scroll To Top 
    var scrollTop = $(".scrollToTop");
    $(window).on('scroll', function () {
      if ($(this).scrollTop() < 500) {
        scrollTop.removeClass("active");
      } else {
        scrollTop.addClass("active");
      }
    });
    //header
    var header = $("header");
    $(window).on('scroll', function () {
      if ($(this).scrollTop() < 1) {
        header.removeClass("active");
      } else {
        header.addClass("active");
      }
    });
    //Click event to scroll to top
    $('.scrollToTop').on('click', function () {
      $('html, body').animate({
        scrollTop: 0
      }, 500);
      return false;
    });
    //Header Bar
    $('.header-bar').on('click', function () {
      $(this).toggleClass('active');
      $('.overlay').toggleClass('active');
      $('.menu').toggleClass('active');
      if ($('.header-bar').hasClass('active')) {
        $('.header-section').addClass('active');
      }
    })
    $('.overlay').on('click', function () {
      $('.menu, .overlay, .header-bar').removeClass('active');
    });
    $('.faq__wrapper .faq__title').on('click', function (e) {
      var element = $(this).parent('.faq__item');
      if (element.hasClass('open')) {
        element.removeClass('open');
        element.find('.faq__content').removeClass('open');
        element.find('.faq__content').slideUp(200, "swing");
      } else {
        element.addClass('open');
        element.children('.faq__content').slideDown(200, "swing");
        element.siblings('.faq__item').children('.faq__content').slideUp(200, "swing");
        element.siblings('.faq__item').removeClass('open');
        element.siblings('.faq__item').find('.faq__title').removeClass('open');
        element.siblings('.faq__item').find('.faq__content').slideUp(200, "swing");
      }
    });
  });
  $('.only-number').on('input', function (e) {
    this.value = this.value.replace(/^\.|[^\d\.]/g, '');
  });
})(jQuery);

Array.from(document.querySelectorAll('table')).forEach(table => {
  let heading = table.querySelectorAll('thead tr th');
  Array.from(table.querySelectorAll('tbody tr')).forEach((row) => {
    Array.from(row.querySelectorAll('td')).forEach((colum, i) => {
      if (colum.hasAttribute('colspan')) {
        return false;
      }
      colum.setAttribute('data-label', heading[i].innerText)
    });
  });
});
