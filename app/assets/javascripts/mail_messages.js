$(function(){
  $('a.del_msg').on('ajax:success', function(event, data, status, xhr){
    $(this).closest('tr').fadeOut('slow');
  });

  $('a.read_msg').on('ajax:success', function(event, data, status, xhr){
    $(this).fadeOut('slow');
  });
});
