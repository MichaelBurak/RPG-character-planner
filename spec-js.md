# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
=Character show page is rendered using jQuery and AMS.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
=Events index page is displayed within planner show page.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
=Planner has_many events, events are displayed within planner.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
= New Event form creates events and dynamically renders.
- [x] Translate JSON responses into js model objects.
=Expanding a character's displayed attributes on character index through a 'more info'
button takes a json response and creates a js model object with the appropriate attributes
to be displayed.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
=Prototypal method is used to insert expanded character information into the DOM off of
JS model object.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
