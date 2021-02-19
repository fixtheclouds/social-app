User.create(
  [
    {
      username: 'admin',
      email: 'admin@mail.com',
      password: ENV.fetch('ADMIN_PASSWORD'),
      full_name: 'Admin',
    },
    {
      username: 'tester',
      email: 'test@user.ru',
      password: 'test123',
      full_name: 'Tester',
    }
  ]
)

Post.create(
  [
    {
      user: User.first,
      body: Faker::ChuckNorris.fact,
    },
    {
      user: User.first,
      body: Faker::Lorem.sentence,
    }
  ]
)

Comment.create(
  [
    {
      post: Post.first.id,
      body: Faker::Hipster.sentence,
      user: User.last,
    },
    {
      post: Post.first.id,
      body: Faker::Restaurant.description,
      user: User.last,
    }
  ]
)
