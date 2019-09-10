window.onload = () => {
$(".deleteAction").click(function(){
    var current_comment = $(this).parents('li')[0]
    if(confirm("Really?")){
        $.ajax({
            url: '/comments/'+ $(current_comment).attr('data-comment_id'),
            type: 'POST',
            data: { _method: 'DELETE'},
            success: function(result){
            $(current_comment).fadeOut(200);
            console.log(result);
            }
        });
    };
})
}