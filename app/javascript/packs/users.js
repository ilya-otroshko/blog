$(document).on("click", ".wall", function ( ){ 
    if ($(".userInfo").hasClass("userInfo")){
        $(".info").removeClass("black")
        $(".userInfo").addClass("off");
    }
    if ($( ".userEditForm" ).hasClass("on")){

        $( ".userEditForm" ).removeClass("on")
    }
        $( ".userPosts" ).addClass("on");
        $(".wall").addClass("black");
 });
 
 $(document).on("click", ".info", function ( ){ 
    if ($(".userPosts").hasClass("on")){
        $(".userPosts").toggleClass("on");
        $(".wall").removeClass("black");
    }

    if ($( ".userEditForm" ).hasClass("on")){

        $( ".userEditForm" ).removeClass("on")
    }

        $( ".userInfo" ).removeClass("off");
        $(".info").addClass("black");

 });


 $(document).on("click", ".userEdit", function( ){

    if ($(".userPosts").hasClass("on") || $(".userInfo").hasClass("userInfo") || $(".userNav").hasClass("userNav")){
        $(".info").removeClass("black")
        $(".userPosts").removeClass("on");
        $(".wall").removeClass("black");
        $(".userInfo").addClass("off");
        $(".userNav").toggleClass("off")

    }
    $( ".userEditForm" ).addClass("on");

 });