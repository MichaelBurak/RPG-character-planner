$(document).on("click", ".show-planner", function (e) {
  e.preventDefault()
  const plannerID = $(this).attr("data-planner-id")
  const characterID = $(this).attr("data-character-id")
  // $.get(`${characterID}/planners/${plannerID}` + ".json", function(data) {
  //     $("#content").html(`<h1> Character planner for ${$.get(`${characterID}` + ".json", function(data){
  //       return data["name"]
  //     )})
      $.each(data.events, function(){
         $("#content").append(`<h1> ${this.name} </h1> <br> <h1> XP: ${this.xp} </h1>`)
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
