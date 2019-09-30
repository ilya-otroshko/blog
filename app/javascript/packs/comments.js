window.onload = () => {
      
    $(document).on('click', ".deleteAction", function(){
    let current_comment = $(this).parents('li')[0]
    if(confirm("Really?")){
        $.ajax({
            url: '/comments/'+ $(current_comment).attr('data-comment-id'),
            type: 'POST',
            data: { _method: 'DELETE'},
            success: function(result){
            $(current_comment).fadeOut(150);
            console.log(result);
            }
        });
    };
});
$(document).on('click', ".menu__icon", function () {
    $(this).parent().toggleClass('menu_state_open');
  });


$(document).on("click", ".showCommentForm", function (  ){ 
    $( this ).parent().find( ".show_comment_form" ).toggleClass("on");
    $( ".commentForPost" ).toggleClass("off");
 });

 $(document).on("click", ".replyComment", function (  ){ 
        $( ".show_comment_form" ).removeClass("on");
        $( this ).parent().parent().parent().find( ".showReply").removeClass("off");
        $( ".commentForPost" ).toggleClass("off");
 });


 
 $(document).on("click", ".addComment", function (  ){ 
    console.log($( this ).parent().parent().find( ".showThisImage").removeClass("off"));
});
 
 $(document).on("click", ".showReply", function (  ){ 
    $( this ).parent().next().removeClass("off");
    $( this ).next().removeClass("off");
    $( this ).addClass("off");
});


$(document).on("click", ".hideReply", function (  ){ 
    $( this ).parent().next().addClass("off");
    $( this ).prev().removeClass("off");
    $( this ).addClass("off");

});

 
$(document).on("click", ".showThisImage", function (  ){ 
    $( this ).parent().find( ".thisImage" ).removeClass("off");
    $( this ).next().removeClass("off");
    $( this ).addClass("off");
});


$(document).on("click", ".hideThisImage", function (  ){ 
    $( this ).parent().find( ".thisImage" ).addClass("off");
    $( this ).prev().removeClass("off");
    $( this ).addClass("off");

});


 $(document).on("dblclick", ".textComment", function(){
$('.ajax').html($('.ajax input').val());
$('.ajax').removeClass('ajax');
$(this).addClass('ajax');
$(this).html('<input id="editbox" type="text" value="' + $(this).text() + '" />');
$('#editbox').focus();

$(document).on('blur', '#editbox', function(){
    let current_comment = $(this).parents('li')[0]
    $.ajax({
        url: '/comments/'+ $(current_comment).attr('data-comment-id'),
        type: 'PUT',
        data: {body: $('.ajax input').val()}, 
        success: function(data){
            if ($('.ajax input').val() != '')
        $('.ajax').html($('.ajax input').val());
        $('.ajax').removeClass('ajax');

        }
    });
    });
    
});

}
