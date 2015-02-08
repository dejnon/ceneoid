Template.products.helpers
  currentcategory: -> 
    Categories.findOne({_id: Session.get 'currentcategory'})
  allproducts: -> 
    categories = Categories.find().fetch()
    _.flatten(
      _.pluck(categories, 'products'))