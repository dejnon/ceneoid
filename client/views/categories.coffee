Template.categories.helpers
  categories: -> Categories.find()
  creating: -> Session.get 'creating'
 
Template.categories.events
  "click .create": (e, tpl) ->
    e.preventDefault()
    Session.set 'creating', true
 
  "submit form.form-create": (e, tpl) ->
    e.preventDefault()
    category_name = {name: tpl.$("input[name='name']").val()}
    if category_name.name.length
      Categories.insert category_name
      Session.set 'creating', false