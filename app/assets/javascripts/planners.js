$(document).on("click", ".show-planner", function (e) {
  e.preventDefault()
  const plannerID = $(this).attr("data-planner-id")
  const characterID = $(this).attr("data-character-id")
  $.get(`/characters/${characterID}` + ".json", function(data){
    $("#content").html(`<h1> Character planner for ${data["name"]} </h1> <br> <h1> Events: </h1>`)
    })
  $.get(`/characters/${characterID}/planners/${plannerID}` + ".json", function(data) {
      $.each(data.events, function(){
         $("#content").append(`<h3> <a href="/planners/${plannerID}/events/${this.id}"> Event: ${this.name}, XP: ${this.xp} </a> </h3> <br>`)
     })
  $("#content").append(`<a class="show-character" data-id="${characterID}" href=""> Back to character <a>`)
   });
});
