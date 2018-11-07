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

tests = Test.create([
  {title: :Ruby, level: 0, category_id: categories[1]},
  {title: :Rails, level: 1, category_id: categories[1]},
  {title: :Html, level: 0, category_id: categories[0]},
  {title: :CSS, level: 0, category_id: categories[0]}
  ])

questions = Question.create([
  {body: 'Ruby question 1', test_id: 1},
  {body: 'Ruby question 2', test_id: 1},
  {body: 'Rails question 1', test_id: 2},
  {body: 'Rails question 1', test_id: 2},
  {body: 'Html question 1', test_id: 3},
  {body: 'Html question 1', test_id: 3},
  {body: 'CSS question 1', test_id: 4},
  {body: 'CSS question 1', test_id: 4}
  ])

answers = Answer.create([
  {answer: "Ruby question 1 - answer 1",question_id: 1, correct: true},
  {answer: "Ruby question 1 - answer 2",question_id: 1},
  {answer: "Ruby question 1 - answer 3",question_id: 1},
  {answer: "Rails question 1 - answer 1",question_id: 1, correct: true},
  {answer: "Rails question 1 - answer 2",question_id: 1, correct: true},
  {answer: "Rails question 1 - answer 3",question_id: 1}
  ])

users = User.create([
  {name: "Ivan Ivanov", nickname: 'Vano'},
  {name: 'JJ Abrams', nickname: 'Django'}
  ])

tests_passage = TestPassage.create([
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 3},
  {user_id: 1, test_id: 4},
  {user_id: 2, test_id: 1}
  ])
