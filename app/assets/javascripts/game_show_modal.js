$(document).on('turbolinks:load', function () {
  $('.game_show_content_modal_trigger .game_show_content_modal_btn').on('click', function() {
    var btnIndex = $(this).index();
    $('.game_show_content_modal_area .game_show_content_modal_box').eq(btnIndex).fadeIn(0);
  });

  $('.game_show_content_modal_close , .game_show_content_modal_bg , .sender_element').click(function(){
    $('.game_show_content_modal_box').hide();
  });
});