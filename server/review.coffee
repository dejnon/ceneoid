Meteor.methods
  createReview: (product_id, review_content, rating) -> 
    selector = { '_id': product_id }
    review   = { content: review_content, rating: rating-1 }
    setter   = { $addToSet: { 'reviews': review } }
    Products.update(selector, setter)
    Meteor.call('updateRating', product_id)

  updateRating: (product_id) ->
    product  = Products.findOne({'_id': product_id})
    ratings  = _.pluck(product.reviews, 'rating')
    average_rating = 
      if ratings.length
        _.reduce(ratings, ((a, b) -> a + b), 0) / ratings.length
    Products.update(
      { '_id': product_id }, 
      { $set: { 'average_rating': average_rating } } )
    Categories.update(
      { 'products._id': product_id }, 
      { $set: { 
        'products.$.average_rating': average_rating,
        'products.$.reviews': ratings.length } } )