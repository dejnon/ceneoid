Meteor.methods
  createReview: (category_id, product_id, review_content, rating) -> 
    selector = {'_id': category_id, 'products._id': product_id}
    review = { content: review_content, rating: rating }
    setter = { $addToSet: { 'products.$.reviews': review } }
    Categories.update selector, setter