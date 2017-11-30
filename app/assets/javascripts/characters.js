$(".characters.index").ready(function () {
  $(".js-more").one("click", function() {
    let populationID = $(".js-expand").attr("data-id");
    debugger
    let buttonID = $(".js-more").attr("data-id")
    debugger
    $.get("/characters/" + buttonID + "/expand/", function(data) {
      $(".js-expand, populationID").html(
        `<p> Subtle: ${data["subtle"]}</p>
         <p> Powerful: ${data["powerful"]} </p>
         <p> Resistant: ${data["resistant"]}</p>
         <p> Level: ${data["level"]}</p>
         <p> XP: ${data["xp"]}</p>`
      );
    });
  });
});

$(".characters.show").ready(function () {
  $.get(window.location.pathname + ".json", function(data) {
    $(".js-character").html(
      `<p> Character Name: ${data["name"]} </p>
       <p> Subtle: ${data["subtle"]}</p>
       <p> Powerful: ${data["powerful"]} </p>
       <p> Resistant: ${data["resistant"]}</p>
       <p> Level: ${data["level"]}</p>
       <p> XP: ${data["xp"]}</p>
       <p> Created by: ${data["user"]["email"]}</p>`
    );
  });
});

$(".characters.show").ready(function () {
  $(".js-next").on("click", function() {
    const nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/characters/" + nextID + ".json", function(data) {
      $(".js-character").html(
        `<p> Character Name: ${data["name"]} </p>
       <p> Subtle: ${data["subtle"]}</p>
       <p> Powerful: ${data["powerful"]} </p>
       <p> Resistant: ${data["resistant"]}</p>
       <p> Level: ${data["level"]}</p>
       <p> XP: ${data["xp"]}</p>
       <p> Created by: ${data["user"]["email"]}</p>`
      );
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});

$(".characters.index").ready(function () {
  $(".js-previous").on("click", function() {
    const nextID = parseInt($(".js-next").attr("data-id")) - 1 ;
    $.get("/characters/" + nextID + ".json", function(data) {
      $(".js-character").html(
        `<p> Character Name: ${data["name"]} </p>
       <p> Subtle: ${data["subtle"]}</p>
       <p> Powerful: ${data["powerful"]} </p>
       <p> Resistant: ${data["resistant"]}</p>
       <p> Level: ${data["level"]}</p>
       <p> XP: ${data["xp"]}</p>
       <p> Created by: ${data["user"]["email"]}</p>`
      );
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});

//<p> Character Name: <%= character.name %> </p>
//<p> Subtle: <%= character.subtle %> </p>
//<p> Powerful: <%= character.powerful %> </p>
//<p> Resistant: <%= character.resistant %> </p>
//<p> Level: <%= character.level %> </p>
//<p> XP: <%= character.xp %> </p>
//<p> Created by: <%= character.user.email %></p>
