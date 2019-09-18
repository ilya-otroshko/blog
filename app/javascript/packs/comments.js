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

$(document).on("click", ".showCommentForm", function ( e ){ 
    e.preventDefault() 
    $( this ).parent().find( ".show_comment_form" ).toggleClass("on");

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
