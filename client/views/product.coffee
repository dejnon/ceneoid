Template.product.helpers
  editing: -> Session.get('editing') == @_id
  averageratingint: -> try this.average_rating.toFixed() catch NaN
  averageratingsmall: -> try this.average_rating.toFixed(2) catch NaN
  reviewing: -> Session.get('reviewing') == @_id
  showreviews: -> Session.get('showreviews') == @_id
  productreviews: ->
    order = 
      switch Session.get 'sortorder'
        when 'ASC' then 1
        when 'DESC' then -1
        else 1
    if Session.get 'currentcategory'
      Products.
        findOne({_id: @_id}, {sort: {'average_rating': order}}).
        reviews
    else
      @reviews   

Template.product.rendered = 
  -> this.$('.rateit').rateit();

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

  "click .product-hide-comments": (e, tpl) ->
    e.preventDefault()
    Session.set('showreviews', null)

  "click .product-show-comments": (e, tpl) ->
    e.preventDefault()
    Session.set('showreviews', @_id)

  "submit form.form-product-review": (e, tpl) ->
    e.preventDefault()
    review = tpl.$("input[name='review']").val()
    rating = tpl.$('#rating').rateit('value')
    if review.length && rating
      Meteor.call('createReview', @_id, review, rating)
      Session.set('reviewing', null)
      Session.set('showreviews', @_id)
