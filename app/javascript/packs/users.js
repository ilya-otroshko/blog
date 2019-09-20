$(document).on("click", ".wall", function ( ){ 
    if  ($(".userInfo").hasClass("userInfo")){
        $(".info").removeClass("black")
        $(".userInfo").addClass("off");
    }
   
    $( ".userPosts" ).addClass("on");
    $(".wall").addClass("black");
 });
 
 $(document).on("click", ".info", function ( ){ 
    if ($(".userPosts").hasClass("on")){
        $(".userPosts").toggleClass("on");
        $(".wall").removeClass("black");
    }
    $( ".userInfo" ).removeClass("off");
    $(".info").addClass("black");

 });