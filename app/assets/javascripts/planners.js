//$(document).ready(function () {


//On clicking planner show link, hijack default, set planned id and character id off introspecting
//on link data, fire get request to appropriate character and planner json pages, add and append
//appropriate descriptions of what character, event with attributes, and a form to create new event.

$(document).on("click", ".show-planner", function (e) {
  e.preventDefault()
  const plannerID = $(this).attr("data-planner-id")
  const characterID = $(this).attr("data-character-id")
  $.get(`/characters/${characterID}` + ".json", function(data){
    $("#content").html(`<h1> Character planner for ${data["name"]} </h1> <br> <h1> Events: </h1> <div class="js-events"</div>`)
    })
  $.get(`/characters/${characterID}/planners/${plannerID}` + ".json", function(data) {
      $.each(data.events, function(){
         $(".js-events").append(`<h3> <a href="/planners/${plannerID}/events/${this.id}"> Event: ${this.name}, XP: ${this.xp} </a> </h3> <br>`)
     })
  $("#content").append(`<form class="new-event" id="new_event" data-planner-id="${plannerID}" action=/planners/${plannerID}/events/ accept-charset="UTF-8" method="post">
    Add Event <label for="event_name">Name</label>
    <input type="text" name="event[name]" id="event_name">
    <label for="event_xp">Xp</label>
    <input type="number" name="event[xp]" id="event_xp">
    <input type="submit" name="commit" value="Create Event">
    <input type="hidden" name="authenticity_token" value=${$("meta[name='csrf-token']").attr('content')}>
</form>
<a class="show-character" data-id="${characterID}" href=""> Back to character <a>`)
  submissionHandler()
  //   debugger
});


  function submissionHandler(){
    $(".new-event").submit( function (e) {
    e.preventDefault();
    var plannerID = $(this).attr("data-planner-id")
    var values = $(this).serializeArray()
    var posting = $.post(`planners/${plannerID}/events`, values);
      posting.done(function (){
      $.get(`/characters/${characterID}/planners/${plannerID}` + ".json", function(data) {
        var lastEvent = Object.values(data.events)[data.events.length -1]
        $(".js-events").append(`<h3> <a href="/planners/${plannerID}/events/${lastEvent.id}"> Event: ${lastEvent.name}, XP: ${lastEvent.xp} </a> </h3> <br>`)
        alert("Event successfully created!")
      })
})
});
}

});
