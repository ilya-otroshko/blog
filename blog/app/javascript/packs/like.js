$(document).on('click', ".like button", function(){
    $.ajax({
        url:'/likes',
        type: 'POST',
        success: console.log("create")

    });
});
    $(document).on('click', ".like span", function(){
        $.ajax({
            url:'/likes/' + $(".like span").attr('data-like-id'),
            type: 'DELETE',
            data: { _method: 'DELETE'},
            success: console.log("delete")
        
        });
    });