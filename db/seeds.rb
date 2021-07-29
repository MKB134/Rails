# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Result.destroy_all
Test.destroy_all
User.destroy_all



users = User.create! ([
  {name: 'Max'},{name: 'Adam'}
])


categories = Category.create! ([
  { title: 'Light weight' },
  { title: 'Light heavyweight'},
  { title: 'Heavyweight'},
  ])

tests = Test.create! ([
  { title: 'UFC Light weight', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'UFC Light heavyweight', level: 1, category_id: categories[1].id, author_id: users[1].id },
  { title: 'UFC Heavyweight', level: 2, category_id: categories[2].id, author_id: users[0].id }
  ])

results = Result.create! ([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[1].id }
  ])
