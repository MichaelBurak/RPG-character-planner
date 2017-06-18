# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - uses Ruby on Rails
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - User has_many Characters 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - Character belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - User has_many :planners, :through => :characters
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - Characters have multiple attributes that are submittable
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - validations include presence and numericality
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Scope method is scope for highest xp events under Event
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - On creating a new Event, includes nested form for adding Treasure to the event
- [x] Include signup (how e.g. Devise) - Signup with Devise
- [x] Include login (how e.g. Devise) - See above
- [x] Include logout (how e.g. Devise) - See above
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Devise/OmniAuth for github implemented.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - Planners are nested under Characters and Events are nested under Planners
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - new Events form exists
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate
