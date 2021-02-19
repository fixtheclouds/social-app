admin_user = User.create(
  username: 'admin',
  email: 'admin@mail.com',
  password: ENV.fetch('ADMIN_PASSWORD'),
  full_name: 'Admin',
)
tester_user = User.create(
  username: 'tester',
  email: 'test@user.ru',
  password: 'test123',
  full_name: 'Tester',
)

posts = Post.create(
  [
    {
      user_id: admin_user.id,
      body: Faker::ChuckNorris.fact,
    },
    {
      user_id: admin_user.id,
      body: Faker::Lorem.sentence,
    }
  ]
)

Comment.create(
  [
    {
      post_id: posts.first.id,
      body: Faker::Hipster.sentence,
      user_id: tester_user.id,
    },
    {
      post_id: posts.second.id,
      body: Faker::Restaurant.description,
      user_id: tester_user.id,
    }
  ]
)
