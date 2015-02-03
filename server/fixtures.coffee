if Products.find().count() == 0
  _([
    {name: 'Barcelona Cup'}
    {name: 'Manchester City Cup'}
  ]).each (data) -> Products.insert(data)
 
if Categories.find().count() == 0
  category = {
    name: 'Cups'
    created_at: new Date
    products: [
      {name: 'Barcelona Cup', _id: "1"}
      {name: 'Manchester City Cup', _id: "2"}
    ]
  }
  
  Categories.insert(category)