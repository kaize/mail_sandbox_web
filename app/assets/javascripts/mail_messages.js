$(function(){
  $('a.del_msg').on('ajax:success', function(event, data, status, xhr){
    $(this).closest('tr').fadeOut('slow', function(){
      $(this).remove();
    });
  });

  $('a.read_msg').on('ajax:success', function(event, data, status, xhr){
    $(this).fadeOut('slow');
  });
});
