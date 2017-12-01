$(document).ready(function () {
  $(".js-more").on("click", function() {
    let buttonID = $(this).attr("data-id")
    $.get("/characters/" + buttonID + "/expand/", function(data) {
      $(`#${buttonID}`).html(
        `<p> Subtle: ${data["subtle"]}</p>
         <p> Powerful: ${data["powerful"]} </p>
         <p> Resistant: ${data["resistant"]}</p>
         <p> Level: ${data["level"]}</p>
         <p> XP: ${data["xp"]}</p>`
      );
    });
  });

  $(document).on('click', ".show-character", function(e) {
    e.preventDefault()
    const id = $(this).attr("data-id")
    debugger
    $('#content').html('')
    debugger
    $.get(`${window.location.pathname}/${id}.json`, function(data) {
        $("#content").html(`<p> Character Name: ${data["name"]} </p>
           <p> Subtle: ${data["subtle"]}</p>
           <p> Powerful: ${data["powerful"]} </p>
           <p> Resistant: ${data["resistant"]}</p>
           <p> Level: ${data["level"]}</p>
           <p> XP: ${data["xp"]}</p>
           <p> Created by: ${data["user"]["email"]}</p>`
        );
      });

    });

// $(".characters.show").ready(function () {
//   debugger
//   $.get(window.location.pathname + ".json", function(data) {
//     $(".js-character").html(
//       `<p> Character Name: ${data["name"]} </p>
//        <p> Subtle: ${data["subtle"]}</p>
//        <p> Powerful: ${data["powerful"]} </p>
//        <p> Resistant: ${data["resistant"]}</p>
//        <p> Level: ${data["level"]}</p>
//        <p> XP: ${data["xp"]}</p>
//        <p> Created by: ${data["user"]["email"]}</p>`
//     );
//   });
// });



// $(".characters.show").ready(function () {
//   debugger
//   $(".js-next").on("click", function() {
//     const nextID = parseInt($(".js-next").attr("data-id")) + 1;
//     $.get("/characters/" + nextID + ".json", function(data) {
//       $(".js-character").html(
//       `<p> Character Name: ${data["name"]} </p>
//        <p> Subtle: ${data["subtle"]}</p>
//        <p> Powerful: ${data["powerful"]} </p>
//        <p> Resistant: ${data["resistant"]}</p>
//        <p> Level: ${data["level"]}</p>
//        <p> XP: ${data["xp"]}</p>
//        <p> Created by: ${data["user"]["email"]}</p>`
//       );
//       $(".js-next").attr("data-id", data["id"]);
//     });
//   });
// });
//
// $(".characters.show").ready(function () {
//   debugger
//   $(".js-previous").on("click", function() {
//     const nextID = parseInt($(".js-next").attr("data-id")) - 1 ;
//     $.get("/characters/" + nextID + ".json", function(data) {
//       $(".js-character").html(
//       `<p> Character Name: ${data["name"]} </p>
//        <p> Subtle: ${data["subtle"]}</p>
//        <p> Powerful: ${data["powerful"]} </p>
//        <p> Resistant: ${data["resistant"]}</p>
//        <p> Level: ${data["level"]}</p>
//        <p> XP: ${data["xp"]}</p>
//        <p> Created by: ${data["user"]["email"]}</p>`
//       );
//       $(".js-next").attr("data-id", data["id"]);
//     });
//   });
});
