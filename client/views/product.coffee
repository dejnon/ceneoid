Template.product.helpers
  editing: -> Session.get('editing') == @_id
  reviewing: -> Session.get('reviewing') == @_id
   
Template.product.events
  "click .edit": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', @_id)
 
  "submit form.form-edit": (e, tpl) ->
    e.preventDefault()
 
    productName = tpl.$("input[name='name']").val()
    if productName.length
      Products.update(@_id, $set: {name: productName})
      Session.set('editing', null)
 
  "click .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', null)
 
  "click .remove": (e, tpl) ->
    e.preventDefault()
    Products.remove(@_id)

  # Reviewing
  "click .product-comment": (e, tpl) ->
    e.preventDefault()
    Session.set('reviewing', @_id)
  
  "click .form-product-review .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('reviewing', null)

  "submit form.form-product-review": (e, tpl) ->
    e.preventDefault()
    category = Session.get 'currentcategory'
    review = tpl.$("input[name='review']").val()
    rating = tpl.$('#rating').rateit('value')
    console.log rating
    if review.length && category
      Meteor.call('createReview', category, @_id, review, 1)
      Session.set('reviewing', null)
