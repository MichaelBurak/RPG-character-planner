$(function() {
  $(".js-more").one("click", function() {
    let charID = $(".js-expand").attr("data-id");
    $.get("/characters/" + charID + "/expand/", function(data) {
      $(".js-expand, charID").html(
        `<p> Subtle: ${data["subtle"]}</p>
         <p> Powerful: ${data["powerful"]} </p>
         <p> Resistant: ${data["resistant"]}</p>
         <p> Level: ${data["level"]}</p>`);
    });
  });
});
