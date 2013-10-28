
$(function(){

    $(".checked_all").change(function(){
      var checked = $(this).is(':checked')
      $("." + $(this).attr('id') + "_group input").attr('checked', checked)
    })

    $(".del_selected").on("click", function(){
        if (confirm(I18n.t('js.are_you_sure'))) {
            $(".group_actions input:checked")
                .parents("tr").find(".del_msg").data("confirm", "").click()
        }
    });

    $(".read_selected").on("click", function(){
        $(".group_actions input:checked")
            .parents("tr").find(".read_msg").click()
    });

    $(".mark_all_as_read").on('ajax:success', function(event, data, status, xhr){
      $('a.read_msg').fadeOut('slow');
    });

});
