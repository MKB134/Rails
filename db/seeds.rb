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
  {name: 'Max', email: 'max@mail.ru' },
  {name: 'Adam', email: 'adam@mail.com' }
])

categories = Category.create! ([
  { title: 'Light weight' },
  { title: 'Light heavyweight'},
  { title: 'Heavyweight'},
  ])

tests = Test.create! ([
  { title: 'UFC Light weight', level: 0, category: categories[0], author: users[0] },
  { title: 'UFC Light heavyweight', level: 1, category: categories[1], author: users[1] },
  { title: 'UFC Heavyweight', level: 2, category: categories[2], author: users[0] }
  ])

Result.create! ([
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] }
  ])

questions = Question.create! ([
  { body: 'Who is the UFC light weight champion?', test: tests[0] },
  { body: 'Who is the UFC light heavyweight champion?', test: tests[1] },
  { body: 'Who is the UFC Heavyweight champion?', test: tests[2] }
  ])

Answer.create! ([
  {body: 'Dustin Poirier', question: questions [0] },
  {body: 'Justin Gaethje', question: questions [0] },
  {body: 'Charles Oliveira', question: questions [0], correct: true },
  {body: 'Jan Blachowicz', question: questions [1], correct: true },
  {body: 'Thiago Santos', question: questions [1] },
  {body: 'Glover Teixeira', question: questions [1] },
  {body: 'Stipe Miocic', question: questions [2] },
  {body: 'Derrick Lewis', question: questions [2] },
  {body: 'Francis Ngannou', question: questions [2], correct: true }
  ])
