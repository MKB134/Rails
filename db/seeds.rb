# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { first_name: 'Maxim', last_name: 'Maximov', email: 'maxim@mail.ru', password: '123456'},
  { first_name: 'Fedor', last_name: 'Fedorov', email: 'fedor@mail.ru', password: '123456' }
])

categories = Category.create!([
  { title: 'Астрономия' },
  { title: 'Спорт' },
  { title: 'Математика' }
])

tests = Test.create!([
  { title: 'Планеты солнечной системы', level: 0, category: categories[0], author: users[0] },
  { title: 'Футбол', level: 1, category: categories[1], author: users[0] },
  { title: 'Сложение чисел', level: 0, category: categories[2], author: users[0] },
  { title: 'Футбол', level: 3, category: categories[1], author: users[0] }
])

questions = Question.create!([
  { body: 'Какая первая планета от Солнца?', test: tests[0] },
  { body: 'Сколько будет 2+2?', test: tests[2] },
  { body: 'Сколько будет 3+3?', test: tests[2] },
  { body: 'Сколько человек играет в футбольной команде?', test: tests[1] },
  { body: 'Можно ли брать мяч в руки полевому игроку?', test: tests[1] }
])

Answer.create!([
  { body: 'Земля', question: questions[0] },
  { body: 'Меркурий', question: questions[0], correct: true },
  { body: 'Марс', question: questions[0] },
  { body: '3', question: questions[1] },
  { body: '5', question: questions[1] },
  { body: '4', question: questions[1], correct: true },
  { body: '6', question: questions[2], correct: true },
  { body: '7', question: questions[2] },
  { body: '8', question: questions[2] },
  { body: '10', question: questions[3] },
  { body: '11', question: questions[3], correct: true },
  { body: '12', question: questions[3] },
  { body: 'Можно', question: questions[4] },
  { body: 'Можно, только при вводе мяча из аута', question: questions[4], correct: true },
  { body: 'Нельзя', question: questions[4] }
])
