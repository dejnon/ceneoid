Template.category.helpers
  editing: -> Session.get('editing') == @_id
  categoryproducts: -> Products.find({category_id: @_id})
  addproduct: -> Session.get('addproduct') == @_id
 
Template.category.events
  "click .category-link": (e, tpl) ->
    e.preventDefault()
    Session.set 'currentcategory', @_id
    
  # "click .edit": (e, tpl) ->
  #   e.preventDefault()
  #   Session.set('editing', @_id)
 
  # "submit form.form-edit": (e, tpl) ->
  #   e.preventDefault()
 
  #   categoryName = tpl.$("input[name='name']").val()
  #   if categoryName.length
  #     Categories.update(@_id, $set: {name: categoryName})
  #     Session.set('editing', null)

  # "click .cancel": (e, tpl) ->
  #   e.preventDefault()
  #   Session.set('editing', null)
 
  # "click .remove": (e, tpl) ->
  #   e.preventDefault()
  #   Categories.remove(@_id)

  # "click .product-create": (e, tpl) ->
  #   e.preventDefault()
  #   Session.set('addproduct', @_id)
 
  # "submit form.product-form-create": (e, tpl) ->
  #   e.preventDefault()
  #   product_name = tpl.$("input[name='name']").val().toString()
  #   if product_name.length
  #     Products.insert { name: product_name, category_id: @_id }
  #     Session.set('addproduct', null)