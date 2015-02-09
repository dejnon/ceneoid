Meteor.methods
  addRetailerToProduct: (product_id, price, retailer_id) -> 
    retailer = Retailers.findOne({'_id': retailer_id})
    retailer_summary =
      _id: retailer._id,
      name: retailer.name,
      price: price
    console.log retailer
    console.log retailer_summary
    Products.update(
      { '_id': product_id }, 
      { $addToSet: { 'retailers': retailer_summary } })
    Meteor.call('addProductToRetailer', product_id, price, retailer_id)

  addProductToRetailer: (product_id, price, retailer_id) ->
    product = Products.findOne({'_id': product_id})
    product_summery = 
      _id:   product._id,
      name:  product.name,
      price: price
    console.log product
    console.log product_summery
    Retailers.update(
      { '_id': retailer_id }, 
      { $addToSet: { 'products': product_summery } })
