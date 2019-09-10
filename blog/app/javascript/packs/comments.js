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
 
}
