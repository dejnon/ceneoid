Template.products.helpers
  currentcategory: -> 
    Categories.findOne({_id: Session.get 'currentcategory'})
  # categoryproducts: -> 
  #   currentcategory = 
  #     Categories.findOne({_id: Session.get 'currentcategory'}).products
  #     console.log(currentcategory)
  #   prods = Products.find({_id: currentcategory.products})
  #   console.log(prods)
  #   prods

  #   console.log(currentcategory)
  #   currentcategory

#   productscreating: -> Session.get 'productscreating'
 
# Template.products.events
#   "click .product-create": (e, tpl) ->
#     e.preventDefault()
#     Session.set 'productscreating', true
 
#   "submit form.product-form-create": (e, tpl) ->
#     e.preventDefault()
#     product_name = {name: tpl.$("input[name='name']").val()}
#     if product_name.name.length
#       Products.insert product_name
#       Session.set 'productscreating', false