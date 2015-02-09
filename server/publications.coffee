Meteor.publish('products', -> Products.find())
Meteor.publish('retailers', -> Retailers.find())
Meteor.publish('categories', -> Categories.find())