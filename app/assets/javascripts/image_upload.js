$(document).on('turbolinks:load', function(){

  // プロフィール画像
  $('#file0').on('change', $('#file0'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field0");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview user_edit_profile_image",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  
  //アイコン画像
  $('#file1').on('change', $('#file1'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field1");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview game_edit_image game_edit_image_icon",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  
  //紹介画像1
  $('#file2').on('change', $('#file2'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field2");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview game_edit_image game_edit_image_intro",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  
  //紹介画像2
  $('#file3').on('change', $('#file3'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field3");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview game_edit_image game_edit_image_intro",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  
  //紹介画像3
  $('#file4').on('change', $('#file4'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field4");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview game_edit_image game_edit_image_intro",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  
  //紹介画像4
  $('#file5').on('change', $('#file5'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $(".img_field5");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview game_edit_image game_edit_image_intro",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});