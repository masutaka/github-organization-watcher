// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function(){
  $('.repo .conditions input:radio').on('change', function(e){
    var owner = location.pathname.match(/orgs\/(.*?)\//)[1];
    var repo = $(this).parent().parent().parent().attr('id');
    var next_condition = $(this).attr('class');
    var path = '/repos/' + owner + '/' + repo + '/subscription';
    var method = null, data = {};

    switch(next_condition) {
    case 'unwatching':
      method = 'DELETE';
      break;
    case 'watching':
      method = 'PUT';
      data = { "condition": "watch" };
      break;
    case 'ignoring':
      method = 'PUT';
      data = { "condition": "ignore" };
      break;
    default:
      break;
    }

    if(method) {
      $.ajax({
        method: method, url: path, data: data
      }).done(function(publishers, textStatus, jqXHR) {
        return true;
      }).fail(function(jqXHR, textStatus, errorThrown) {
        return false;
      });
    }
  });
});
