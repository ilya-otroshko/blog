$(document).on('click', ".like button", function(){
    $.ajax({
        url:'/likes',
        type: 'POST',
        success: console.log("create")
    });
});
    $(document).on('click', ".like span", function(){
        $.ajax({
            url:'/likes/' + $(this).attr('data-like-id'),
            type: 'DELETE',
            data: { _method: 'DELETE'},
            success: console.log("delete")
        });
    });


    // $('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {  
    //     $('.preview').html(
    //       $.cloudinary.image(data.result.public_id, 
    //         { format: data.result.format, version: data.result.version, 
    //           crop: 'fill', width: 150, height: 100 })
    //     );    
    //     $('.image_public_id').val(data.result.public_id);    
    //     return true;
    //   });



 
