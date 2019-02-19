# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  {name: "Ivan Ivanov", email: 'Vano@mail.ru', password: '123456'},
  {name: 'JJ Abrams', email: 'Django@mail.ru', password: '123456'},
  {name: 'Admin', email: 'Admin@mail.ru', password: 'Admin1'}
  ])

categories = Category.create([
  {title: :Frontend}, {title: :Backend}
  ])

tests = Test.create([
  {title: :Ruby, level: 0, category_id: categories[1].id, user_id: users[2].id},
  {title: :Rails, level: 1, category_id: categories[1].id, user_id: users[2].id}  
  ])

questions = Question.create([
  {body: 'Ruby question 1', test_id: tests[0].id},
  {body: 'Ruby question 2', test_id: tests[0].id},
  {body: 'Rails question 1', test_id: tests[1].id},
  {body: 'Rails question 2', test_id: tests[1].id}
  ])

answers = Answer.create([
  {body: "Ruby question 1 - answer body 1",question_id: questions[0].id, correct: true},
  {body: "Ruby question 1 - answer body 2",question_id: questions[0].id},
  {body: "Ruby question 1 - answer body 3",question_id: questions[0].id},
  {body: "Ruby question 2 - answer body 1",question_id: questions[1].id, correct: true},
  {body: "Ruby question 2 - answer body 2",question_id: questions[1].id},
  {body: "Ruby question 2 - answer body 3",question_id: questions[1].id},
  {body: "Rails question 1 - answer body 1",question_id: questions[2].id, correct: true},
  {body: "Rails question 1 - answer body 2",question_id: questions[2].id, correct: true},
  {body: "Rails question 1 - answer body 3",question_id: questions[2].id},
  {body: "Rails question 2 - answer body 1",question_id: questions[3].id, correct: true},
  {body: "Rails question 2 - answer body 2",question_id: questions[3].id},
  {body: "Rails question 2 - answer body 3",question_id: questions[3].id}
  ])
