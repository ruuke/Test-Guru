# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {title: :Frontend}, {title: :Backend}
  ])

users = User.create([
  {name: "Ivan Ivanov", nickname: 'Vano'},
  {name: 'JJ Abrams', nickname: 'Django'}
  ])

tests = Test.create([
  {title: :Ruby, level: 0, category_id: categories[1].id, user_id: users[1].id},
  {title: :Rails, level: 1, category_id: categories[1].id, user_id: users[1].id},
  {title: :Html, level: 0, category_id: categories[0].id, user_id: users[1].id},
  {title: :CSS, level: 0, category_id: categories[0].id, user_id: users[1].id}
  ])

questions = Question.create([
  {body: 'Ruby question 1', test_id: tests[0].id},
  {body: 'Ruby question 2', test_id: tests[0].id},
  {body: 'Rails question 1', test_id: tests[1].id},
  {body: 'Rails question 2', test_id: tests[1].id},
  {body: 'Html question 1', test_id: tests[2].id},
  {body: 'Html question 2', test_id: tests[2].id},
  {body: 'CSS question 1', test_id: tests[3].id},
  {body: 'CSS question 2', test_id: tests[3].id}
  ])

answers = Answer.create([
  {answer: "Ruby question 1 - answer 1",question_id: questions[0].id, correct: true},
  {answer: "Ruby question 1 - answer 2",question_id: questions[0].id},
  {answer: "Ruby question 1 - answer 3",question_id: questions[0].id},
  {answer: "Rails question 1 - answer 1",question_id: questions[1].id, correct: true},
  {answer: "Rails question 1 - answer 2",question_id: questions[1].id, correct: true},
  {answer: "Rails question 1 - answer 3",question_id: questions[1].id}
  ])


tests_passage = TestPassage.create([
  {user_id: users[1].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[2].id},
  {user_id: users[1].id, test_id: tests[3].id},
  {user_id: users[0].id, test_id: tests[0].id}
  ])
