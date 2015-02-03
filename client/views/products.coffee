Template.products.helpers
  products: -> Products.find()
  creating: -> Session.get 'products_creating'
 
Template.products.events
  "click .products-create": (e, tpl) ->
    e.preventDefault()
    Session.set 'products_creating', true
 
  "products-submit form.products-form-create": (e, tpl) ->
    e.preventDefault()
    product_name = {name: tpl.$("input[name='products-name']").val()}
    if product_name.name.length
      Products.insert product_name
      Session.set 'products_creating', false