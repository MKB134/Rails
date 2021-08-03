# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.destroy_all
Question.destroy_all
Result.destroy_all
Test.destroy_all
User.destroy_all

users = User.create! ([
  {name: 'Max'},
  {name: 'Adam'}
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

questions = Question.create! ([
  { body: 'Who is the UFC light weight champion?', test_id: tests[0].id },
  { body: 'Who is the UFC light heavyweight champion?', test_id: tests[1].id },
  { body: 'Who is the UFC Heavyweight champion?', test_id: tests[2].id }
  ])

Answer.create! ([
  {body: 'Dustin Poirier', question_id: questions [0].id },
  {body: 'Justin Gaethje', question_id: questions [0].id },
  {body: 'Charles Oliveira', question_id: questions [0].id, correct: true },
  {body: 'Jan Blachowicz', question_id: questions [1].id, correct: true },
  {body: 'Thiago Santos', question_id: questions [1].id },
  {body: 'Glover Teixeira', question_id: questions [1].id },
  {body: 'Stipe Miocic', question_id: questions [2].id },
  {body: 'Derrick Lewis', question_id: questions [2].id },
  {body: 'Francis Ngannou', question_id: questions [2].id, correct: true }
  ])
