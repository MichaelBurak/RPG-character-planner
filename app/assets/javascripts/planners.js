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
  $("#content").append(`<a href="/planners/${plannerID}/events/new">Add event<a>`)
   });
});

//<h1>Character planner for: <%= @character.name %></h1>

// <h2>Events:
// <div class ="js-events">
// </div>
//
// <%= link_to "Add event", new_planner_event_path(@planner) %>
//planners/:planner_id/events/new(.:format)                          events#new
// <%= link_to "Back", character_path(@character) %>
//
//
//
//planner_event GET      /planners/:planner_id/events/:id(.:format)                          events#show
