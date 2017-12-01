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
  $("#content").append(`<form class="new-event" id="new_event" action=/planners/${plannerID}/events/ accept-charset="UTF-8" method="post">
    <input name="utf8" type="hidden" value="✓">
    Add Event <label for="event_name">Name</label>
    <input type="text" name="event[name]" id="event_name">
    <label for="event_xp">Xp</label>
    <input type="number" name="event[xp]" id="event_xp">
    <input type="submit" name="commit" value="Create Event" data-disable-with="Create Event">
    <input type="hidden" name="authenticity_token" value=${$("meta[name='csrf-token']").attr('content')}>
</form>
<a class="show-character" data-id="${characterID}" href=""> Back to character <a>`)
   });
  //   debugger

  $(document).on('submit', ".new-event", function(e) {
    debugger
    e.preventDefault();
    var values = $(this).serialize;
    var posting = $.post(`planners/${plannerID}/events`, values);
    debugger
    posting.done(function (data){
    debugger
    console.log(data)
    debugger
  })
  });
});
