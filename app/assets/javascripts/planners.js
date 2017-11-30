$(".planners.show").ready(function () {
  $.get(window.location.pathname + ".json", function(data) {
      $.each(data.events, function(){
        debugger
        $(".js-events").append(`<h1> ${this.name} </h1> <br> <h1> XP: ${this.xp} </h1>`)
    })
  });
});
