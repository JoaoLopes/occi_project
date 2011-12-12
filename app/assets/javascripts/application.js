// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function remove_fields(link, action) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
  if (action == true)
    $(link).parent(".fields").next().hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).next().children().children("#fields").before(content.replace(regexp, new_id));
  //$(link).next().children().children(".action_items").children().children("#add_field_link_action_item").click();
  
}

  $(function(){

    // Accordion
    $("#accordion").accordion({ header: "h3" });

    // Tabs
    $('#tabs').tabs();

    // Dialog			
    $('#dialog').dialog({
      autoOpen: false,
      width: 600,
      buttons: {
        "Ok": function() { 
          $(this).dialog("close"); 
        }, 
        "Cancel": function() { 
          $(this).dialog("close"); 
        } 
      }
    });

    // Dialog Link
    $('#dialog_link').click(function(){
      $('#dialog').dialog('open');
      return false;
    });

    // Datepicker
    $( ".datepicker" ).datepicker({ showAnim: 'fold', speed: 'slow', dateFormat: 'dd/mm/yy'});


    // Slider
    $('#slider').slider({
      range: true,
      values: [17, 67]
    });

    // Progressbar
    $("#progressbar").progressbar({
      value: 20 
    });

    //hover states on the static widgets
    $('#dialog_link, ul#icons li').hover(
      function() { $(this).addClass('ui-state-hover'); }, 
      function() { $(this).removeClass('ui-state-hover'); }
    );

    $('#timepicker').timepicker({ showAnim: 'fold' });

  });