// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery.min
//= require popper.min
//= require bootstrap.min
//= require grasp_mobile_progress_circle-1.0.0.min
//= require jquery.cookie
//= require Chart.min
//= require jquery.validate.min
//= require jquery.mCustomScrollbar.concat.min
//= require charts-home
//= require front
//= require_tree .

$(function() {
    $('.orders_and_order_form').css({'height': ($( window ).height() - 110)})
    $(window).resize(function(){
        var screenHeight = $( window ).height() - 110;
        $('.orders_and_order_form').height(screenHeight)
    })

});