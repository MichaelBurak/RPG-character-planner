//On clicking planner show link, hijack default, set planned id and character id off introspecting
//on link data, fire get request to appropriate character and planner json pages, add and append
//appropriate descriptions of what character, event with attributes, and a form to create new event,
//call posting and response function to append js events if form submitted.

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
  $("#content").append(`<form class="new-event" id="new_event" data-planner-id="${plannerID}" data-character-id="${characterID}" action=/planners/${plannerID}/events/ accept-charset="UTF-8" method="post">
    Add Event <label for="event_name">Name</label>
    <input type="text" name="event[name]" id="event_name">
    <label for="event_xp">Xp</label>
    <input type="number" name="event[xp]" id="event_xp">
    <input type="submit" name="commit" value="Create Event">
    <input type="hidden" name="authenticity_token" value=${$("meta[name='csrf-token']").attr('content')}>
</form>
<a class="show-character" data-id="${characterID}" href=""> Back to character <a>`)
  submissionHandler()
});


//A basic handler for dynamic submission and rendering instead of the default when
//creating a new event. When the new-event form submits, prevent the default action.
//Then introspect on the form's character's id through the linked attribute, and its
//planner id. Set these to constants. Serialize the array of values of the form's
//submission data, pass these through in a post to the form's creation route.
//Finally, append a link to the appropriate event into js-events and alert the user that
//the event has been created.

  function submissionHandler(){
    $(".new-event").submit( function (e) {
    e.preventDefault();
    const characterID = $(this).attr("data-character-id")
    const plannerID = $(this).attr("data-planner-id")
    const values = $(this).serializeArray()
    const posting = $.post(`planners/${plannerID}/events`, values);
      posting.done(function (data){
        $(".js-events").append(`<h3> <a href="/planners/${plannerID}/events/${data["id"]}"> Event: ${data["name"]}, XP: ${data["xp"]} </a> </h3> <br>`)
        alert("Event successfully created!")
      })
})
}

});
