//When button with js-more class is clicked, introspect on button's data-id corresponding to character's id
//and display more info from API route of expand using newly created ECharacter object and prototypal method.
  $(function () {
    function ECharacter(subtle, powerful, resistant, level, xp){
      this.subtle = subtle
      this.powerful = powerful
      this.resistant = resistant
      this.level = level
      this.xp = xp
    }
  $(".js-more").on("click", function() {
    let buttonID = $(this).attr("data-id")
    ECharacter.prototype.expand = function(){
      $(`#${buttonID}`).html(
        `<p> Subtle: ${this.subtle}</p>
         <p> Powerful: ${this.powerful} </p>
         <p> Resistant: ${this.resistant}</p>
         <p> Level: ${this.level}</p>
         <p> XP: ${this.xp}</p>`)
       };
    $.get("/characters/" + buttonID + "/expand/", function(data) {
      expandedCharacter = new ECharacter(data["subtle"], data["powerful"], data["resistant"],
      data["level"], data["xp"])
      expandedCharacter.expand()
     });
   })

  //When js-next or js-previous class button is clicked, grab and replace content with
  //next or previous character based on id. Reset button-ids on previous and next buttons.
      $(document).on("click", ".js-next", function() {
      $.get("/characters.json/", function(data){
         $.get("/characters/" + `${data.find(function (i){ 
          return i.id > parseInt($(".js-next").attr("data-button-id"))
          }).id}` + ".json", function(data) {
          $(".js-character").html(
          `<p> Character Name: ${data["name"]} </p>
           <p> Subtle: ${data["subtle"]}</p>
           <p> Powerful: ${data["powerful"]} </p>
           <p> Resistant: ${data["resistant"]}</p>
           <p> Level: ${data["level"]}</p>
           <p> XP: ${data["xp"]}</p>
           <p> Created by: ${data["user"]["email"]}</p>
           <p> <button class= "js-next" data-button-id = "${data["id"]}"> Next Character </button>
           <p> <button class= "js-previous" data-button-id = "${data["id"]}"> Previous Character </button>
           <p> <button class= "js-delete" data-button-id = "${data["id"]}"> Delete Character </button>`
          );
          $(".js-next").attr("data-button-id", data["id"])
          $(".js-previous").attr("data-button-id", data["id"]);
          $(".js-delete").attr("data-button-id", data["id"])
        });
      });
    })
         })
      $(document).on("click", ".js-previous", function() {
        $.get("/characters.json/", function(data){
         $.get("/characters/" + `${data.reverse().find(function (i){
          return i.id < parseInt($(".js-previous").attr("data-button-id"))
          }).id}` + ".json", function(data) {
          $(".js-character").html(
          `<p> Character Name: ${data["name"]} </p>
           <p> Subtle: ${data["subtle"]}</p>
           <p> Powerful: ${data["powerful"]} </p>
           <p> Resistant: ${data["resistant"]}</p>
           <p> Level: ${data["level"]}</p>
           <p> XP: ${data["xp"]}</p>
           <p> Created by: ${data["user"]["email"]}</p>
           <p> <button class= "js-next" data-button-id = "${data["id"]}"> Next Character </button>
           <p> <button class= "js-previous" data-button-id = "${data["id"]}"> Previous Character </button>
           <p> <button class= "js-delete" data-button-id = "${data["id"]}"> Delete Character </button>`
          );
          $(".js-next").attr("data-button-id", data["id"])
          $(".js-previous").attr("data-button-id", data["id"]);
          $(".js-delete").attr("data-button-id", data["id"])
        });
      })
    });

    $(document).on("click", ".js-delete", function() {
      const deleteID = parseInt($(".js-delete").attr("data-button-id"));
      $.ajax({
        url: `/characters/${deleteID}`,
        type: 'DELETE',
        success: function(result) {
        console.log("Deleted")
    }
});
      });

      //comment