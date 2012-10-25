
$(function(){

    $(".checked_all").change(function(){
      var checked = $(this).is(':checked')
      $("." + $(this).attr('id') + "_group input").attr('checked', checked)
    })

    $(".del_selected").on("click", function(){
        $(".group_actions input:checked")
            .parents("tr").find(".del_msg").data("confirm", "").click()
    });

    $(".read_selected").on("click", function(){
        $(".group_actions input:checked")
            .parents("tr").find(".read_msg").click()
    });
});