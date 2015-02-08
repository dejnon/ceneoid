# Template.products_create.helpers
#   creating: -> Session.get('creating')

# Template.product.helpers
#   editing: -> Session.get('editing') == @_id
 
# Template.product.events
#   "click .edit": (e, tpl) ->
#     e.preventDefault()
#     Session.set('editing', @_id)
 
#   "submit form.form-edit": (e, tpl) ->
#     e.preventDefault()
 
#     productName = tpl.$("input[name='name']").val()
#     if productName.length
#       Products.update(@_id, $set: {name: productName})
#       Session.set('editing', null)
 
#   "click .cancel": (e, tpl) ->
#     e.preventDefault()
#     Session.set('editing', null)
 
#   "click .remove": (e, tpl) ->
#     e.preventDefault()
#     Products.remove(@_id)


# Template.products.helpers
#   products: -> Products.find()
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