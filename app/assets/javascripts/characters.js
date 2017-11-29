$(function() {
  $(".js-more").on("click", function() {
    const charID = $(".js-expand").attr("data-id");
    $.get("/characters/" + charID + "/expand/", function(data) {
      $(".js-expand").html(
        `<p> Subtle: ${data["subtle"]}</p>
         <p> Powerful: ${data["powerful"]} </p>
         <p> Resistant: ${data["resistant"]}</p>
         <p> Level: ${data["level"]}</p>`);
    });
  });
});
