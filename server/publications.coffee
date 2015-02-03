Meteor.publish('products', -> Products.find())
Meteor.publish('categories', -> Categories.find())