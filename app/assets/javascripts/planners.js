$(".planners.show").ready(function () {
  debugger
  $.get(window.location.pathname + ".json", function(data) {
      $.each(data.events, function(){
        $(".js-events").append(`<h1> ${this.name} </h1> <br> <h1> XP: ${this.xp} </h1>`)
    })
  });
});
