$(document).on("click", ".show-planner", function (e) {
  e.preventDefault()
  const plannerID = $(this).attr("data-planner-id")
  const characterID = $(this).attr("data-character-id")
  // $.get(window.location.pathname + ".json", function(data) {
  //     $.each(data.events, function(){
  //       $(".js-events").append(`<h1> ${this.name} </h1> <br> <h1> XP: ${this.xp} </h1>`)
  //   })
  // });
});
