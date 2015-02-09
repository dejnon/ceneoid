Template.product.helpers
  editing: -> Session.get('editing') == @_id
  assigning: -> Session.get('assigning') == @_id
  averageratingint: -> try this.average_rating.toFixed() catch NaN
  averageratingsmall: -> try this.average_rating.toFixed(2) catch NaN
  reviewing: -> Session.get('reviewing') == @_id
  showreviews: -> Session.get('showreviews') == @_id
  showretailers: -> Session.get('showretailers') == @_id
  productretailers: -> _(@retailers).sort('price') if @retailers
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
  # Add to retailer
  "click .product-retailer": (e, tpl) ->
    e.preventDefault()
    Session.set('assigning', @_id)

  "click .form-product-assign .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('assigning', null)

  "submit form.form-product-assign": (e, tpl) ->
    e.preventDefault()
    price    = tpl.$("input[name='price']").val()
    retailer = tpl.$("select[name='retailer']").val()
    console.log price
    console.log retailer
    if price.length && retailer.length
      Meteor.call('addRetailerToProduct', @_id, price, retailer)
      Session.set('assigning', null)
      Session.set('showretailers', @_id)

  # Reviewing
  "click .product-comment": (e, tpl) ->
    e.preventDefault()
    Session.set('reviewing', @_id)
  
  "click .form-product-review .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('reviewing', null)

  "submit form.form-product-review": (e, tpl) ->
    e.preventDefault()
    review = tpl.$("input[name='review']").val()
    rating = tpl.$('#rating').rateit('value')
    if review.length && rating
      Meteor.call('createReview', @_id, review, rating)
      Session.set('reviewing', null)
      Session.set('showreviews', @_id)

  # Review list
  "click .product-hide-comments": (e, tpl) ->
    e.preventDefault()
    Session.set('showreviews', null)

  "click .product-show-comments": (e, tpl) ->
    e.preventDefault()
    Session.set('showreviews', @_id)

  # Retailer list
  "click .product-hide-retailers": (e, tpl) ->
    e.preventDefault()
    Session.set('showretailers', null)

  "click .product-show-retailers": (e, tpl) ->
    e.preventDefault()
    Session.set('showretailers', @_id)
