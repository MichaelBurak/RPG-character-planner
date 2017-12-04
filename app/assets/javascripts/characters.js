//When button with js-more class is clicked, introspect on button's data-id corresponding to character's id
//and display more info from API route of expand.
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

//grab data from character, then turn into object, then call prototypal method instead of 
//.html

//When character show page link is clicked, clear html, then get request from json version
//of character page and populate with JSON versions of ActiveRecord model, with buttons.

$(document).on('click', ".show-character", function(e) {
  e.preventDefault()
  const id = $(this).attr("data-id")
  $('#content').html('')
  $.get(`/characters/${id}.json`, function(data) {
      $("#content").html(`<p> Character Name: ${data["name"]} </p>
         <p> Subtle: ${data["subtle"]}</p>
         <p> Powerful: ${data["powerful"]} </p>
         <p> Resistant: ${data["resistant"]}</p>
         <p> Level: ${data["level"]}</p>
         <p> XP: ${data["xp"]}</p>
         <p> Created by: ${data["user"]["email"]}</p>
         <p> <button class= "js-next" data-button-id = "${id}"> Next Character </button>
         <p> <button class= "js-previous" data-button-id = "${id}"> Previous Character </button>`
      );
    });


  //When js-next class button is clicked, set const to button-id + 1, grab and replace content with
  //next character. Reset button-ids on previous and next buttons.
      $(document).on("click", ".js-next", function() {
        const nextID = parseInt($(".js-next").attr("data-button-id")) + 1;
        $.get("/characters/" + nextID + ".json", function(data) {
          $("#content").html(
          `<p> Character Name: ${data["name"]} </p>
           <p> Subtle: ${data["subtle"]}</p>
           <p> Powerful: ${data["powerful"]} </p>
           <p> Resistant: ${data["resistant"]}</p>
           <p> Level: ${data["level"]}</p>
           <p> XP: ${data["xp"]}</p>
           <p> Created by: ${data["user"]["email"]}</p>
           <p> <button class= "js-next" data-button-id = "${id}"> Next Character </button>
           <p> <button class= "js-previous" data-button-id = "${id}"> Previous Character </button>`
          );
          $(".js-next").attr("data-button-id", data["id"])
          $(".js-previous").attr("data-button-id", data["id"]);
        });
      });
      $(document).on("click", ".js-previous", function() {
        const previousID = parseInt($(".js-previous").attr("data-button-id")) - 1;
        $.get("/characters/" + previousID + ".json", function(data) {
          $("#content").html(
          `<p> Character Name: ${data["name"]} </p>
           <p> Subtle: ${data["subtle"]}</p>
           <p> Powerful: ${data["powerful"]} </p>
           <p> Resistant: ${data["resistant"]}</p>
           <p> Level: ${data["level"]}</p>
           <p> XP: ${data["xp"]}</p>
           <p> Created by: ${data["user"]["email"]}</p>
           <p> <button class= "js-next" data-button-id = "${id}"> Next Character </button>
           <p> <button class= "js-previous" data-button-id = "${id}"> Previous Character </button>`
          );
          $(".js-next").attr("data-button-id", data["id"])
          $(".js-previous").attr("data-button-id", data["id"]);
        });
      })
    });

});
