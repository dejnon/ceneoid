if Categories.find().count() == 0
  _([
    {
      name: 'Real Estate'
      _id: 'realestate'
      image: 'categories/cabin.png'
      created_at: new Date
      products: [
        {name: 'Lake house', _id: "1"}
        {name: 'Cabin in the woods', _id: "2"} ]
    }, {
      name: 'Groceries'
      _id: 'groceries'
      image: 'categories/cake.png'
      created_at: new Date
      products: [
        {name: 'Donuts', _id: "3"}
        {name: 'Escargot', _id: "4"} ]
    }, {
      name: 'Outdoor'
      _id: 'outdoor'
      image: 'categories/circus.png'
      created_at: new Date
      products: [
        {name: 'Diving suit', _id: "5"}
        {name: 'Diving tube', _id: "6"}
        {name: 'Oxygen tank', _id: "7"} ]
    }, {
      name: 'Games'
      _id: 'games'
      image: 'categories/game.png'
      created_at: new Date
      products: [
        {name: 'Serious Sami', _id: "8"}
        {name: 'Operation', _id: "9"} ]
    }, {
      name: 'Security'
      _id: 'security'
      image: 'categories/safe.png'
      created_at: new Date
      products: [
        {name: 'Steel door', _id: "10"}
        {name: 'Safe', _id: "11"} ]
    }, {
      name: 'Transport'
      _id: 'transport'
      image: 'categories/submarine.png'
      created_at: new Date
      products: [
        {name: 'Car', _id: "12"} ]
    }
  ]).each (category) -> 
    Categories.insert(category)
    _(category.products).each (product) ->
      product.category_id = category._id
      Products.insert(product)

