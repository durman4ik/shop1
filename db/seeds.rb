# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create!(email: 'yur4ik93@mail.ru',
             password: '12345678',
             role: 'admin')
# . . .
# Product.delete_all
# Product.create!(title: 'CoffeeScript',
#                 description:
#                     %{
#         CoffeeScript is JavaScript done right. It provides all of JavaScript's
# 	functionality wrapped in a cleaner, more succinct syntax. In the first
# 	book on this exciting new language, CoffeeScript guru Trevor Burnham
# 	shows you how to hold onto all the power and flexibility of JavaScript
# 	while writing clearer, cleaner, and safer code.})
# # . . .
# Product.create!(title: 'Programming Ruby 1.9 & 2.0',
#                 description:
#                     '
#         Ruby is the fastest growing and most exciting dynamic language
#         out there. If you need to get working programs delivered fast,
#         you should add Ruby to your toolbox.')
# # . . .
#
# Product.create!(title: 'Rails Test Prescriptions',
#                 description:
#                     '
#         Rails Test Prescriptions is a comprehensive guide to testing
#         Rails applications, covering Test-Driven Development from both a
#         theoretical perspective (why to test) and from a practical perspective
#         (how to test effectively). It covers the core Rails testing tools and
#         procedures for Rails 2 and Rails 3, and introduces popular add-ons,
#         including Cucumber, Shoulda, Machinist, Mocha, and Rcov.')
#
# ProductProperty.delete_all
# ProductProperty.create!(volume: '200',
#                         performance: 'оригинал',
#                         product_id: Product.last.id,
#                         property_price: 300
# )
#
# ProductAttachment.delete_all
# ProductAttachment.create!(
#                      product_id: Product.first.id,
#                      image: 'products/matte-shine-category.jpg')
#
# # . . .
# ProductAttachment.create!(
#     product_id: Product.second.id,
#     image: 'products/shawl_white_cardi_category.jpg')
#
# # . . .
# ProductAttachment.create!(
#     product_id: Product.third.id,
#     image: 'products/shawl_black_cardi_category.jpg')
#
# ProductAttachment.create!(
#     product_id: Product.third.id,
#     image: 'products/shawl_white_cardi_category.jpg')
