jQuery(document).ready(function($) {

  /* Script to select menu according to open page. */
  $(document).ready(function(){
      var get = document.URL;
      if(get.match(/releases/i)){
          $('.navbar-nav li:eq(0)').addClass('is-selected');
      }
      if(get.match(/about/i)){
          $('.navbar-nav li:eq(1)').addClass('is-selected');
      }
  });

});