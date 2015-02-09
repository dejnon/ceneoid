Template.addproduct.helpers
  categories: -> Categories.find()
     
Template.addproduct.events
  "submit form.form-create": (e, tpl) ->
    e.preventDefault()
    name = tpl.$("input[name='name']").val()
    category = tpl.$("select[name='category_id']").val()
    if name.length && category
      Meteor.call('addProduct', name, category)
 
  "click .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', null)
 
  "click .remove": (e, tpl) ->
    e.preventDefault()
    Products.remove(@_id)


