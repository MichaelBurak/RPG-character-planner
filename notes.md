jquery project
To fulfill requirements:
-Character model Index page list of characters - only by default display name and then use Jquery or fetch with a ‘more info’ button to dynamically display the rest of the Character model’s attributes.
=Current status:
/Displays more info on click, but changes html of all divs to reflect just the json attributes of the first character, displaying more info and incorrect info on the second and further characters. Only calls first API link, but twice?

Jquery in asset pipeline-

(fill in later)

Relevant HTML of page:
(fill in)

(<%=character.id%> is rails introspecting on the sqlite3 database to fetch the ID of the object through ERB and interpolate it into HTML. first created character has ID 1, second ID 2, etc.)


-Character show page - add a ‘next’ button to cycle through all the different user's characters(via. inquiring off of user_id and its connection to the character model)
=Current status
/Works fine, even added 'previous' button.

-Rails API reveals one has-many relationship: Planner has many Events. On Planner show page, display.
=Current status
/Works fine.



-Rails API and a form to create and render the response without a page refresh: On Planner show page, remove ‘add event’ link and corresponding controller action and route, add form on page and then dynamically display.
	-also not sure how to wire this up?
  -on client side, post to ensure persistence on server side
-Translate JSON responses to Javascript Model Objects. Use at least one method on the prototype.
	-Event has_many treasures, treasure has gold_value integer, maybe make Treasure JMO respond to a sorting method to sort highest to lowest gold_value.


-+Use gems- fetch+-
Add AMSerializer


-remove turbo links in application.js and application.html.erb
-fix asset pipeline to use controller specific logic instead of requiring tree
-properly add notes.md to gitignore 

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
