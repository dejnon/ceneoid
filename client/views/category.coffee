Template.category.helpers
  editing: -> Session.get('editing') == @_id
  categoryproducts: -> Products.find({category_id: @_id})
  addproduct: -> Session.get('addproduct') == @_id
 
Template.category.events
  "click .category-link": (e, tpl) ->
    e.preventDefault()
    Session.set 'currentcategory', @_id