Template.products.helpers
  currentcategory: -> 
    Categories.findOne({_id: Session.get 'currentcategory'})
  
  categoryproducts: ->
    order = 
      switch Session.get 'sortorder'
        when 'ASC' then 1
        when 'DESC' then -1
        else 1
    Products.find(
      { category_id: Session.get('currentcategory') }, 
      { sort: {'average_rating': order } })

  allproducts: -> 
    order = 
      switch Session.get 'sortorder'
        when 'ASC' then 1
        when 'DESC' then -1
        else 1
    Products.find({}, { sort: { 'average_rating': order } })

  sortorder: -> Session.get 'sortorder'

Template.products.events
  "click .sort": (e, tpl) ->
    e.preventDefault()
    switch Session.get 'sortorder'
      when 'ASC'  then Session.set('sortorder', 'DESC')
      when 'DESC' then Session.set('sortorder', 'ASC')
      else Session.set('sortorder', 'ASC')