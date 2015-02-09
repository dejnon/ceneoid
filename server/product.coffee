Meteor.methods
  addProduct: (name, category_id, filename) -> 
    product_id = 
      Products.insert({name: name, category_id: category_id, image: filename })
    Meteor.call('addProductToCategory', product_id, category_id)

  addProductToCategory: (product_id, category_id) ->
    product = Products.findOne({'_id': product_id})
    product_summery = 
      _id:     product._id,
      name:    product.name,
      reviews: 0
    Categories.update(
      { '_id': category_id }, 
      { $addToSet: { 'products': product_summery } })
