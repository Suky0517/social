// When the mouse hover over the education text it shows the following message
$(document).ready(function(){
    $("#p1").mouseenter(function(){
      alert('Mcmaster University - Halmiton');
      alert('Bachelor of Applied science, Honors Computer scientist');
    });
  });
  
// When the user clikcs on the button, it hides or shows
$(document).ready(function(){
    $(".sum").click(function(){
      $("sum").toggle();
    });
  });

  // show more for the high school backgroud
  $(document).ready(function(){
    $(".high").click(function(){
      $("#div1").fadeIn("fast");
      $("#div2").fadeIn("slow");
      $("#div3").fadeIn(4000);
    });
  });
 // show something interesting -- block
  $(document).ready(function(){
    $(".web").click(function(){
      var divv=$("divv");
      divv.animate({height:'100px',opacity:'0.4'},"slow");
      divv.animate({width:'300px',opacity:'0.8'},"slow");
      divv.animate({height:'20px',opacity:'0.4'},"slow");
      divv.animate({width:'300px',opacity:'0.8'},"slow");
    });
  });
