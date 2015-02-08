@Products = new Mongo.Collection('products')

# @Products.attachSchema new SimpleSchema
#     name:
#       type: String,
#       label: "Name"
#     category:
#       type: @Category,
#       label: "Category"