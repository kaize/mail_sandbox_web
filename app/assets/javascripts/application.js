// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require chosen-jquery
//= require jquery.query-2.1.7
//= require_tree .
//= require_self

$(function(){
  $('.table tr').click(function(e) {
      var href = $(this).data('href');
      if(href && !$(e.target).data('remote')) window.location.href = href;
  });

  $("select.per_page_selector").change(function(){
    url = $.query.set("per_page", this.value).set("page", 1).toString().replace('%2B', '+');
    window.location.href = url;
  });
});

