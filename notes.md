jquery project
To fulfill requirements:
-Character model Index page - only by default display name and then use Jquery or fetch with a ‘more info’ button to dynamically display the rest of the Character model’s attributes.
=only display one at a time

-Character show page - add a ‘next’ button to cycle through all the different user's characters(via. inquiring off of user_id and its connection to the character model)
=reincorporate links

-Rails API reveals one has-many relationship: Planner has many Events. On Planner show page, display.
	-not sure how to wire this up?
  -AMS, render json/html controller paradigm
  -create separate page to call upon and use handlebars to render template
-Rails API and a form to create and render the response without a page refresh: On Planner show page, remove ‘add event’ link and corresponding controller action and route, add form on page and then dynamically display.
	-also not sure how to wire this up?
  -on client side, post to ensure persistence on server side
-Translate JSON responses to Javascript Model Objects. Use at least one method on the prototype.
	-Event has_many treasures, treasure has gold_value integer, maybe make Treasure JMO respond to a sorting method to sort highest to lowest gold_value.


-+Use gems- fetch+-
Add AMSerializer


remove turbo links in application.js and application.html.erb

for JS Model Objects:
class Character {
  constructor(id, name, klass){
    this.id = id;
    this.name = name;
    this.klass = klass;
  }

  // renders character to page
  render(){
    // handlebar logic lives here
  }
}

// doing some get request for a character
// let character = new Character(data.id, data.name, data.klass)
// character.render();

Character.all = []

Character.sort = function(){
  console.log(this.all)
}

Character.sort();

---

Basic API call and appending structure
JQUERY-
(() => {
  $('.repo-button').on('click', function(e) {
    e.preventDefault()
    const user = $('#user-name').val()
    console.log(user)

    fetch(`https://api.github.com/users/${user}/repos`)
      .then(res => res.json())
      .then(data => {
        data.forEach(repo => {
           $('#repos').append(`<p>${repo.name}</p>`)  
        })
      })
  })  



})()

HTML -
<div id="repos">

</div>
<input type="text" id="user-name" />
<button class="repo-button">Get repos</button>
