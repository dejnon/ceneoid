Template.addproduct.helpers
  categories: -> Categories.find()
     
Template.addproduct.events
  "click .edit": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', @_id)