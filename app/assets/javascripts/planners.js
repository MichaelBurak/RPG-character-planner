$(document).on("click", ".show-planner", function (e) {
  e.preventDefault()
  const plannerID = $(this).attr("data-planner-id")
  const characterID = $(this).attr("data-character-id")
  debugger
  $.get(`/characters/${characterID}` + ".json", function(data){
    $("#content").html(`<h1> Character planner for ${data["name"]} </h1> <br> <h1> Events: </h1>`)
    })
  $.get(`/characters/${characterID}/planners/${plannerID}` + ".json", function(data) {
    debugger

      $.each(data.events, function(){
         $("#content").append(`<h3> Event: ${this.name}, XP: ${this.xp} </h3> <br>`)
     })
   });
});

//<h1>Character planner for: <%= @character.name %></h1>

// <h2>Events:
// <div class ="js-events">
// </div>
//
// <%= link_to "Add event", new_planner_event_path(@planner) %>
// <%= link_to "Back", character_path(@character) %>
//
//
// <%# @events.each do |event| %>
//       <%#= link_to "#{event.name}", planner_event_path(@planner, event) %></p>
//       <%# end %> </h2>
//
